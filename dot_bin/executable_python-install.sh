#! /bin/sh

# Sets up pyhon and Installs pythons dependencies

python3 -m pip install --user pipx
python3 -m pipx ensurepath
pip install konsave instaloader animdl notebook howdoi virtualenv
echo 'Python Setup Done with all its packages'

