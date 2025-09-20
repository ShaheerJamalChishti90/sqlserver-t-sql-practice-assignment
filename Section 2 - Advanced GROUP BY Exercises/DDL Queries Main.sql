CREATE DATABASE sportsclub;
GO

USE sportsclub;
GO


-- Runner table
CREATE TABLE runner (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    main_distance INT NULL,   -- can be NULL if unknown
    age INT NULL,             -- can be NULL if not provided
    is_female BIT NULL        -- can be NULL if gender not specified
);

-- Event table
CREATE TABLE event (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(200) NOT NULL,
    start_date DATE NULL,     -- sometimes event date not known
    city NVARCHAR(100) NULL   -- sometimes city may be missing
);

-- Runner_Event table (junction)
CREATE TABLE runner_event (
    runner_id INT NOT NULL,
    event_id INT NOT NULL,
    PRIMARY KEY (runner_id, event_id),
    FOREIGN KEY (runner_id) REFERENCES runner(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);


INSERT INTO runner (name, main_distance, age, is_female) VALUES
('Ali Khan', 5000, 25, 0),
('Sara Ahmed', 10000, 29, 1),
('John Smith', 42195, 34, 0),
('Maria Lopez', 21097, 31, 1),
('David Brown', 5000, 22, 0),
('Fatima Noor', NULL, 27, 1), -- unknown main distance
('James Wilson', 10000, 40, 0),
('Aisha Siddiqui', 3000, 19, 1),
('Michael Chen', 42195, 35, 0),
('Sophia Khan', 21097, 28, 1),
('Hassan Raza', 5000, 24, 0),
('Olivia Taylor', 1500, 21, 1),
('Abdullah Sheikh', 8000, 33, 0),
('Emma Watson', 10000, 26, 1),
('Omar Ali', 21097, 37, 0),
('Noor Fatima', 5000, 22, 1),
('Liam Johnson', 42195, 30, 0),
('Amna Khalid', NULL, 23, 1),
('Robert Miller', 3000, 45, 0),
('Hina Malik', 10000, 39, 1),
('Daniel Evans', 1500, 20, 0),
('Maryam Qureshi', 5000, 34, 1),
('Chris Martin', 21097, 28, 0),
('Sophia White', 42195, 32, 1),
('Yasir Khan', 5000, 19, 0),
('Nadia Bibi', 10000, 27, 1),
('Alex Green', 8000, 29, 0),
('Zara Ali', 1500, 25, 1),
('Bilal Ashraf', 21097, 31, 0),
('Jessica Brown', 42195, 36, 1),
('Hamza Yousuf', 3000, 18, 0),
('Emily Davis', NULL, 26, 1),
('Imran Haider', 5000, 42, 0);



INSERT INTO event (name, start_date, city) VALUES
('London Marathon', '2022-04-23', 'London'),
('Warsaw Runs', '2021-06-12', 'Warsaw'),
('New Year Run', '2023-01-01', 'Karachi'),
('Berlin Half Marathon', '2022-09-18', 'Berlin'),
('Chicago Marathon', '2021-10-10', 'Chicago'),
('Tokyo Sprint', '2022-03-15', 'Tokyo'),
('Lahore City Run', '2023-02-19', 'Lahore'),
('Boston Marathon', '2021-04-19', 'Boston'),
('Paris Evening Run', '2022-08-25', 'Paris'),
('Sydney 10K', '2021-11-07', 'Sydney'),
('New Delhi Challenge', '2023-03-03', 'New Delhi'),
('Warsaw Runs', '2023-06-10', 'Warsaw'), -- repeated name
('London Marathon', '2021-04-25', 'London'), -- repeated event
('Dubai Desert Run', '2022-12-05', 'Dubai'),
('Karachi Fun Run', '2022-07-15', 'Karachi'),
('Istanbul 5K', '2021-05-20', 'Istanbul'),
('Berlin Night Run', '2023-08-12', 'Berlin'),
('Madrid 15K', '2021-09-09', 'Madrid'),
('Toronto Lake Run', '2022-06-18', 'Toronto'),
('Rome City Marathon', '2023-10-01', 'Rome'),
('Boston Winter Run', '2022-01-10', 'Boston'),
('Tokyo Relay', '2021-12-22', 'Tokyo'),
('Paris Spring Run', '2023-04-14', 'Paris'),
('Sydney Marathon', '2022-09-11', 'Sydney'),
('Lahore Mini Marathon', '2021-08-30', 'Lahore'),
('Dubai Night Run', '2023-11-20', 'Dubai'),
('New Delhi Dash', '2022-07-03', 'New Delhi'),
('Karachi Midnight Run', '2021-12-31', 'Karachi'),
('Istanbul City Challenge', '2023-05-22', 'Istanbul'),
('Toronto Half Marathon', '2021-10-17', 'Toronto'),
('Rome Evening Run', '2022-09-05', 'Rome');



INSERT INTO runner_event (runner_id, event_id) VALUES
-- Ali Khan joins London Marathon and Karachi Fun Run
(1, 1), (1, 15),

-- Sara Ahmed joins Warsaw Runs, Lahore City Run
(2, 2), (2, 7),

-- John Smith in New Year Run, Chicago Marathon, Dubai Desert Run
(3, 3), (3, 5), (3, 14),

-- Maria Lopez in Berlin Half Marathon, Boston Marathon
(4, 4), (4, 8),

-- David Brown in Tokyo Sprint, Karachi Midnight Run
(5, 6), (5, 28),

-- Fatima Noor in Lahore City Run, Paris Evening Run
(6, 7), (6, 9),

-- James Wilson in Chicago Marathon, Rome City Marathon
(7, 5), (7, 20),

-- Aisha Siddiqui in New Delhi Challenge, Sydney 10K
(8, 11), (8, 10),

-- Michael Chen in Boston Marathon, Tokyo Relay
(9, 8), (9, 22),

-- Sophia Khan in Paris Spring Run, London Marathon
(10, 23), (10, 1),

-- Hassan Raza in Sydney Marathon, Lahore Mini Marathon
(11, 24), (11, 25),

-- Olivia Taylor in New Delhi Dash, Istanbul 5K
(12, 27), (12, 16),

-- Abdullah Sheikh in Berlin Night Run, Toronto Half Marathon
(13, 17), (13, 30),

-- Emma Watson in Paris Evening Run, Rome Evening Run
(14, 9), (14, 31),

-- Omar Ali in Dubai Night Run, Toronto Lake Run
(15, 26), (15, 19),

-- Noor Fatima in Karachi Fun Run, New Year Run
(16, 15), (16, 3),

-- Liam Johnson in London Marathon, Rome City Marathon
(17, 1), (17, 20),

-- Amna Khalid in Istanbul City Challenge, New Delhi Challenge
(18, 29), (18, 11),

-- Robert Miller in Berlin Half Marathon, Tokyo Sprint
(19, 4), (19, 6),

-- Hina Malik in Sydney 10K, Madrid 15K
(20, 10), (20, 18),

-- Daniel Evans in Toronto Lake Run, Sydney Marathon
(21, 19), (21, 24),

-- Maryam Qureshi in Warsaw Runs, Dubai Desert Run
(22, 2), (22, 14),

-- Chris Martin in Paris Spring Run, Boston Winter Run
(23, 23), (23, 21),

-- Sophia White in Rome City Marathon, London Marathon
(24, 20), (24, 1),

-- Yasir Khan in Karachi Midnight Run, Berlin Night Run
(25, 28), (25, 17),

-- Nadia Bibi in Lahore Mini Marathon, Paris Evening Run
(26, 25), (26, 9),

-- Alex Green in Istanbul 5K, Dubai Night Run
(27, 16), (27, 26),

-- Zara Ali in New Delhi Dash, Warsaw Runs
(28, 27), (28, 2),

-- Bilal Ashraf in Toronto Half Marathon, Boston Marathon
(29, 30), (29, 8),

-- Jessica Brown in Rome Evening Run, Sydney 10K
(30, 31), (30, 10),

-- Hamza Yousuf in New Year Run, Karachi Fun Run
(31, 3), (31, 15),

-- Emily Davis in Madrid 15K, Berlin Half Marathon
(32, 18), (32, 4),

-- Imran Haider in Toronto Lake Run, Istanbul City Challenge
(33, 19), (33, 29);
