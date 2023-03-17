#! /bin/sh

# Installs necessary packages like font and ides

echo 'Yay Installation with all its packages'

yay -S vivaldi
yay -S plank-git chezmoi
yay -Syyu keybase yt-dlp noto-fonts-cjk mkcert httpie noto-fonts-emoji mpv ark jetbrains-toolbox tmux ttf-joypixels gnu-free-fonts lsd thefuck mcfly fasd ttf-cm-unicode alacritty taskwarrior-tui git-delta kcolorchooser grex fd sd tealdeer bat the_silver_searcher git-secrets fzf podman git-interactive-rebase-tool-bin python-pip mousepad nano zoom mojave-gtk-theme-git adwaita-icon-theme capitaine-cursors gparted htop la-capitaine-icon-theme neovim insomnia-bin rate-mirrors spectacle ttf-bitstream-vera ttf-dejavu ttf-font-awesome ttf-hack ttf-liberation ttf-ms-fonts ttf-twemoji-colorvlc youtube-dl gwenview ktorrent persepolis linux


echo 'Installing fonts'

sudo fc-cache -vf
sudo pacman -Qtdq | sudo pacman -Rns -

echo 'Adding plugins for asdf and installing golang and nodejs'

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
source ~/.zshrc
asdf update
asdf plugin add nodejs
asdf plugin add golang
asdf plugin add deno
asdf plugin add ruby
asdf install nodejs 18.12.1
asdf install golang 1.19.4
asdf install ruby 3.0.4
asdf global golang 1.19.4
asdf global nodejs 18.12.1
asdf global ruby 3.0.4


echo 'setting npm defaults'
npm config set init-author-name "rubin Bhandari"
npm config set init-author-url "rubiin.ml"
npm config set init-author-email "roobin.bhandari@gmail.com"
npm config set init-license "MIT"
npm config set init-version "1.0.0"
npm config set fetch-retries 3
npm config set fetch-retry-mintimeout 100000
npm config set fetch-retry-maxtimeout 600000


echo 'Installing lunarvim'
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)

echo "Installing docker and compose"
yay -S docker docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service



echo 'Installing zsh with ohmyzsh and other plugins'
sudo pacman -S zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab




