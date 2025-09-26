-- Utilizando Group BY

SELECT order_id,
	COUNT(order_id) AS unique_product,
	SUM(quantity) AS total_quantity,
	SUM(unit_price * quantity) AS total_price
FROM order_details
GROUP BY order_id
ORDER BY order_id

-- Window functions

SELECT  DISTINCT order_id, -- necessario colocar o distinct, para nao haver repeticao 
	COUNT(order_id) OVER(PARTITION BY order_id) AS produto_unico,
	SUM(quantity) OVER (PARTITION BY order_id) AS quant_total,
	SUM(unit_price *quantity) OVER (PARTITION BY order_id) AS total_price
FROM order_details
ORDER BY order_id

-- Utilizando Group By

SELECT customer_id,
   MIN(freight) AS min_frete,
   MAX(freight) AS max_frete,
   AVG(freight) AS avg_frete
FROM orders
GROUP BY customer_id
ORDER BY customer_id;

-- com Window fuctions

SELECT DISTINCT customer_id,order_id, freight, -- possivel colocar outras colunas
	MIN(freight) OVER (PARTITION BY customer_id) AS frete_min,
	MAX(freight) OVER (PARTITION BY customer_id) AS frete_max,
	AVG(freight) OVER (PARTITION BY customer_id) AS frete_med
FROM orders
ORDER BY customer_id

--Classificacao

SELECT  
  o.order_id, 
  p.product_name, 
  (o.unit_price * o.quantity) AS total_sale,
  ROW_NUMBER() OVER (ORDER BY (o.unit_price * o.quantity) DESC) AS order_rn, 
  RANK() OVER (ORDER BY (o.unit_price * o.quantity) DESC) AS order_rank, 
  DENSE_RANK() OVER (ORDER BY (o.unit_price * o.quantity) DESC) AS order_dense
FROM  
  order_details o
JOIN 
  products p ON p.product_id = o.product_id;

SELECT  
  sales.product_name, 
  total_sale,
  ROW_NUMBER() OVER (ORDER BY total_sale DESC) AS order_rn, 
  RANK() OVER (ORDER BY total_sale DESC) AS order_rank, 
  DENSE_RANK() OVER (ORDER BY total_sale DESC) AS order_dense
FROM (
  SELECT 
    p.product_name, 
    SUM(o.unit_price * o.quantity) AS total_sale
  FROM  
    order_details o
  JOIN 
    products p ON p.product_id = o.product_id
  GROUP BY p.product_name
) AS sales
ORDER BY sales.product_name;

SELECT first_name, last_name, title,
   NTILE(3) OVER (ORDER BY first_name) AS group_number
FROM employees;

SELECT 
  customer_id, order_date,
  --TO_CHAR(order_date, 'YYYY-MM-DD') AS order_date, 
  shippers.company_name AS shipper_name, 
  LAG(freight) OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS previous_order_freight, 
  freight AS order_freight, 
  LEAD(freight) OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS next_order_freight
FROM 
  orders
JOIN 
  shippers ON shippers.shipper_id = orders.ship_via;
