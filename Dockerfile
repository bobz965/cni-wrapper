FROM roboxes/centos8:3.6.14
RUN dnf install -y wget tar git 
COPY . .
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
RUN go version
RUN tar -xf v1.2.1.tar.gz 
RUN cd terway-1.2.1 && git apply ../terway-yealink.patch && CGO_ENABLED=0 go build -o ../terway ./plugin/terway/
# put /terway from this docker image into another cnid image
