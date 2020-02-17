FROM ubuntu:eoan
LABEL mantainer=BlueKrow
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

COPY ./dockerfile.run.base.sh ./
RUN ./dockerfile.run.base.sh

COPY ./dockerfile.run.jekyll.sh ./
RUN ./dockerfile.run.jekyll.sh

COPY ./entrypoint.sh ./
ENTRYPOINT ["/entrypoint.sh"]
CMD ["check"]