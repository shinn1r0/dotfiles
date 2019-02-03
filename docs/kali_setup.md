# login
/etc/gdm3/daemon.conf
```
AutomaticLoginEnable = true
AutomaticLogin = root
TimedLoginEnable = true
TimedLogin = root
TimedLoginDelay = 5
```

```
passwd
cat /etc/shadow | grep root | awk -F ':' '{print $2}'
/lib/live/config/0031-root-password
adduser shin-ichiro
passwd xxxxxxx
```
