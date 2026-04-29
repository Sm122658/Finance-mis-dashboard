-- ================================================
-- ADVANCED QUERIES: Finance MIS Dashboard
-- Concepts: Subqueries, Views, Indexes,
--           Stored Procedures, Window Functions
-- ================================================

-- ================================================
-- 1. SUBQUERY
-- ================================================

-- Employees earning more than their dept average
SELECT 
    e.emp_name,
    e.designation,
    e.salary,
    d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.salary > (
    SELECT AVG(e2.salary) 
    FROM Employees e2 
    WHERE e2.dept_id = e.dept_id
);

-- ================================================
-- 2. VIEWS (Virtual MIS Report Table)
-- ================================================

-- View: Employee full details
CREATE VIEW vw_Employee_Summary AS
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.designation,
    e.salary,
    e.join_date,
    e.status
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- Use the view
SELECT * FROM vw_Employee_Summary;

-- View: Loan summary
CREATE VIEW vw_Loan_Summary AS
SELECT 
    e.emp_name,
    l.loan_amount,
    l.emi_amount,
    l.paid_months,
    l.total_months,
    (l.emi_amount * l.paid_months)                    AS amount_paid,
    (l.loan_amount - (l.emi_amount * l.paid_months))  AS amount_remaining
FROM Loans l
JOIN Employees e ON l.emp_id = e.emp_id;

-- Use the view
SELECT * FROM vw_Loan_Summary;

-- ================================================
-- 3. INDEXES (Performance Optimization)
-- ================================================

CREATE INDEX idx_emp_dept    ON Employees(dept_id);
CREATE INDEX idx_loan_emp    ON Loans(emp_id);
CREATE INDEX idx_sal_month   ON Salary_Transactions(sal_month);
CREATE INDEX idx_exp_month   ON Monthly_Expenses(expense_month);

-- ================================================
-- 4. STORED PROCEDURE
-- ================================================

-- Procedure: Get employee salary details by dept
DELIMITER $$

CREATE PROCEDURE GetDeptSalaryReport(IN p_dept_name VARCHAR(100))
BEGIN
    SELECT 
        e.emp_name,
        e.designation,
        e.salary,
        s.sal_month,
        s.deduction,
        s.net_salary
    FROM Employees e
    JOIN Departments d   ON e.dept_id  = d.dept_id
    JOIN Salary_Transactions s ON e.emp_id = s.emp_id
    WHERE d.dept_name = p_dept_name
    ORDER BY s.sal_month;
END$$

DELIMITER ;

-- Call the procedure
CALL GetDeptSalaryReport('Finance');

-- ================================================
-- 5. WINDOW FUNCTIONS
-- ================================================

-- Salary RANK department wise
SELECT 
    e.emp_name,
    d.dept_name,
    e.salary,
    RANK() OVER (
        PARTITION BY d.dept_name 
        ORDER BY e.salary DESC
    ) AS salary_rank
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- Running total of salary payments
SELECT 
    emp_id,
    sal_month,
    net_salary,
    SUM(net_salary) OVER (
        PARTITION BY emp_id 
        ORDER BY sal_month
    ) AS running_total
FROM Salary_Transactions;

-- ROW_NUMBER - expense ranking per department
SELECT 
    d.dept_name,
    m.expense_month,
    m.category,
    m.actual_spend,
    ROW_NUMBER() OVER (
        PARTITION BY d.dept_name 
        ORDER BY m.actual_spend DESC
    ) AS expense_rank
FROM Monthly_Expenses m
JOIN Departments d ON m.dept_id = d.dept_id;
