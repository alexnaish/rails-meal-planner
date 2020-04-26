FROM ruby

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT


## Rails stuff
RUN gem install rails bundler
RUN gem install rails
RUN apt-get update -qq && apt-get install -y nodejs sqlite3

## Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

ENTRYPOINT [ "/bin/bash" ]
