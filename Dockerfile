FROM ubuntu:eoan
LABEL mantainer=BlueKrow
COPY ./entrypoint.sh /
#RUN apt-get update -y
ENTRYPOINT ["/entrypoint.sh"]
CMD ["check"]
