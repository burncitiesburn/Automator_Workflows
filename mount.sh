#!/bin/bash
for i in $( ls /Volumes ); do
	
	diskident=$(diskutil info /Volumes/$i | grep "Device Node:" | awk '$1 == "Device" {print $3}'| xargs);
	filesys=$(diskutil info /Volumes/$i | grep "Partition Type:" | awk '$1 == "Partition" {print $3}' | xargs);
	diskutil info /Volumes/$i | grep "Partition Type:" | awk '$1 == "Partition" {print $3}'
	echo $i;
	echo $diskident;
	echo $filesys;
	if [[ -n $diskident ]] && [[ $filesys = "Windows_NTFS" ]]; then
		diskutil unmount $diskident;
		mkdir -p ~/Volumes/$i;
		sudo /sbin/mount_ntfs -o rw,auto,nobrowse $diskident ~/Volumes/$i;
		open ~/Volumes/$i;
	fi
done