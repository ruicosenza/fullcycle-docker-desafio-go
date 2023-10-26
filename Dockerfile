FROM golang:1.13.8-alpine3.11 AS builder
WORKDIR /home
COPY . .
RUN CGO_ENABLED=0 go build -ldflags='-s -w -extldflags "-static"' -a -o application full-cycle.go

FROM scratch
WORKDIR /home
COPY --from=builder /home ./


CMD ["./application"]