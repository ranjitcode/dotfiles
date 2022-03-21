#! /bin/sh

# Sets up pyhon and Installs pythons dependencies

python3 -m pip install --user pipx
python3 -m pipx ensurepath
pip3 install konsave instaloader anime-dl anime-downloader notebook howdoi virtualenv
echo 'Python Setup Done with all its packages'

