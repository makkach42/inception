**What's included**
- WordPress: The website
- MariaDB: Database
- Static website: Seperate simple site (port 80)
Redis: Cashing for wordpress
FTP server: File upload/download
SSH server: Remote container access
Adminer: Web-based database viewer

**Start / stop**

```
make          # build and start
make stop     # pause (keeps data/containers)
make up       # resume after stop
make down     # stop and remove containers (data kept)
make fclean   # stop and delete all data — irreversible
```

**Accessing things**

- Website: https://makkach.42.fr or https://localhost (self-signed cert — click through the browser warning)
- Static site: http://localhost:80
- WordPress admin: https://makkach.42.fr/wp-admin
- Database admin (Adminer): http://localhost:9999 → Server: mariadb, Database: wordpress, credentials below

**Credentias**

Passwords live in individual files under secrets/ (project root):

- ADMIN_USER_PASS: WordPress admin login
- DB_USER_PASSWORD: Database / Adminer login
- WP_PASSWORD: WordPress ↔ database
- WP_SEC_USER_PASS: Second WordPress user
- FTP_USER_PASS: FTP login
- ROOT_PASS: SSH login

View one: cat secrets/ADMIN_USER_PASS
Usernames (not secret) are in srcs/.env.
To change a password: edit the file, then make re.

**Checking everything's running**
```
docker ps
```

All services should show "Up" (MariaDB also "healthy"). If one's missing or restarting:

```
docker logs <container_name>
```

Then confirm by visiting the site (https://makkach.42.fr), Adminer (http://localhost:9999), and the static site (http://localhost:80) in a browser.