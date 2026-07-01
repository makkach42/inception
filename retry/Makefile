
all:
	mkdir -p /home/$$USER/data/mariadb /home/$$USER/data/wordpress
	echo "127.0.0.1 $$(grep DOMAIN srcs/.env | cut -d= -f2)" | sudo tee /etc/hosts
	docker compose -f ./srcs/docker-compose.yml up --build

fclean:
	docker compose -f ./srcs/docker-compose.yml down
	docker rmi nginx mariadb wordpress

re: fclean all