FROM golang
MAINTAINER Alexander F Rødseth <xyproto@archlinux.org>

RUN apt-get update && \
    apt-get install -y node-typescript vim emacs-nox && \
    apt-get clean

RUN go get -u github.com/jteeuwen/go-bindata/...

RUN git clone https://github.com/xyproto/typescript_in_go
WORKDIR typescript_in_go

CMD ["make"]
