FROM bwits/pdf2htmlex-alpine
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "wget -q http://localhost:8080/healthcheck -O /dev/null || exit -1" ]

WORKDIR /usr/local/bin/

USER 1000

