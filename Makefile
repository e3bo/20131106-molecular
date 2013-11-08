BEAST=/usr/bin/beast

all: shortnames.log

shortnames.log: shortnames.xml
	. /opt/sun-java6/envsetup.sh && $(BEAST) $<
