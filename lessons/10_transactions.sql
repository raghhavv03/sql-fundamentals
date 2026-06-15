-- transactions
CREATE DATABASE xyz_bank;
USE xyz_bank;

CREATE TABLE accounts(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts (name, balance)
VALUES
('Alice Johnson', 12500.50),
('Mark Rivera', 8200.75),
('Sophia Lee', 15400.00),
('Daniel Kim', 6700.25),
('Emma Brown', 9800.80),
('Liam Patel', 20150.60),
('Olivia Garcia', 4300.40),
('Noah Thompson', 17600.90),
('Ava Martinez', 11250.35),
('Ethan Davis', 25000.00);

SELECT * FROM accounts;

-- autocommit
SELECT @@autocommit;

SET autocommit = 0;

-- commit
START TRANSACTION;

UPDATE accounts 
SET balance = balance - 100 
WHERE id = 3;

UPDATE accounts 
SET balance = balance + 100 
WHERE id = 5;

COMMIT;

-- rollback
START TRANSACTION;

UPDATE accounts 
SET balance = balance - 100 
WHERE id = 4;

COMMIT;

UPDATE accounts 
SET balance = balance + 100 
WHERE id = 7;

ROLLBACK;

-- savepoints
START TRANSACTION;

UPDATE accounts 
SET balance = balance + 1000
WHERE id = 3;

SAVEPOINT after_wallet_topup;

UPDATE accounts -- cashback
SET balance = balance + 100 
WHERE id = 3;

ROLLBACK TO after_wallet_topup;

COMMIT;

-- stored procedures
DELIMITER $$

CREATE PROCEDURE check_balance(IN acc_id INT, OUT bal DECIMAL(10, 2))
BEGIN
	SELECT balance INTO bal
    FROM accounts
    WHERE id = acc_id;
END $$

DELIMITER ;

-- calling procedure
CALL check_balance(3, @balance);
SELECT @balance; -- user-defined variable





