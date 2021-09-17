# https://github.com/asdf-community/asdf-hashicorp
install-terraform:
    asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
    asdf install terraform latest
    asdf global terraform latest
