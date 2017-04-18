FROM ubuntu:latest

MAINTAINER Lucas Nathan Barbosa de Oliveira "lucasnathan80@gmail.com"

# install dependences
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates
RUN apt-get install -y curl \
      fakeroot \
      gconf2 \
      gconf-service \
      git \
      gvfs-bin \
      libasound2 \
      libcap2 \
      libgconf-2-4 \
      libgtk2.0-0 \
      libnotify4 \
      libnss3 \
      libxkbfile1 \
      libxss1 \
      libxtst6 \
      python \
      xdg-utils
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

#Atom version
ENV ATOM_VERSION=v1.15.0

#install atom
RUN curl -L https://github.com/atom/atom/releases/download/${ATOM_VERSION}/atom-amd64.deb > /tmp/atom.deb
RUN dpkg -i /tmp/atom.deb
RUN rm -f /tmp/atom.deb

# Add atom user
RUN useradd -d /home/atom -m atom
USER atom

CMD ["/usr/bin/atom","-f", "."]
