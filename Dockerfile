FROM schmidh/arch-base
MAINTAINER Eamon O'Dea <[last name without apostrophe]35@gmail.com>

RUN cd tmp && curl https://aur.archlinux.org/packages/su/sun-java6/sun-java6.tar.gz | tar -xzf -
RUN cd tmp/sun-java6 && makepkg -c --asroot
RUN pacman -U --noconfirm /tmp/sun-java6/*.pkg.tar.xz

RUN install -d opt
RUN cd opt && curl http://beast-mcmc.googlecode.com/files/BEASTv1.8.0.tgz | tar -xzf -
RUN ln -s /opt/BEASTv1.8.0/bin/{beast,treeannotator} /usr/bin

ADD shortnames.xml ./shortnames.xml
ADD Makefile ./Makefile

ENTRYPOINT ["/usr/bin/make"]

