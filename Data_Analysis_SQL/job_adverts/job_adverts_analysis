-- 1. [String Functions]

use job_adverts

-- a. Write a query to display the job_id, job_title, salary_estimate_min, salary_estimate_max

SELECT job_id, job_title, salary_estimate_min, salary_estimate_max
FROM jobs

-- b. Repeat your last query, only this time display only the job adverts where salary_estimate_max is less than 105,000

SELECT job_id, job_title, salary_estimate_min, salary_estimate_max
FROM jobs
WHERE salary_estimate_max < '105K'
[String Functions]

-- 2. Write a query to display the company_name, company_rank, company_size_min, and company_size_max
-- for companies with more than 60 employees and less than 120 employees

SELECT company_name, company_rank, company_size_min, company_size_max
FROM jobs
WHERE company_size_min > '60 Employees' AND 
	  company_size_max < '120 Employees'

-- 3. [String Functions]

-- Write a query to display the :

-- a. job_id

-- b. job_title in uppercase

-- c. company_name in lowercase

SELECT job_id, UPPER(job_title) AS 'upper_jobtitle', LOWER(company_name) AS 'lower_companyname'
FROM jobs



--4. [String Functions]

-- Write a query to display the:

-- a. job_id, company_name, headquarters_of_company

-- b. first letter of company_name

-- c. first letter of headquarters_of_company

SELECT job_id,

       company_name,

       headquarters_of_company,

       SUBSTRING(company_name,1,1) AS 'company_name_first_letter',

       SUBSTRING(headquarters_of_company, 1,1) AS 'state_of_company_first_letter'

FROM jobs


-- 5. [String Functions]

--  Write a query to display the :

--- a. job_id

-- b. company_name

-- c. headquarters_of_company

-- d. company_code - a new column containing a concatenation of: the first letter of company_name and the first letter of headquarters_of_company
-- For example : for Google located in Austin, the company_code would be: GA

SELECT job_id, 
 
       company_name, 
 
       headquarters_of_company,
 
       CONCAT(
                SUBSTRING(company_name,1,1), 
                SUBSTRING(headquarters_of_company, 1,1)
              ) AS 'company_code'
FROM jobs


-- 6. [String Functions]

-- Repeat your last query, only this time display the company_code in lowercase

SELECT job_id, 
 
       company_name, 
 
       headquarters_of_company,
 
       LOWER(CONCAT(
                SUBSTRING(company_name,1,1), 
                SUBSTRING(headquarters_of_company, 1,1)
                    )
             ) AS 'company_code'
FROM jobs


--7. [String Functions]

--- Write a query to display the job titles with length greater than 29

SELECT DISTINCT job_title
FROM jobs
WHERE LEN(job_title) > 29
[Numeric Functions]



-- 8. Write a query to display the:

-- a. company_name

-- b. company_rank

-- c. company_market_value
-- d. company_market_value rounded using ROUND function with precision of 2 digits
-- e. company_market_value rounded down using FLOOR
-- f. company_market_value rounded up using CEIL

SELECT company_name,
	   company_rank,
	   company_market_value,
	   ROUND(company_market_value,2) as company_market_round_value,
	   	  FLOOR(company_market_value) as company_market_floor_value,
		  CEILING(company_market_value) as company_market_ceil_value
 
FROM jobs
