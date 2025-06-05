# AWS-Based Web Application Deployment with EFS, RDS, and Load Balancer

This project demonstrates how I deployed a high-availability WordPress application on AWS using the following key services:

- **EC2 (Amazon Linux 2023)**
- **Amazon RDS (MySQL)**
- **Amazon EFS**
- **Elastic Load Balancer (ALB)**
- **Auto Scaling Group**
- **Security Groups**
- **IAM Roles**
- **User Data for bootstrapping**
- **(Optional) Route 53**

---

## 🔧 Technologies Used

- Amazon Linux 2023 (on EC2)
- Apache Web Server
- PHP (with MySQL support)
- MySQL (RDS)
- AWS CLI / Cloud Console

---

## 🌐 Architecture Overview

```text
              Route 53 (optional)
                     |
            ┌────────▼────────┐
            │ Application Load│
            │    Balancer     │
            └────────┬────────┘
                     |
           ┌─────────▼─────────┐
           │  Auto Scaling     │
           │   Group (EC2)     │
           └────┬────┬────┬────┘
                │    │    │
        ┌───────▼┐ ┌─▼────┐┌────▼─────┐
        │ EC2 #1 │ │ EC2#2││ EC2 #n  │
        └────┬───┘ └──────┘└─────────┘
             │
   ┌─────────▼────────┐
   │   Amazon EFS     │ (shared web content)
   └──────────────────┘

   ┌──────────────────┐
   │   Amazon RDS     │ (MySQL DB)
   └──────────────────┘
```

---

## 🚀 Deployment Steps

### 1. Launch EC2 Instances

- Used Amazon Linux 2023
- Installed Apache, PHP, MySQL client using `user-data`
- Mounted EFS into `/var/www/html`
- Attached IAM Role with necessary permissions

### 2. Setup Amazon EFS

- Created a file system with mount targets in relevant AZs
- Allowed NFS traffic in security groups
- Mounted with:

  ```bash
  sudo mount -t nfs4 -o nfsvers=4.1 fs-XXXX:/ /var/www/html
  ```

### 3. Configure Apache & PHP

```bash
sudo dnf install -y httpd php php-mysqlnd
sudo systemctl start httpd
```

### 4. Connect to Amazon RDS

- Created RDS with MySQL engine
- Connected from EC2 using:

  ```bash
  mysql -h <rds-endpoint> -u <user> -p
  ```

### 5. Create Load Balancer and Auto Scaling Group

- Target group health check: `/index.php`
- Launch Template included EFS mount and Apache startup
- Load balancer DNS used to access app

---

## 📂 File Structure

```text
/var/www/html/
├── index.php
├── config.php
├── db.php
└── assets/
```

---

## 📎 Scripts

- **WordPress setup script**: [`./wordpress.sh`](./wordpress.sh)
- **Auto scaling script**: [`./autoscale.sh`](./autoscale.sh)

---

## 📸 Screenshots

### 📌 General Setup

![Setup](./imgs/04.06.2025_17.56.19_REC.png)  
![Setup](./imgs/05.06.2025_10.26.23_REC.png)

### 📌 WordPress Interface

