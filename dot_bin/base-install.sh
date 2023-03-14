#! /bin/sh

# Installs necessary packages like font and ides

echo 'Yay Installation with all its packages'

yay -S vivaldi chezmoi
yay -S plank-git
yay -Syyu keybase  yt-dlp mongodb-tools-bin noto-fonts-cjk mkcert httpie gping noto-fonts-emoji mpv ark jetbrains-toolbox tmux ttf-joypixels gnu-free-fonts git-interactive-rebase-tool lsd thefuck mcfly fasd ttf-cm-unicode alacritty taskwarrior-tui git-delta kcolorchooser grex fd sd tldr bat the_silver_searcher git-secrets fzf podman git-interactive-rebase-tool-bin docker-compose python-pip mousepad nano zoom mojave-gtk-theme-git adwaita-icon-theme capitaine-cursors gparted htop la-capitaine-icon-theme neovim insomnia-bin rate-mirrors spectacle ttf-bitstream-vera ttf-dejavu ttf-font-awesome ttf-hack ttf-liberation ttf-ms-fonts ttf-twemoji-colorvlc youtube-dl gwenview ktorrent persepolis linux


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
asdf install nodejs 18.15.0
asdf install golang 1.20.2
asdf install ruby 3.2.1
asdf global golang 1.20.2
asdf global nodejs 18.15.0

npm config set fetch-retries 3
npm config set fetch-retry-mintimeout 100000
npm config set fetch-retry-maxtimeout 600000


echo 'Installing zsh with ohmyzsh and other plugins'
sudo pacman -S zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab




