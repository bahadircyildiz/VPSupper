FROM scratch

WORKDIR /app

COPY . /app

RUN pwd

ENTRYPOINT [ "/app/setup.sh" ]