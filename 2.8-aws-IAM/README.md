# 🔐 AWS IAM Practice – My Journey in Managing Access the Right Way

## 🧾 Overview

In this exercise, I explored AWS IAM (Identity and Access Management) by setting up users, groups, and policies. My goal was to understand how to properly assign permissions for services like EC2 and S3 without giving unnecessary access. This was part of my cloud learning journey, and it gave me hands-on experience with managing AWS identities securely and effectively.

---

## 🧑‍💻 What I Did

### 👤 Created a User – `eric`

I started by creating an IAM user named `eric`. My intention was to give Eric permission to manage EC2 instances only.

- I created a **custom IAM policy** with the necessary permissions for EC2 operations (like starting, stopping, and terminating instances).
- Then I **attached that policy directly to Eric**, giving him access to EC2 without granting unnecessary permissions.

### 📜 Wrote a Custom Policy for EC2 and S3

Next, I created a more flexible IAM policy that allows access to **both EC2 and S3**.

- This policy grants full EC2 management rights.
- It also gives access to S3 buckets, allowing users to create, upload, list, and delete objects.
- I saved this policy to use with a developer group.

### 👥 Created a Group – `developer-team`

To simulate a team setup, I created a group called `developer-team`.

- This group is meant for users who need both EC2 and S3 access.
- I attached the custom EC2 & S3 policy to this group.

### 👨‍💻👨‍💻 Added Users – `jack` and `ade`

I then created two users: `jack` and `ade`.

- Instead of assigning permissions to them individually, I added them to the `developer-team` group.
- This way, they inherited the group’s permissions and could work with both EC2 and S3 services right away.

---

## 🧠 What I Learned

This hands-on setup helped me understand the value of proper permission management in AWS:

- **Use groups for scalability**: It’s easier to manage access through groups instead of attaching policies to each user.
- **Custom policies are powerful**: I can tailor access based on what a user or group actually needs.
- **The principle of least privilege matters**: Don’t give more access than necessary. It’s safer that way.
- **Every user should have unique credentials** for accountability.

I also realized how easy it is to misconfigure access if you're not careful. Using visual policy editors and IAM policy simulator tools helped me double-check everything.

---

## ✍️ Final Thoughts

Doing this IAM setup by myself helped me see just how important identity and access management is in cloud computing. It’s not just about clicking buttons—it’s about thinking through who needs what and why.

Security in the cloud starts with IAM, and I’m glad I’m getting the foundations right.

---

## 📸 Screenshots

Here’s a visual walkthrough of the process:

![ade](./img/ade.png)  
![ade1](./img/ade1.png)  
![ade2](./img/ade2.png)  
![ade3](./img/ade3.png)  
![ade4](./img/ade4.png)  
![ade5](./img/ade5.png)  
![ade6](./img/ade6.png)  
![ade7](./img/ade7.png)  
![ade8](./img/ade8.png)  
![ade9](./img/ade9.png)  
![ade10](./img/ade10.png)  

![dev](./img/dev.png)  
![dev1](./img/dev1.png)  
![dev2](./img/dev2.png)  
![dev3](./img/dev3.png)  
![dev4](./img/dev4.png)  
![dev5](./img/dev5.png)  

![eric1](./img/eric1.png)  
![eric2](./img/eric2.png)  
![eric3](./img/eric3.png)  
![eric4](./img/eric4.png)  
![eric5](./img/eric5.png)  
![eric6](./img/eric6.png)  
![eric7](./img/eric7.png)  
![eric8](./img/eric8.png)  
![eric9](./img/eric9.png)  
![eric10](./img/eric10.png)  
![eric11](./img/eric11.png)  
![eric12](./img/eric12.png)
