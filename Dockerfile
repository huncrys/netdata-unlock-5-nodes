# syntax=docker/dockerfile:1

FROM denoland/deno:alpine-2.5.6@sha256:b9c7668c78fe393893f00b0fc8ba3d0f2e1bbb8f891a79a963b3b713ab110767

WORKDIR /app

COPY deno.* *.ts ./

RUN deno cache main.ts

CMD ["deno", "run", "--allow-net", "--allow-env=NETDATA_BASE_URL,HOST,PORT", "main.ts"]

EXPOSE 8000
