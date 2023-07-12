ARG BUILD_FROM=homeassistant/amd64-base-python:3.9-alpine3.16
FROM ${BUILD_FROM} as builder

COPY rtl_433_mqtt_hass.py .
COPY run.sh .

RUN \
    pip install \
        --no-cache-dir \
        --prefer-binary \
        paho-mqtt

RUN chmod a+x run.sh

CMD [ "/run.sh" ]

