FROM dalongrong/openjdk11:stretch-jvm-tools
LABEL AUTHOR="rongfengliang"
LABEL EMAIL="1141591465@qq.com"
ENV VERSION=4.0
ENV ACEQL_HTTP_HOST=localhost
WORKDIR /app
RUN wget https://www.aceql.com/rest/soft/${VERSION}/download/aceql-http-${VERSION}.run \
    && chmod +x aceql-http-${VERSION}.run \
    && sh aceql-http-${VERSION}.run \
    && rm -rf aceql-http-${VERSION}.run
ENV PATH=$PATH:/app/aceql-http-${VERSION}/bin
ENV ACEQL_HOME=/app/aceql-http-${VERSION}
COPY aceql-server.properties /app/aceql-http-${VERSION}/conf/aceql-server.properties
COPY entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh
EXPOSE 9090
ENTRYPOINT [ "/entrypoint.sh" ]