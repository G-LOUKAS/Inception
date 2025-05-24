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

## 🛠️ Installation

1. **Clone the repo**:
   ```bash
   git clone https://github.com/yourusername/inception.git
   cd inception
   ```

2. **Configure environment**:  
   Create a `.env` file in the `srcs/` directory:
   ```env
   DOMAIN_NAME=yourdomain.com
   WP_DB_NAME=wordpress
   WP_DB_USER=wp_user
   WP_DB_PASSWORD=wp_pass
   WP_ADMIN_USER=admin
   WP_ADMIN_PASSWORD=admin123
   WP_ADMIN_EMAIL=admin@yourdomain.com
   ```

3. **Build and run your containers**:
   ```bash
   cd srcs
   docker-compose up --build
   ```

4. **Visit your website**:  
   Navigate to `https://yourdomain.com` and complete the WordPress setup.

## 🔒 Security & Best Practices

- All services run in **separate containers** for isolation.
- SSL ensures encrypted traffic.
- Docker **volumes** are used to persist data across reboots.
- Containers are **restarted automatically** using `restart: always`.

## 🧪 Testing Tips

- Use `docker-compose ps` to see running containers.
- Check logs with `docker-compose logs -f`.
- Use `docker exec -it <container> sh` to explore containers.

## ✅ Mandatory Requirements Covered

- ✔️ Multi-container setup via Docker Compose  
- ✔️ Isolated services  
- ✔️ SSL-secured NGINX reverse proxy  
- ✔️ Persistent volumes for WordPress and MariaDB  
- ✔️ Automatic restarts  
- ✔️ No hard-coded secrets  

## 🏁 Conclusion

Inception isn’t just about building containers — it’s about orchestrating them into a **reliable, secure infrastructure**. You’ve built a real-world stack using only Docker and open-source tools. It’s your first step into a world where Dev meets Ops — and you’re in control.
