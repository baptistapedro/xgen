FROM golang:1.19.1-buster as builder

ADD . /xgen
WORKDIR /xgen/cmd/xgen
RUN go build

FROM golang:1.19.1-buster
COPY --from=builder /xgen/xmlFixtures/*.xml /testsuite/
COPY --from=builder /xgen/cmd/xgen/xgen /

ENTRYPOINT []
CMD ["/xgen", "-i", "@@", "-o", "/dev/null", "-l", "Go"]
