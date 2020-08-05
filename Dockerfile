FROM schunit/schunit:edge

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install extra tooling
RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends make git \
 && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends apt-utils dialog \
 && DEBIAN_FRONTEND=noninteractive apt install -y openssh-server openssh-client less iproute2 procps lsb-release \
 #
 # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
 && groupadd --gid $USER_GID $USERNAME \
 && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
 #
 # Cleaning up
 && apt autoremove -y \
 && rm -rf /var/lib/apt/lists/* \
 && find /tmp -mindepth 1 -maxdepth 1 | xargs rm -rf