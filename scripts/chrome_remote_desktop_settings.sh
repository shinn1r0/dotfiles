#!/bin/zsh

/opt/google/chrome-remote-desktop/chrome-remote-desktop --stop
sudo cp /opt/google/chrome-remote-desktop/chrome-remote-desktop /opt/google/chrome-remote-desktop/chrome-remote-desktop.orig
sudo sed -i -e 's/FIRST_X_DISPLAY_NUMBER = 20/FIRST_X_DISPLAY_NUMBER = 1/g' /opt/google/chrome-remote-desktop/chrome-remote-desktop
sudo sed -i -e 's/while os.path.exists(X_LOCK_FILE_TEMPLATE % display):/#while os.path.exists(X_LOCK_FILE_TEMPLATE % display):/g' /opt/google/chrome-remote-desktop/chrome-remote-desktop
sudo sed -i -e 's/display += 1/#display += 1/g' /opt/google/chrome-remote-desktop/chrome-remote-desktop
sudo sed -i -e 's/self._launch_x_server(x_args)/#self._launch_x_server(x_args)/g' /opt/google/chrome-remote-desktop/chrome-remote-desktop
sudo sed -i -e 's/self._launch_x_session()/#self._launch_x_session()\n    display = self.get_unused_display_number()\n    self.child_env["DISPLAY"] = ":%d" % display/g' /opt/google/chrome-remote-desktop/chrome-remote-desktop
/opt/google/chrome-remote-desktop/chrome-remote-desktop --start
