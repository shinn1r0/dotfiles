sudo apt install -y conky-all lm-sensors hddtemp
sudo dpkg-reconfigure hddtemp
sudo sensors-detect
git clone git@github.com:shinichir0/conky $HOME/.config/conky
cp $HOME/.config/conky/conky_template.conf $HOME/.config/conky/conky.conf
