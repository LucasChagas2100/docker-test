FROM golang as builder
WORKDIR /app
COPY *.go /app
RUN go build -ldflags "-s -w" main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main /app/main
CMD [ "/app/main" ]

EXPOSE 8000