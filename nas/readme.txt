
[ubuntu]
https://www.linuxbabe.com/ubuntu/upgrade-ubuntu-18-04-to-ubuntu-20-04

[swap]
swapon --show
sudo vim /etc/fstab
comment swap.img
sudo reboot

[mount hdd]
sudo fdisk -l
sudo blkid
sudo mkdir /mnt/wd40
sudo vim /etc/fstab
add
#UUID=04d4e3ab-6582-48ba-89d7-902f80a69d17 /mnt/wd40            ext4    errors=remount-ro 0    1

sudo mount -av

[miniDlna]
sudo apt-get install minidlna
sudo vim /etc/default/minidlna 
sudo cp /home/olemin/repo/unsorted/nas/cfgs/minidlna.conf /etc/minidlna.conf
sudo vim /etc/minidlna.conf
add
#media_dir=V,/mnt/wd40/torrent/unsorted/
#media_dir=V,/mnt/wd40/torrent/new
#media_dir=V,/mnt/wd40/media/cartoon

sudo service minidlna status
sudo service minidlna restart
sudo service minidlna force-reload

http://192.168.1.2:8200/
OPEN_TCP="8200"
OPEN_UDP="1900"


[Apache]
https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-20-04
sudo apt install apache2
sudo ufw allow 'Apache'
sudo systemctl reload apache2
sudo systemctl restart apache2
cd /var/www/
clone
mv .. html

[dropbox]
https://www.how2shout.com/linux/install-dropbox-gui-or-headless-on-ubuntu-20-04-lts/
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
/var/cache/zoneminder/events


getfacl
incron
setfacl

cd /usr/share/doc/lsyncd/examples/
/etc/lsyncd/lsyncd.conf.lua
sudo systemctl enable lsyncd
sudo systemctl start lsyncd
sudo systemctl status lsyncd

[Git Diff and Meld on Windows]
You need to add C:/Program Files (x86)/Meld/lib to your PATH environment variable
sudo service zoneminder restart


[Deluge]
https://deluge-torrent.org/installing/linux/ubuntu/
https://deluge.readthedocs.io/en/latest/how-to/systemd-service.html
/home/olemin/repo/unsorted/nas/cfgs/deluged/
sudo systemctl status deluged
sudo systemctl restart deluged
sudo systemctl restart deluge-web

sudo adduser $USER deluge
sudo adduser minidlna deluge


password off 
  /var/lib/deluge/.config/deluge/web.con
   session_timeout from 3600 to 31536000

sudo cp ~/repo/unsorted/nas/cfgs/deluged/new_torrent.sh  /var/lib/deluge/.
sudo chown  deluge:deluge /var/lib/deluge/new_torrent.sh


[smb]
sudo apt-get install samba
https://www.techrepublic.com/article/how-to-create-a-samba-share-on-ubuntu-server-20-04/
sudo ln -s /home/olemin/repo/unsorted/nas/cfgs/smb.conf /etc/samba/smb.conf
sudo vim /etc/samba/smb.conf
sudo service smbd restart

add
  [share]
    comment = Ubuntu File Server Share
    path = /mnt/wd40
    browsable = yes
    guest ok = yes
    read only = no
    create mask = 0755


[etc]

posershell simlink
New-Item -ItemType Junction -Path "webdav_air_pcb" -Target "D:\user\hobby\git\WebDAV_air\webdav_air_pcb"

remove broken simlink
$find  -xtype l -delete