![WordPress](./imgs/wordpress0.1.png)  
![WordPress](./imgs/wordpress1.png)  
![WordPress](./imgs/wordpress2.png)  
![WordPress](./imgs/wordpress3.png)  
![WordPress](./imgs/wordpress4.png)  
![WordPress](./imgs/wordpress5.png)  
![WordPress](./imgs/wordpress6.png)  
![WordPress](./imgs/wordpress7.png)  
![WordPress](./imgs/wordpress8.png)  
![WordPress](./imgs/wordpress9.png)  
![WordPress](./imgs/wordpress10.png)  
![WordPress](./imgs/wordpress11.png)  
![WordPress](./imgs/wordpress12.png)  
![WordPress](./imgs/wordpress13.png)  
![WordPress](./imgs/wordpress14.png)  
![WordPress](./imgs/wordpress15.png)  
![WordPress](./imgs/wordpress16.png)  
![WordPress](./imgs/wordpress17.png)  
![WordPress](./imgs/wordpress18.png)  
![WordPress](./imgs/wordpress19.png)  
![WordPress](./imgs/wordpress20.png)  
![WordPress](./imgs/wordpress21.png)  
![WordPress](./imgs/wordpress22.png)  
![WordPress](./imgs/wordpress23.png)  
![WordPress](./imgs/wordpress24.png)  
![WordPress](./imgs/wordpress25.png)  
![WordPress](./imgs/wordpress26.png)  
![WordPress](./imgs/wordpress27.png)  
![WordPress](./imgs/wordpress28.png)  
![WordPress](./imgs/wordpress29.png)  
![WordPress](./imgs/wordpress30.png)  
![WordPress](./imgs/wordpress31.png)  
![WordPress](./imgs/wordpress32.png)  
![WordPress](./imgs/wordpress33.png)  
![WordPress](./imgs/wordpress34.png)  
![WordPress](./imgs/wordpress35.png)  
![WordPress](./imgs/wordpress36.png)  
![WordPress](./imgs/wordpress37.png)  
![WordPress](./imgs/wordpress38.png)  
![WordPress](./imgs/wordpress39.png)  
![WordPress](./imgs/wordpress40.png)  
![WordPress](./imgs/wordpress41.png)  
![WordPress](./imgs/wordpress42.png)  
![WordPress](./imgs/wordpress43.png)  
![WordPress](./imgs/wordpress44.png)  
![WordPress](./imgs/wordpress45.png)  
![WordPress](./imgs/wordpress46.png)  
![WordPress](./imgs/wordpress47.png)  
![WordPress](./imgs/wordpress48.png)  
![WordPress](./imgs/wordpress49.png)  
![WordPress](./imgs/wordpress50.png)  
![WordPress](./imgs/wordpress51.png)  
![WordPress](./imgs/wordpress52.png)  
![WordPress](./imgs/wordpress53.png)  
![WordPress](./imgs/wordpress54.png)  
![WordPress](./imgs/wordpress55.png)  
![WordPress](./imgs/wordpress56.png)  
![WordPress](./imgs/wordpress57.png)  
![WordPress](./imgs/wordpress58.png)  
![WordPress](./imgs/wordpress59.png)  
![WordPress](./imgs/wordpress60.png)  
![WordPress](./imgs/wordpress61.png)  
![WordPress](./imgs/wordpress62.png)  
![WordPress](./imgs/wordpress63.png)  
![WordPress](./imgs/wordpress64.png)  
![WordPress](./imgs/wordpress65.png)  
![WordPress](./imgs/wordpress66.png)  
![WordPress](./imgs/wordpress67.png)  
![WordPress](./imgs/wordpress68.png)  
![WordPress](./imgs/wordpress69.png)  
![WordPress](./imgs/wordpress70.png)  
![WordPress](./imgs/wordpress71.png)  
![WordPress](./imgs/wordpress72.png)  
![WordPress](./imgs/wordpress73.png)  
![WordPress](./imgs/wordpress74.png)  
![WordPress](./imgs/wordpress75.png)  
![WordPress](./imgs/wordpress76.png)  
![WordPress](./imgs/wordpress77.png)  
![WordPress](./imgs/wordpress78.png)  
![WordPress](./imgs/wordpress79.png)

---

## 🔐 Security Measures

- Used IAM roles, no hardcoded AWS keys
- NFS, HTTP, and MySQL ports carefully controlled by SG
- SSH only allowed from known IPs

---

## 📚 What I Learned

- Deploying multi-AZ EC2 + EFS applications
- Using Auto Scaling + Load Balancers effectively
- Creating robust IAM roles and security groups
- Troubleshooting EFS, Apache, and RDS connectivity

---

## 📁 Project Files

- [`./README.md`](./README.md)
- [`./wordpress.sh`](./wordpress.sh)
- [`./autoscale.sh`](./autoscale.sh)

