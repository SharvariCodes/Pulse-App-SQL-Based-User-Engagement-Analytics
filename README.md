# Pulse-App-SQL-Based-User-Engagement-Analytics
This project simulates a product analytics use case for a consumer application, where SQL is used to analyze user engagement, retention, and growth trends. Using a relational dataset of users and login sessions, I answer real business questions such as identifying inactive users, measuring quarter-over-quarter growth, detecting power users, and validating data completeness. All insights are generated using pure SQL, demonstrating strong analytical thinking and job-ready querying skills.

# 🔍 Project Overview

Pulse is a hypothetical consumer application designed to track user engagement and session behavior.
This project simulates the role of a Data Analyst working with Pulse’s internal database to answer critical product and growth questions using pure SQL.

The goal is to:

Monitor user activity
Identify inactive users
Measure growth trends
Detect engagement patterns
Support product decisions with data
All analysis is performed exclusively in SQL, reflecting real-world analytics workflows.

🛠️ Tech Stack

Language: SQL
Analysis Type: Product & User Analytics
Focus Areas:
User engagement
Retention & inactivity
Session growth
Power user identification

Data completeness checks

🧱 Data Model
👤 Users

Stores user-level information for the Pulse app.

user_id

user_name

user_status (Active / Inactive)

🔐 Logins

Tracks every login session on the platform.

user_id

login_timestamp

session_id

session_score (engagement indicator)

📈 Business Questions Answered
1️⃣ Which users are at risk of churn?

Business Context:
Product managers want to identify users who have not logged in within the last 5 months.

SQL Concepts Used:
CTEs, date filtering, aggregations

2️⃣ How is user engagement trending quarter over quarter?

Business Context:
Track the number of users and sessions each quarter to evaluate product adoption.

SQL Concepts Used:
Time-based aggregation, grouping, DATEPART()

3️⃣ Which users returned after being inactive?

Business Context:
Identify users active in January 2026 but absent in November 2025.

SQL Concepts Used:
Set comparison, CTEs, date filters

4️⃣ Is user activity growing or declining?

Business Context:
Calculate quarter-over-quarter percentage growth in sessions.

SQL Concepts Used:
Window functions (LAG()), growth calculations

5️⃣ Who are our most engaged users?

Business Context:
Identify the top-performing user per day based on session engagement scores.

SQL Concepts Used:
Window functions, ranking, daily aggregation

6️⃣ Who are our power users?

Business Context:
Detect users who have logged in every single day since signup.

SQL Concepts Used:
Date difference logic, distinct counts

7️⃣ Are there data gaps affecting reporting?

Business Context:
Identify dates where no users logged in, which may indicate outages or tracking issues.

SQL Concepts Used:
Recursive CTEs, date series generation
