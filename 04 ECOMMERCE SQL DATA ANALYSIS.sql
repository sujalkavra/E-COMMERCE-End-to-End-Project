# 50 Questions SQL analysis

# LEVEL 1 — Beginner (1–15)

# 1. How many total records are in the table?
SELECT COUNT(*) AS Total_Records FROM ecommerce_data;

# 2. How many unique orders are there?
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders FROM ecommerce_data;

# 3. How many unique customers are there?
SELECT COUNT(DISTINCT Customer_Name) AS Total_Customer FROM ecommerce_data;

# 4. How many unique products are there?
SELECT COUNT(DISTINCT Product) AS Total_Product FROM ecommerce_data;

# 5. Display all unique product names.
SELECT DISTINCT Product AS unique_product FROM ecommerce_data;
Order by unique_product

# 6. Display all unique categories.
SELECT DISTINCT Category AS Unique_Categories FROM ecommerce_data;

# 7. Find the total quantity sold.
SELECT SUM(Qty) AS Total_Quantity_Sold FROM ecommerce_data;

# 8. Find total sales.
SELECT SUM(Sales) AS Total_Sales FROM ecommerce_data;

# 9. Find total discount amount.
SELECT SUM(Discount_Amount) AS Total_Discount FROM ecommerce_data;

# 10. Find total net sales.
SELECT SUM(Net_Sales) AS Total_Net_Sales FROM ecommerce_data;

# 11. Find the average product price.
SELECT ROUND(AVG(Unit_Price), 2) AS Average_Unit_Price FROM ecommerce_data;

# 12. Find the minimum and maximum product price.
SELECT MIN(Unit_Price) AS Minimum_Price, MAX(Unit_Price) AS Maximum_Price 
FROM ecommerce_data;

# 13. Display all order statuses.
SELECT DISTINCT Order_Status FROM ecommerce_data;

# 14. Count orders by order status.
SELECT Order_Status, COUNT(*) AS Total_Orders FROM ecommerce_data
GROUP BY Order_Status
ORDER BY Total_Orders DESC;

# 15. Find the number of orders for each payment mode.
Select Payment_Mode, count(distinct Order_ID) As Total_Orders_Each_Payment from ecommerce_data
group by Payment_Mode
order by Total_Orders_Each_Payment desc

# LEVEL 2 — Intermediate (16–30)

# 16. Find total revenue by product.
SELECT Product, Round(SUM(Net_Sales), 2) AS Total_Revenue FROM ecommerce_data
GROUP BY Product
ORDER BY Total_Revenue DESC;

# 17. Find total quantity sold by product.
SELECT Product, SUM(Qty) AS Total_Quantity_Sold FROM ecommerce_data
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC;

# 18. Find total revenue by category.
SELECT Category, ROUND(SUM(Net_Sales),2) AS Total_Revenue
FROM ecommerce_data
GROUP BY Category
ORDER BY Total_Revenue DESC;

# 19. Find total orders by category.
SELECT Category, COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce_data
GROUP BY Category
ORDER BY Total_Orders DESC;

# 20. Find the top 10 products by revenue.
SELECT Product, SUM(Net_Sales) AS Total_Revenue FROM ecommerce_data
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 10;

# 21. Find the top 10 products by quantity sold.
SELECT Product, SUM(Qty) AS Total_Quantity_Sold
FROM ecommerce_data
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

# 22. Find revenue by state.
SELECT State, SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY State
ORDER BY Total_Revenue DESC;

# 23. Find the top 10 cities by revenue.
SELECT City, SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY City
ORDER BY Total_Revenue DESC
LIMIT 10;

# 24. Find the top 10 customers by revenue.
SELECT Customer_Name, SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 10;

# 25. Find customers who placed more than one order.
SELECT Customer_Name, COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce_data
GROUP BY Customer_Name
HAVING COUNT(DISTINCT Order_ID) > 1
ORDER BY Total_Orders DESC;

# 26. Find average order value.
SELECT ROUND(SUM(Net_Sales) / COUNT(DISTINCT Order_ID),2) AS Average_Order_Value
FROM ecommerce_data;

