CREATE TABLE bank_accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance DECIMAL(10,2)
);

INSERT INTO bank_accounts VALUES 
(1, 'Rahul', 15000),
(2, 'Aman', 8000),
(3, 'Priya', 12000),
(4, 'Neha', 5000),
(5, 'Karan', 20000),
(6, 'Rohit', 9000),
(7, 'Sneha', 11000),
(8, 'Arjun', 7000),
(9, 'Meena', 6000),
(10, 'Vikram', 13000);

COMMIT;

START TRANSACTION;

UPDATE bank_accounts
SET balance = balance-3000
WHERE account_id = 5;

UPDATE bank_accounts
SET balance = balance + 3000
WHERE account_id = 9;

SAVEPOINT sp_transfer;

UPDATE bank_accounts
SET balance = balance - 4000
WHERE account_id = 1;

UPDATE bank_accounts
SET balance = balance + 4000
WHERE account_id = 4;

ROLLBACK to sp_transfer;
COMMIT;

SELECT VERSION();


