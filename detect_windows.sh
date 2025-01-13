#!/bin/bash

# systemd-boot utility script to add Michaelsoft boot entry into systemd-boot
# AlexC (c) 2025

# Check if the systemd-boot is installed
if ! command -v bootctl &> /dev/null; then
    echo "systemd-boot not found. Please install systemd-boot."
    exit 1
fi

# Function to detect the EFI partition
detect_efi_partition() {
    # Search for the FAT32 filesystem, which is used for EFI partitions
    efi_partition=$(blkid | grep -i 'vfat' | awk -F: '{print $1}')
    
    if [ -z "$efi_partition" ]; then
        echo "No EFI partition detected."
        return 1
    fi

    echo "$efi_partition"
    return 0
}

# Function to check if Windows boot files exist in the EFI partition
check_windows_boot_files() {
    local efi_partition=$1
    local efi_dir_mount_point="/mnt/efi"

    # Mount the EFI partition temporarily to check for Windows boot files
    mount "$efi_partition" "$efi_dir_mount_point" &> /dev/null
    if [ $? -ne 0 ]; then
        echo "Failed to mount EFI partition."
        return 1
    fi

    # Check if Windows boot files exist in /EFI/Microsoft/Boot/
    if [ ! -f "$efi_dir_mount_point/EFI/Microsoft/Boot/bootmgfw.efi" ]; then
        echo "Windows boot files not found in the EFI partition."
        umount "$efi_dir_mount_point"
        return 1
    fi

    # Clean up by unmounting the EFI partition
    umount "$efi_dir_mount_point"
    return 0
}

# Function to add Windows entry to systemd-boot
add_windows_entry() {
    local efi_partition=$1
    local boot_loader_dir="/boot/loader/entries"
    local windows_entry="$boot_loader_dir/windows.conf"

    # Create the entry directory if it doesn't exist
    mkdir -p "$boot_loader_dir"

    # Add the Windows entry to systemd-boot
    echo "Creating systemd-boot entry for Windows..."
    cat <<EOF > "$windows_entry"
title   Windows
efi     /EFI/Microsoft/Boot/bootmgfw.efi
options root=$efi_partition ro
EOF

    echo "Windows boot entry added successfully."
}

# Detect EFI partition and check for Windows boot files
efi_partition=$(detect_efi_partition)
if [ $? -eq 0 ]; then
    check_windows_boot_files "$efi_partition"
    if [ $? -eq 0 ]; then
        add_windows_entry "$efi_partition"
    else
        echo "Windows boot files are not present. Please ensure Windows is installed properly."
        exit 1
    fi
else
    echo "Could not detect EFI partition."
    exit 1
fi

# Reload systemd-boot to recognize the new entry
bootctl update

echo "systemd-boot entry for Windows has been added and systemd-boot has been updated."
exit 0
