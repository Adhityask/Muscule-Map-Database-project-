# 🏋️‍♂️ Gym Management SQL Project

This project is a **relational database system** designed to manage a gym's operations including members, memberships, trainers, and certifications. It ensures data normalization and showcases different types of relationships in SQL.

---

## 📌 Project Overview

This MySQL database contains five key tables:

1. **trainer** – Stores trainer details.  
2. **certification** – Contains certification details.  
3. **trainer_certification** – A junction table for many-to-many relation between trainers and certifications.  
4. **member** – Stores member details, linked to their trainer.  
5. **membership** – Stores membership plans, linked one-to-one with each member.  

---

## 🧩 ER Model (Relationships)

- 🧍‍♂️ **One-to-One** → `member` ↔ `membership`  
- 🧍‍♂️ **One-to-Many** → `trainer` → `member`  
- 🧑‍🏫 **Many-to-Many** → `trainer` ↔ `certification` (via `trainer_certification`)  

---

## 💾 Technologies Used

- MySQL 8.0  
- SQL (DDL + DML)  
- Relational Database Design  

---

## 📂 File Structure

---

## 📜 Sample SQL Queries

```sql
-- Get all members with their trainer and membership type
SELECT 
    m.name AS member_name,
    t.name AS trainer_name,
    ms.type AS membership_type
FROM member m
JOIN trainer t ON m.trainer_id = t.trainer_id
JOIN membership ms ON m.member_id = ms.member_id;

