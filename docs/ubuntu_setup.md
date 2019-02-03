# Update
```
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
```

# monitor
### setting display
#### lightdm
```
sudo cp ~/.config/monitors.xml /var/lib/lightdm/.config/
```
#### gdm3
```
sudo cp ~/.config/monitors.xml /var/lib/gdm3/.config/
```

# guest session
#### lightdm
```
sudo mkdir /etc/lightdm/lightdm.conf.d
sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" > /etc/lightdm/lightdm.conf.d/50-no-guest.conf'
```
#### gdm3
```
sudo mkdir /etc/gdm3/gdm3.conf.d
sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" > /etc/gdm3/gdm3.conf.d/50-no-guest.conf'
```

# directory
### make name english
```
LANG=C xdg-user-dirs-gtk-update
```
### back
```
xdg-user-dirs-gtk-update
```

# Security
### unattended-upgrades
```
sudo dpkg-reconfigure -plow unattended-upgrades
```
/etc/apt/apt.conf.d/50unattended-upgrades
```
\${distro_id}:${distro_codename}-updates
```

### sshd_config
/etc/ssh/sshd_config
```
port
PermitRootLogin
PasswordAuthentication
UsePAM
LoginGraceTime 30
MaxAuthTries 3
```

### ufw
```
sudo apt install ufw
IPV6=no
sudo ufw default deny
sudo ufw allow 2222/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```
