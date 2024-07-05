-- SQL script to insert sample data into the "themepark" database

-- Insert data into themepark table
INSERT INTO themepark (park_code, park_name, park_city, park_country)
VALUES
    ('US001', 'Disneyland', 'Anaheim', 'USA'),
    ('FR123', 'Disneyland Paris', 'Marne-la-Vallée', 'France'),
    ('UK456', 'Thorpe Park', 'Chertsey', 'UK'),
    ('JP789', 'Tokyo Disneyland', 'Urayasu', 'Japan');

-- Insert data into ticket table
INSERT INTO ticket (ticket_no, ticket_price, ticket_type, park_code)
VALUES
    (1, 100.00, 'Adult', 'US001'),
    (2, 50.00, 'Child', 'FR123'),
    (3, 30.00, 'Adult', 'UK456'),
    (4, 2000.00, 'VIP', 'JP789');

-- Insert data into attraction table
INSERT INTO attraction (attract_no, attract_name, attract_age, attract_capacity, park_code)
VALUES
    (1001, 'Space Mountain', 10, 200, 'US001'),
    (1002, 'Pirates of the Caribbean', 12, 150, 'US001'),
    (2001, 'Big Thunder Mountain', 8, 180, 'FR123'),
    (2002, 'It\'s a Small World', 6, 250, 'FR123'),
    (3001, 'Stealth', 14, 100, 'UK456');

-- Insert data into employee table
INSERT INTO employee (emp_num, emp_title, emp_lname, emp_fname, emp_dob, emp_hire_date, emp_area_code, emp_phone, park_code)
VALUES
    (1, 'Manager', 'Smith', 'John', '1980-05-15', '2005-01-10', '213', '555-1234', 'US001'),
    (2, 'Technician', 'Johnson', 'Emily', '1990-08-20', '2010-03-25', '213', '555-5678', 'FR123'),
    (3, 'Operator', 'Williams', 'David', '1985-12-10', '2008-06-15', '213', '555-9876', 'UK456');

-- Insert data into hours table
INSERT INTO hours (emp_num, attract_no, hours_per_attract, hour_rate, date_worked)
VALUES
    (1, 1001, 8.5, 25.00, '2023-07-01'),
    (2, 2001, 7.0, 20.00, '2023-07-01'),
    (3, 3001, 9.0, 22.00, '2023-07-02');

-- Insert data into sales table
INSERT INTO sales (transaction_no, park_code, sale_date)
VALUES
    (1001, 'US001', '2023-07-01'),
    (1002, 'FR123', '2023-07-01'),
    (1003, 'UK456', '2023-07-02');

-- Insert data into sales_line table
INSERT INTO sales_line (transaction_no, line_no, ticket_no, line_qty, line_price)
VALUES
    (1001, 1, 1, 2, 200.00),
    (1002, 1, 2, 3, 150.00),
    (1003, 1, 3, 1, 30.00);
