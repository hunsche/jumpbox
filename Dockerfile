FROM ubuntu:22.04
RUN apt-get update && \
 apt-get install -y \
 vim \
 htop \
 iputils-ping \
 postgresql-client \
 screen
RUN apt-get install -y \
 ca-certificates \
 curl \
 apt-transport-https \
 lsb-release gnupg && \
 curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
 gpg --dearmor | \
 tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
 AZ_REPO=$(lsb_release -cs) && \
 echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
 tee /etc/apt/sources.list.d/azure-cli.list
RUN apt install -y \
 python3-pip && \
 pip3 install --user pipenv && \
 echo 'export PATH=$PATH:/root/.local/bin' >> ~/.bashrcexit
ENTRYPOINT ["bash", "-c", "while true; do echo 'running...'; sleep 2; done;"]