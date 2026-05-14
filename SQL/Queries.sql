CREATE TABLE healthcare_data (

    name VARCHAR(100),

    age INT,

    gender VARCHAR(20),

    blood_type VARCHAR(10),

    medical_condition VARCHAR(100),

    date_of_admission DATE,

    doctor VARCHAR(100),

    hospital VARCHAR(100),

    insurance_provider VARCHAR(100),

    billing_amount FLOAT,

    room_number INT,

    admission_type VARCHAR(50),

    discharge_date DATE,

    medication VARCHAR(100),

    test_results VARCHAR(50),

    stay_duration INT
);

select * from healthcare_data;

--TOTAL PATIENTS
select count(name) as Total_Patients
from healthcare_data;

--AVERAGE BILLING AMOUNT
select sum(billing_amount) as Total_revenue
from healthcare_data;

--TOP HOSPITALS BY REVENUE
select avg(billing_amount) as average_billing_amount
from healthcare_data;

--MOST COMMON MEDICAL CONDITIONS
select hospital, sum(billing_amount) as Revenue
from healthcare_data
group by hospital
Order by Revenue desc;

--GENDER ANALYSIS
Select medical_condition, count(name) as Patient_count
from healthcare_data
group by medical_condition
Order by Patient_count desc;

--INSURANCE PROVIDER ANALYSIS
Select Gender, avg(billing_amount) as average_bill
from healthcare_data
group by Gender
Order by average_bill desc;

--INSURANCE PROVIDER ANALYSIS
Select insurance_provider, count(name) as Patient_count
from healthcare_data
group by insurance_provider
Order by Patient_count desc;

--ADMISSION TYPE ANALYSIS
Select admission_type, count(name) as Total_admission
from healthcare_data
group by admission_type
Order by Total_admission desc;

---ADVANCE---

select * from healthcare_data;

--MONTHLY REVENUE TREND
select date_trunc('month', date_of_admission) AS month,
sum(billing_amount) as revenue
from healthcare_data
group by month
order by month;

--TOP 5 HOSPITALS
SELECT * FROM (SELECT hospital, SUM(billing_amount) AS revenue, 
RANK() OVER(ORDER BY SUM(billing_amount) DESC) AS hospital_rank
FROM healthcare_data GROUP BY hospital) ranked_hospitals
WHERE hospital_rank <= 5;

--AVERAGE STAY DURATION BY CONDITION
select medical_condition, avg(stay_duration) as average_stay_duration
from healthcare_data
group by medical_condition
order by average_stay_duration desc;

--DAILY REVENUE RUNNING TOTAL
select date_of_admission,
sum(billing_amount) as revenue,
SUM(SUM(billing_amount))
over(order by date_of_admission) as running_total
from healthcare_data
group by date_of_admission
order by date_of_admission;

--TOP INSURANCE PROVIDERS
select insurance_provider, sum(billing_amount) as top_insurance_provider
from healthcare_data
group by insurance_provider
order by top_insurance_provider desc limit 10;

--EMERGENCY VS ELECTIVE ANALYSIS
select admission_type, avg(billing_amount) as avg_bill, avg(stay_duration) as avg_stay
from healthcare_data
group by admission_type;

--AGE GROUP ANALYSIS
select 
case when age > 18 then 'children'
            when age between 18 and 35 then 'young adult'
			when age between 35 and 60 then 'adult'
			else 'senior citizen'
		end as age_group,
count(name) as total_patients,
avg(billing_amount) as avg_bill
from healthcare_data
group by age_group
ORDER BY total_patients DESC;