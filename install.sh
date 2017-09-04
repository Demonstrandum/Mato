#!/usr/bin/env sh

cd `dirname $0`

## If .icons folder doesn't exist, create it.
mkdir -p ~/.icons

## Replace old Mato folder by the new one
rm -rf ~/.icons/Mato/
cp -r ./ ~/.icons/Mato/

## Use password to change mime directory permisions to 777
## and update the mimetype database
printf "Password: "
PASS="$(read -s)"
echo
echo "$PASS" | sudo -s chmod 777 /usr/share/mime/packages
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
gem install mimetype-xml --no-ri --no-rdoc
ruby generate-mimetypes.rb 
echo "$PASS" | sudo -s update-mime-database /usr/share/mime

## Set Mato icon theme
gsettings reset org.gnome.desktop.interface icon-theme
gsettings set org.gnome.desktop.interface icon-theme "Mato"
