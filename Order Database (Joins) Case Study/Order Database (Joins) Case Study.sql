USE data_bank

------Order Database (Joins) Case Study

------------Basic (EDA)------------

--1. How many orders do we have?

SELECT Count('DISTINCT Ordnum') as Total_Order  
FROM orders;


--2. What is the total Sale Amount?

Select SUM(ordamount) as Total_SALE_AMOUNT
From orders;


--3. How many Customers do we have onboard?

SELECT Count('custcode') as TOTAL_Customer
from customers;


--4. How many Agents do we have team?

SELECT Count('agentcode') as Total_Agents_Team
from agents;


----------------Using Joins: (Get Data from Other Tables)-----------------------


--5. Can you summarize the Sales Amount by Agent Name? Which one is the Top Performing Agent Sale (Order Amount)?

Select agents.agentname As AGENT_NAME, SUM(orders.ordamount) AS TOTAL_SALE_AMOUNT
from agents 
INNER JOIN orders ON agents.agentcode = orders.agentcode
GROUP by agents.agentname
order by TOTAL_SALE_AMOUNT DESC
Limit 1;


--6. Can you summarize the Sales Amount by Agent Name? Which one is the Low Performing by Volume (Order Count)?

Select agents.agentname As AGENT_NAME, COUNT(orders.ordnum) AS ORDER_COUNT
from agents 
INNER JOIN orders ON agents.agentcode = orders.agentcode
GROUP by agents.agentname
order by ORDER_COUNT ASC;



--7. Which Customer has the highest share in the Revenue for the Company? Brain Storm some Risk & Opportunities.

SELECT customers.custcode AS customer_code, customers.custname AS customer_name, SUM(orders.ordamount) AS Total_REVENUE
FROM customers
INNER JOIN orders ON customers.custcode = orders.custcode
GROUP BY customers.custcode, customers.custname
ORDER BY Total_REVENUE DESC
LIMIT 1;

----------------Level Up with Analytical Queries (Using Join Types)----------------------------------------

--8. Which Customers haven’t made an order yet?

SELECT customers.custcode As customer_code, customers.custname As Customer_Name
from customers
Left JOIN orders on customers.custcode = orders.custcode
where orders.custcode is Null;

--9. Which Agents have not referred a Single Customer Yet?

SELECT agents.agentcode As Agent_code, agents.agentname As Agent_Name
from agents
Left JOIN customers on agents.agentcode = customers.agentcode
where customers.agentcode is Null;
