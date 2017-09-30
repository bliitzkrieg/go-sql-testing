FROM golang
EXPOSE 8080
ADD . /go/src
WORKDIR /go/src
RUN go build main.go
CMD ['./main']
