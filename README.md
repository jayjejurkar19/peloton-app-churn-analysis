# Peloton App Churn Analysis

## 📊 Project Overview

This project analyzes **Peloton App customer subscription and monthly usage data** to identify customer churn patterns, understand customer engagement, and identify potential retention opportunities.

The analysis focuses on:

* Overall customer churn
* Churn across subscription plans and tiers
* Acquisition channel performance
* Device and age-group churn
* Customer tenure and early-stage churn
* Workout activity and customer engagement
* Support ticket activity
* Cancellation reasons
* First-month engagement
* Potential high-risk customer segments
* Revenue at risk

The project was completed using the following workflow:

**Excel → MySQL → Power BI**

---

## 🛠️ Tools Used

* **Excel** – Data cleaning, formatting, filtering, validation, and initial analysis
* **MySQL** – Exploratory data analysis, joins, aggregations, CTEs, subqueries, and window functions
* **Power BI** – Data modeling, DAX measures, KPIs, interactive dashboard, and data visualization
* **GitHub** – Project documentation and version control

---

## 📗 Excel – Data Cleaning & Preparation

Excel was used for data cleaning, formatting, validation, and initial exploration before importing the data into MySQL and Power BI.

### Data Cleaning & Preparation

* Removed **duplicate records** to avoid duplicate entries in the analysis.
* Used **Excel Filters** to review individual categories and identify category-level patterns.
* Standardized date formatting by converting dates into **DD-MM-YYYY** format.
* Reviewed the dataset for consistency before SQL analysis and Power BI development.
* Checked categorical fields such as **plan type, plan tier, device, age group, and acquisition channel** for consistency.

---

## 🎯 Business Questions

The analysis focuses on questions such as:

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
16. How does each customer's monthly workout activity compare with the previous month?
17. What is the workout trend for each customer across their subscription period?
18. Which customers have the highest total workout activity?

---

# 📈 Key Insights

## Overall Churn

The dashboard analyzes approximately **4K customers**, of which approximately **2K customers have churned**.

Key overall metrics:

* **Total Customers:** 4K
* **Churned Customers:** 2K
* **Churn Rate:** 42%
* **Revenue at Risk:** $30.82K

This indicates a significant customer-retention challenge and provides a baseline for analyzing the segments associated with higher churn.

---

## Subscription Plan

Monthly subscribers represented **65.99% of churned customers**, compared with **34.01% for annual subscribers**.

This makes subscription plan type an important segmentation variable for further churn analysis.

However, the analysis does not assume that monthly subscriptions directly cause churn. Differences in engagement, acquisition source, tenure, and price sensitivity should also be investigated.

---

## Subscription Tier

Churned customers were relatively evenly distributed across subscription tiers:

* **Premium:** 34.20%
* **Basic:** 33.12%
* **Plus:** 32.68%

This suggests that subscription tier had a smaller difference in churn distribution compared with variables such as plan type and customer engagement.

---

## Customer Tenure

Customer tenure showed one of the strongest differences in the analysis.

Customers in the **0–1 month tenure band showed churn approaching 100%**, while churn decreased substantially among customers with longer subscription tenure.

This indicates that **early-stage customer engagement and onboarding are important areas for retention analysis**.

---

## Customer Engagement

Customer workout activity showed a strong association with churn.

Non-churned customers accounted for approximately:

* **60.53% of the active-minute distribution**
* **60.30% of the workout distribution**

The dashboard also showed approximately:

* **75 classes booked by non-churned customers**
* **10 classes booked by churned customers**

This indicates that customers who remain active generally demonstrate higher product engagement than customers who churn.

---

## First-Month Engagement

Customers who eventually churned showed lower engagement during their early subscription period.

This suggests that **first-month activity can potentially be used as an early retention signal**.

Customers showing little or no activity during their first month could therefore be considered for targeted engagement initiatives.

---

## Support Ticket Activity

Churned customers represented approximately **76.07% of the support-ticket distribution**.

This suggests a strong association between support activity and churn and may indicate that customers experiencing greater product or service friction are more likely to leave.

Further investigation would be required to determine whether support issues directly contribute to churn.

---

## Cancellation Reasons

`not_using_enough` was the leading cancellation reason, followed by:

* `found_alternative`
* `technical_issues`

The `not_using_enough` finding is consistent with the engagement analysis, where lower workout activity was associated with higher churn.

---

## Acquisition Channel

Customers acquired through **promotional offers showed relatively high churn**, while referral customers showed lower observed churn.

This suggests that acquisition source can be useful when evaluating customer retention patterns.

