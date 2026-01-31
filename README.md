# Pulse-App-User-Engagement-Analysis-with-SQL
This project analyzes **user engagement and activity data for a simulated consumer app** using **pure SQL**. It involves designing relational tables, populating realistic login data, and answering **product and growth questions** related to retention, engagement, and user behavior. Advanced SQL queries are used to extract actionable insights, closely mirroring real-world **product analytics workflows**. 🚀

# 📊 Pulse App — SQL User Engagement Analytics

## 📝 Overview
This project represents an internal **product analytics assignment for a consumer application**, where SQL is used to analyze **user activity, engagement trends, and retention patterns**. Using relational tables containing user and login session data, the project answers key business questions such as identifying **inactive users**, measuring **quarter-over-quarter growth**, detecting **power users**, and validating **data completeness** — all using **pure SQL**.

## 🔍 Steps Involved

### 1️⃣ Data Modeling & Table Creation
- 🗄️ Designed relational tables to represent application users and their login sessions.
- 🧱 Created tables using **DDL** with primary and foreign key relationships.
- 📊 Modeled data to support time-based and user-level analysis.

### 2️⃣ Data Population (DML)
- ✍️ Inserted realistic and historical login data using **DML operations**.
- ⚠️ Included edge cases such as inactive users, gaps in activity, and varying engagement levels.
- 🎯 Prepared the dataset to closely resemble real app usage behavior.

### 3️⃣ User Activity & Retention Analysis
- 🔍 Identified users who have **not logged in within the last 5 months** to flag churn risk.
- 🔄 Compared user activity across different time periods to detect returning and dormant users.

### 4️⃣ Engagement & Growth Trends
- 📈 Calculated **quarterly user and session metrics** to track product adoption.
- 📊 Measured **quarter-over-quarter percentage growth in sessions** to assess engagement trends.
- 🧠 Used window functions to compare performance across time.

### 5️⃣ Power User Identification
- 🏆 Identified users with the **highest session engagement scores per day**.
- ⚡ Detected **power users** who logged in every single day since their first login.
- 🧮 Applied ranking and date-difference logic to evaluate consistency and engagement.

### 6️⃣ Data Quality & Completeness Checks
- 🕵️‍♀️ Identified **dates with zero login activity**, which may indicate outages or tracking issues.
- 🔁 Used **recursive CTEs** to generate continuous date ranges and validate data coverage.

## 📂 Dataset Overview
- **Users Table:** user_id, user_name, user_status (Active / Inactive)
- **Logins Table:** user_id, login_timestamp, session_id, session_score

## 🛠️ Tools & Technologies Used
- **SQL** 🗄️: Data modeling, transformation, and analysis
- **CTEs & Subqueries** 🧠: Query structuring and readability
- **Window Functions** 📊: Ranking and time-based comparisons
- **Recursive CTEs** 🔁: Date sequence generation and gap detection

## 🎓 Key Learnings
- 🧠 Translating **product and business questions** into SQL queries
- 📊 Analyzing user engagement, retention, and growth using relational data
- 🪜 Writing **interview-level SQL** involving window functions and recursive logic
- ⚠️ Handling edge cases and validating data completeness

## 🚀 Future Improvements
- 📈 Add retention cohorts and DAU/MAU metrics
- 📊 Build dashboards using Power BI or Tableau
- 🧠 Generate product recommendations based on engagement patterns
- 🔎 Expand analysis to include session duration and feature-level usage

## ✅ Conclusion
This project demonstrates how **pure SQL** can be used to support **product, growth, and engagement analysis** for a consumer application. It mirrors the type of analytical work performed by **Data Analysts and Product Analysts** in real-world product-based companies, emphasizing strong SQL fundamentals and business-driven thinking.
