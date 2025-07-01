Sure! Here's a **simple and clean `README.md`** for your **Simple E-commerce App** project, covering setup, usage, and deployment.

---

### ✅ `README.md`

```markdown
# 🛍️ Simple E-commerce App

This is a minimal full-stack e-commerce app built with:

- 🐍 **Flask** for the backend API
- 🌐 **HTML + Nginx** for the frontend UI
- 🐳 **Docker** for containerization
- ☁️ **AWS EC2** for deployment
- 🤖 **GitHub Actions** for CI/CD automation

---

## 📂 Project Structure

```

simple-ecommerce/
├── backend/       # Flask API
│   ├── app.py
│   ├── test\_app.py
│   ├── requirements.txt
│   └── Dockerfile
├── frontend/      # Static HTML frontend
│   ├── index.html
│   └── Dockerfile
└── .github/workflows/
└── deploy-ec2.yml

````

---

## 🚀 Features

- View product list (`/products`)
- Place an order via `/order` endpoint
- Dockerized backend & frontend
- Auto-deploys to EC2 on push to `main` branch

---

## 🧪 Run Locally

### Backend

```bash
cd backend
pip install -r requirements.txt
pytest
docker build -t ecommerce-backend .
docker run -p 5000:5000 ecommerce-backend
````

### Frontend

```bash
cd frontend
docker build -t ecommerce-frontend .
docker run -p 80:80 ecommerce-frontend
```

---

## ⚙️ CI/CD Pipeline

The project uses **GitHub Actions** to:

* Build Docker images
* Push to Docker Hub
* SSH into EC2 and deploy the latest containers

Secrets required in GitHub Actions:

| Secret Name          | Description                    |
| -------------------- | ------------------------------ |
| `DOCKERHUB_USERNAME` | Your Docker Hub username       |
| `DOCKERHUB_TOKEN`    | Docker Hub access token        |
| `EC2_HOST`           | Public IP of your EC2 instance |
| `EC2_SSH_KEY`        | Your EC2 private SSH key       |

---

## ☁️ Deployment on AWS EC2

1. Launch EC2 (Amazon Linux or Ubuntu)
2. Install Docker and start Docker service
3. Open ports: 22, 80, 5000
4. Add your SSH key to GitHub Secrets
5. Push to `main` to auto-deploy 🎉

---

## 🛠️ API Endpoints

| Method | Endpoint    | Description          |
| ------ | ----------- | -------------------- |
| GET    | `/products` | Returns all products |
| POST   | `/order`    | Place an order       |

---

## 📦 Sample Order Request

```json
POST /order
{
  "product_id": 1,
  "quantity": 2
}
```

---



 ## Sreen shots

![text](imgs/eco1.png)  
![text](imgs/eco2.png)  
![text](imgs/eco3.png)  
![text](imgs/eco4.png)  
![text](imgs/eco5.png)  
![text](imgs/eco6.png)  
![text](imgs/eco7.png)  
![text](imgs/eco8.png)  
![text](imgs/eco9.png)  
![text](imgs/eco10.png)  
![text](imgs/eco11.png)  
![text](imgs/eco12.png)  
![text](imgs/eco13.png)  
![text](imgs/eco14.png)  
![text](imgs/eco15.png)  
![text](imgs/eco16.png)  
![text](imgs/eco17.png)  
![text](imgs/eco18.png)  
![text](imgs/eco19.png)  
![text](imgs/eco20.png)  
![text](imgs/eco21.png)  
![text](imgs/eco22.png)  
![text](imgs/eco23.png)  
![text](imgs/eco24.png)