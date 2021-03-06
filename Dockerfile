FROM mlenv:1.0.0

# The user name you can set you want.
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG USER_NAME=mlcontainer


# Add non-root $USER_NAME user which this Dockerfile gives sudo access.
# Warning! If you have user in the base image, it will fail to add new user with the default id.
RUN useradd -m $USER_NAME \
    && echo "$USER_NAME:$USER_NAME" | chpasswd \
    && usermod --shell /bin/bash $USER_NAME \
    # [Optional] Update a non-root user to match UID/GID - see https://aka.ms/vscode-remote/containers/non-root-user.
    && if [ "$USER_GID" != "1000" ]; then groupmod $USER_NAME --gid $USER_GID; fi \
    && if [ "$USER_UID" != "1000" ]; then usermod --uid $USER_UID node; fi

ENV LANGUAGE=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    # Avoid warnings by switching to noninteractive
    DEBIAN_FRONTEND=noninteractive \
    # Default display to 0 on the host
    DISPLAY=host.docker.internal:0


RUN apt-get update \
    && apt install -y \
    # [Optional] Add add sudo support for non-root user
    && apt-get install -y sudo \
    && echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME \
    && chmod 0440 /etc/sudoers.d/$USER_NAME
# RUN echo 'export PATH="/opt/conda/bin/:$PATH"' >> ~/.bashrc

# Open Ports for TensorBoard, Jupyter, and SSH
EXPOSE 6006
EXPOSE 7654
EXPOSE 22

# #Setup File System
# RUN mkdir ds
# ENV HOME=/ds
# ENV SHELL=/bin/bash
# VOLUME /ds
# WORKDIR /ds
# ADD run_jupyter.sh /ds/run_jupyter.sh
# RUN chmod +x /ds/run_jupyter.sh

# # Run the shell
# CMD [ "/bin/bash" ]

# Default to non-root user
USER $USER_NAME

# Go back to the default apt frontend
ENV DEBIAN_FRONTEND=