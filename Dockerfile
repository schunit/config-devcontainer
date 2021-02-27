ARG VERSION=latest
FROM schunit/devcontainer:${VERSION}

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

 #
 # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
RUN groupadd --gid $USER_GID $USERNAME \
 && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME