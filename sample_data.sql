-- ================================================
-- SAMPLE DATA: Finance MIS Dashboard
-- ================================================

-- Departments
INSERT INTO Departments (dept_name, location, budget) VALUES
('Finance',        'Chennai',    500000.00),
('HR',             'Bangalore',  300000.00),
('Operations',     'Mumbai',     450000.00),
('IT',             'Hyderabad',  600000.00),
('Sales',          'Delhi',      400000.00);

-- Employees
INSERT INTO Employees (emp_name, dept_id, designation, salary, join_date) VALUES
('Monisha S',      1, 'MIS Executive',     35000.00, '2023-06-01'),
('Ravi Kumar',     2, 'HR Manager',         55000.00, '2021-03-15'),
('Priya Nair',     3, 'Operations Lead',    48000.00, '2022-07-20'),
('Suresh Babu',    4, 'SQL Developer',      62000.00, '2020-11-10'),
('Anita Sharma',   5, 'Sales Executive',    40000.00, '2023-01-05'),
('Karthik R',      1, 'Finance Analyst',    52000.00, '2021-08-12'),
('Meena Devi',     2, 'HR Executive',       38000.00, '2022-04-18'),
('Vijay S',        4, 'IT Analyst',         58000.00, '2020-09-25'),
('Lakshmi K',      3, 'Operations Exec',    42000.00, '2023-03-30'),
('Arjun M',        5, 'Sales Manager',      65000.00, '2019-12-01');

-- Loans
INSERT INTO Loans (emp_id, loan_amount, emi_amount, total_months, paid_months, loan_date) VALUES
(1,  50000.00,  2500.00, 20, 5,  '2024-01-01'),
(2, 100000.00,  5000.00, 20, 10, '2023-06-01'),
(3,  75000.00,  3750.00, 20, 8,  '2023-09-01'),
(5,  30000.00,  1500.00, 20, 3,  '2024-03-01'),
(7,  60000.00,  3000.00, 20, 6,  '2023-12-01');

-- Monthly Expenses
INSERT INTO Monthly_Expenses (dept_id, expense_month, category, actual_spend) VALUES
(1, '2024-01', 'Software',    45000.00),
(1, '2024-02', 'Software',    47000.00),
(2, '2024-01', 'Recruitment', 32000.00),
(2, '2024-02', 'Training',    28000.00),
(3, '2024-01', 'Logistics',   55000.00),
(3, '2024-02', 'Logistics',   52000.00),
(4, '2024-01', 'Hardware',    80000.00),
(4, '2024-02', 'Software',    75000.00),
(5, '2024-01', 'Marketing',   60000.00),
(5, '2024-02', 'Marketing',   65000.00);

-- Salary Transactions
INSERT INTO Salary_Transactions (emp_id, sal_month, basic_salary, deduction, net_salary, paid_date) VALUES
(1,  '2024-01', 35000.00, 2500.00, 32500.00, '2024-01-31'),
(1,  '2024-02', 35000.00, 2500.00, 32500.00, '2024-02-29'),
(2,  '2024-01', 55000.00, 5000.00, 50000.00, '2024-01-31'),
(2,  '2024-02', 55000.00, 5000.00, 50000.00, '2024-02-29'),
(3,  '2024-01', 48000.00, 3750.00, 44250.00, '2024-01-31'),
(3,  '2024-02', 48000.00, 3750.00, 44250.00, '2024-02-29'),
(5,  '2024-01', 40000.00, 1500.00, 38500.00, '2024-01-31'),
(5,  '2024-02', 40000.00, 1500.00, 38500.00, '2024-02-29'),
(7,  '2024-01', 38000.00, 3000.00, 35000.00, '2024-01-31'),
(7,  '2024-02', 38000.00, 3000.00, 35000.00, '2024-02-29');
