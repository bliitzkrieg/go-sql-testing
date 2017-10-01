FROM golang
ADD . /go/src
WORKDIR /go/src

RUN go get github.com/go-sql-driver/mysql
RUN go get github.com/gorilla/mux
RUN go build -o bin/main main.go app.go model.go
RUN git clone https://github.com/vishnubob/wait-for-it.git
RUN ./wait-for-it/wait-for-it.sh --host=db --port=3306 --timeout=60

ENTRYPOINT /go/src/bin/main

EXPOSE 8080