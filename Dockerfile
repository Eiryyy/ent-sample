FROM golang:1.20 as core

ENV APP_ROOT /app
WORKDIR $APP_ROOT

FROM core as dev

RUN go install github.com/google/wire/cmd/wire@latest
RUN go install -v golang.org/x/tools/gopls@latest
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.53.3

FROM core as stg

FROM core as prod
