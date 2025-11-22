show DATABASES
use kb;
CREATE TABLE CustomerTransactions (
    id INT PRIMARY KEY,
    login_device VARCHAR(50),
    customer_name VARCHAR(100),
    ip_address VARCHAR(20),
    product VARCHAR(100),
    amount DECIMAL(10, 2),
    is_placed BOOLEAN,
    is_viewed BOOLEAN,
    transaction_status VARCHAR(20)
);
INSERT INTO CustomerTransactions VALUES
(1, 'Mobile', 'Ravi', '192.168.1.1', 'Laptop', 50000.00, TRUE, FALSE, 'Completed'),
(2, 'Desktop', 'Priya', '192.168.1.2', 'Smartphone', 20000.00, TRUE, TRUE, 'Completed'),
(3, 'Tablet', 'Arjun', '192.168.1.3', 'Headphones', 1500.00, FALSE, TRUE, 'Failed'),
(4, 'Mobile', 'Meena', '192.168.1.4', 'Shoes', 2500.00, TRUE, FALSE, 'Completed'),
(5, 'Desktop', 'Karthik', '192.168.1.5', 'Watch', 5000.00, TRUE, TRUE, 'Completed'),
(6, 'Mobile', 'Sowmya', '192.168.1.6', 'Tablet', 15000.00, TRUE, TRUE, 'Completed'),
(7, 'Tablet', 'Ramesh', '192.168.1.7', 'Smartphone', 25000.00, FALSE, TRUE, 'Failed'),
(8, 'Desktop', 'Divya', '192.168.1.8', 'Laptop', 60000.00, TRUE, FALSE, 'Completed'),
(9, 'Mobile', 'Arun', '192.168.1.9', 'Smartwatch', 12000.00, TRUE, TRUE, 'Completed'),
(10, 'Tablet', 'Deepa', '192.168.1.10', 'Laptop', 55000.00, FALSE, FALSE, 'Pending');




desc customertransactions

SELECT 
    product,
    amount,
    CASE 
        WHEN amount < 2000 THEN 'cheap'
        WHEN amount BETWEEN 2000 and 20000 then 'medium'
        ELSE  'expensive'
    END range_
from customertransactions;

SELECT* from customertransactions

select count(*) from customertransactions where transaction_status not in ('failed','pending');

select sum(amount) sum from customertransactions where transaction_status='completed';

SELECT max(amount) FROM customertransactions;

select AVG(amount)  avg FROM customertransactions;

SELECT count(*), sum(amount) FROM customertransactions where login_device = 'mobile';

SELECT login_device,
sum(amount) total_revenue,
count(*) count
FROM customertransactions
Group by login_device
HAVING 
 sum(amount)>80000;


SELECT
case 
    when 10 < 8 then 'yes'
    else 'false'
end


CREATE TABLE CustomerData (
    id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(200),
    amount DECIMAL(10, 2)
);

INSERT INTO CustomerData VALUES
(1, 'Ravi', 'ravi@example.com', '98765', 'Chennai', 5000.00),
(2, 'Priya', NULL, '98765', 'Bangalore', NULL),
(3, 'Arjun', 'arjun@example.com', NULL, 'Hyderabad', 1500.00),
(4, 'Meena', NULL, NULL, 'Mumbai', 2500.00),
(5, 'Karthik', 'karthik@example.com', '98765', NULL, 3000.00);

select customer_name,
CASE 
    WHEN email is null and phone_number is null then '99942'
    WHEN phone_number is null THEN email  
    ELSE phone_number
END Contact 
from customerdata


SELECT count(*) from customerdata where phone_number is not NULL

SELECT customer_name,
COALESCE(amount,0)
 from customerdata

 SELECT LENGTH(customer_name) length_,
 UPPER(address) city,
 LOWER(customer_name) low,
 CASE 
   WHEN address is null THEN 'noaddress'
   ELSE  CONCAT(customer_name, ' ', address)  
 END nameadress,
 CONCAT(customer_name, ' ', address) nameaddres,
 SUBSTR(customer_name, 4, 5) substr_su,
 LPAD(customer_name, 10, '*') padding,
 REPLACE(customer_name,'a', '*'),
 INSTR(customer_name, 'a'),
 LEFT(customer_name, 3) le,
 REVERSE(customer_name) rev,
 FORMAT(amount, 2)
 from customerdata



