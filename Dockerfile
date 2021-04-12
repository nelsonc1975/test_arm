FROM alpine AS build
RUN apk add --no-cache alpine-sdk
WORKDIR /app
COPY app/* .
RUN gcc -static -o hello hello.c

FROM scratch
WORKDIR /app
COPY --from=build /app/hello .
ENTRYPOINT ["/app/hello"]
