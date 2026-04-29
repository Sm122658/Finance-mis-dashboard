-- ================================================
-- BASIC QUERIES: Finance MIS Dashboard
-- Concepts: SELECT, WHERE, ORDER BY, 
--           GROUP BY, JOINS, CASE WHEN
-- =================================================

-- Q1: All employees with department name (JOIN)
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.designation,
    e.salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
ORDER BY e.salary DESC;

-- Q2: Department wise total salary (GROUP BY)
SELECT 
    d.dept_name,
    COUNT(e.emp_id)    AS total_employees,
    SUM(e.salary)      AS total_salary,
    AVG(e.salary)      AS avg_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total_salary DESC;

-- Q3: Loan status per employee (CASE WHEN)
SELECT 
    e.emp_name,
    l.loan_amount,
    l.emi_amount,
    l.paid_months,
    l.total_months,
    (l.total_months - l.paid_months) AS months_remaining,
    CASE 
        WHEN l.paid_months = l.total_months THEN 'Fully Paid'
        WHEN l.paid_months >= l.total_months / 2 THEN 'Halfway Done'
        ELSE 'In Progress'
    END AS loan_status
FROM Loans l
JOIN Employees e ON l.emp_id = e.emp_id;

-- Q4: Employees with salary above average (WHERE)
SELECT 
    emp_name,
    designation,
    salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees)
ORDER BY salary DESC;

-- Q5: Monthly salary report (GROUP BY + ORDER BY)
SELECT 
    sal_month,
    COUNT(emp_id)      AS employees_paid,
    SUM(basic_salary)  AS total_basic,
    SUM(deduction)     AS total_deduction,
    SUM(net_salary)    AS total_net_salary
FROM Salary_Transactions
GROUP BY sal_month
ORDER BY sal_month;

-- Q6: Department budget vs actual spend (JOIN + GROUP BY)
SELECT 
    d.dept_name,
    d.budget               AS allocated_budget,
    SUM(m.actual_spend)    AS total_spent,
    (d.budget - SUM(m.actual_spend)) AS budget_remaining,
    CASE
        WHEN SUM(m.actual_spend) > d.budget THEN '🚨 Over Budget'
        WHEN SUM(m.actual_spend) > d.budget * 0.8 THEN '⚠️ Near Limit'
        ELSE '✅ Under Control'
    END AS budget_status
FROM Departments d
JOIN Monthly_Expenses m ON d.dept_id = m.dept_id
GROUP BY d.dept_name, d.budget;
