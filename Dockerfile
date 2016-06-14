FROM ruby:2.3.1
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

ENV TDIARY_CORE_VERSION=v5.0.0
ENV TDIARY_CONTRIB_VERSION=v5.0.0
ENV TDIARY_CACHE_NULL_VERSION=v0.1.2
ENV TDIARY_IO_RDB_VERSION=v0.0.2
ENV TDIARY_STYLE_GFM_VERSION=v0.3.0
ENV MAGELLAN_PROXY_VERSION=0.1.5

## install tdiary-core to /usr/src/app
RUN git clone -b ${TDIARY_CORE_VERSION} https://github.com/tdiary/tdiary-core.git /usr/src/app
RUN cd /usr/src/app && bundle install --jobs=4 --without=development:test

## customize tdiary
ADD build /build
RUN cp -a /build/Gemfile.local /usr/src/app/ && cd /usr/src/app && bundle install
RUN cp -a /build/tdiary.conf   /usr/src/app/
RUN cp -a /build/config.ru     /usr/src/app/

## copy js, theme to public/assets
RUN cd /usr/src/app && rake assets:copy

## download Phusion Passenger agent binary
RUN passenger start --runtime-check-only

## install entrypoint script, and utility
RUN install -m 755 -o root -g root -p -D /build/entrypoint /opt/magellan-tdiary/entrypoint
RUN install -m 644 -o root -g root -p -D /build/Rakefile   /opt/magellan-tdiary/Rakefile

## install magellan-proxy
ADD https://github.com/groovenauts/magellan-proxy/releases/download/v${MAGELLAN_PROXY_VERSION}/magellan-proxy-${MAGELLAN_PROXY_VERSION}_linux-amd64 /usr/local/bin/magellan-proxy
RUN chmod +x /usr/local/bin/magellan-proxy

## cleanup
RUN rm -rf /build

ENV RACK_MINI_PROFILER_ENABLED true
ENV RUBY_GC_PROFILER_ENABLED true
ENV TDIARY_BASIC_AUTH_USERNAME tdiary
ENV TDIARY_BASIC_AUTH_PASSWORD tdiary

WORKDIR /usr/src/app

ENTRYPOINT ["/opt/magellan-tdiary/entrypoint"]
CMD [ "magellan-proxy", "-n", "5", \
      "bundle", "exec", "passenger", "start", "-p", "80", "-e", "production", "--max-pool-size", "3", \
      "--pid-file", "tmp/passenger.pid", "--load-shell-envvars", "--static-files-dir", "public" ]

