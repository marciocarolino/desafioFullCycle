FROM golang:1.20-alpine AS build

WORKDIR /app/

COPY go.mod fullCycle.go  /app/

RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo

EXPOSE 8888

ENTRYPOINT [ "/bin/demo" ]