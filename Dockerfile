FROM ruby:2.7.1

RUN wget https://dl.yarnpkg.com/debian/pubkey.gpg
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN cat pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn postgresql-client libgmp-dev

RUN mkdir /come_across
WORKDIR /come_across
COPY Gemfile /come_across/Gemfile
COPY Gemfile.lock /come_across/Gemfile.lock
COPY package.json /come_across/package.json
COPY yarn.lock /come_across/yarn.lock
RUN gem install bundler
RUN bundle config set force_ruby_platform true
RUN bundle install
RUN yarn install --ignore-engines
COPY . /come_across

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
