bootloader --location=mbr --driveorder=$disk_type
clearpart --initlabel --linux --drives=$disk_type
part /boot --fstype ext3 --size=512 --ondisk=$disk_type
part pv.2 --size=1 --grow --ondisk=$disk_type
volgroup $system_vg_name --pesize=32768 pv.2
logvol swap --fstype swap --name=swapfs --vgname=$system_vg_name --size=512 --grow --maxsize=4096
logvol / --fstype ext3 --name=rootfs --vgname=$system_vg_name --size=256 --grow --maxsize=512
logvol /usr --fstype ext3 --name=usrfs --vgname=$system_vg_name --size=1536 --grow --maxsize=4096
logvol /opt --fstype ext3 --name=optfs --vgname=$system_vg_name --size=512 --grow --maxsize=1024
logvol /tmp --fstype ext3 --name=tmpfs --vgname=$system_vg_name --size=256 --grow --maxsize=512
logvol /var --fstype ext3 --name=varfs --vgname=$system_vg_name --size=256 --grow --maxsize=2048
logvol /var/log --fstype ext3 --name=varlogfs --vgname=$system_vg_name --size=1024 --grow --maxsize=3072
logvol /var/lib --fstype ext3 --name=varlibfs --vgname=$system_vg_name --size=1536 --grow --maxsize=2048
