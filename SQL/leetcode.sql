-- Active: 1770635952694@@127.0.0.1@3306@grow_tech
CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(10),
    state ENUM('approved', 'declined'),
    amount INT,
    trans_date DATE
);

INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');

SELECT * from transactions;


select 
    date_format(trans_date, '%Y-%m') as month,
    country,
    count(*) as trans_count,
    SUM(CASE 
        WHEN state = 'approved' THEN  1
        ELSE  0
    END) as approved_count ,
    SUM(amount)trans_total_amount ,
    SUM(CASE 
        WHEN state = 'approved' THEN  amount
        ELSE  0
    END) as approved_total_amount
from Transactions 
group by month, country;


CREATE TABLE Activity (
    user_id INT,
    session_id INT,
    activity_date DATE,
    activity_type ENUM(
        'open_session',
        'end_session',
        'scroll_down',
        'send_message'
    )
);

INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down'),
(1, 1, '2019-07-20', 'end_session'),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session'),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session'),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-25', 'end_session');

SELECT * FROM Activity;



select activity_date  as day,
count(DISTINCT user_id) as active_users 
from Activity 
group by activity_date
having activity_date BETWEEN '2019-06-28' AND '2019-07-27'
;

