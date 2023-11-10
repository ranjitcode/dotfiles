#! /bin/sh

# Sets up pyhon and Installs pythons dependencies
yay -S python-pip python-pipx
pipx ensurepath
pipx install konsave
pipx install instaloader
pipx install animdl
pipx install notebook
echo 'Python Setup Done with all its packages'

