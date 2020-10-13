#!/bin/bash

echo "This will install the contents of this dotfiles repo into $HOME (except this script)."
echo "(yY/nN)"

read answer

if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; then
    echo "Installing..."
    cd "$(dirname $0)"
    rsync -rvz ../ $HOME/
    echo ""
    echo "--------------------------------------------"
    echo "You may now delete this repo"
else
    echo "Canceled."
fi
