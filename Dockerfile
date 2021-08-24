FROM ruby:3.0.1-buster

WORKDIR /app

ARG BUNDLE_INSTALL_ARGS="-j 4"
COPY Gemfile* ./

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY . ./

CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000
