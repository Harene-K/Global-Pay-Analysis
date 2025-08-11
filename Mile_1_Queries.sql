CREATE DATABASE salary_db;
USE salary_db;
select * from employee_insights_csv;
# 1) The below query compares the average salary within each industry, split by gender. This helps identify potential salary discrepancies 
                                                                                                  #based on gender within industries
                                                                                                  
select Industry,Gender,avg(Final_Salary) as Average_Salary from employee_insights_csv group by Gender,Industry order by Average_Salary;

# 2) The below query shows the total monetary compensation (base salary + additional monetary compensation) for each job title. 
											                        #This can show which roles have the highest overall compensation.
select Job_Title,sum(Annual_Salary+Additional_Monetary_Compensation) as Total_Salary from employee_insights_csv group by Job_Title order by Total_Salary desc;

# 3) The below query is to find the salary distribution (average salary, minimum, and maximum) for different education levels. This helps analyze the
																							#correlation between education and salary.
select Highest_Level_of_Education_Completed as Education_Level, avg(Final_Salary) as Avg_salary, min(Final_Salary) as 
Min_salary, max(Final_Salary) as Max_salary from employee_insights_csv group by Highest_Level_of_Education_Completed;

#4) This query determines how many employees are in each industry, broken down by years of professional experience. This can show if certain 
																					#industries employ more experienced professionals.
select Industry, Years_of_Professional_Experience_Overall, COUNT(*) AS Number_of_Employees from employee_insights_csv group by Industry, 
Years_of_Professional_Experience_Overall;

#5) This query calculates the median salary within different age ranges and genders. This can provide insights into salary trends across different age  
#groups and gender
                                                                                                                        
SELECT Age_Range, Gender,
SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(Final_Salary ORDER BY Final_Salary), ',', FLOOR(COUNT(*)/2)+1), ',', -1) AS Median_Salary
FROM Salary_Survey
GROUP BY Age_Range, Gender;

#6) This query is to find the highest-paying job titles in each country. This can help understand salary trends across different countries and 
																										#highlight high-paying positions
SELECT Country, Job_Title, MAX(Final_Salary) AS Max_Salary
FROM employee_insights_csv
GROUP BY Country, Job_Title
ORDER BY Country, Max_Salary DESC;

#7) This query calculates the average salary for each combination of city and industry. This shows which cities offer higher salaries within each industry
SELECT City, Industry, 
       AVG(Final_Salary) AS Average_Salary
FROM employee_insights_csv
GROUP BY City, Industry;

#8) This query is to find the percentage of employees within each gender who receive additional monetary compensation, such as bonuses or stock options
SELECT Gender,
       COUNT(CASE WHEN Additional_Monetary_Compensation > 0 THEN 1 END) * 100.0 / COUNT(*) AS Percent_With_Comp
FROM employee_insights_csv
GROUP BY Gender;

#9) This query is to determine the total compensation (salary + additional compensation) for each job title based on years of professional experience. 
										#This can help highlight compensation trends based on experience levels within specific job titles.
SELECT Job_Title, Years_of_Professional_Experience_Overall,
       SUM(Annual_Salary + Additional_Monetary_Compensation)  AS Total_Compensation
FROM employee_insights_csv
GROUP BY Job_Title, Years_of_Professional_Experience_Overall;

#10) This query is to understand how salary varies by industry, gender, and education level. This query can provide a comprehensive view of how multiple 
																													#factors influence salary.
SELECT Industry, Gender, Highest_Level_of_Education_Completed,
       AVG(Final_Salary) AS Average_Salary
FROM employee_insights_csv
GROUP BY Industry, Gender, Highest_Level_of_Education_Completed;

select * from employee_insights_csv;




