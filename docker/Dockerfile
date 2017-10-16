FROM golang
MAINTAINER Alexander F Rødseth <xyproto@archlinux.org>

RUN apt-get update && \
    apt-get install -y node-typescript vim emacs-nox && \
    apt-get clean

RUN go get -u github.com/jteeuwen/go-bindata/...

RUN git clone https://github.com/xyproto/ts_in_go
RUN cd ts_in_go && go get -d -v

WORKDIR ts_in_go

CMD ["make"]
