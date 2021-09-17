FROM golang:1.14-alpine AS build

WORKDIR /src/
ADD . /src/
RUN apk add --update make
RUN make build

FROM alpine
COPY --from=build /src/target/openldap_exporter-linux /bin/openldap_exporter

ENTRYPOINT ["/bin/openldap_exporter"]
