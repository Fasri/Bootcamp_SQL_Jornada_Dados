SELECT * 
FROM customers

SELECT contact_name, city
FROM customers

SELECT country
FROM customers

SELECT DISTINCT country
FROM customers

SELECT COUNT(DISTINCT country) AS Distinct, COUNT(country) AS All
FROM customers

SELECT * 
FROM customers 
WHERE country = 'Mexico'

SELECT * 
FROM customers 
WHERE customer_id = 'ANATR'

SELECT *
FROM customers
WHERE country = 'Germany' AND city = 'Berlin'

SELECT *
FROM customers
WHERE  city = 'Aachen'

SELECT *
FROM customers
WHERE country = 'Germany'

SELECT *
FROM customers
WHERE country = 'Germany' AND (city = 'Berlin' OR city= 'Aachen')

SELECT *
FROM customers
WHERE country <> 'Germany' AND country <> 'USA'

SELECT * 
FROM products
WHERE unit_price > 100

SELECT *
FROM products
WHERE unit_price < 100

SELECT *
FROM products
WHERE unit_price <= 50

SELECT *
FROM products
WHERE units_in_stock >= 10

SELECT *
FROM products
WHERE unit_price <> 30

SELECT * 
FROM products
WHERE unit_price >= 50 AND unit_price < 100

SELECT * 
FROM products
WHERE unit_price < 20 OR unit_price > 40

SELECT * 
FROM customers
WHERE contact_name is Null

SELECT * 
FROM customers
WHERE contact_name is not Null

SELECT *
FROM customers
WHERE contact_name LIKE 'A%'

-- LOWE() E UPPER()

SELECT *
FROM customers
WHERE LOWER(contact_name) LIKE 'a%'

SELECT *
FROM customers
WHERE UPPER(contact_name) LIKE 'A%'

SELECT *
FROM customers
WHERE contact_name LIKE '%or%'

SELECT *
FROM customers
WHERE contact_name LIKE '_r%'

SELECT *
FROM customers
WHERE contact_name LIKE 'A_%_%'

SELECT *
FROM customers
WHERE contact_name LIKE 'A%o'

SELECT *
FROM customers
WHERE contact_name NOT LIKE 'A%'

SELECT *
FROM customers
WHERE contact_name LIKE '%or%'


SELECT *
FROM customers
WHERE country IN ('Germany', 'France', 'UK')

SELECT *
FROM customers
WHERE country NOT IN ('Germany', 'France', 'UK')

SELECT *
FROM customers
WHERE country IN (SELECT country FROM suppliers)


SELECT *
FROM products
WHERE unit_price BETWEEN 10 AND 20

SELECT *
FROM products
WHERE unit_price NOT BETWEEN 10 AND 20

SELECT *
FROM products
WHERE (unit_price BETWEEN 10 AND 20) AND category_id NOT IN (1,2,3)
