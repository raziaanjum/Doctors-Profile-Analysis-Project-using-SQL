


/*	Doctors Profile Analysis Project using SQL  */

/* Q1: How to get all information of all the doctors */
SELECT *
FROM profile_data;


/* Q2: Getting a list of all cities where the doctors are located */
SELECT DISTINCT City FROM profile_data;


/* Q3: What is the total number of doctors in the dataset */
SELECT count(*) as Total_Doctors 
FROM profile_data;


/* Q4: Who are the most senior doctors based on years of experience? */
SELECT Doctor_Name, City, Specialization ,Experience_by_Years
from profile_data
order by Experience_by_Years desc
limit 5;


/* Q5: Which City have the highest number of doctors? */
SELECT City,COUNT(*) as Number_of_Doctors 
from profile_data
group by City
order by Number_of_Doctors desc;


/* Q6: Which Specialization have the highest number of doctors? */
SELECT Specialization,COUNT(*) as Count  
FROM profile_data
group by Specialization 
ORDER BY Count DESC;


/* Q7: Who are the best and top 10 doctors? Doctors who have earned the most money will be declared the best doctor.*/
SELECT doctor_name ,City, Specialization ,SUM(Fee_in_Rupees) AS total_earnings
FROM profile_data
GROUP BY doctor_name,City ,Specialization
ORDER BY total_earnings DESC
LIMIT 10;


/* Q8: Who are the best and top doctors? Doctors who have the most Satisfaction Rate?.*/
Select Doctor_Name, City, Specialization,Sum(Patient_Satisfaction_Rate_in_percentage) as Satisfaction_Rate 
from profile_data 
group by Doctor_Name, City,Specialization
order by Satisfaction_Rate desc;


/* Q9:  What percentage of doctors have more than 15 years of experience? */
SELECT (COUNT(*) / (SELECT COUNT(*) FROM profile_data)) * 100 AS percentage 
FROM profile_data 
WHERE Experience_by_Years > 15;


/* Q10: Which doctor has the highest fees ? */
Select Doctor_Name, City, Specialization, MAX(Fee_in_Rupees) as Fee 
from profile_data
group by Doctor_Name, City, Specialization, Fee_in_Rupees 
order by Fee_in_Rupees desc
limit 20;

/* Q11: Name the doctors whose qualification includes the "MBBS". ? */
SELECT Doctor_Name, Doctor_Qualification FROM profile_data
WHERE Doctor_Qualification LIKE '%MBBS%';

/* Q12: Name the doctors who has Gynecologist specialization and  have more than 10 years of experience.? */
SELECT Doctor_Name, Specialization ,City, Experience_by_Years as Exp_Year
FROM profile_data
WHERE Specialization = "Gynecologist" and Experience_by_Years >10
order by Exp_Year desc;


/* Q13:  Get the number of doctors in each specialization who have more than 10 years of experience. ? */
SELECT Specialization, COUNT(*) AS  Count_of_Doctors
FROM profile_data 
WHERE Experience_by_Years > 10 
GROUP BY specialization
order by Count_of_Doctors  desc;


/* Q14: How to Find the total number of doctors in Hyderabad who specialize in Cardiology. */
SELECT COUNT(*) AS Cardiologists_in_Hyderabad 
FROM profile_data 
WHERE city = 'Hyderabad' AND specialization = 'Cardiologist';


/* Q15: List all doctors and their qualifications, ordered by city alphabetically. */ 
SELECT Doctor_Name, Doctor_Qualification, City 
FROM profile_data 
ORDER BY City ASC;


