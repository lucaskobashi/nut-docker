FROM alpine

# dependencies
RUN apk add \
		git \
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

EXPOSE 9000
CMD python3 /nut/nut.py -S >> /var/log/nut.log
