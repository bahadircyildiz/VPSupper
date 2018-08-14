FROM ubuntu:14.04.4

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y git

RUN find /app -type f -iname "*.sh" -exec chmod +x {} \;

ENTRYPOINT [ "./setup.sh" ]