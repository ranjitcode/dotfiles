#!/bin/sh

# Installs necessary packages like font and ides

echo "Refreshing arch package database"
yay -Syyu

echo "Install base packages"
yay -S vivaldi
yay -S plank-git chezmoi

echo 'Installing normal fonts'
yay -S noto-fonts-cjk noto-fonts-emoji gnu-free-fonts ttf-joypixels ttf-font-awesome ttf-hack ttf-ms-fonts ttf-twemoji-color ttf-bitstream-vera ttf-cm-unicode

echo 'Installing nerd fonts'
yay -S ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-dejavu-nerd

sudo fc-cache -vf

echo "Installing docker and compose"
yay -S docker docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "Installing other packages"
yay -S mcfly keybase yt-dlp mongodb-compass mkcert jq lazydocker-bin stacer plasma-systemmonitor just github-cli postman-bin httpie  mpv ark jetbrains-toolbox tmux lsd thefuck alacritty taskwarrior-tui git-delta kcolorchooser grex fd sd tealdeer bat the_silver_searcher git-secrets fzf podman git-interactive-rebase-tool-bin python-pip mousepad nano mojave-gtk-theme-git adwaita-icon-theme capitaine-cursors gparted htop la-capitaine-icon-theme neovim rate-mirrors spectacle vlc youtube-dl gwenview ktorrent persepolis linux

echo "Installing pnpm"
curl -fsSL https://get.pnpm.io/install.sh | sh -

echo 'Installing zsh with ohmyzsh and other plugins'
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

echo 'Adding plugins for asdf and installing golang and nodejs'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
source ~/.zshrc

# Update asdf
asdf update

# Declare an associative array of plugins and versions
declare -A versions=(
  ["nodejs"]="20.10.0"
  ["golang"]="1.21.5"
  ["rust"]="1.74.1"
  ["ruby"]="3.2.2"
)

# Loop through plugins, add them, and install versions
for plugin in "${!versions[@]}"; do
  asdf plugin add "$plugin"
  asdf install "$plugin" "${versions[$plugin]}"
  asdf global "$plugin" "${versions[$plugin]}"
done


inshellisense bind

echo 'Installing lunarvim'
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
yay -Rns kate okular

sudo pacman -Qtdq | sudo pacman -Rns -
chezmoi init --apply rubiin
