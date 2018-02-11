#!/bin/bash

var=$(diskutil info /Volumes/Untitled/ | grep "Device Node:" | awk '$1 == "Device" {print $3}');
diskutil unmount $var;
sudo /sbin/mount_ntfs -o rw,auto,nobrowse $var ~/ntfs-volume;
open ~/ntfs-volume;

