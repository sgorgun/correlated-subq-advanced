# Database design and SQL (DQL). Correlated subqueries advanced

## Task  

1. Get customers, whose average purchase amount per order is more than 70. Sort ascending total purchase sum, surname. Scheme of result data set: **name| surname | avg_purchase | sum_ purchase** 
 
2. Calculate how many more (in percentage) products were sold when their discount was more than 5% (id and title of the product, the quantity of this product purchased with this discount, the quantity of this product purchased without a discount or with a discount below 5%, the difference in percentage between the number of product sold with discount and without one). Sort ascending by product id. Scheme of result data set: **id | title | count_with_discount_5 | count_without_discount_5 | difference**
 
3. Get the leading manufacturers for each product title. If the product was not sold, the leader-manufacturer is NULL. Sort ascendidng by title id. Scheme of result data set: **product_id| title | manufacturer_id | manufacturer**





### Domain description   

Supermarkets sell goods of various categories. The customers can shop anonymously or by logging in. When buying, a receipt is created with a list of goods purchased in a particular market. 

![DBScheme](/CorrelatedSubqueriesAdvanced/sql_queries/DBSchema.jpg)

### How to complete task solution

Save the script with the query for subtask 1 to file **sql_queries / task1.sql**, the next one to file **sql_queries / task2.sql**, etc. 
______
