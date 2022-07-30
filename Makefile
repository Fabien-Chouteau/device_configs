SOURCES:=$(wildcard modm-devices/devices/*/*.xml)

all:
	@for src in ${SOURCES} ; do \
		./scripts/modm-device_code_gen.py $$src; \
	done
