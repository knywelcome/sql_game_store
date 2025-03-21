-- premade sql for assingment 4

-- Drop the table if it exists
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS action_figure;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS poster;
DROP TABLE IF EXISTS game CASCADE;
DROP TABLE IF EXISTS genre_game CASCADE;
DROP TABLE IF EXISTS action_figure;
DROP TABLE IF EXISTS poster;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS social_security;
DROP TABLE IF EXISTS shifts;


-- CREATE TABLE game (
--     game_id INT PRIMARY KEY,
--     game_title VARCHAR(255) UNIQUE NOT NULL CHECK (game_title ~ '^[A-Za-z0-9 _\-:''\\]+$'),
--     quantity INT NOT NULL CHECK(quantity > 0 AND quantity < 51),
--     price DECIMAL(5, 2) NOT NULL CHECK(price > 10 AND price < 60)
-- );
-- CREATE TABLE action_figure (
--     id INT PRIMARY KEY,
--     action_figure_title VARCHAR UNIQUE NOT NULL CHECK (action_figure_title ~ '^[A-Za-z0-9 _-]+$'),
--     quantity INT NOT NULL CHECK(quantity > 0 AND quantity < 31),
--     price DECIMAL(5,2) NOT NULL CHECK(price > 10 AND price < 100.01)
-- );
-- -- MAX SALARY AN HOUR IS 31.25 AND MIN IS 16.66
-- CREATE TABLE employee (
--     id INT PRIMARY KEY,
--     employee_name VARCHAR NOT NULL CHECK (employee_name ~ '^[A-Za-z ]+$'),
--     position VARCHAR NOT NULL CHECK (position IN (
--         'Sales Associate',
--         'Store Manager',
--         'Inventory Clerk',
--         'Customer Service Representative',
--         'IT Specialist',
--         'Marketing Coordinator',
--         'Assistant Manager',
--         'Finance Analyst',
--         'Security Officer',
--         'HR Coordinator'
--     )),
--     salary DECIMAL(7,2) NOT NULL CHECK (salary > 31987.19 AND salary < 60000.01)
-- );
-- CREATE TABLE poster (
--     id SERIAL PRIMARY KEY,
--     poster_title VARCHAR UNIQUE NOT NULL CHECK (poster_title ~ '^[A-Za-z0-9 _-]+$'),
--     quantity INT NOT NULL CHECK (quantity > 0 AND quantity < 31),
--     price DECIMAL(4,2) NOT NULL CHECK (price <= 20.00 AND price > 6)
-- );



CREATE TABLE game (
    game_id SERIAL PRIMARY KEY,
    engine_id INT,  FOREIGN KEY (engine_id) REFERENCES gaming_engine(engine_id),
    -- Define engine_id column here  -- Reference engine_id here
    game_title VARCHAR(255) UNIQUE NOT NULL CHECK (game_title ~ '^[A-Za-z0-9 _\-:''\\]+$'),
    quantity INT NOT NULL CHECK(quantity > 0 AND quantity < 51),
    price DECIMAL(5, 2) NOT NULL CHECK(price > 10 AND price < 60)
    
);
\COPY game FROM './game.csv' WITH CSV HEADER;



CREATE TABLE genre_game (
    id SERIAL PRIMARY KEY,
    game_id INT, FOREIGN KEY (game_id) REFERENCES game (game_id),
    genre_id INT, FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
    
);
\COPY genre_game FROM './genre_game.csv' WITH CSV HEADER;



CREATE TABLE action_figure (
    id SERIAL PRIMARY KEY,
    action_figure_title VARCHAR UNIQUE NOT NULL CHECK (action_figure_title ~ '^[A-Za-z0-9 _-]+$'),
    quantity INT NOT NULL CHECK(quantity > 0 AND quantity < 31),
    price DECIMAL(5,2) NOT NULL CHECK(price > 10 AND price < 100.01)
);
\COPY action_figure FROM './action_figure.csv' WITH CSV HEADER;



-- MAX SALARY AN HOUR IS 31.25 AND MIN IS 16.66
CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    employee_name VARCHAR NOT NULL CHECK (employee_name ~ '^[A-Za-z ]+$'),
    position VARCHAR NOT NULL CHECK (position IN (
        'Sales Associate',
        'Store Manager',
        'Inventory Clerk',
        'Customer Service Representative',
        'IT Specialist',
        'Marketing Coordinator',
        'Assistant Manager',
        'Finance Analyst',
        'Security Officer',
        'HR Coordinator'
    )),
    salary DECIMAL(7,2) NOT NULL CHECK (salary > 31987.19 AND salary < 60000.01)
);
\COPY employee FROM './employee.csv' WITH CSV HEADER;



CREATE TABLE poster (
    id SERIAL PRIMARY KEY,
    poster_title VARCHAR UNIQUE NOT NULL CHECK (poster_title ~ '^[A-Za-z0-9 _-]+$'),
    quantity INT NOT NULL CHECK (quantity > 0 AND quantity < 31),
    price DECIMAL(4,2) NOT NULL CHECK (price <= 20.00 AND price > 6)
);
\COPY poster FROM './poster.csv' WITH CSV HEADER;







CREATE TABLE social_security(
    id SERIAL PRIMARY KEY,
    employee_id INT, FOREIGN KEY (employee_id) REFERENCES employee(id),
    ssn VARCHAR(11) UNIQUE NOT NULL CHECK (ssn ~ '^\d{3}-\d{2}-\d{4}$')

);
\COPY social_security FROM './social_security.csv' WITH CSV HEADER;



CREATE TABLE shifts (
    id SERIAL PRIMARY KEY,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    employee_id INT, FOREIGN KEY (employee_id) REFERENCES employee(id)
);
\COPY shifts FROM './shifts.csv' WITH CSV HEADER;

---------------------------------------------------------------------------------------------------------------------


