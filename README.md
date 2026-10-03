# Peloton App Churn Analysis

## 📌 Project Overview

This project analyzes customer churn for the Peloton App using subscription and monthly usage data.

The objective is to identify customer segments associated with higher churn, understand how customer engagement relates to churn, analyze cancellation reasons, and provide actionable recommendations for improving customer retention.

The project workflow was:

**Excel → MySQL → Power BI**

---

## 🎯 Business Objectives

* Measure overall customer churn.
* Compare churn across subscription plans and tiers.
* Analyze churn across acquisition channels, devices, and age groups.
* Understand the relationship between customer engagement and churn.
* Analyze first-month engagement.
* Identify common cancellation reasons.
* Identify potential customer segments for retention initiatives.
* Build an interactive Power BI dashboard for business users.

---

# 🛠️ Tools Used

* **Microsoft Excel** — Data cleaning, formatting, and initial analysis
* **MySQL** — SQL-based exploratory data analysis
* **Power BI** — Interactive dashboard and visualization
* **GitHub** — Project documentation and version control

---

# 📊 Excel — Data Cleaning & Preparation

Excel was used for **data cleaning, formatting, and initial data analysis** before importing the data into MySQL and Power BI.

### Data Cleaning & Preparation

The following steps were performed:

* **Removed duplicate records** to avoid duplicate entries in the analysis.
* **Used Excel filters** to review and examine individual categories and identify category-level patterns.
* **Standardized date formatting** by changing dates from Long Date format to **Short Date format (`DD-MM-YYYY`)**.
* **Reviewed the dataset for consistency** before using it for SQL analysis and Power BI visualization.
* **Checked categorical fields** such as plan type, plan tier, device, age group, and acquisition channel for consistency.

---

# 🗄️ MySQL — Exploratory Data Analysis

MySQL was used to perform exploratory analysis and answer business questions related to customer churn.

### SQL Analysis Questions

1. How many total customers are there, and how many have churned?
2. What is the overall customer churn rate?
3. How does churn rate differ between monthly and annual plans?
4. How does churn rate differ across subscription tiers?
5. Which acquisition channels have the highest churn rate?
6. How does churn rate differ across primary devices?
7. How does churn rate differ across age groups?
8. How does churn rate differ by monthly price?
9. How does average monthly engagement differ between churned and active customers?
10. How does workout frequency relate to customer churn?
11. How does support ticket activity relate to customer churn?
12. How does first-month workout activity differ between churned and active customers?
13. How does churn rate differ by plan type within similar tenure groups?
14. What are the most common cancellation reasons among churned customers?
15. Which cancellation reasons are most common for each subscription tier?

---

# 📈 Power BI Dashboard

The Power BI report contains **two dashboard pages**.

## Page 1 — Churn Breakdown & Demographics

### KPI Cards

* Total Customers
* Churned Customers
* Churn Rate
* Revenue at Risk

### Slicers

* Plan Type and Plan Tier
* Primary Device
* Age Group
* Tenure Band
* Clear All Slicers

### Charts

* Churn Rate by Plan Tier
* Churn Rate by Plan Type
* Churn Rate by Age Group
* Churn Rate by Tenure Band
* Churn Rate by Primary Device

---

## Page 2 — Behavioral & Engagement Churn Analysis

### KPI Cards

* Total Workouts
* Average Workouts
* Average Active Minutes
* Average Support Tickets

### Slicers

* Plan Type and Plan Tier
* Primary Device
* Age Group
* Tenure Band
* Clear All Slicers

### Charts

* Churned Customers by Cancel Reason
* Sum of Classes Booked by Churn
* Average Active Minutes by Churn
* Average Workouts by Churn
* Average Support Tickets by Churn

---

# 🧮 Power BI DAX Measures

The dashboard uses DAX measures and calculated columns to create the KPIs and segmentation used throughout the report.

```text
Total Customers =
DISTINCTCOUNT('subscription'[customer_id])

Churned Customers =
CALCULATE(
DISTINCTCOUNT('subscription'[customer_id]),
'subscription'[churned] = "yes"
)

Churn Rate =
DIVIDE(
[Churned Customers],
[Total Customers]
)

Revenue at Risk =
CALCULATE(
SUM('subscription'[monthly_price]),
'subscription'[churned] = "yes"
)

Average Workouts =
AVERAGE('usage'[workouts_completed])

Average Active Minutes =
AVERAGE('usage'[minutes_active])

Average Support Tickets =
AVERAGE('usage'[support_tickets])

Total Workouts =
SUM('usage'[workouts_completed])
```

