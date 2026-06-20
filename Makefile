all:	build_nginx build_maria build_wordpress run_nginx run_maria run_wordpress

build_nginx:
	docker build -t nginx ./srcs/requirements/nginx
build_maria:
	docker build -t mariadb ./srcs/requirements/mariadb
build_wordpress:
	docker build -t wordpress ./srcs/requirements/wordpress

run_nginx:
	docker run -d --name nginx -p 8000:80 nginx
run_maria:
	docker run -d --name mariadb mariadb
run_wordpress:
	docker run -d --name wordpress wordpress


rm_cont_nginx:
	docker rm -f nginx
rm_cont_maria:
	docker rm -f mariadb
rm_cont_wp:
	docker rm -f wordpress

