# Project_ElevateLabs
I took the  E-commerce Return Rate Reduction Analysis dataset from the kaggle and cleaned the dataset with python libraries like matplotlib and seaborn, standardised the dataset and converted the null values of the return status to the binary bit values,done little feature enhancement like delay of the return and discount values, analysed through the EDA for the different categories and the return rate like highest(clothing-52.4%) and lowest(Home-49.0%), Reasons of return like defective(1327) ,wrong item(1258) ,changed mind due to item color or quality(1255) , not as described(1212),location Analysis,shipping method and discount vs return and analysed data by plots using the libraries.
I done the analysis using te powerBI and project aims to reduce the return rate in an e-commerce platform by analyzing historical order data. It combines data analytics, machine learning, Power BI dashboarding, and SQL operations to uncover key return trends and proactively predict high-risk return orders.
Tools & Technologies Used
- Python – Data cleaning, EDA, and ML modeling (Pandas, Scikit-learn, Matplotlib, Seaborn)
- Power BI – Interactive dashboards for business insights
- SQL – Relational querying and pattern detection
- Jupyter Notebook – Iterative analysis and model building
- GitHub – Version control and collaboration
  
  **Project Workflow**
1. Data Preprocessing (Python)
- Removed duplicates and null values
- Standardized column names
- Created new features like:
  - `Customer_Return_Rate`
  - `Supplier_Return_Rate`
  - `Return_Rate_Per_Category`

2. Exploratory Data Analysis (Python)
- Used Seaborn & Matplotlib to visualize:
  - Return rate by category
  - Return reasons (Defective, Wrong Item, Changed Mind)
  - City-wise return trends
  - Impact of shipping method and discount on return rate

3. Predictive Modeling (Logistic Regression)
- Built a logistic regression model to predict return likelihood (`Is_Returned`)
- Key features:
  - Product category, price, shipping method, user age, discount
- Accuracy: ~50%
- Future improvements:
  - Try Random Forest, XGBoost
  - Feature selection & hyperparameter tuning

4. Power BI Dashboard
- Built an interactive dashboard with:
  - KPI cardsfor total return rate, supplier/customer return rates
  - Pie and bar charts showing return trends by category, reason, city
  - Slicers to filter by city, product type, payment method
  - Drill-through reports for deeper customer/product return analysis
    
5.  SQL Analysis
Performed SQL queries to extract insights from the dataset:
sql
-- Example: Top 5 product categories by return rate
SELECT Product_Category, 
       COUNT(*) AS Total_Orders,
       SUM(CASE WHEN Is_Returned = 1 THEN 1 ELSE 0 END) AS Returned_Orders,
       ROUND(1.0 * SUM(CASE WHEN Is_Returned = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Return_Rate
FROM orders
GROUP BY Product_Category
ORDER BY Return_Rate DESC
LIMIT 5;

-- Example: Return rate by shipping method
SELECT Shipping_Method,
       COUNT(*) AS Total_Orders,
       SUM(CASE WHEN Is_Returned = 1 THEN 1 ELSE 0 END) AS Returned_Orders,
       ROUND(AVG(Is_Returned), 2) AS Return_Rate
FROM orders
GROUP BY Shipping_Method;

