#!/usr/bin/bash

set -e

RED="\e[31m"
BLUE="\e[34m"
ORANGE="\e[38;5;208m"
RESET="\e[0m"

NVIM_VERSION="v0.10.4"
NVIM_PLUGIN_REPO="git@github.com:pi-sigma/nvim-plugins.git"

# print colored message, surround with dashes
color_msg() {
  local color="$1"
  local msg="$2"

  local length=${#msg}

  printf "\n${color}%*s${RESET}\n" "$length" '' | tr ' ' '-'
  printf "\n${color}%s${RESET}\n" "$msg"
  printf "\n${color}%*s${RESET}\n" "$length" '' | tr ' ' '-'
}


#=== SYSTEM-SPECIFIC SETUP =============================================================
setup_fedora() {
    # Check that packages are up-to-date
    if dnf check-update -q >/dev/null; then
        color_msg "$BLUE" "Setting up Fedora"
    else
        color_msg "$RED" "Update system packages before running this script"
        exit 1
    fi

    # DNF plugins
    color_msg "$BLUE" "Installing dnf plugins"

    sudo dnf -y install dnf-plugins-core

    # General build tools
    color_msg "$BLUE" "Installing general build tools"

    sudo dnf -y install \
        autoconf \
        automake \
        cmake \
        gcc \
        gcc-c++ \
        gettext \
        kernel-devel \
        make

    # X11
    color_msg "$BLUE" "Installing X11 build tools"

    sudo dnf -y install \
        libX11-devel \
        libXext-devel \
        libXrender-devel \
        libXrandr-devel \
        libXtst-devel \
        libXi-devel \
        libXft-devel \
        libXinerama-devel \
        xorg-x11-server-devel \
        xorg-x11-proto-devel \
        xorg-x11-fonts-*

    # Neovim
    color_msg "$BLUE" "Installing Neovim build dependencies"

    sudo dnf -y install \
        ninja-build \
        glibc-gconv-extra \
        lua-devel \
        luajit-devel

    # General-purpose tools
    color_msg "$BLUE" "Installing general-purpose tools"

    sudo dnf -y install \
        alacritty \
        curl \
        fzf \
        jq \
        keychain \
        meld \
        patch \
        pkgconfig \
        scrot \
        stow \
        tig \
        unzip \
        xclip

    # Python
    color_msg "$BLUE" "Installing Python development libraries"

    sudo dnf -y install python3-devel
    sudo dnf -y install libxml2-devel libxslt-devel
    sudo dnf -y install python3-lxml python3-xmlsec
    sudo dnf -y install python3-pip

    sudo pip3 install virtualenvwrapper

    # Postgres
    color_msg "$BLUE" "Installing Postgres"

    sudo dnf -y install \
        postgresql-server \
        postgresql-contrib \
        postgresql-devel \
        libpq-devel

    if ! systemctl -q is-active postgresql; then
        sudo postgresql-setup --initdb --unit postgresql
        sudo systemctl enable --now postgresql
    fi

    # Docker
    color_msg "$BLUE" "Installing Docker"

    if [ ! -e /etc/yum.repos.d/docker-ce.repo ]; then
        sudo dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
    fi

    sudo dnf -y install \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin

    if ! systemctl -q is-active docker; then
        sudo systemctl enable --now docker
    fi

    # Swap ESC & CAPS
    localectl set-x11-keymap us "" "" caps:swapescape

    # Configure default login via shell or GUI
    # sudo systemctl set-default multi-user.target
    # sudo systemctl set-default graphical.target
}

setup_debian() {
    echo "Setting up Debian-based OS (Debian or Ubuntu)"
    echo "Installing general build tools for Debian/Ubuntu"
}


#=== PLATFORM-INDEPENDENT TOOLS ========================================================
install_neovim() {
    if command -v nvim &> /dev/null; then
        color_msg "$ORANGE" "Neovim is already installed: skipping"
    else
        color_msg "$BLUE" "Installing Neovim"

        # https://github.com/neovim/neovim/blob/master/BUILD.md
        repo="https://github.com/neovim/neovim"

        if [ ! -d "${HOME}/.local/etc/" ]; then
            mkdir -p "${HOME}/.local/etc/"
        fi

        cd "${HOME}/.local/etc" && git clone "$repo" && cd neovim || { echo "Error cloning '$repo'" > "${HOME}/setup-logs.txt"; }

        git checkout "$NVIM_VERSION"

        # best performance (RelWithDebInfo for more debug info)
        make CMAKE_BUILD_TYPE=Release

        sudo make install
    fi
}

install_neovim_plugins() {
    target="${HOME}/.local/share/nvim/site/pack/plugins"

    if [ -d "$target" ]; then
        color_msg "$ORANGE" "Neovim plugins already installed; skipping"
    else
        color_msg "$BLUE" "Installing Neovim plugins"

        mkdir -p "$target"

        git clone --recurse-submodules "$NVIM_PLUGIN_REPO" "$target"  || { echo "Error cloning Neovim plugins" > "${HOME}/setup-logs.txt"; }
    fi
}

install_dwm() {
    # DWM
    if [ -d "${HOME}/.local/etc/suckless/dwm/" ]; then
        color_msg "$ORANGE" "DWM is already installed: skipping"
    else
        color_msg "$BLUE" "Installing DWM"

        git clone git@github.com:pi-sigma/dwm "${HOME}/.local/etc/suckless/dwm/" || { echo "Error cloning DWM" > "${HOME}/setup-logs.txt"; }

        cd "${HOME}/.local/etc/suckless/dwm/" && sudo make install clean
    fi

    # dmenu
    if [ -d "${HOME}/.local/etc/suckless/dmenu/" ]; then
        color_msg "$ORANGE" "dmenu is already installed: skipping"
    else
        color_msg "$BLUE" "Installing dmenu"

        git clone https://git.suckless.org/dmenu "${HOME}/.local/etc/suckless/dmenu/" || { echo "Error cloning dmenu" > "${HOME}/setup-logs.txt"; }

        cd "${HOME}/.local/etc/suckless/dmenu/" && sudo make install clean
    fi

    # DWM status bar
    if [ -d "${HOME}/.local/etc/suckless/dwmstatus/" ]; then
        color_msg "$ORANGE" "DMW statusbar is already installed: skipping"
    else
        color_msg "$BLUE" "Installing DWM status bar"

        git clone git@github.com:pi-sigma/dwmstatus.git "${HOME}/.local/etc/suckless/dwmstatus/" || { echo "Error cloning DWM status bar" > "${HOME}/setup-logs.txt"; }

        cd "${HOME}/.local/etc/suckless/dwmstatus" && sudo make install clean
    fi
}

install_fasd() {
    if command -v fasd &> /dev/null; then
        color_msg "$ORANGE" "fasd is already installed: skipping"
    else
        color_msg "$BLUE" "Installing fasd"

        repo=https://github.com/clvv/fasd.git
        git clone $repo "${HOME}/.local/etc/fasd/" || { echo "Error cloning '$repo'" > "${HOME}/setup-logs.txt"; }
        cd "${HOME}/.local/etc/fasd/" && sudo make install
    fi
}

install_tools() {
    color_msg "$BLUE" "Installing platform-independent tools"

    install_neovim
    if [[ -n "$NVIM_PLUGIN_REPO" ]]; then
        install_neovim_plugins
    fi
    install_dwm
    install_fasd
}


stow_dotfiles() {
    color_msg "$BLUE" "Stowing dotfiles"

    cd "${HOME}/.dotfiles/"

    # overwrite existing files & restore repository; ignore scripts
    for pkg in *; do
        [ "$pkg" == "scripts" ] && continue
        stow --adopt "${pkg%/}"
    done
    git restore .

    ln -s /home/pschilling/.dotfiles/scripts/screenshot.sh /home/pschilling/scripts/
}

#=== MAIN ===============================================================================
main() {
    if [[ ! -f /etc/os-release ]]; then
        color_msg "$RED" "OS information not found"
        exit 1
    fi

    cd "$HOME"

    source /etc/os-release
    if [[ "$ID" == "fedora" ]]; then
        setup_fedora
    elif [[ "$ID" == "ubuntu" || "$ID" == "debian" || "$ID_LIKE" == *"debian"* ]]; then
        setup_debian
    else
        color_msg "$RED" "Unsupported Linux distro found ('$ID'); aborting"
        exit 1
    fi

    install_tools
    stow_dotfiles
}

main
