FROM golang
ADD . /go/src
WORKDIR /go/src

RUN go get github.com/go-sql-driver/mysql
RUN go get github.com/gorilla/mux
RUN go build -o bin/main main.go app.go model.go

ENTRYPOINT /go/src/bin/main

EXPOSE 8080