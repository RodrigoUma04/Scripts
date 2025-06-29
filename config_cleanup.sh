#!/bin/bash

mkdir -p ~/.config_orphans_backup
cd ~/.config

for item in \
  bluedevilglobalrc kconf_updaterc KDE kiorc kmenueditrc phishingurlrc \
  QtProject.conf session specialmailcollectionsrc spectaclerc trashrc \
  Trolltech.conf xdg-desktop-portal-kderc xsettingsd; do

  [ -e "$item" ] && mv "$item" ~/.config_orphans_backup/
done

