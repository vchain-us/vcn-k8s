FROM codenotary/vcn:latest as vcn
FROM pierrezemb/gostatic:latest as gostatic
FROM docker:latest
ADD verify.prometheus /verify
RUN chmod +x /verify
RUN apk update && apk add bash ca-certificates jq curl && rm -rf /var/cache/apk/*
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
COPY --from=vcn /bin/vcn /bin/vcn
COPY --from=gostatic /goStatic /bin/goStatic
ENTRYPOINT /verify
