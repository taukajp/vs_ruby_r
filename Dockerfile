# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.187.0/containers/ruby/.devcontainer/base.Dockerfile

# [Choice] Ruby version: 3, 3.0, 2, 2.7, 2.6
ARG VARIANT="3.0"
#FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}
FROM ruby:${VARIANT}

# [Option] Install Node.js
ARG INSTALL_NODE="true"
ARG NODE_VERSION="lts/*"
RUN if [ "${INSTALL_NODE}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
 && apt-get -y install --no-install-recommends \
    vim zsh \
    # build-essential \
    # patch ruby-dev zlib1g-dev liblzma-dev libxslt1-dev libxml2-dev libreadline-dev \
 && apt-get autoremove -y && apt-get clean -y

COPY .devcontainer/.zshrc /root/

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1
