# 🚢 Inception  
*“Because containers aren’t just for shipping cargo anymore.”*

## 🧠 Project Overview

**Inception** is your first dive into the world of **DevOps** at 42. This project challenges you to set up a **secure, containerized infrastructure** from scratch using **Docker** and **Docker Compose**. You’ll deploy a simple but production-style architecture: a WordPress site served over HTTPS, powered by a MariaDB backend, and routed through an NGINX reverse proxy — all in isolated containers.

## 🧰 Technologies

- 🐳 **Docker** & **Docker Compose**
- 🌐 **NGINX** (with SSL)
- 📝 **WordPress**
- 🛢️ **MariaDB**
- 🔐 **OpenSSL**
- 🐧 Alpine Linux

## 🗺️ Project Structure

```
inception/
├── srcs/
│   ├── docker-compose.yml
│   ├── .env                # Environment variables
│   └── requirements/
│       ├── nginx/          # SSL + reverse proxy
│       ├── wordpress/      # WordPress installation
│       └── mariadb/        # DB setup and init
```

## ⚙️ Services

### 🌐 NGINX  
- Acts as a secure HTTPS reverse proxy.  
- Uses **self-signed SSL certificates** generated with OpenSSL.  
- Redirects all traffic to the WordPress container via port **443**.

### 📝 WordPress  
- Runs inside its own container.  
- Connects to MariaDB for persistent storage of content and users.  
- Installed and configured via environment variables.

### 🛢️ MariaDB  
- Stores WordPress data securely.  
- Automatically initialized on first run using SQL setup scripts.  
- Runs persistently with a named Docker volume.

## 🔒 Security & Best Practices

- All services run in **separate containers** for isolation.
- SSL ensures encrypted traffic.
- Docker **volumes** are used to persist data across reboots.
- Containers are **restarted automatically** using `restart: always`.

## 🏁 Conclusion

Inception isn’t just about building containers — it’s about orchestrating them into a **reliable, secure infrastructure**. You’ve built a real-world stack using only Docker and open-source tools. It’s your first step into a world where Dev meets Ops — and you’re in control.
