# Order Data Base Case Study

![case_study_diagram](https://github.com/user-attachments/assets/d41437c2-6579-4c76-a1e8-343a0b5d0ad8)

# INTRODUCTION
In this case study, we explore critical business questions to uncover key insights into a company's sales performance and customer dynamics. The analysis begins by determining foundational metrics such as the total number of orders, total sales amount, and the size of the customer base. We then shift focus to the sales agents, examining their contribution to the business by summarizing sales performance and identifying both the top-performing agent and those with lower order volumes.

Additionally, we assess which customer contributes the most to revenue, identifying risks like potential over-dependence on key customers and opportunities for expanding sales. The study further investigates customers who have yet to place an order and agents who have not referred any customers, pinpointing areas for potential improvement in customer outreach. By answering these questions, this case study provides a comprehensive view of the business’s sales strategy, agent performance, and customer engagement, enabling data-driven decisions to foster growth and profitability.

# PROJECT AIMS

•	The project aims to quantify essential sales metrics, including the total number of orders and overall sales amount, to establish a clear understanding of the company’s current performance and identify trends.

•	By analyzing sales data by agent, the project seeks to identify top-performing agents and those requiring additional support, thereby enhancing team productivity and optimizing sales strategies.

•	The project will assess customer contributions to revenue, pinpointing key customers and identifying risks associated with dependency on a few clients, as well as opportunities to engage inactive customers for potential growth.

# ABOUT THE DATA

This database consists of three tables.

•	Orders – This table is made up of 6 columns and 13 rows.

•	Customers – This table is made up of 12 columns and 24 rows.

•	Agents – This table is made up of 6 columns and 12 rows.


# Entity Relationship diagram


![entity_relationship_diagram](https://github.com/user-attachments/assets/40a1b0a3-ef7d-45b7-b504-5a3e5c373281)


# CASE STUDY QUESTIONS AND INSIGHTS

# A. Warm Up Questions! Basic (EDA)

# 1. How many orders do we have?

The query counts the number of distinct order numbers (Ordnum) in the orders table and returns that count with the alias "Total_Order."

![1](https://github.com/user-attachments/assets/1534bd30-4652-4776-9173-04b8753ca583)


# 2. What is the total Sale Amount?

This query calculates the total sum of the ordamount field from the orders table and returns the result with the alias "Total_SALE_AMOUNT."


![2](https://github.com/user-attachments/assets/609b52db-ee3f-4454-89c0-270d5c4ea449)


# 3. How many Customers do we have onboard?

The query will count the number of non-null values in the custcode column from the customers table. Here’s what each part represents:

• COUNT(custcode): This counts the number of non-null entries in the custcode column. It will not include any rows where custcode is NULL.

• TOTAL_Customer: This gives the resulting count a label, so the result will be returned under the name "TOTAL_Customer."

![3](https://github.com/user-attachments/assets/23557d08-2e43-49f5-b314-03bf467d08a7)


# 4. How many Agents do we have team?

The query will count the number of non-null values in the agentcode column from the agents table. Here’s what each part represents:

• COUNT(agentcode): This counts the number of non-null entries in the agentcode column. It will not include any rows where agentcode is NULL.

• Total_Agents_Team: This gives the resulting count a label, so the result will be returned under the name "Total_Agents_Team."

![4](https://github.com/user-attachments/assets/92e6f984-ee8f-4c55-8902-b70ab8023e73)


# B. Using Joins: (Get Data from Other Tables)

# 5. Can you summarize the Sales Amount by Agent Name? Which one is the Top Performing Agent Sale (Order Amount)?

The query retrieves the name of the agent with the highest total sales amount by joining the agents table with the orders table, grouping by agent name, and ordering by the total sales amount in descending order. It then limits the result to show only the top-performing agent. Here’s what each part represents:

• agents.agentname As AGENT_NAME: Selects the agent's name from the agents table and labels it as "AGENT_NAME."

• SUM(orders.ordamount) AS TOTAL_SALE_AMOUNT: Sums the order amounts (ordamount) from the orders table and labels the result as "TOTAL_SALE_AMOUNT."

• INNER JOIN orders ON agents.agentcode = orders.agentcode: Joins the agents and orders tables based on the matching agentcode values.

• GROUP by agents.agentname: Groups the results by the agent's name to aggregate the total sales for each agent.

• ORDER BY TOTAL_SALE_AMOUNT DESC: Orders the results by the total sales amount in descending order (highest to lowest).

• LIMIT 1: Limits the output to show only the top-performing agent in terms of total sales.

![5](https://github.com/user-attachments/assets/c3fa8133-48b8-418e-88f3-45e5561cc291)


# 6. Can you summarize the Sales Amount by Agent Name? Which one is the Low Performing by Volume (Order Count)?

The query retrieves the name of each agent and the count of orders they are associated with. It joins the agents and orders tables, groups the results by agent name, and orders the results by the number of orders in ascending order (lowest to highest). Here’s what each part represents:

• agents.agentname As AGENT_NAME: Selects the agent's name from the agents table and labels it as "AGENT_NAME."

• COUNT(orders.ordnum) AS ORDER_COUNT: Counts the number of orders (ordnum) from the orders table and labels the result as "ORDER_COUNT."

• INNER JOIN orders ON agents.agentcode = orders.agentcode: Joins the agents and orders tables based on matching agentcode values.

• GROUP by agents.agentname: Groups the results by the agent's name to calculate the order count for each agent.

• ORDER BY ORDER_COUNT ASC: Orders the results by the number of orders in ascending order (lowest to highest).

![6](https://github.com/user-attachments/assets/69ded199-d592-44cb-a916-d9254582c5c1)


# 7. Which Customer has the highest share in the Revenue for the Company? Brain Storm some Risk & Opportunities.

The query retrieves the customer with the highest total revenue by joining the customers and orders tables, grouping the results by customer code and name, and ordering by total revenue in descending order. It limits the output to show only the top-performing customer. Here's what each part represents:

• customers.custcode AS customer_code: Selects the customer code from the customers table and labels it as "customer_code."

• customers.custname AS customer_name: Selects the customer name from the customers table and labels it as "customer_name."

• SUM(orders.ordamount) AS Total_REVENUE: Sums the order amounts (ordamount) from the orders table for each customer and labels the result as "Total_REVENUE."

• INNER JOIN orders ON customers.custcode = orders.custcode: Joins the customers and orders tables based on matching custcode values.

• GROUP BY customers.custcode, customers.custname: Groups the results by both customer code and customer name to calculate the total revenue 
for each customer.

• ORDER BY Total_REVENUE DESC: Orders the results by the total revenue in descending order (highest to lowest).

• LIMIT 1: Limits the output to show only the top customer in terms of total revenue.

![7](https://github.com/user-attachments/assets/de7b5910-146d-4154-917d-dd59cc2a3393)


# C. Level Up with Analytical Queries (Using Join Types)

# 8. Which Customers haven’t made an order yet?


The query retrieves the customer code and name for all customers who have not placed any orders. It uses a LEFT JOIN between the customers and orders tables and filters the results where there is no matching order for the customer. Here's what each part represents:

• customers.custcode As customer_code: Selects the customer code from the customers table and labels it as "customer_code."

• customers.custname As Customer_Name: Selects the customer name from the customers table and labels it as "Customer_Name."

• LEFT JOIN orders on customers.custcode = orders.custcode: Performs a left join between the customers and orders tables, meaning all customers are included even if they have no matching orders.

• WHERE orders.custcode is Null: Filters the results to only include customers who do not have any corresponding records in the orders table (i.e., customers who have not placed any orders).

![8](https://github.com/user-attachments/assets/73ff2ffe-5993-44d9-98a3-45bf62d1949c)


# 9. Which Agents have not referred a Single Customer Yet?

The query retrieves the agent code and name for all agents who have not referred any customers. It uses a LEFT JOIN between the agents and customers tables and filters the results where there is no matching customer for the agent. Here's what each part represents:

• agents.agentcode As Agent_code: Selects the agent code from the agents table and labels it as "Agent_code."

• agents.agentname As Agent_Name: Selects the agent name from the agents table and labels it as "Agent_Name."

• LEFT JOIN customers on agents.agentcode = customers.agentcode: Performs a left join between the agents and customers tables, meaning all agents are included even if they have no matching customers.

• WHERE customers.agentcode is Null: Filters the results to only include agents who do not have any corresponding records in the customers table (i.e., agents who have not referred any customers).

![9](https://github.com/user-attachments/assets/d6d82249-dbb9-4c00-8a5a-a0630e84a332)



