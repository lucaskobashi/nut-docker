FROM alpine

# dependencies
RUN apk add \
		git \
		jq \
		gcc \
		libusb \
		python3 \
		python3-dev \
		py3-pip \
		py3-qt5 \
		libressl-dev \
		curl-dev \
		musl-dev \
		jpeg-dev \
		zlib-dev \
		libffi-dev

RUN git clone https://github.com/blawar/nut.git
RUN pip3 install wheel
RUN pip3 install -r ./nut/requirements.txt

COPY ./entrypoint.sh /

EXPOSE 9000
ENTRYPOINT sh entrypoint.sh
