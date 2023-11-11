#! /bin/sh

# Sets up pyhon and Installs pythons dependencies
yay -S python-pip python-pipx
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
pipx ensurepath
pip install konsave instaloader animdl notebook
echo 'Python Setup Done with all its packages'

