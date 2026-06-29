
all:
	mkdir -p /home/$$USER/data/mariadb /home/$$USER/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build

fclean:
	docker compose -f ./srcs/docker-compose.yml down
	docker rmi nginx mariadb wordpress

re: fclean all