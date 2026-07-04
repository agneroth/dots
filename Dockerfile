ARG USERNAME="agneroth"
ARG GIT_DIR="/home/${USERNAME}/git"
ARG DOTS_DIR="${GIT_DIR}/dots"
ARG UID="1001"
ARG GID="1001"
ARG DEPENDENCIES="neovim tmux ripgrep btop fzf zsh starship stow fd-find bat"

FROM ubuntu:26.04

ARG USERNAME
ARG DOTS_DIR
ARG GIT_DIR
ARG UID
ARG GID
ARG DEPENDENCIES

# locales

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install sudo git curl build-essential xz-utils openssh-server man-db ${DEPENDENCIES} -y
    # locale-gen en_US.UTF-8 && \
    # update-locale LANG=en_US.UTF-8

# Create new user, enable sudo
RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -u ${UID} -g ${GID} --create-home --shell /usr/bin/zsh ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/${USERNAME}
USER ${USERNAME}

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"

# Bootstrap dots
COPY --chown=${USERNAME}:${USERNAME} dots ${DOTS_DIR}
# TODO: Clone chezmoi
# COPY --chown=${USERNAME}:${USERNAME} chezmoi /home/${USERNAME}/.local/share/chezmoi

RUN mkdir -p "${HOME}/.ssh"

RUN chezmoi apply
# Update nvim
RUN nvim --headless "+Lazy! sync" "+MasonUpdate" +qa