Promotional customers may require additional post-signup engagement and onboarding analysis.

---

## Device Performance

Android users showed slightly higher churn at approximately **45%**, compared with approximately **40% for iOS and Web users**.

Although this difference exists, it is smaller than the differences observed for tenure, subscription plan, and customer engagement.

---

## Age Group

Churn remained relatively consistent across age groups, generally ranging between approximately **40% and 42%**.

This suggests that age group was not one of the strongest differentiating variables in this analysis.

---

# 💡 Business Recommendations & Action Plan

## 1. Improve Early Customer Engagement

**Finding:** Customers in the 0–1 month tenure band showed the highest churn, while customers who eventually churned also showed lower early engagement.

**Actions:**

* Create personalized onboarding journeys.
* Recommend beginner-friendly workouts.
* Send onboarding reminders.
* Provide progress notifications.
* Recommend relevant classes based on customer preferences.
* Monitor first-month workout activity.

**Business Impact:** Increasing early product engagement may help identify and support customers before they become inactive.

---

## 2. Create a Low-Activity Retention Segment

**Finding:** Lower workout activity was associated with higher churn, while non-churned customers showed substantially higher workout and class activity.

**Actions:**

* Identify customers with very low workout activity.
* Monitor declining activity.
* Create targeted engagement campaigns.
* Recommend personalized workouts.
* Measure retention after intervention.

**Retention Workflow:**

**Low activity → Identify customer → Targeted engagement → Measure retention**

**Business Impact:** Early identification of inactive customers can provide an opportunity for targeted retention efforts.

---

## 3. Investigate Monthly Subscriber Churn

**Finding:** Monthly subscribers represented **65.99% of churned customers**, compared with 34.01% for annual subscribers.

**Actions:**

* Compare engagement between monthly and annual customers.
* Analyze acquisition channels by plan type.
* Compare customer tenure.
* Investigate price sensitivity.
* Compare first-month workout activity.
* Monitor monthly subscriber retention.

**Business Impact:** Understanding the underlying reasons for the difference can help improve retention strategies without assuming that subscription type itself causes churn.

---

## 4. Review Promotional Acquisition

**Finding:** Customers acquired through promotional offers showed relatively high churn.

**Actions:**

* Compare promotional customers with organic and referral customers.
* Analyze their first-month engagement.
* Monitor their workout activity.
* Evaluate post-signup onboarding.
* Test additional engagement campaigns.

**Business Impact:** Improving post-acquisition engagement may help determine whether promotional customers can be retained more effectively.

---

## 5. Address "Not Using Enough"

**Finding:** `not_using_enough` was the leading cancellation reason and lower product usage was associated with higher churn.

**Actions:**

* Identify customers with declining workout activity.
* Monitor customers with zero or very low workouts.
* Trigger targeted engagement campaigns.
* Recommend personalized classes.
* Connect cancellation feedback with usage behavior.

**Business Impact:** Connecting behavioral signals with cancellation reasons can help identify potential churn risks earlier.

---

## 6. Monitor Customer Support Friction

**Finding:** Churned customers represented approximately **76.07% of the support-ticket distribution**.

**Actions:**

* Monitor customers with repeated support tickets.
* Identify recurring technical issues.
* Analyze support activity alongside engagement.
* Investigate whether unresolved issues are associated with cancellation.
* Track churn among customers who contact support.

**Business Impact:** Identifying and resolving recurring customer issues may reduce friction and improve retention.

---

## 7. Monitor Retention KPIs

The effectiveness of retention initiatives should be measured using KPIs such as:

* Monthly churn rate
* First-month workout completion
* 30-day engagement rate
* Average workouts per customer
* Percentage of customers with zero workouts
* Monthly subscriber retention
* Retention of targeted customers
* Cancellation rate
* Revenue at risk

Where possible, A/B testing should be used to determine whether retention interventions actually improve customer outcomes.

---

# 📊 Power BI Dashboard

The Power BI report contains **two interactive dashboard pages** covering customer churn, demographics, subscription behavior, and customer engagement.

---

## 📌 Page 1 – Churn Breakdown & Demographics

### Key Performance Indicators (KPIs)

| KPI                   |       Value |
| --------------------- | ----------: |
| **Total Customers**   |      **4K** |
| **Churned Customers** |      **2K** |
| **Churn Rate**        |     **42%** |
| **Revenue at Risk**   | **$30.82K** |

### Dashboard Visuals

* **Churn Rate by Plan Tier** – Donut Chart
* **Churn Rate by Plan Type** – Donut Chart
* **Churn Rate by Age Group** – Bar Chart
* **Churn Rate by Tenure Band** – Bar Chart
* **Churn Rate by Primary Device** – Bar Chart

