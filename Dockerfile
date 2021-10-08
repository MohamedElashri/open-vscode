FROM gitpod/openvscode-server:nightly

USER root

# Install specific extensions because `VSCODE_IPC_HOOK_CLI` is missing
RUN apt-get update && apt-get -y install zip wget

# copy all .vsix files to /home
COPY extensions/*.vsix /home/

#mkdir for each extension
#Don't forget to change $version
RUN mkdir /home/openvscode-server-nightly-v1.61.0-linux-x64/extensions/muhammadelashri

#unzip (add one per each)
RUN unzip /home/muhammadelashri.FHiCL-0.0.4.vsix "extension/*" -d /home/openvscode-server-nightly-v1.61.0-linux-x64/extensions/muhammadelashri/

USER openvscode-server
