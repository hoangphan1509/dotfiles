install-zsh-plugins:
    git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-256color

install-common:
    sudo apt install -y git zsh build-essential openssh-server network-manager-openvpn-gnome tmux libmysqlclient-dev htop

install-python:
    sudo apt install -y python3 python3-dev python3-pip python3-venv python-is-python3
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    python3 -m pipx completions
    python3 -m pipx install poetry

install-space-vim:
    sudo apt install vim
    curl -sLf https://spacevim.org/install.sh | bash

install-mordern-unix-tools:
    sudo apt install -y bat delta fzf jq httpie
    cargo install lsd
    cargo install du-dust
    cargo install zoxide

install-rust:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

install-miniconda:
    curl -sLf https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh | bash -b

install-docker:
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo groupadd docker || true
    sudo usermod -aG docker $USER
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
    mkdir -p ~/.docker/cli-plugins/
    curl -SL https://github.com/docker/compose-cli/releases/download/v2.0.0-rc.1/docker-compose-linux-amd64 -o ~/.docker/cli-plugins/docker-compose
    chmod +x ~/.docker/cli-plugins/docker-compose

install-ibus-bamboo:
    sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
    sudo apt-get update
    sudo apt-get install ibus-bamboo
    ibus restart


install-gcp:
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    sudo apt-get install apt-transport-https ca-certificates gnupg
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update && sudo apt-get install google-cloud-sdk


install-oci:
    pipx install oci-cli

install-k8s:
    sudo apt-get update && sudo apt-get install -y apt-transport-https
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
    sudo dpkg -i minikube_latest_amd64.deb


install-brew:
    #!/bin/bash
    if ! command -v brew &> /dev/null
    then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install derailed/k9s/k9s

install-torrent:
    sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
    sudo apt-get update && sudo apt-get -y install qbittorrent

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
    ln -s {{justfile_directory()}}/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
    rm $HOME/.gitconfig || true
    rm $HOME/.gitconfig-fmv || true
    ln -s {{justfile_directory()}}/git/.gitconfig $HOME/.gitconfig
    ln -s {{justfile_directory()}}/git/.gitconfig-fmv $HOME/.gitconfig-fmv
