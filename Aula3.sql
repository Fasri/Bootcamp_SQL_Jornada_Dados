SELECT * 
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id


-- pedidos no ano de 1996 e seus clientes

SELECT * 
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM o.order_date) = 1996

-- CIDADES QUE TEM EMPREGADOS POR QUANTIDADE DE FUNCIONARIOS E CLIENTES

SELECT e.city,COUNT(DISTINCT e.employee_id) AS qunt_funcionario, COUNT(DISTINCT c.customer_id) AS qunt_clientes
FROM employees e
LEFT JOIN customers c ON e.city = c.city
GROUP BY e.city
ORDER BY e.city

-- CIDADES QUE TEM CLIENTES POR QUANTIDADE DE FUNCIONARIOS E CLIENTES

SELECT c.city,COUNT(DISTINCT e.employee_id) AS qunt_funcionario, COUNT(DISTINCT c.customer_id) AS qunt_clientes
FROM employees e
RIGHT JOIN customers c ON e.city = c.city
GROUP BY c.city
ORDER BY c.city

-- CIDADES QUE TEM CLIENTES E FUNCIONARIOS POR QUANTIDADE DE FUNCIONARIOS E CLIENTES

SELECT COALESCE(c.city, e.city) AS cidade,COUNT(DISTINCT e.employee_id) AS qunt_funcionario, COUNT(DISTINCT c.customer_id) AS qunt_clientes
FROM employees e
FULL JOIN customers c ON e.city = c.city
GROUP BY c.city, e.city
ORDER BY cidade