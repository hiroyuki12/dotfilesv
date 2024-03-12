sudo mount.cifs -o vers=2.0,sec=ntlmssp,username=guest,password="" "//192.168.1.5/public" /mnt/nas
ls /mnt/nas
