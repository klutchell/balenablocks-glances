#!/bin/sh

# quit the plymouth (balena logo) service so that we can see the TTY
dbus-send \
    --system \
    --dest=org.freedesktop.systemd1 \
    --type=method_call \
    --print-reply \
    /org/freedesktop/systemd1 org.freedesktop.systemd1.Manager.StartUnit \
    string:"plymouth-quit.service" string:"replace"

# adjust fontface and fontsize on terminal
sed -i "s/^FONTFACE.*/FONTFACE=\"${FONTFACE}\"/" /etc/default/console-setup
sed -i "s/^FONTSIZE.*/FONTSIZE=\"${FONTSIZE}\"/" /etc/default/console-setup
dpkg-reconfigure console-setup 2> /dev/null > /dev/tty0

python3 -m glances -C /glances/conf/glances.conf $GLANCES_OPT > /dev/tty0
