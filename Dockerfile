FROM ubuntu:eoan
LABEL mantainer=BlueKrow
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

COPY ./entrypoint.sh /
RUN apt-get update -qq > /dev/null \
 && apt-get install ruby-full build-essential zlib1g-dev -qq > /dev/null

RUN gem install jekyll bundler --silent

ENTRYPOINT ["/entrypoint.sh"]
CMD ["check"]