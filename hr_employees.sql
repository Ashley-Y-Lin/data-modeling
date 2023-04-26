CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE managers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    months_at_job INT NOT NULL
        CHECK (months_at_job >= 0),
    status VARCHAR(10) NOT NULL
        CHECK (status IN ('full time', 'part time')),
    department_id INTEGER NOT NULL REFERENCES departments,
    manager_id INTEGER DEFAULT NULL REFERENCES managers
);

INSERT INTO departments (name)
    VALUES
        ('Legal'),
        ('Exec'),
        ('Finance');

INSERT INTO managers (name)
    VALUES
        ('Genna Sussman'),
        ('Aliya Mantas'),
        ('Roger Clark');

INSERT INTO employees (name, months_at_job, status, department_id, manager_id)
    VALUES
        ('Nick Styles', 32, 'full time', 1, 1),
        ('Aliya Mantas', 12, 'full time', 1, 1),
        ('Eric Schmidt', 6, 'part time', 1, 2),
        ('Jesus Allende', 8, 'part time', 1, 1),
        ('Genna Sussman', 15, 'full time', 2, DEFAULT),
        ('Leslie Costas', 18, 'full time', 3, 3),
        ('Janet Nopales', 16, 'full time', 3, 3),
        ('Roger Clark', 43, 'full time', 3, 1);

SELECT e.id, e.name, m.name
    FROM employees AS e
    LEFT OUTER JOIN managers AS m
        ON e.manager_id = m.id
    ORDER BY e.name;

SELECT * FROM managers;