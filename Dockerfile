FROM ubuntu/eoan
LABEL mantainer=BlueKrow
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["echo", "Image Ready"]
