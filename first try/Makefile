DOMAIN := $(shell grep "DB_ROOT" srcs/requirements/wordpress/.env | grep DB_ROOT | cut -d'=' -f2).42.fr

all:
	@if ! grep -q "$(DOMAIN)" /etc/hosts; then \
		FILE=$$(cat /etc/hosts); \
		sudo bash -c 'echo "127.0.0.1 $(DOMAIN)" > /etc/hosts'; \
	fi
	docker compose -f ./srcs/docker-compose.yml up --build

fclean:
	docker compose -f ./srcs/docker-compose.yml down