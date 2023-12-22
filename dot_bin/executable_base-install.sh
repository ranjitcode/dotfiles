#!/bin/sh

# Function to ask yes/no question with a default value
ask_yes_no_default() {
    local prompt="$1 (Y/n)"
    local default="${2:-}"

    read -p "$prompt: " -n 1 answer
    echo

    case "$answer" in
        [Yy]* ) return 0;;
        [Nn]* ) return 1;;
        * ) return "${default:-0}";;
    esac
}

# Use "ask_yes_no_default" function with default value "0" for "yes"
echo "Refreshing Arch package database"
ask_yes_no_default "Do you want to refresh the Arch package database?" 0 && yay -Syyu

echo "Install base packages"
ask_yes_no_default "Do you want to install base packages?" 0 && yay -S vivaldi plank-git chezmoi

echo 'Installing normal fonts'
ask_yes_no_default "Do you want to install normal fonts?" 0 && yay -S noto-fonts-cjk noto-fonts-emoji gnu-free-fonts ttf-joypixels ttf-font-awesome ttf-hack ttf-ms-fonts ttf-twemoji-color ttf-bitstream-vera ttf-cm-unicode

echo 'Installing nerd fonts'
ask_yes_no_default "Do you want to install nerd fonts?" 0 && yay -S ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-dejavu-nerd

sudo fc-cache -vf

curl -fsSL https://get.pnpm.io/install.sh | sh -

echo "Installing Docker and Compose"
ask_yes_no_default "Do you want to install Docker and Docker Compose?" 0 && yay -S docker docker-compose && \
    sudo groupadd docker && sudo usermod -aG docker $USER && \
    sudo systemctl enable docker.service && sudo systemctl enable containerd.service

echo "Installing other packages"
ask_yes_no_default "Do you want to install other packages?" 0 && yay -S btop keybase yt-dlp mongodb-compass zoxide mkcert jq entr ripgrep lazydocker-bin stacer plasma-systemmonitor just github-cli postman-bin httpie  mpv ark jetbrains-toolbox tmux lsd thefuck alacritty taskwarrior-tui git-delta kcolorchooser grex fd sd tealdeer bat the_silver_searcher git-secrets fzf git-interactive-rebase-tool-bin mousepad nano mojave-gtk-theme-git adwaita-icon-theme capitaine-cursors gparted htop la-capitaine-icon-theme neovim rate-mirrors spectacle vlc youtube-dl gwenview ktorrent persepolis

echo 'Installing Zsh with Oh My Zsh and other plugins'
ask_yes_no_default "Do you want to install Zsh with Oh My Zsh and other plugins?" 0 && \
    sudo pacman -S zsh && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open && \
    git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate && \
    git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache && \
    git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

echo 'Adding plugins for asdf and installing golang and nodejs'
ask_yes_no_default "Do you want to add plugins for asdf and install Golang and Node.js?" 0 && \
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1 && \
    source ~/.zshrc && \
    asdf update && \
    declare -A versions=( ["nodejs"]="20.10.0" ["golang"]="1.21.5" ["rust"]="1.74.1" ["ruby"]="3.2.2" ) && \
    for plugin in "${!versions[@]}"; do \
        asdf plugin add "$plugin" && \
        asdf install "$plugin" "${versions[$plugin]}" && \
        asdf global "$plugin" "${versions[$plugin]}"; \
    done

ask_yes_no_default "Do you want to install LunarVim?" 0 && \
    echo 'Installing LunarVim' && \
    LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) && \
    yay -Rns kate okular

ask_yes_no_default "Do you want to remove unused packages?" 0 && sudo pacman -Qtdq | sudo pacman -Rns -

ask_yes_no_default "Do you want to apply chezmoi configuration?" 0 && chezmoi init --apply rubiin
