
[ubuntu]
https://www.linuxbabe.com/ubuntu/upgrade-ubuntu-18-04-to-ubuntu-20-04

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
sudo ln /home/olemin/repo/unsorted/nas/cfgs/minidlna.conf /etc/minidlna.conf -s
sudo vim /etc/minidlna.conf
add
#media_dir=V,/mnt/wd40/torrent/unsorted/
#media_dir=V,/mnt/wd40/torrent/new
#media_dir=V,/mnt/wd40/media/cartoon

sudo service minidlna restart
sudo service minidlna force-reload

http://192.168.1.2:8200/

[rtl8811au]
https://github.com/gnab/rtl8812au

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

[utorrent]
https://www.linuxbabe.com/ubuntu/install-utorrent-ubuntu-20-04
https://tipsonubuntu.com/2020/05/26/install-%C2%B5torrent-ubuntu-20-04/
sudo apt install libssl-dev
sudo vim /etc/apt/sources.list
#Bionic support 
deb http://ca.archive.ubuntu.com/ubuntu/ bionic main restricted
deb http://ca.archive.ubuntu.com/ubuntu/ bionic universe
deb http://ca.archive.ubuntu.com/ubuntu/ bionic multiverse
sudo apt update
sudo apt install libssl1.0.0

wget http://download-hr.utorrent.com/track/beta/endpoint/utserver/os/linux-x64-ubuntu-13-04 -O utserver.tar.gz
sudo tar xvf utserver.tar.gz -C /opt/
sudo ln -s /opt/utorrent-server-alpha-v3_3/utserver /usr/bin/utserver
utserver -settingspath /opt/utorrent-server-alpha-v3_3/ -daemon
demon
sudo vim /etc/systemd/system/utserver.service
sudo ln -s /home/olemin/repo/unsorted/nas/cfgs/torrent/utserver.service /etc/systemd/system/utserver.service
sudo systemctl daemon-reload
sudo systemctl restart utserve

http://192.168.1.2:8080/gui/web/index.html
user:admin 
pwd:
>>client
	uTorrent WebUI
	8080
	/gui/

>>Run Program
/mnt/wd40/torrent/config/new_torrent.sh '%D' '%F' '%N'  '%K' '%L'

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
