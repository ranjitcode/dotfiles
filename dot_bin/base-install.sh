#! /bin/sh

# Installs necessary packages like font and ides

echo 'Yay Installation with all its packages'

yay -S vivaldi chezmoi
yay -S plank-git
yay -Syyu keybase httpie gping noto-fonts-emoji pamac-aur ttf-joypixels gnu-free-fonts
ttf-cm-unicode alacritty taskwarrior-tui git-delta kcolorchooser grex fd sd tldr bat
the_silver_searcher asdf-vm git-secrets fzf docker git-interactive-rebase-tool-bin docker-compose python-pip
mousepad nano skypeforlinux-stable-bin zoom mojave-gtk-theme-git adwaita-icon-theme capitaine-cursors gparted htop
la-capitaine-icon-theme neovim insomnia-bin rate-arch-mirrors spectacle ttf-bitstream-vera ttf-dejavu ttf-font-awesome
ttf-hack ttf-liberation ttf-ms-fonts ttf-nerd-fonts-symbols-mono ttf-twemoji-color uuid vlc wps-office wps-office-fonts youtube-dl gwenview ktorrent persepolis linux


echo 'Executing post install steps for docker'

# docker post install
sudo groupadd docker
sudo usermod -aG docker $USER


echo 'Adding plugins for asdf and installing golang and nodejs'
source ~/.zshrc
asdf update
asdf plugin add nodejs
asdf plugin add golang
asdf plugin add deno
asdf plugin add ruby
asdf plugin add rust
asdf install nodejs 14.18.2
asdf install golang 1.17.7
asdf install ruby 2.6.8
asdf install rust 1.59.0
asdf global golang 1.17.7
asdf global nodejs 14.18.2
asdf global rust 1.59.0

echo 'Installing zsh with ohmyzsh and other plugins'
sudo pacman -S zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

echo 'Installing fonts'

tar -xzvf ~/.fonts/dot_fonts.tar.gz

npm config set fetch-retries 3
npm config set fetch-retry-mintimeout 100000
npm config set fetch-retry-maxtimeout 600000
npm config set cache-min 360


sudo fc-cache -vf
source ~/.zshrc
sudo pacman -Qtdq | sudo pacman -Rns -
