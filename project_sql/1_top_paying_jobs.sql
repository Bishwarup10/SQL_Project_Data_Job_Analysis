/* 
 Question: What are the top-paying data analyst jobs?
 - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
 - Focuses on job postings with specified salaries(remove nulls).
 - Why? Highlight the top-paying opportunities for data analysts, offering insights into employment options and location flexibility.
 */
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'India'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
    /*
     Here's the breakdown of the top data analyst jobs in India in 2023:
     In India, the top 10 paying data analyst roles range from $64,800 to $119,250, indicating a notable but not exceptionally wide salary spectrum for the profession.
     Diverse Employers - The majority of the top-paying data analyst roles in India are offered by multinational corporations, such as Deutsche Bank, ACA Group, and Clarivate, suggesting that these companies are willing to offer competitive salaries to attract skilled professionals in the field.
     Job Title Variety - There is a variety of job titles among the top-paying roles, including Senior Business & Data Analyst, Financial Data Analyst, and Healthcare Research & Data Analyst, indicating the diverse applications and specialties within the data analysis domain in India.
     
     RESULTS
     =======
     
     [
     {
     "job_id": 325402,
     "job_title": "Senior Business & Data Analyst",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "119250.0",
     "job_posted_date": "2023-11-21 13:11:46",
     "company_name": "Deutsche Bank"
     },
     {
     "job_id": 908967,
     "job_title": "Sr. Enterprise Data Analyst",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "118140.0",
     "job_posted_date": "2023-12-21 20:10:10",
     "company_name": "ACA Group"
     },
     {
     "job_id": 591307,
     "job_title": "HR Data Operations Analyst",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "104550.0",
     "job_posted_date": "2023-11-07 16:11:10",
     "company_name": "Clarivate"
     },
     {
     "job_id": 1218280,
     "job_title": "Financial Data Analyst",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "93600.0",
     "job_posted_date": "2023-05-02 17:14:27",
     "company_name": "Loop Health"
     },
     {
     "job_id": 544240,
     "job_title": "Healthcare Research & Data Analyst",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "89118.0",
     "job_posted_date": "2023-11-08 14:31:21",
     "company_name": "Clarivate"
     },
     {
     "job_id": 733296,
     "job_title": "Data Integration and Business Intelligence Analyst",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "79200.0",
     "job_posted_date": "2023-07-27 07:12:42",
     "company_name": "Miratech"
     },
     {
     "job_id": 152699,
     "job_title": "Ai Research Engineer",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "79200.0",
     "job_posted_date": "2023-08-14 19:11:53",
     "company_name": "AlphaSense"
     },
     {
     "job_id": 989706,
     "job_title": "Data Analyst - Price hub",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "75067.5",
     "job_posted_date": "2023-12-22 04:09:39",
     "company_name": "Cargill"
     },
     {
     "job_id": 1018519,
     "job_title": "Data Analyst I",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "71600.0",
     "job_posted_date": "2023-11-28 21:12:02",
     "company_name": "Bristol Myers Squibb"
     },
     {
     "job_id": 1797441,
     "job_title": "IT Data Analytic Architect - Biopharma Commercial",
     "job_location": "India",
     "job_schedule_type": "Full-time",
     "salary_year_avg": "64800.0",
     "job_posted_date": "2023-12-22 17:08:01",
     "company_name": "Merck Group"
     }
     ]
     
     */