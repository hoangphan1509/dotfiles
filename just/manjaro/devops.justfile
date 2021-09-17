install-devops-tools:
    pamac install docker \
        docker-compose \
        minikube \
        helm \
        terraform \
        infracost \
        oci-cli \
        google-cloud-sdk \
        krew
    sudo pacman -S k9s