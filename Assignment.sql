# Create new tables | Start - Question 1
desc `bajaj auto`;
create table bajaj1 as(
select `Date`, `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 19 PRECEDING) as MA20,
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 49 PRECEDING) as MA50
from `bajaj auto`
);

create table eicher1 as(
select `Date`, `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 19 PRECEDING) as MA20,
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 49 PRECEDING) as MA50
from `eicher motors`
);

create table hero1 as(
select `Date`, `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 19 PRECEDING) as MA20,
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 49 PRECEDING) as MA50
from `hero motocorp`
);

create table infosys1 as(
select `Date`, `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 19 PRECEDING) as MA20,
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 49 PRECEDING) as MA50
from `infosys`
);

create table tcs1 as(
select `Date`, `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 19 PRECEDING) as MA20,
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 49 PRECEDING) as MA50
from `tcs`
);

create table tvs1 as(
select `Date`, `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 19 PRECEDING) as MA20,
avg(`Close Price`) over (order by str_to_date(`Date`,"%d-%M-%Y") ROWS 49 PRECEDING) as MA50
from `tvs motors`
);


# Create new tables | End


# Create the master table | Start - Question 2
create table master_stock as (
select str_to_date(bajaj.`Date`, "%d-%M-%Y")  as `Date`,  
bajaj.`Close Price` as Bajaj, 
tcs.`Close Price` as TCS,
tvs.`Close Price` as TVS,
infosys.`Close Price` as Infosys,
eicher.`Close Price` as Eicher,
hero.`Close Price` as Hero
from  
 `bajaj auto` as bajaj
 inner join 
 tcs on bajaj.`Date` = tcs.`Date`
 inner join
 `tvs motors` as tvs
 on tcs.`Date`=tvs.`Date`
  inner join
 infosys
 on tvs.`Date`=infosys.`Date`
 inner join
 `eicher motors` as eicher
 on infosys.`Date`=eicher.`Date`
 inner join
 `hero motocorp` as hero
 on eicher.`Date`=hero.`Date`);
 
 # Create the master table | End
 
 
 # - Question 3 | START
 
 # Create signal table for Bajaj Auto | START
 
 create table bajaj2 as (select `Date`,`Close Price`,
 CASE WHEN MA20>MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))<lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "BUY"
 WHEN MA20<MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))>lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "SELL"
 ELSE "HOLD"
 END as "Signal"
 from bajaj1);

 # Create signal table for Bajaj Auto | END
 
 
 # Create signal table for eicher motors | START
 
 create table eicher2 as (select `Date`,`Close Price`,
 CASE WHEN MA20>MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))<lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "BUY"
 WHEN MA20<MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))>lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "SELL"
 ELSE "HOLD"
 END as "Signal"
 from eicher1);

 # Create signal table for eicher motors  | END
 
  
 # Create signal table for hero motocorp | START
 
 create table hero2 as (select `Date`,`Close Price`,
 CASE WHEN MA20>MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))<lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "BUY"
 WHEN MA20<MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))>lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "SELL"
 ELSE "HOLD"
 END as "Signal"
 from hero1);

 # Create signal table for hero motocorp | END
 
 # Create signal table for infosys | START
 
 create table infosys2 as (select `Date`,`Close Price`,
 CASE WHEN MA20>MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))<lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "BUY"
 WHEN MA20<MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))>lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "SELL"
 ELSE "HOLD"
 END as "Signal"
 from infosys1);

 # Create signal table for infosys | END
 
 # Create signal table for TCS | START
 
 create table tcs2 as (select `Date`,`Close Price`,
 CASE WHEN MA20>MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))<lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "BUY"
 WHEN MA20<MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))>lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "SELL"
 ELSE "HOLD"
 END as "Signal"
 from tcs1);

 # Create signal table for TCS | END
 
 # Create signal table for TVS Motors | START
 
 create table tvs2 as (select `Date`,`Close Price`,
 CASE WHEN MA20>MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))<lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "BUY"
 WHEN MA20<MA50 AND lag(MA20,1)  over (order by str_to_date(`Date`, "%d-%M-%Y"))>lag(MA50,1) over (order by str_to_date(`Date`, "%d-%M-%Y")) THEN "SELL"
 ELSE "HOLD"
 END as "Signal"
 from tvs1);

 # Create signal table for TVS Motors | END
 
 # - Question 3 | END
 
 
 # - Question 4 | START
 
  DELIMITER $$
 create function getSignal(datetext text)
 returns varchar(4) DETERMINISTIC
 begin
	
	return (select `Signal` from bajaj2 where str_to_date(`Date`,"%d-%M-%Y") = str_to_date(datetext,"%d-%M-%Y"));
    
 end
 $$
 DELIMITER 
 
 select getSignal("5-January-2015") as "signal" ;
 
 # - Question 4 | END