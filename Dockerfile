# GroundAuth Development Dockerfile

FROM golang:1.22-alpine AS builder

RUN apk add --no-cache git

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /groundauth ./cmd/groundauth

FROM alpine:3.19

RUN apk add --no-cache ca-certificates

WORKDIR /app

COPY --from=builder /groundauth .
COPY . .

EXPOSE 443 8080

CMD ["./groundauth"]
