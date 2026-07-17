*This project has been created as part of the 42 curriculum by makkach*

<u>**Description**</u>

this inception project is all about docker, containers and their capabilities. it involves practical use of containers, managing a network of containers, and working with diffrent technologies.

<u>**Instructions**</u>

**Build and run**

```
make
```

- Creates the host data directories (/home/$USER/data/mariadb, /home/$USER/data/wordpress) and builds/starts all containers in the foreground.

```
make up       # start containers without rebuilding
make stop     # stop containers without removing them
make down     # stop and remove containers
make fclean   # stop containers, remove images/networks/volumes for this stack, delete host data directories
make re       # fclean + all (full rebuild from scratch)
```

**Accessing services**

- WordPress site: https://makkach.42.fr or https://localhost (self-signed cert — accept the browser warning)
- Static website: http://localhost:8000
- Adminer (DB admin): http://localhost:9999 — server: mariadb, user/password: from .env/secrets, database: wordpress
- FTP: ftp://localhost:21 — user: FTP_USER value, password: from FTP_USER_PASS secret
- SSH: ssh root@localhost -p 1111 — password: from ROOT_PASS secret

**Notes**

- Add makkach.42.fr to /etc/hosts pointing to 127.0.0.1 to use the configured domain instead of localhost.
- wordpress_vol is shared between nginx, WordPress, the FTP server, and the SSH server. mariadb_vol persists database data across restarts.
- make fclean is destructive — it deletes all locally stored WordPress and database data.


<u>**Resources**</u>

some resources i found helpfull while making this project were the following ones:

- Docker Deep Dive: https://github.com/rohitg00/DevOps_Books/blob/main/Docker%20Deep%20Dive%20Zero%20to%20Docker%20in%20a%20single%20book%20(Nigel%20Poulton)%20(z-lib.org).pdf

- Free Docker Fundamentals Course: https://www.youtube.com/playlist?list=PLTk5ZYSbd9Mg51szw21_75Hs1xUpGObDm

- TLS Handshake: https://www.youtube.com/watch?v=ZkL10eoG1PY&t=476s

<u>**AI usage**</u>

AI was used for linking parts of knowledge that i have read across the internet and ones i heard from my peers. it was also used for minor research to understand underlying mechanisms.

<u>**Project description**</u>

**overview**

Multi-container setup via Docker Compose: nginx, WordPress/php-fpm, MariaDB, plus bonus services (static site, Redis, FTP, SSH, Adminer), each built from debian:bookworm.

**Use of Docker**

Each Dockerfile installs only what's needed, then runs script.sh (first-boot setup: users, DB init, WordPress install) ending in exec so the real server becomes PID 1. Compose builds images, creates the network, mounts volumes, injects .env/secrets, and orders startup via depends_on/healthchecks.

**Sources**

- nginx — TLS on 443, proxies .php to WordPress
- WordPress/php-fpm — installs/configures WordPress, connects to MariaDB + Redis
- MariaDB — bootstraps DB/user, runs as PID 1
- Bonus: static site, Redis, FTP, SSH, Adminer

**Main design choices**

- One process per container, minimal base images
- script.sh entrypoints ending in exec
- TLS only at the edge
- Named volumes with fixed host paths
- All credentials via Docker secrets, never env vars

**VMs vs Docker**

VMs run a full guest kernel per instance — strong isolation, heavy, slow. Containers share the host kernel via namespaces/cgroups — lightweight, fast. Trade-off: VM isolates kernel exploits; container escape risks the shared kernel. Containers fit trusted single-host service composition.

**Secrets vs Environment Variables**

.env = non-sensitive config (names, domains). Secrets = passwords, mounted as files under /run/secrets/, read explicitly, never in docker inspect or image layers. Rule: authentication → secret, configuration → env var.

**Docker Network vs Host Network**

Host networking = no isolation, no name resolution. Custom bridge (inception) gives each container its own namespace and DNS-based service-name resolution (wordpress:9000, mariadb, redis). Only necessary ports are published; DB and cache stay internal-only.

**Docker Volumes vs Bind Mounts**

Bind mounts have no independent lifecycle. Named volumes (backed by fixed host paths via driver_opts) combine Docker-managed lifecycle (persists past container removal) with inspectable host location — shared across services needing the same data (e.g. WordPress files) or persisted per-service (e.g. DB data).