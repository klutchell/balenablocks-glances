ARG GLANCES_TAG=3.1.7

FROM nicolargo/glances:${GLANCES_TAG}

ENV DEBIAN_FRONTEND noninteractive

# hadolint ignore=DL3008
RUN apt-get update && \
	apt-get install --no-install-recommends -y console-setup dbus && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

ENV DBUS_SYSTEM_BUS_ADDRESS 'unix:path=/host/run/dbus/system_bus_socket'
ENV FONTFACE TerminusBold
ENV FONTSIZE 18x16

COPY run.sh /

RUN chmod +x /run.sh

CMD [ "/run.sh" ]
