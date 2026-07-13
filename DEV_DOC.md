## Setting up from scratch ##
**Project structure required:**
```
project_root/
├── Makefile
├── secrets/
│   ├── DB_USER_PASSWORD
│   ├── WP_PASSWORD
│   ├── WP_SEC_USER_PASS
│   ├── ADMIN_USER_PASS
│   ├── FTP_USER_PASS
│   └── ROOT_PASS
└── srcs/
    ├── docker-compose.yml
    ├── .env
    ├── requirements/
    │   ├── nginx/
    │   ├── mariadb/
    │   └── wordpress/
    └── bonus/
        ├── static_website/
        ├── redis/
        ├── ftp_server/
        ├── ssh_server/
        └── adminer/
```
Create secrets — one password per file, no trailing content beyond the password itself:

```
mkdir -p secrets
echo "your_password" > secrets/DB_USER_PASSWORD
echo "your_password" > secrets/WP_PASSWORD
echo "your_password" > secrets/WP_SEC_USER_PASS
echo "your_password" > secrets/ADMIN_USER_PASS
echo "your_password" > secrets/FTP_USER_PASS
echo "your_password" > secrets/ROOT_PASS
```
Create srcs/.env:

```
DB_USER=makkach
DB_NAME=wordpress
DOMAIN=makkach.42.fr
TITLE=wordpress
ADMIN_USER=makkach_ad
ADMIN_EMAIL=makkach_ad@gmail.com
WP_SEC_USER=makkach2
WP_SEC_USER_MAIL=makkach2@gmail.com
FTP_USER=makkach_ftp
```

**Build and launch**

```
make        # creates host data dirs, builds all images, starts stack (foreground)
```
To rebuild after changing a Dockerfile/script:
```
docker compose -f ./srcs/docker-compose.yml up --build <service_name>
```

**Managing containers and volumes**
```
make up       # start without rebuilding
make stop     # stop containers, keep them (fast resume)
make down     # stop and remove containers, keep volumes
make fclean   # down + docker system prune -af + delete host data dirs
make re       # fclean then all (full rebuild)
```
Useful direct commands:

```
docker ps                          # container status
docker logs <name>                 # e.g. wordpress, mariadb
docker exec -it <name> bash        # shell into a container
docker compose -f ./srcs/docker-compose.yml build <service>   # rebuild one image
docker volume ls                   # list volumes
docker volume inspect wordpress_vol
```

**Where data lives and how it persists**

Two named volumes, backed by fixed host paths via driver_opts (type: none, o: bind):

1) <u>mariadb_vol</u>
- Host path: /home/$USER/data/mariadb
- Mounted in: mariadb → /var/lib/mysql
- Contents: Database files

2) <u>wordpress_vol</u>
- Host path: /home/$USER/data/wordpress
- Mounted in: nginx, wordpress, ftp_server, ssh_server → /wordpress
- Contents: WordPress core, themes, uploads

Because these are Docker-managed volumes (not plain bind mounts), they survive docker compose down and container rebuilds — only make fclean (or manual docker volume rm / rm -rf on the host path) deletes the data.

To inspect data directly from the host without entering a container:

```
ls /home/$USER/data/wordpress
ls /home/$USER/data/mariadb
```

To back up either volume, just copy the corresponding host directory.