# 27. Find revenue by payment mode.
SELECT Payment_Mode, SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY Payment_Mode
ORDER BY Total_Revenue DESC;

# 28. Find average discount by category.
SELECT Category, ROUND(AVG(Discount), 2) AS Average_Discount
FROM ecommerce_data
GROUP BY Category
ORDER BY Average_Discount DESC;

# 29. Find total discount given by category.
SELECT Category, sum(Discount_Amount) AS Total_Discount
FROM ecommerce_data
GROUP BY Category
ORDER BY Total_Discount DESC;

# 30. Find average delivery time by state.
SELECT State, ROUND(AVG(Delivery_Days), 2) AS Average_Delivery_Days
FROM ecommerce_data
GROUP BY State
ORDER BY Average_Delivery_Days DESC;

# LEVEL 3 — Advanced (31–40)

# 31. Find the cancellation rate.
SELECT COUNT(CASE WHEN Order_Status = 'Cancelled' THEN 1 END) AS Cancelled_Orders,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
ROUND(COUNT(CASE WHEN Order_Status = 'Cancelled' THEN 1 END) * 100.0 / 
COUNT(DISTINCT Order_ID),2) AS Cancellation_Rate
FROM ecommerce_data;

# 32. Find revenue by year.
SELECT Order_Year, SUM(Net_Sales) AS Total_Revenue FROM ecommerce_data
GROUP BY Order_Year
ORDER BY Order_Year;

# 33. Find monthly revenue.
SELECT Order_Month, Order_Month_Name, SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY Order_Month, Order_Month_Name
ORDER BY Order_Month, Order_Month_Name

# 34. Find quarterly revenue.
SELECT Order_Year, Order_Quarter, SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY Order_Year, Order_Quarter
ORDER BY Order_Year, Order_Quarter;

# 35. Find revenue by day of the week.
SELECT Order_Day_Name, SUM(Net_Sales) AS Total_Revenue FROM ecommerce_data
GROUP BY Order_Day_Name
ORDER BY Total_Revenue desc;

# 36. Find the best-performing delivery category.
SELECT Delivery_Performance, COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(AVG(Delivery_Days), 2) AS Average_Delivery_Days
FROM ecommerce_data
GROUP BY Delivery_Performance
ORDER BY Total_Orders DESC;

# 37. Find products with revenue greater than ₹100,000.
SELECT Product, SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY Product
HAVING SUM(Net_Sales) > 100000
ORDER BY Total_Revenue DESC;

# 38. Find products with high quantity OR low revenue.
SELECT
    Product,
    SUM(Qty) AS Total_Quantity,
    SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY Product
HAVING SUM(Qty) > 50 or SUM(Net_Sales) < 50000
ORDER BY Total_Quantity DESC;

# 39. Find customers with revenue greater than ₹50,000.
SELECT Customer_Name, SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY Customer_Name
HAVING SUM(Net_Sales) > 50000
ORDER BY Total_Revenue DESC;

# 40. Find categories with an average discount greater than 5%.
SELECT Category, ROUND(AVG(Discount), 2) AS Average_Discount
FROM ecommerce_data
GROUP BY Category
HAVING AVG(Discount) > 5
ORDER BY Average_Discount DESC;

# LEVEL 4 — Expert / Interview SQL (41–50)

# 41. Rank products by revenue.
SELECT Product, SUM(Net_Sales) AS Total_Revenue, 
	   RANK() OVER (ORDER BY SUM(Net_Sales) DESC) AS Revenue_Rank
FROM ecommerce_data
GROUP BY Product;

# 42. Find the top 3 products in every category.
WITH Product_Sales AS 
	(SELECT Category, Product, SUM(Net_Sales) AS Total_Revenue
    FROM ecommerce_data
    GROUP BY Category, Product),
    
    Ranked_Products AS 
    (SELECT Category, Product, Total_Revenue,
	DENSE_RANK() OVER (PARTITION BY Category ORDER BY Total_Revenue DESC) AS Product_Rank
    FROM Product_Sales)
    
SELECT Category, Product, Total_Revenue, Product_Rank
FROM Ranked_Products
WHERE Product_Rank <= 3
ORDER BY Category, Product_Rank;

