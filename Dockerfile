FROM golang:1.16-alpine

WORKDIR $APP_HOME

# Download necessary Go modules
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# copy source code
COPY *.go ./

# build binary
RUN go build -o ops-tech-challenge

EXPOSE 8080

CMD ["/ops-tech-challenge"]