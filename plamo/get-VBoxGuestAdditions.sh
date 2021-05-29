curl http://download.virtualbox.org/virtualbox/6.1.22/VBoxGuestAdditions_6.1.22.iso -o VBoxGuestAdditions_6.1.22.iso
sudo mkdir /mnt/iso
sudo mount -t iso9660 -o loop VBoxGuestAdditions_6.1.22.iso /mnt/iso
sudo sh /mnt/iso/VBoxLinuxAdditions.run
