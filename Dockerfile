FROM ubuntu:eoan
LABEL mantainer=BlueKrow
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

COPY ./entrypoint.sh ./dockerfile.run.base.sh ./dockerfile.run.jekyll.sh ./
RUN ./dockerfile.run.base.sh
#RUN ./dockerfile.run.jekyll.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["check"]