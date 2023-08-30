#! /bin/sh

# Installs necessary packages like font and ides

echo "install base packages"

yay -S vivaldi
yay -S plank-git chezmoi

echo 'Installing fonts'
yay -Syyu noto-fonts-cjk noto-fonts-emoji gnu-free-fonts ttf-joypixels ttf-dejavu ttf-font-awesome ttf-hack ttf-liberation ttf-ms-fonts ttf-twemoji-color ttf-bitstream-vera ttf-cm-unicode
sudo fc-cache -vf

echo 'Installing zsh with ohmyzsh and other plugins'
sudo pacman -S zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
source ~/.zshrc

echo "Installing docker and compose"
yay -S docker docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo 'Adding plugins for asdf and installing golang and nodejs'

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
source ~/.zshrc
asdf update
asdf plugin add nodejs
asdf plugin add golang
asdf plugin add deno
asdf plugin add ruby
asdf install nodejs 18.17.1
asdf install golang 1.21.0
asdf install ruby 3.2.2
asdf global golang 1.21.0
asdf global nodejs 18.17.1
asdf global ruby 3.2.2

echo 'Installing lunarvim'
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

echo "Installing other packages"
yay -Syyu keybase yt-dlp mongodb-compass postgreq-libs mkcert jq lazydocker stacer plasma-systemmonitor just github-cli lazydocker postman-bin la-capitaine-icon-theme-git httpie  mpv ark jetbrains-toolbox tmux lsd thefuck mcfly fasd alacritty taskwarrior-tui git-delta kcolorchooser grex fd sd tealdeer bat the_silver_searcher git-secrets fzf podman git-interactive-rebase-tool-bin python-pip mousepad nano mojave-gtk-theme-git adwaita-icon-theme capitaine-cursors gparted htop la-capitaine-icon-theme neovim rate-mirrors spectacle vlc youtube-dl gwenview ktorrent persepolis linux
sudo pacman -Qtdq | sudo pacman -Rns -