### Key Visual Findings

**Plan Tier Distribution**

* Premium – 34.20%
* Basic – 33.12%
* Plus – 32.68%

**Plan Type Distribution**

* Monthly – 65.99%
* Annual – 34.01%

**Tenure**

The **0–1 month** tenure band showed churn approaching 100%, with churn decreasing substantially among longer-tenure customers.

**Age Group**

Churn remained relatively stable at approximately 40–42%.

**Device**

* Android – approximately 45%
* iOS – approximately 40%
* Web – approximately 40%

---

# 📊 Page 2 – Behavioral & Engagement Churn Analysis

### Key Performance Indicators (KPIs)

| KPI                         |      Value |
| --------------------------- | ---------: |
| **Total Workouts**          |    **673** |
| **Average Workouts**        |   **3.98** |
| **Average Active Minutes**  | **119.43** |
| **Average Support Tickets** |   **0.13** |

### Dashboard Visuals

* **Churned Customers by Cancellation Reason** – Bar Chart
* **Sum of Classes Booked by Churn** – Column Chart
* **Average Active Minutes by Churn** – Donut Chart
* **Average Workouts by Churn** – Donut Chart
* **Average Support Tickets by Churn** – Donut Chart

### Key Visual Findings

**Cancellation Reasons**

`not_using_enough` was the leading cancellation reason, followed by `found_alternative` and `technical_issues`.

**Classes Booked**

* Non-churned customers – approximately 75 classes
* Churned customers – approximately 10 classes

**Active Minutes**

Non-churned customers represented **60.53%** of the active-minute distribution.

**Workouts**

Non-churned customers represented **60.30%** of the workout distribution.

**Support Tickets**

Churned customers represented **76.07%** of the support-ticket distribution.

---

## 🎛️ Dashboard Slicers

The dashboard includes interactive filters for:

* **Plan Type & Plan Tier**
* **Primary Device**
* **Age Group**
* **Tenure Band**

A **Clear All Slicers** button is also included to quickly reset dashboard filters.

---

# 🧮 DAX Measures

The dashboard uses DAX measures and calculated columns to create KPIs, customer segmentation, and tenure analysis.

## Total Customers

```dax
total customers =
distinctcount('subscription'[customer_id])
```

## Churned Customers

```dax
churned customers =
calculate(
distinctcount('subscription'[customer_id]),
'subscription'[churned] = "yes"
)
```

## Churn Rate

```dax
churn rate =
divide(
[churned customers],
[total customers]
)
```

## Revenue at Risk

```dax
revenue at risk =
calculate(
sum('subscription'[monthly_price]),
'subscription'[churned] = "yes"
)
```

## Average Workouts

```dax
average workouts =
average('usage'[workouts_completed])
```

## Average Active Minutes

```dax
average active minutes =
average('usage'[minutes_active])
```

## Average Support Tickets

```dax
average support tickets =
average('usage'[support_tickets])
```

## Total Workouts

```dax
total workouts =
sum('usage'[workouts_completed])
```

---

## 📅 Tenure Calculation

```dax
tenure months =
datediff(
'subscription'[signup_date],
if(
'subscription'[churned] = "yes",
'subscription'[churn_date],
date(2025,12,31)
),
month
)
```

---

## 📊 Tenure Band

```dax
tenure band =
switch(
true(),
'subscription'[tenure months] <= 1, "0-1 months",
'subscription'[tenure months] <= 3, "2-3 months",
'subscription'[tenure months] <= 6, "4-6 months",
'subscription'[tenure months] <= 12, "7-12 months",
"12+ months"
)
```

---

## 📅 Usage Tenure

```dax
months since signup =
datediff(
related('subscription'[signup_date]),
'usage'[month],
month
)
```

## First Month

```dax
first month =
if(
'usage'[months since signup] = 0,
"First Month",
"Later Month"
)
```

---

# 📁 Project Structure

```text
peloton-app-churn-analysis/
│
├── README.md
│   └── Project documentation and analysis overview
│
├── peloton-app-churn-analysis eda.sql
│   └── SQL EDA and business analysis queries
│
├── peloton-cleaned-dataset.xlsx
│   └── Cleaned Peloton subscription and usage dataset
│
├── peloton-dashboard-page-1.png
│   └── Power BI dashboard — Churn Overview
│
├── peloton-dashboard-page-2.png
│   └── Power BI dashboard — Engagement & Churn Analysis
│
└── peloton-dashboard.pbix
    └── Power BI churn analysis dashboard
```


