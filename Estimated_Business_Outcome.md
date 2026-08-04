**CUSTOMER CHURN ANALYSIS — ESTIMATED BUSINESS IMPACT**

Dataset: customer\_churn\_dataset.csv (1,000 customers)

=====================================================



**METHOD:**



\- Calculated overall churn rate and churn rate across key customer segments

&#x20; (tenure, account activity status, balance, product holding, age, credit card ownership).



\- Isolated the segment(s) that concentrate the churn risk and estimated the

&#x20; effect of a targeted retention intervention on that segment.



**KEY FINDINGS:**



1\. Baseline churn rate: **1.70% (17 of 1,000 customers).**



2\. Churn is not evenly distributed — it is concentrated almost entirely in

&#x20;  customers who are BOTH new (tenure <= 12 months) AND inactive

&#x20;  (IsActiveMember = 0):

&#x20;    - This "new + inactive" segment is only **8.2%** of the customer base (82 customers)

&#x20;      but accounts for 100% of all churned customers.

&#x20;    - Churn rate inside this segment: **20.7% vs. 0%** among customers who are

&#x20;      either tenured (>12 months) or actively engaged.



3\. Active members (IsActiveMember = 1) churned at **0.0%, vs. 3.4%** for inactive

&#x20;  members — engagement status is the single strongest churn signal in the data.



4\. Customers holding 4 products churned at the highest rate **(3.8%)** — a sign

&#x20;  of possible over-selling/product-fatigue among a subset of customers.



**ESTIMATED BUSINESS OUTCOME:**



\- Because this single, easily identifiable segment (new + inactive customers)

&#x20; explains 100% of observed churn, a targeted onboarding/re-engagement

&#x20; campaign aimed only at this **8.2%** of customers is far more efficient than a

&#x20; blanket retention program.



\- Modeling scenario: if a targeted activation campaign (e.g., onboarding

&#x20; calls, early engagement incentives, welcome offers in the first 90 days)

&#x20; converts half of this at-risk group to "active" status — bringing their

&#x20; churn rate toward the 0% observed for active members — overall churn would

&#x20; fall from **1.70% to an estimated 0.85%, a \~50%** relative reduction in churn.

