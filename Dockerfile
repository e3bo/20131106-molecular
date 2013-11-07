FROM archlinux
MAINTAINER Eamon O'Dea <[last name without apostrophe]35@gmail.com>

RUN pacman -S jre7-openjdk-headless 7.u45_2.4.3-1
RUN mkdir opt && cd opt && curl -C - -f http://beast-mcmc.googlecode.com/files/BEASTv1.8.0.tgz | tar -xz -
RUN ln -s /opt/BEASTv1.8.0/bin/{beast,treeannotator} /usr/bin
RUN useradd -m -g users -s /bin/bash archie

ENTRYPOINT ["make"]
USER archie