### Tenure Calculation

```text
Tenure Months =
DATEDIFF(
'subscription'[signup_date],
IF(
'subscription'[churned] = "yes",
'subscription'[churn_date],
DATE(2025,12,31)
),
MONTH
)
```

### Tenure Band

```text
Tenure Band =
SWITCH(
TRUE(),
'subscription'[Tenure Months] <= 1, "0-1 months",
'subscription'[Tenure Months] <= 3, "2-3 months",
'subscription'[Tenure Months] <= 6, "4-6 months",
'subscription'[Tenure Months] <= 12, "7-12 months",
"12+ months"
)
```

### Usage Tenure

```text
Months Since Signup =
DATEDIFF(
RELATED('subscription'[signup_date]),
'usage'[month],
MONTH
)

First Month =
IF(
'usage'[Months Since Signup] = 0,
"First Month",
"Later Month"
)
```

---

# 🔎 Key Findings

### Subscription Plan

Monthly subscribers showed substantially higher churn than annual subscribers, making **plan type one of the strongest segmentation variables** in the analysis.

### Customer Engagement

Lower workout activity was strongly associated with higher churn.

Customers with little or no workout activity showed considerably higher churn than customers with frequent workouts.

### First-Month Engagement

Customers who eventually churned showed lower engagement during their early subscription period.

This indicates that **early engagement can be monitored as a potential retention signal**.

### Acquisition Channel

Promo-offer customers showed relatively high churn, while referral customers showed lower observed churn.

This suggests that acquisition source can be useful when evaluating customer retention patterns.

### Cancellation Reasons

`not_using_enough` was one of the most common cancellation reasons.

This aligns with the engagement analysis, where lower product usage was associated with higher churn.

### Device and Age

Churn differences across age groups were relatively small.

Android users showed somewhat higher churn than iOS and web users, although the difference was not as large as the differences observed for plan type and engagement.

---

# 💡 Business Recommendations

## 1. Improve Early Customer Engagement

Create an onboarding and engagement program for customers showing little or no activity during their first month.

Possible actions:

* Personalized workout recommendations
* Beginner workout plans
* Onboarding reminders
* Progress notifications
* Personalized class recommendations

**Goal:** Increase early engagement before customers become inactive.

---

## 2. Create a Low-Activity Retention Segment

Customers with very low workout activity can be identified as a potential high-risk group.

A simple retention workflow could be:

**Low activity → Identify customer → Targeted engagement → Measure retention**

The effectiveness of these interventions should be tested rather than assumed.

---

## 3. Investigate Monthly Subscriber Churn

Monthly subscribers show substantially higher churn than annual subscribers.

Instead of assuming that the subscription type itself causes churn, Peloton should investigate the underlying differences between monthly and annual customers.

Areas to investigate include:

* Engagement
* Acquisition source
* Customer tenure
* Price sensitivity
* First-month activity

---

## 4. Review Promotional Acquisition

Customers acquired through promotional offers showed relatively high churn.

Peloton could evaluate whether promotional customers receive sufficient post-signup engagement and onboarding.

A useful approach would be to compare:

**Promo customers → engagement → retention**

and test whether additional onboarding improves their retention.

---

## 5. Address "Not Using Enough"

Since `not_using_enough` is a common cancellation reason and low activity is associated with higher churn, the business should connect cancellation feedback with engagement behavior.

Customers showing declining activity could receive targeted interventions before cancellation.

---

## 6. Measure the Impact

The recommendations should be evaluated using measurable KPIs:

* Monthly churn rate
* First-month workout completion
* 30-day engagement rate
* Average workouts per customer
* Percentage of customers with zero workouts
* Monthly subscriber retention
* Retention of targeted customers
* Cancellation rate

Where possible, A/B testing should be used to determine whether an intervention actually improves retention.

---

# 📁 Project Structure

```text
peloton-app-churn-analysis/
│
├── README.md
│
├── subscription.csv
├── usage.csv
│
├── churn_analysis.sql
│
└── peloton_churn_dashboard.pbix
```

---

# 👤 Skills Demonstrated

* Microsoft Excel
* Data Cleaning
* Exploratory Data Analysis
* MySQL
* SQL Aggregations
* CASE Statements
* JOINs
* CTEs
* Subqueries
* Customer Segmentation
* Churn Analysis
* DAX
* Power BI
* KPI Development
* Interactive Dashboard Design
* Business Analysis
* Data-Driven Recommendations
