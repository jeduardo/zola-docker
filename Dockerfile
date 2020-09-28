FROM rust:slim-buster AS fetcher
WORKDIR /
RUN apt-get update && \
    apt-get install -y curl
RUN curl -sL $(curl -s https://api.github.com/repos/getzola/zola/releases/latest | \
    grep browser_download_url | \
    grep -i $(uname -s) | \
    cut -d : -f 2,3 | \
    sed 's/"//g') | \
    tar zxf -
RUN chmod u+x zola

FROM debian:buster-slim
RUN apt-get update && apt-get install -y git awscli
WORKDIR /
COPY --from=fetcher /zola /usr/local/bin/zola