# 43. Calculate monthly sales growth.
WITH Monthly_Sales AS 
    (SELECT Order_Year, Order_Month, SUM(Net_Sales) AS Total_Sales
    FROM ecommerce_data
    GROUP BY Order_Year, Order_Month),
    
Sales_With_Previous AS
    (SELECT Order_Year, Order_Month, Total_Sales,
	LAG(Total_Sales) OVER (ORDER BY Order_Year, Order_Month) AS Previous_Month_Sales
    FROM Monthly_Sales)
    
SELECT Order_Year, Order_Month, Total_Sales, Previous_Month_Sales,
ROUND((Total_Sales - Previous_Month_Sales) * 100.0 / NULLIF(Previous_Month_Sales, 0),2) 
AS MoM_Growth_Percentage
FROM Sales_With_Previous
ORDER BY Order_Year, Order_Month;

# 44. Find each category's percentage contribution to total revenue.
SELECT Category, SUM(Net_Sales) AS Total_Revenue,
       ROUND(SUM(Net_Sales) * 100.0 / SUM(SUM(Net_Sales)) OVER (),2) AS Revenue_Percentage
FROM ecommerce_data
GROUP BY Category
ORDER BY Total_Revenue DESC;

# 45. Find the top 10 customers and their percentage contribution to revenue.
WITH Customer_Sales AS
(SELECT Customer_Name, SUM(Net_Sales) AS Total_Revenue
    FROM ecommerce_data
    GROUP BY Customer_Name),
    
Ranked_Customers AS 
(SELECT Customer_Name, Total_Revenue,
	RANK() OVER (ORDER BY Total_Revenue DESC) AS Customer_Rank
    FROM Customer_Sales)

SELECT Customer_Name, Total_Revenue, Customer_Rank,
   ROUND(Total_Revenue * 100.0 / SUM(Total_Revenue) OVER (), 2) AS Revenue_Percentage
FROM Ranked_Customers
WHERE Customer_Rank <= 10
ORDER BY Customer_Rank;

# 46. Find the highest-revenue product in each category.
WITH Product_Revenue AS 
(SELECT Category, Product, SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY Category, Product),

Ranked_Products AS 
(SELECT Category, Product, Total_Revenue,
ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Total_Revenue DESC) AS Product_Rank
FROM Product_Revenue)

SELECT Category, Product, Total_Revenue
FROM Ranked_Products
WHERE Product_Rank = 1;

# 47. Find customers who purchased more than 3 different products.
SELECT Customer_Name, COUNT(DISTINCT Product) AS Unique_Products_Purchased
FROM ecommerce_data
GROUP BY Customer_Name
HAVING COUNT(DISTINCT Product) > 3
ORDER BY Unique_Products_Purchased DESC;

# 48. Find the highest-value order.
SELECT Order_ID, Customer_Name, Product, Net_Sales
FROM ecommerce_data
ORDER BY Net_Sales DESC
LIMIT 1;

# 49. Top 10 highest-value orders
SELECT Order_ID, Customer_Name, Product, Net_Sales
FROM ecommerce_data
ORDER BY Net_Sales DESC
LIMIT 10;

# 50. Find products where the average discount is high but revenue is low.
SELECT Product, ROUND(AVG(Discount), 2) AS Average_Discount,
	   SUM(Net_Sales) AS Total_Revenue
FROM ecommerce_data
GROUP BY Product
HAVING AVG(Discount) > 5 AND SUM(Net_Sales) < 500
ORDER BY Average_Discount DESC;

# 51. Create an overall product performance report
SELECT
    Product,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Qty) AS Total_Quantity_Sold,
    ROUND(AVG(Unit_Price), 2) AS Average_Price,
	SUM(Sales) AS Total_Sales,
	SUM(Discount_Amount) AS Total_Discount,
	SUM(Net_Sales) AS Total_Net_Sales,
	ROUND(AVG(Discount), 2) AS Average_Discount,
	ROUND(AVG(Delivery_Days), 2) AS Average_Delivery_Days
FROM ecommerce_data
GROUP BY Product
ORDER BY Total_Net_Sales DESC;



   