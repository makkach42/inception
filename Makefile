
all:
	mkdir -p /home/$$USER/data/mariadb /home/$$USER/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

up:
	docker compose -f ./srcs/docker-compose.yml up

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start

fclean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo rm -rf /home/$$USER/data

re: fclean all