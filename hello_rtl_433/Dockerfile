ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.16
FROM $BUILD_FROM as builder

ENV LANG C.UTF-8

RUN apk add --no-cache --virtual .buildDeps \
    build-base \
    libusb-dev \
    librtlsdr-dev \
    cmake \
    git

WORKDIR /build

RUN git clone https://github.com/merbanan/rtl_433

WORKDIR ./rtl_433

ARG rtl433GitRevision=master

RUN git checkout ${rtl433GitRevision}

WORKDIR ./build

RUN cmake ..
RUN make -j 4

WORKDIR /build/rtl_433/build

run make DESTDIR=/build/root/ install

FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache libusb \
    librtlsdr sed

WORKDIR /root

COPY --from=builder /build/root/ / 

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

