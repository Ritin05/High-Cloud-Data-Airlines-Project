select count(*) from maindata;


#  KPI 1 No of Airline,No of Country,City,State,Operating_Region,Cover_Distance,Total_Passengers and No_OF_Aircraft
select count(Airline_ID) as No_Of_Airlines
from airline ;

select count(Aircraft_Type_ID) as No_OF_Aircraft
from aircraft_types;

select count(distinct(`Destination Country`)) as No_Of_Country,count(distinct(`Destination State`)) as No_of_State,
count(distinct(`Destination City`)) as No_of_City,concat(round(sum(Transported_Passengers)/1000000,2),'M') as Total_Passengers,
concat(round(sum(Distance)/1000000,2),'M',' ',"Km") as Cover_Distance,count(distinct(Operating_Region)) as Total_Operating_Region
from maindata join operatingregion 
on maindata.`%Region Code`=operatingregion.Region_Code;

# KPI 2 calcuate the following fields from the Year Month (#) Day fields ( First Create a Date Field from Year , Month , Day fields)
create view Date_field as
select concat(year,'-',month,'-',day) as Date_field,From_to_City,Transported_Passengers,Available_Seats,Carrier_Name
from maindata;

create view KPI1 as select Date_field,year(Date_field) as Year_No,month(Date_field)as Month_Number,
monthname(Date_field) as Month_Name,day(Date_field) as Day_No,dayname(Date_field) as Day_name,
concat("Q",quarter(date_field)) as Quarter_No,
weekofyear(date_field) as Week_Of_Year,concat(year(date_field),'-',monthname(date_field)) as YearMonth,
case
when quarter(Date_field)=1 then "FQ-4"
when quarter(Date_field)=2 then "FQ-1"
when quarter(Date_field)=3 then "FQ-2"
when quarter(Date_field)=4 then "FQ-3"
end as Finalncial_Quarter,
case
when month(Date_field)=4 then "FM-1"
when month(Date_field)=5 then "FM-2"
when month(Date_field)=6 then "FM-3"
when month(Date_field)=7 then "FM-4"
when month(Date_field)=8 then "FM-5"
when month(Date_field)=9 then "FM-6"
when month(Date_field)=10 then "FM-7"
when month(Date_field)=11 then "FM-8"
when month(Date_field)=12 then "FM-9"
when month(Date_field)=1 then "FM-10"
when month(Date_field)=2 then "FM-11"
when month(Date_field)=3 then "FM-12"
end as Financial_Month,
case
when dayname(date_field) in ('Saturday','Sunday') then 'Weekand'
else 'weekday'
end  as Weekday_Weekand,From_to_City,Transported_Passengers,Available_Seats,Carrier_Name
from date_field;

# KPI 3 Find the load Factor percentage on a yearly , Quarterly , Monthly basis ( Transported passengers / Available seats)
select Year_No,concat(round(count(Transported_Passengers/Available_Seats)/1000,2),'%') as Load_factor
from kpi1
group by Year_No
order by Load_factor desc;

select Month_Name,concat(round(count(Transported_Passengers/Available_Seats)/1000,2),'%') as Load_factor
from kpi1
group by Month_Name
order by Load_factor desc;


select Quarter_No as Quarter_no,concat(round(count(Transported_Passengers/Available_Seats)/1000,2),'%') as Load_factor
from kpi1
group by Quarter_No
order by Load_factor desc;

# KPI 4 Find the load Factor percentage on a Carrier Name basis ( Transported passengers / Available seats)
select Carrier_Name,concat(round(count(Transported_Passengers/Available_Seats)/1000,2),'%') as Load_factor
from maindata
group by Carrier_Name
order by Load_factor desc;

# KPI 5 Identify Top 10 Carrier Names based passengers preference 
select Carrier_Name,count(Transported_Passengers) as passengers
from maindata
group by Carrier_Name
order by passengers desc
limit 10;

# KPI 6 Display top Routes ( from-to City) based on Number of Flights 
select From_to_City,COUNT(`%Airline ID`) as NO_OF_Flights
from maindata 
group by From_to_City
order by NO_OF_Flights desc
limit 10;

# KPI 7 Identify the how much load factor is occupied on Weekend vs Weekdays.
select Weekday_Weekand
,count(Transported_Passengers/Available_Seats) as Load_factor
from kpi1
group by Weekday_Weekand
order by Load_factor desc;

# KPI 8 Identify number of flights based on Distance group
select DistanceInterval,count(`%Distance Group ID`) as Distance_group
from distancegroups join maindata
on distancegroups.DistanceGroupID=maindata.`%Distance Group ID`
group by DistanceInterval
order by Distance_group desc
limit 10;

# KPI 9 Use the filter to provide a search capability to find the flights between Source Country, Source State, Source City to Destination Country ,
-- Destination State, Destination City

select `Origin Country`,`Destination Country`,`Origin State`,`Destination State`,`Origin City`,`Destination City`
from maindata;

 # KPI 10 Carrier Name wise Cover Distanse
 select Carrier_Name,concat(round(count(Distance)/1000,2),'M') As Cover_Distanse
from maindata
group by Carrier_Name
order by Cover_Distanse desc
limit 5;

# KPI 11 Transported Passengers by Operating Region

select Operating_Region,count(Transported_Passengers) As Transported_Passenger
from operatingregion join maindata
on operatingregion.Region_Code=maindata.`%Region Code`
group by Operating_Region
order by Transported_Passenger desc;

# KPI 12 Available Seats by Flight Type

select Flight_Type,count(Available_Seats) as Available_seat
from flighttype join maindata
on flighttype.Datasource_ID=maindata.`%Datasource ID`
group by Flight_Type
order by Available_seat desc;
















