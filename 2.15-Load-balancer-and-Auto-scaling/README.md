# AWS Auto Scaling with Application Load Balancer (ALB) 🚀☁️

This project demonstrates the configuration of **Auto Scaling** in AWS using a **Launch Template**, an **Application Load Balancer (ALB)**, and **scaling policies**. The aim is to provision scalable infrastructure that responds to changing workloads automatically—ensuring high availability and efficient resource utilization.

---

## 🛠️ Project Overview

The setup includes:
- A **Launch Template** for EC2 instances
- An **Auto Scaling Group** to manage instance scaling
- An **Application Load Balancer (ALB)** to distribute traffic
- CloudWatch **Scaling Policies** triggered by CPU utilization
- A **User Data script** to install Nginx and simulate load

---

## 🧱 Step-by-Step Configuration

### 1. **Launch Template**

- **AMI**: Ubuntu Server 22.04 LTS (Free Tier eligible)
- **Instance Type**: `t2.micro`
- **Key Pair**: `your-keypair-name`
- **Security Group**: Allows HTTP (80) and SSH (22)
- **User Data**:

```bash
#!/bin/bash
apt update -y
apt install nginx stress -y
systemctl start nginx
systemctl enable nginx


```
## Screen shots
![alt text](./imgs/asg-1.png)  
![alt text](./imgs/asg-2.png)  
![alt text](./imgs/asg-3.png)  
![alt text](./imgs/asg-4.png)  
![alt text](./imgs/asg-5.png)  
![alt text](./imgs/asg-6.png)  
![alt text](./imgs/asg-7.png)  
![alt text](./imgs/asg-8.png)  
![alt text](./imgs/asg-9.png)  
![alt text](./imgs/asg-10.png)  
![alt text](./imgs/asg-11.png)  
![alt text](./imgs/asg-12.png)  
![alt text](./imgs/asg-13.png)  
![alt text](./imgs/asg-14.png)  
![alt text](./imgs/asg-15.png)  
![alt text](./imgs/asg-16.png)  
![alt text](./imgs/asg-17.png)  
![alt text](./imgs/asg-18.png)  
![alt text](./imgs/asg-19.png)  
![alt text](./imgs/asg-20.png)  
