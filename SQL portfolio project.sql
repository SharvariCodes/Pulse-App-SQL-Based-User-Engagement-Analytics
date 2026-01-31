/*SQL Portfolio Project */
select * from users
select * from logins

/* 1. Management wants to see all the users that did not login in the past 5 months.
Return: Username */

--Method 1:
with cte1 as (select user_id, max(login_timestamp) as max_login
from logins_q1
group by user_id
having max(login_timestamp) < dateadd(month,-5,getdate()))
select user_name
from users
where user_id in (select user_id from cte1)
--Method 2:
select user_id, user_name
from users
where user_id not in
(select user_id
from logins_q1
where login_timestamp > dateadd(month,-5,getdate()))


/* 2. For Business Units' quarterly analysis, calculate how many users and how many sessions
were at each quarter. Order by Quarter from newest to oldest.
Return: first day of the quarter, user_cnt, Session_cnt
*/

select datepart(quarter, login_timestamp) as quarter_num, count(*) as session_cnt, 
count(distinct user_id) as user_cnt, min(login_timestamp) as quarter_first_login,
DATEADD(quarter, DATEDIFF(quarter, 0, MIN(login_timestamp)),0) as first_quarter_date
from logins_q1
group by datepart(quarter, login_timestamp)


/* 3. Display User_ids that Log-in January 2026 and did not login in November 2025
Return: User_id */
with cte_jan as (
select  * 
from logins_q1
where login_timestamp between '2026-01-01' and '2026-01-31'),
cte_nov as(
select  * 
from logins_q1
where login_timestamp between '2025-11-01' and '2025-11-30')
select distinct user_id
from cte_jan
where user_id not in (select user_id from cte_nov)

/* 4. Add to the query 2, the percent change in session from last quarter.
Return: first day of the quarter, session_cnt, session_cnt_prev, session_percent_chnage
*/
with cte as (
select datepart(quarter, login_timestamp) as quarter_num, count(*) as session_cnt, 
count(distinct user_id) as user_cnt, min(login_timestamp) as quarter_first_login,
DATEADD(quarter, DATEDIFF(quarter, 0, MIN(login_timestamp)),0) as first_quarter_date
from logins_q1
group by datepart(quarter, login_timestamp)
)

select *,
lag(session_cnt,1) over(order by first_quarter_date) as prev_session_cnt,
((session_cnt - (lag(session_cnt,1) over(order by first_quarter_date)))*100.0)/(lag(session_cnt,1) over(order by first_quarter_date)) as percent_session
from cte

/* 5. Display the user that had the highest session score (max) for each day
Return: Date, Username, score */
with cte as(
select user_id, cast(login_timestamp as date) as login_date, sum(session_score) as score
from logins_q1
group by user_id, cast(login_timestamp as date)
)
select * from (
select *,
row_number() over(partition by login_date order by score desc) as rn
from cte) a
where rn = 1

/* 6. To identify our best users - return the users that has a session on every single day since
their first login. Make assumptions if needed. */
select user_id, min(cast(login_timestamp as date)) as first_login_date,
datediff(day, min(cast(login_timestamp as date)), getdate()) + 1 as no_of_logins_req,
count(distinct cast(login_timestamp as date)) as login_days_num
from logins_q1
group by user_id
having datediff(day, min(cast(login_timestamp as date)), getdate()) + 1 = count(distinct cast(login_timestamp as date))
order by user_id

select *
from logins_q1
order by user_id, login_timestamp

/* 7. On what dates there were no login at all? 
Return: Login_dates
Assumption: We are getting dates from first login date, today's date as last login date*/

--Recursive CTE used here
with cte as (
select cast(min(login_timestamp) as date) as first_date, cast(getdate() as date) as last_date
from logins_q1
union all
select dateadd(day,1,first_date) as first_date,last_date from cte
where first_date < last_date
)
select * from cte
where first_date not in 
(select distinct cast(login_timestamp as date) from logins_q1)
option(maxrecursion 500)