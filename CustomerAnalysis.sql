show databases;
use classicmodels;
show tables;
#TotalRevenue
SELECT SUM(quantityOrdered * priceEach) AS total_revenue 
FROM orderdetails;
#Top5BestSellingProducts
SELECT productCode, SUM(quantityOrdered) AS total_sold
FROM orderdetails
GROUP BY productCode
ORDER BY total_sold DESC
LIMIT 5 ;

#MonthlySalesTrend
SELECT 
    YEAR(orderDate) AS year, 
    MONTH(orderDate) AS month, 
    SUM(quantityOrdered * priceEach) AS total_sales
FROM orders 
JOIN orderdetails USING (orderNumber)
GROUP BY year, month
ORDER BY year, month;

#Top 5 Customers by Total Purchases
SELECT customerNumber, SUM(amount) AS total_spent
FROM payments
GROUP BY customerNumber
ORDER BY total_spent DESC
LIMIT 5;

#Employee Count by Office

SELECT officeCode, COUNT(*) AS employee_count
FROM employees
GROUP BY officeCode;

#Average Order Value
SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT orderNumber, SUM(quantityOrdered * priceEach) AS order_total
    FROM orderdetails
    GROUP BY orderNumber
) AS order_summary;


