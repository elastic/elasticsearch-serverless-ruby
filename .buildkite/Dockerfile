ARG RUBY_VERSION=${RUBY_VERSION:-3.1}
ARG RUBY_SOURCE=${RUBY_SOURCE:-ruby}
FROM $RUBY_SOURCE:$RUBY_VERSION

ARG QUIET=${QUIET:-true}
ARG CI=${CI:-false}
ENV QUIET=$QUIET
ENV CI=$CI

# Install required tools
RUN apt-get -q update && apt-get -y install zip curl git
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .

RUN bundle install
