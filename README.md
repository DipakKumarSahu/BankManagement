# 🟢 FinTrust Bank - Online Banking Management System

**FinTrust Bank** is a complete web-based banking application developed using **Java (Servlets & JSP)**, **JDBC**, and **MySQL**. It supports essential banking features for both users and administrators — such as account creation, fund transfers, balance check, and full transaction tracking.

---

## ✅ Features

### 👤 User Panel:
- Create bank account
- Register and login to Net Banking
- View personal account details
- Check current balance
- Send money to other users
- View transaction history

### 🛠 Admin Panel:
- Admin login authentication
- View all registered users
- Activate or deactivate accounts
- Perform transactions
- View complete transaction logs

---

## 🧰 Tech Stack

| Layer        | Technology                         |
|--------------|-------------------------------------|
| Frontend     | HTML, CSS, JavaScript, Bootstrap    |
| Backend      | Java, Servlet, JSP                  |
| Database     | MySQL                               |
| Connectivity | JDBC                                |
| Server       | Apache Tomcat                       |

---

## 🗃 Database Schema

### `user_data` Table

| Column    | Type       | Description               |
|-----------|------------|---------------------------|
| id        | INT        | Primary Key (Auto Increment) |
| name      | VARCHAR    | Full Name                 |
| email     | VARCHAR    | Email Address             |
| phone     | VARCHAR    | Phone Number              |
| address   | VARCHAR    | Address                   |
| acno      | VARCHAR    | Unique Account Number     |
| balance   | FLOAT      | Current Balance           |
| status    | VARCHAR    | 'active' or 'inactive'    |

---

### `netbanking` Table

| Column    | Type     | Description                |
|-----------|----------|----------------------------|
| username  | VARCHAR  | Net Banking Username (PK)  |
| password  | VARCHAR  | Password                   |
| acno      | VARCHAR  | Linked Account Number      |

---

### `transaction_history` Table

| Column         | Type      | Description                       |
|----------------|-----------|-----------------------------------|
| id             | INT       | Primary Key (Auto Increment)      |
| acno           | VARCHAR   | Sender Account Number             |
| receiver_acno  | VARCHAR   | Receiver Account Number           |
| amount         | FLOAT     | Amount Transferred                |
| date           | TIMESTAMP | Date and Time of Transaction      |

---

📂 **SQL File:**  
You can download and import this SQL file for creating all required tables:  
[`database.sql`](database.sql)

---

## ⚙️ How to Run the Project Locally

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/fintrust-bank.git


   🙋‍♂️ Author
Dipak KUmar Sahu
📧 dipak04092004@gmail.com
feel free to email me for any project related question.
