install-zsh-plugins:
    git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-256color

install-common:
    sudo apt install -y git zsh build-essential openssh-server network-manager-openvpn-gnome

install-python:
    sudo apt install -y python3 python3-dev python3-pip python3-venv
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    python3 -m pipx completions
    python3 -m pipx install poetry

install-space-vim:
    sudo apt install vim
    curl -sLf https://spacevim.org/install.sh | bash

install-vs-code-extension:
    code --install-extension ms-python.python
    code --install-extension skellock.just

install-mordern-unix-tools:
    sudo apt install -y bat delta fzf jq httpie
    cargo install lsd
    cargo install du-dust
    cargo install zoxide

install-rust:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

install-miniconda:
    curl -sLf https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh | bash -b

install-ibus-bamboo:
    sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
    sudo apt-get update
    sudo apt-get install ibus-bamboo
    ibus restart

clone-tamara-repo:
    #!/bin/sh
    cd ~/workspace/tamara
    git clone git@gitlab.com:tamara-backend/bi-group/curry-superset.git
    git clone git@gitlab.com:tamara-backend/bi-group/data-warehouse-projection.git
    git clone git@gitlab.com:tamara-backend/bi-group/dataops.git
    git clone git@gitlab.com:tamara-backend/bi-group/pho-airflow.git
    git clone git@gitlab.com:tamara-backend/bi-group/poc.git

link-dotfiles:
    rm ~/.zshrc
    ln -s {{justfile_directory()}}/zsh/.zshrc $HOME/.zshrc
    mkdir -p $HOME/.config/alacritty || true
    rm $HOME/.config/alacritty/alacritty.yml || true
    ln -s ./{{justfile_directory()}}/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
