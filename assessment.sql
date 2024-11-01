create database pratice_mysql;
use pratice_mysql;

CREATE TABLE employee (
    empid INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
) AUTO_INCREMENT=500;

CREATE TABLE manager (
    managerid INT,  -- No AUTO_INCREMENT and no UNIQUE constraint
    manager_name VARCHAR(100),
    empid INT,
    FOREIGN KEY (empid) REFERENCES employee(empid)
);

INSERT INTO employee (first_name, last_name) VALUES
('Amit', 'Sharma'),
('Priya', 'Verma'),
('Rahul', 'Gupta'),
('Sneha', 'Singh'),
('Vikram', 'Kumar');

INSERT INTO employee (first_name, last_name) VALUES
('Arjun', 'Patel'),
('Riya', 'Kohli'),
('Deepak', 'Reddy'),
('Sana', 'Malik'),
('Rakesh', 'Mehta');
select * from employee;

INSERT INTO manager (managerid, manager_name, empid) VALUES
(150, 'swadha', 500),
(151, 'utkarsh', 501),
(150, 'swadha', 502),
(152, 'gazal', 503),
(151, 'utkarsh', 504);

select * from manager;

SELECT m.manager_name, e.first_name, e.last_name
FROM manager m
JOIN employee e ON m.empid = e.empid
ORDER BY m.managerid;

SELECT COUNT(*) AS employee_count
FROM manager m
WHERE m.manager_name = 'swadha';

SELECT DISTINCT managerid, manager_name
FROM manager;

SELECT e.empid, e.first_name, e.last_name
FROM employee e
LEFT JOIN manager m ON e.empid = m.empid
WHERE m.empid IS NULL;

DELIMITER $$

CREATE FUNCTION GetFullName(first_name VARCHAR(100), last_name VARCHAR(100))
RETURNS VARCHAR(200) DETERMINISTIC
BEGIN
    RETURN CONCAT(first_name, ' ', last_name);
END $$

DELIMITER ;

SELECT empid, GetFullName(first_name, last_name) AS fullname
FROM employee;





