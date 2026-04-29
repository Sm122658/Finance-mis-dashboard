-- ================================================
-- PROJECT: Finance MIS Dashboard
-- Author: Monisha
-- Description: Basic to Advanced SQL concepts
-- ================================================

CREATE DATABASE FinanceMISDashboard;
USE FinanceMISDashboard;

-- ================================================
-- TABLE 1: Departments
-- ================================================
CREATE TABLE Departments (
    dept_id       INT PRIMARY KEY AUTO_INCREMENT,
    dept_name     VARCHAR(100) NOT NULL,
    location      VARCHAR(100),
    budget        DECIMAL(15,2)
);

-- ================================================
-- TABLE 2: Employees
-- ================================================
CREATE TABLE Employees (
    emp_id        INT PRIMARY KEY AUTO_INCREMENT,
    emp_name      VARCHAR(100) NOT NULL,
    dept_id       INT,
    designation   VARCHAR(100),
    salary        DECIMAL(10,2),
    join_date     DATE,
    status        VARCHAR(10) DEFAULT 'Active',
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- ================================================
-- TABLE 3: Loans
-- ================================================
CREATE TABLE Loans (
    loan_id       INT PRIMARY KEY AUTO_INCREMENT,
    emp_id        INT,
    loan_amount   DECIMAL(15,2),
    emi_amount    DECIMAL(10,2),
    total_months  INT,
    paid_months   INT DEFAULT 0,
    loan_date     DATE,
    status        VARCHAR(10) DEFAULT 'Active',
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- ================================================
-- TABLE 4: Monthly Expenses
-- ================================================
CREATE TABLE Monthly_Expenses (
    expense_id    INT PRIMARY KEY AUTO_INCREMENT,
    dept_id       INT,
    expense_month VARCHAR(7),
    category      VARCHAR(50),
    actual_spend  DECIMAL(15,2),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- ================================================
-- TABLE 5: Salary Transactions
-- ================================================
CREATE TABLE Salary_Transactions (
    sal_id        INT PRIMARY KEY AUTO_INCREMENT,
    emp_id        INT,
    sal_month     VARCHAR(7),
    basic_salary  DECIMAL(10,2),
    deduction     DECIMAL(10,2) DEFAULT 0,
    net_salary    DECIMAL(10,2),
    paid_date     DATE,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);
