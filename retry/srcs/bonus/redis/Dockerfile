FROM debian:bookworm

RUN apt update && apt install -y redis

CMD ["redis-server", "--bind", "0.0.0.0", "--protected-mode", "no"]