FROM quay.io/jupyter/minimal-notebook:2024-06-24

USER root

# Copy and run setup scripts
COPY setup-scripts /opt/setup-scripts/
RUN /opt/setup-scripts/setup-linux-desktop.bash

# Set environment variables
ENV DISPLAY=":1.0"
ENV DESKTOP_FILES_DIR=/opt/desktop-files
ENV MIME_FILES_DIR=/opt/mime-files
RUN mkdir -p ${DESKTOP_FILES_DIR}  
# ${MIME_FILES_DIR}

ADD ./icons/orange.png /usr/share/backgrounds/images/orange.png

# Install Orange Data Mining
RUN mamba install -c conda-forge --yes orange3

# Copy Orange desktop entry
COPY orange-canvas.desktop ${DESKTOP_FILES_DIR}/orange-canvas.desktop
COPY orange-canvas.desktop /etc/xdg/autostart/orange-canvas.desktop

# Install jupyter-remote-desktop-proxy
RUN python -m pip install --no-cache jupyter-remote-desktop-proxy

# Copy startup scripts
COPY startup-scripts /usr/local/bin/start-notebook.d/

USER ${NB_UID}
