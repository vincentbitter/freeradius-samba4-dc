# freeradius-samba4-dc

---

## About the project

---

The project was created to implement a user authentication service using Radius and ActiveDirectory.
Authentication is used over EAP-TTLS MSCHAPv2.
Works with wildcard DV certificate.



Uses the following micro service applications:

* Server Freeradius (samba + freeradius + winbind).

---

## Project structure

---

```
/opt/
 📦freeradius
 ┣ 📂.docker
 ┃ ┣ 📜Dockerfile           - Docker file freeradius.
 ┃ ┣ 📜configure            - freeradius configuration bash script.
 ┃ ┗ 📜init                 - freeradius installation init bash script.
 ┣ 📂crt                    - directory with certificates.
 ┣ 📜.env_temp              - variable template file.
 ┣ 📜.gitignore
 ┣ 📜README.md
 ┗ 📜docker-compose.yaml    - Docker-compose project.
 ```

## Pre-deployment preparation

---

Before deploying the project, install Docker, Docker Compose latest versions.

---

## Installation

---

For installation:
To install, run:

1. Do a git clone.
2. Create directory ./crt and import dv certificate

3. Create an .env file and fill with variables:

```bash
cp ./.env_temp ./.env

```

3. Run the project

```bash
docker-compose up -d

```

4. After a couple of minutes, the service will start.

**Important!!!**

The project uses a wildcard DV certificate.

/etc/freeradius/3.0/certs/server.crt - assembled from server certificate + CA certificate (root cert) + intermediate certificate (intermediate).

---

### Useful links

---

[Doc freeradius.org](https://freeradius.org/documentation/)

---

### Forks project

---

[Fork freeradius project](https://github.com/vincentbitter/freeradius-samba4-dc)
