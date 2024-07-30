create database db_churn


select * 
from Customer_Data

select gender,count(gender)as total_count,
count(gender) *100.0 /(select count(*) from Customer_Data) as percentage
from Customer_Data
group by Gender


select contract,count(contract) as total_count,
count(contract)*1.0 /(select count(*) from Customer_Data) as percentage  --(contract--‰Ê⁄ «·⁄ﬁœ «· »Ì” Œœ„Â «·⁄„Ì·)
from Customer_Data
group by Contract


select Customer_status,count(Customer_status) as total_count,sum(total_revenue) as total_revenue,
sum(total_revenue)/(select sum(total_revenue)from Customer_Data)*100 as RevPercentage --customer_status( Õ«·… «·⁄„Ì· «·Õ«·Ì… (»ﬁÌ° €«œ—))
from Customer_Data
group by Customer_Status              --total_revenue(≈Ã„«·Ì «·≈Ì—«œ«  «· Ì Ã·»Â« «·⁄„Ì· ··‘—ﬂ….)



select State,count(State)as total_count,
count(State)*100.0 /(select count(State)from Customer_Data) as percentage
from Customer_Data      --state(«·Ê·«Ì… «· Ì ÌﬁÌ„ ›ÌÂ« «·⁄„Ì·)--(„⁄—›… „Êﬁ⁄ «·⁄„Ì· Ì„ﬂ‰ √‰  ”«⁄œ ›Ì  Õ·Ì· «·«” Œœ«„«  »‰«¡ ⁄·Ï «·„‰«ÿﬁ «·Ã€—«›Ì….)
group by State
order by percentage desc


select distinct Internet_type
from Customer_Data


--Data Exploration ñ Check Nulls
SELECT 

    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,

    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,

    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,

    SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,

    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,

    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,

    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,

    SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,

    SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,

    SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,

    SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,

    SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,

    SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,

    SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,

    SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,

    SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,

    SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,

    SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,

    SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,

    SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,

    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,

    SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,

    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,

    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,

    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,

    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,

    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,

    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,

    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,

    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,

    SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,

    SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count

FROM Customer_Data



--Remove null and insert the new data into customer_data_cleaned table
select
       Customer_Id,
	   gender,
	   age,
	   married,
	   state,
	  Number_of_Referrals referrals,
	  Tenure_in_Months,
	  isnull(value_deal,'none') as value_deal,
	  Phone_Service,
	  isnull(multiple_lines,'none')as Multiple_Lines,
	  Internet_Service,
	  isnull(internet_type,'none')as Internet_Type,
	  isnull(online_security,'none')as online_security,
	  isnull(online_backup,'none')as online_backup,
	  isnull(Device_Protection_Plan,'none')as device_protection,
	  ISNULL(Premium_Support, 'No') AS Premium_Support,

      ISNULL(Streaming_TV, 'none') AS Streaming_TV,

      ISNULL(Streaming_Movies, 'none') AS Streaming_Movies,

      ISNULL(Streaming_Music, 'none') AS Streaming_Music,

      ISNULL(Unlimited_Data, 'none') AS Unlimited_Data,

     Contract,

    Paperless_Billing,

    Payment_Method,

    Monthly_Charge,

    Total_Charges,

    Total_Refunds,

    Total_Extra_Data_Charges,

    Total_Long_Distance_Charges,

    Total_Revenue,

    Customer_Status,

    ISNULL(Churn_Category, 'Others') AS Churn_Category,

    ISNULL(Churn_Reason , 'Others') AS Churn_Reason


	INTO [db_Churn].[dbo].[customer_data_cleaned]--Ì‰‘Ï¡ «·ÃœÊ· «·ÃœÌœ  ÊÌ÷⁄ ›ÌÂ «·»Ì«‰« 
	from [db_churn].[dbo].[Customer_Data]


------------------------------------------------------------------------------------------------------------
create view vw_ChurnData AS 
       select*FROM customer_data_cleaned where Customer_Status in('Churned','Stayed')

create view vw_JoinData as
       select * from customer_data_cleaned where Customer_Status='Joined'



SELECT * FROM vw_ChurnData;

select * from vw_JoinData


SELECT COUNT(Customer_ID) AS New_Joiners
FROM customer_data_cleaned
WHERE Customer_Status = 'Joined';


-- calculate the number of customers for each type of Internet
SELECT Internet_Type, COUNT(*) AS Total_Customers
FROM customer_data_cleaned
GROUP BY Internet_Type;


--Calculation of total revenues for each type of Internet
select internet_type,sum(Total_Revenue) as total_revenue
from customer_data_cleaned
group by Internet_Type

--Calculation of total revenues per customer
select customer_id,total_revenue
from customer_data_cleaned

--Total revenue per customer category
select customer_status,sum(total_revenue) as total_revenue
from customer_data_cleaned
group by Customer_Status

--Average revenue per customer
select avg(total_revenue)as Aveage_revenue
from customer_data_cleaned

--Average duration of subscription per customer case 

select customer_status,avg(tenure_in_months) as average_tenure
from customer_data_cleaned
group by Customer_Status

--Number of customers per subscription period (set of months
select tenure_in_months,count(*) as total_customers
from customer_data_cleaned
group by Tenure_in_Months

--Number of customers using each services
select 
    sum(case when phone_service='yes' then 1 else 0 end)as phone_service_count,
    sum(case when Multiple_lines='yes' then 1 else 0 end)as multiple_lines_service_count,
	sum(case when internet_service='yes' then 1 else 0 end)as internet_service_count,
	SUM(CASE WHEN Online_Security = 'Yes' THEN 1 ELSE 0 END) AS Online_Security_Count,
    SUM(CASE WHEN Online_Backup = 'Yes' THEN 1 ELSE 0 END) AS Online_Backup_Count,
    SUM(CASE WHEN device_protection = 'Yes' THEN 1 ELSE 0 END) AS Device_Protection_Plan_Count,
    SUM(CASE WHEN Premium_Support = 'Yes' THEN 1 ELSE 0 END) AS Premium_Support_Count,
    SUM(CASE WHEN Streaming_TV = 'Yes' THEN 1 ELSE 0 END) AS Streaming_TV_Count,
    SUM(CASE WHEN Streaming_Movies = 'Yes' THEN 1 ELSE 0 END) AS Streaming_Movies_Count,
    SUM(CASE WHEN Streaming_Music = 'Yes' THEN 1 ELSE 0 END) AS Streaming_Music_Count,
    SUM(CASE WHEN Unlimited_Data = 'Yes' THEN 1 ELSE 0 END) AS Unlimited_Data_Count
from
     customer_data_cleaned
	 
-- View reasons for deportation
SELECT CHURN_REASON,COUNT(*) AS TOTAL_CUSTOMERS
FROM customer_data_cleaned
WHERE Customer_Status='CHURNED'
group by Churn_Reason
order by TOTAL_CUSTOMERS desc


 
 --Churn Analysis by Service
 SELECT 
    Phone_Service,
    Internet_Service,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Churn_Rate_Percentage
FROM 
    customer_data_cleaned
GROUP BY 
    Phone_Service,
    Internet_Service
ORDER BY 
    Churn_Rate_Percentage DESC;


--total customer and churn rate by age group
SELECT 
    CASE 
        WHEN Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        ELSE '61+' 
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Churn_Rate_Percentage
FROM 
    customer_data_cleaned
GROUP BY 
    CASE 
        WHEN Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        ELSE '61+' 
    END
ORDER BY 
    Age_Group;

