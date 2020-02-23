FROM ubuntu:eoan
LABEL mantainer=BlueKrow

ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8

COPY ./dockerfile.run.base.sh ./
RUN ./dockerfile.run.base.sh

COPY ./dockerfile.run.jekyll.sh ./
RUN ./dockerfile.run.jekyll.sh

COPY ./entrypoint.sh ./
ENTRYPOINT ["/entrypoint.sh"]
CMD ["check"]

WORKDIR /jkl-site

EXPOSE 4000
