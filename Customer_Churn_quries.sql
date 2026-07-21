/*
==========================================
Customer Churn Analysis
SQL Business Questions
Database: Customer_Churn_DB
==========================================
*/

-------------------------------------------------------------------
1. How many total customers are there?

SELECT COUNT(*) AS Total_Customers
FROM churn;

-------------------------------------------------------------------

2. How many customers have churned?

SELECT COUNT(*) AS Churned_Customers
FROM churn
WHERE Churn = 1;

-------------------------------------------------------------------

3. What is the average age of customers?

SELECT ROUND(AVG(Age), 2) AS Average_Age
FROM churn;

-------------------------------------------------------------------

4. What is the average account balance?

SELECT ROUND(AVG(Balance), 2) AS Average_Balance
FROM churn;

-------------------------------------------------------------------

5. How many active and inactive members are there?

SELECT
    IsActiveMember,
    COUNT(*) AS Total_Customers
FROM churn
GROUP BY IsActiveMember;

--------------------------------------------------------------------

6. Which gender has the highest churn rate?

SELECT
    Gender,
    COUNT(CASE WHEN Churn = 1 THEN 1 END) AS Churned_Customers,
    COUNT(*) AS Total_Customers,
    ROUND(
        COUNT(CASE WHEN Churn = 1 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM churn
GROUP BY Gender
ORDER BY Churn_Rate DESC;

-------------------------------------------------------------------

7. What is the average balance of churned customers?

SELECT ROUND(AVG(Balance), 2) AS Average_Balance
FROM churn
WHERE Churn = 1;

-------------------------------------------------------------------

8. Does the number of products owned affect customer churn?

SELECT
    NumOfProducts,
    COUNT(CASE WHEN Churn = 1 THEN 1 END) AS Churned_Customers,
    COUNT(*) AS Total_Customers,
    ROUND(
        COUNT(CASE WHEN Churn = 1 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM churn
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-------------------------------------------------------------------

9. Which age group has the highest churn rate?

SELECT
CASE
    WHEN Age < 30 THEN 'Young'
    WHEN Age <50 THEN 'Middle'
    ELSE 'Senior'
END AS Age_Group,

COUNT(CASE WHEN Churn = 1 THEN 1 END) AS Churned_Customers,
COUNT(*) AS Total_Customers,

ROUND(
COUNT(CASE WHEN Churn = 1 THEN 1 END) *100.0/COUNT(*),
2
) AS Churn_Rate

FROM churn
GROUP BY Age_Group
ORDER BY Churn_Rate DESC;

-------------------------------------------------------------------

10. What is the average tenure of customers who churned?

SELECT ROUND(AVG(Tenure),2) AS Average_Tenure
FROM churn
WHERE Churn = 1;

-------------------------------------------------------------------

11. Are inactive members more likely to churn than active members?

SELECT
    IsActiveMember,
    COUNT(CASE WHEN Churn = 1 THEN 1 END) AS Churned_Customers,
    COUNT(*) AS Total_Customers,
    ROUND(
        COUNT(CASE WHEN Churn = 1 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM churn
GROUP BY IsActiveMember;

-------------------------------------------------------------------

12. Is there any relationship between credit card ownership and churn?

SELECT
    HasCrCard,
    COUNT(CASE WHEN Churn = 1 THEN 1 END) AS Churned_Customers,
    COUNT(*) AS Total_Customers,
    ROUND(
        COUNT(CASE WHEN Churn = 1 THEN 1 END) *100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM churn
GROUP BY HasCrCard;

-------------------------------------------------------------------

13. Which customer segment (based on age and balance) has the highest churn?

SELECT
CASE
    WHEN Age < 30 THEN 'Young'
    WHEN Age BETWEEN 30 AND 50 THEN 'Middle Age'
    ELSE 'Senior'
END AS Age_Group,

CASE
    WHEN Balance < 50000 THEN 'Low Balance'
    WHEN Balance BETWEEN 50000 AND 100000 THEN 'Medium Balance'
    ELSE 'High Balance'
END AS Balance_Group,

COUNT(CASE WHEN Churn=1 THEN 1 END) AS Churned_Customers

FROM churn

GROUP BY Age_Group, Balance_Group

ORDER BY Churned_Customers DESC;

-------------------------------------------------------------------

14. What percentage of total customers have churned?

SELECT
ROUND(
COUNT(CASE WHEN Churn=1 THEN 1 END) *100.0/COUNT(*),
2
) AS Churn_Percentage
FROM churn;

--------------------------------------------------------------------

15. Identify high-value customers (high balance) who are at risk of churn.

SELECT
CustomerID,
Balance,
EstimatedSalary,
Age,
NumOfProducts
FROM churn
WHERE Churn = 1
AND Balance >
(
SELECT AVG(Balance)
FROM churn
)
ORDER BY Balance DESC;

-------------------------------------------------------------------


