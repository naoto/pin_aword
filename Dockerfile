FROM        ruby:2.5.3
MAINTAINER  Naoto SHINGAKI <n.shingaki@gmail.com>

ENV LANG C.UTF-8
RUN apt-get update
RUN gem install bundler

ADD . /pin2018
WORKDIR /pin2018
RUN bundle install

CMD ["bundle", "exec", "bin/pin2018"]
