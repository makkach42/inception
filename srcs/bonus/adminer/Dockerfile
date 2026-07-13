FROM debian:bookworm

RUN apt update && apt install -y php wget

RUN wget https://www.adminer.org/latest.php -O adminer.php

CMD [ "php", "-S", "0.0.0.0:9999", "/adminer.php" ]