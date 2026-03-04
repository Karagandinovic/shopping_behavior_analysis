Customer Value Analysis & Sales Drivers
Behavioral segmentation, discount effectiveness, and revenue structure analysis
________________________________________
1. Overview
This project analyzes customer behavior and sales drivers using transactional retail data. The objective is to identify the key factors influencing revenue, customer value, and marketing efficiency, and to provide actionable business recommendations.
The analysis focuses on:
•	customer segmentation (loyalty, demographics, subscription),
•	discount effectiveness,
•	product and category performance,
•	behavioral drivers of revenue.
The dataset used is synthetic but designed to realistically simulate retail customer behavior.
________________________________________
4. Dataset
Source: Kaggle – Synthetic retail dataset (simulated real-world structure)
Size: 3900 customers
Unit of analysis: Customer-level purchase data
Key features:
•	customer_id
•	age, gender, location
•	previous_purchases
•	purchase_frequency
•	subscription_status
•	discount_applied
•	category, item_purchased
•	purchase_amount_usd
•	review_rating
Link (dataset source): https://www.kaggle.com/datasets/thedrzee/customer-behaviour-and-shopping-analysis-dataset
________________________________________
5. Methodology
•	Data preparation and feature engineering
•	Customer segmentation (loyalty, subscription, frequency, demographics)
•	Exploratory data analysis
•	Statistical testing (t-tests, ANOVA, Welch ANOVA)
•	Correlation analysis
________________________________________
6. Key Insights
•	Revenue is driven by customer volume, not behavior differences.
•	Loyal customers generate most revenue (80%), but only due to their share in the customer base, not because they spend more per purchase.
•	Two clothing categories generate the majority (76%) of all revenue, and revenue correlates almost perfectly with number of products available in a category.
•	Subscription does not increase customer spending. It may function as a retention or promotional tool rather than a value multiplier.
•	Men represent the majority of customers (68%). Female segment is underpenetrated and represents growth opportunity.
•	Discount usage is high and consistent – (in 43% of all orders discount was applied. This number stays almost the same across customer and item categories), at the same time discounted and non-discounted purchases have nearly identical average transaction values.
•	Average review rating across items does not vary notably and stays pretty low for each item (< 4.0).
•	Customer distribution is similar across states despite population differences. This suggests significant variation in customer penetration and engagement rates between states.
•	Customer lifetime value is driven by purchase frequency rather than basket size.

The more detailed information is provided in “Analysis.docx” file.
________________________________________
7. Key Business Recommendations

•	Test targeted acquisition campaigns for underrepresented female segment.
•	Re-evaluate discount strategy (collect discount size and cost data).
•	Investigate low review ratings (<4.0) to improve customer satisfaction.
•	Test assortment expansion in underperforming categories (Footwear, Outerwear).
•	Strengthen customer acquisition channels and maintain retention while ensuring healthy inflow of new customers.
•	Implement location-based marketing in underpenetrated states.

The more detailed information is provided in “Analysis.docx” file.
________________________________________
8. Limitations
•	Synthetic dataset may not fully reflect real customer behavior
•	Lack of time dimension prevents true retention and cohort analysis
•	No profit data prevents margin and ROI analysis
•	No discount size prevents true pricing analysis
These limitations restrict certain strategic conclusions.
________________________________________
9. Tools Used
•	SQL — data querying and aggregation
•	Python (Pandas, SciPy, Pingouin) — statistical analysis
•	Jupyter Notebook — analysis workflow
•	Power BI— visualization
•	Excel — data inspection
________________________________________
10. Project Structure

•	shopping_behavior_updated.csv – Processed dataset
•	shopping_behavior_updated_raw.csv – Original dataset
•	shopping_behavior.ipynb – Data exploration and analysis in Python (Pandas)
•	customer_behavior_analysis.sql – SQL queries
•	Analysis.md – Detailed business conclusions and interpretation 
•	Power BI Dashboard.pbix – Power BI dashboard
•	Shopping Behavior Analysis.pptx – Final presentation with insights
