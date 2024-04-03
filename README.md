# Introduction
📊 Dive into the data job market in India! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql](/project_sql/)

# Background
Inspired by a mission to navigate the Indian data analyst job market more efficiently, this project arose from a determination to identify top-paid and in-demand skills, simplifying the process for others to uncover optimal job opportunities.

Data hails from this amazing [SQL Course](https://lukebarousse.com/sql) by Luke Barousse. It's packed with insights on job titles, salaries,locations and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-payiong data analyst jobs in India?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn.

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code**: My go-to for database management and executing SQL queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs In India
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location. This query highlights the high paying opportunities in the field.
```sql
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
```

Here's the breakdown of the top data analyst jobs in India in 2023:
- **Salary Range:** In India, the top 10 paying data analyst roles range from $64,800 to $119,250, indicating a notable but not exceptionally wide salary spectrum for the profession.
- **Diverse Employers:**  The majority of the top-paying data analyst roles in India are offered by multinational corporations, such as Deutsche Bank, ACA Group, and Clarivate, suggesting that these companies are willing to offer competitive salaries to attract skilled professionals in the field.
- **Job Title Variety:**  There is a variety of job titles among the top-paying roles, including Senior Business & Data Analyst, Financial Data Analyst, and Healthcare Research & Data Analyst, indicating the diverse applications and specialties within the data analysis domain in India.


![Top Paying Roles](assets\1_top_paying_roles.png)

This graph helps in visualizing the salary for the top 10 paying data analyst jobs in India.


### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.
```sql
WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'India'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
    skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;
```
Here's the breakdown of the most demanded skills for data analysts in India in 2023, based on job postings:
 - **SQL** and **Excel** are the most demanded skills.
 - **Python** follows closely behind, with 5 appearances among the top-paying roles.
 - Other skills like Power BI,Tableau, R, and Pandas show varying degrees of demand among the top-paying data analyst roles in India.

![Top Paying Job Skills](assets\2_top_paying_job_skills.png)
*This graph helps in visualizing the top paying skills for Data Analyst Jobs*

### 3. In-Demand Skills for Data Analysts
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_country = 'India'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```
Here's the breakdown of the most demanded skills for data analysts in India in 2023
 - **SQL** remains the top in-demand skill for data analysts in India, with a significant demand count of 3167, emphasizing its crucial role in data management and analysis tasks within the Indian job market.
 - **Python** maintains its significance as the second most in-demand skill in India, with a demand count of 2207, highlighting its widespread usage for data manipulation, statistical analysis, and machine learning applications.
 - Although **Excel** remains among the top skills, its demand count decreases slightly compared to SQL and Python in the Indian job market, suggesting potential variations in its utilization or priority within data analyst roles specific to India.

|Skills    | Demand Count|
|----------|-------------|
| SQL      | 3167        |
| Python   | 2207        |
| Excel    | 2118        |
| Tableau  | 1673        |
| Power BI | 1285        |
*Table of the demand for the top 5 skills in data analyst job postings* 

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_country = 'India'
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
```
Here are the insights for the top paying skills in India for Data Analyst role:
 
 **Uniform High Pay**: The top five skills—PySpark, GitLab, PostgreSQL, Linux, and MySQL—all offer the same high average salary of $165,000, indicating strong demand and critical roles in data analysis.
 
 **Emerging Technologies in Demand**: Skills like Neo4j, GDPR, and Airflow among the top earners suggest a growing demand for expertise in emerging technologies and data management platforms.
 
 **Visualization and Collaboration Tools**: Tools like Confluence and Visio are among the top earners, highlighting the importance of data visualization and collaboration tools in the data analysis field.
 
 **Programming Language Proficiency**: Skills like Shell scripting and Bash command top salaries, emphasizing the value of proficiency in programming and scripting languages for data analysts.


|Skills    | Average Salary ($)|
|----------|-------------|
| Pyspark    | 165000        |
| Gitlab     | 165000        |
| PostgresSQL| 165000        |
| Linux      | 165000        |
| MySQL      | 165000        |
| neo4j      | 163782        |
| gdpr       | 163782        |
| airflow    | 138088        |
| MongoDb    | 135994        |
| Scala      | 135994        |
| Databricks | 135994        |
| Pandas     | 122463        |
| Kafka      | 122100        |
| Confluence | 119250        |
| Visio      | 119250        |
| Shell      | 118500        |
| spark      | 118332        |
| jira       | 115213        |
| no-sql     | 114291        |
| hadoop     | 113276        |
| snowflake  | 111213        |
| matplotlib | 111175        |
| dax        | 111175        |
| bash       | 111175        |
| electron   | 111175        |
*Table of the average salary for the top 10 paying skills for data analysts*


### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
SELECT skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_country = 'India'
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
| Skill ID | Skills    | Demand Count | Average Salary($) |
|----------|-----------|--------------|-------------------|
|    92    | spark     |      11      |       118332      |
|   183    | Power BI  |      17      |       109832      |
|    79    | oracle    |      11      |       104260      |
|    74    | azure     |      15      |       98570       |
|    1     | python    |      36      |       95933       |
|    76    | aws       |      12      |       95333       |
|   182    | tableau   |      20      |       95103       |
|     0    | sql       |      46      |       92984       |
|   181    | excel     |      39      |       88519       |
|    5     | R         |      18      |       86609       |

*Table of the most optimal skills for data analyst sorted by salary*

Here's a breakdown of the most optimal skills for Data Analysts in 2023:
**Diverse Tech Landscape**: Top-paying skills span SQL, Python, Excel, and Tableau, showcasing the need for a broad skill set in Indian data analysis roles.
 
**Programming Key**: Python and R lead demand and salary, underlining the critical role of coding proficiency in data analysis careers.
 
**Visualization Tools Valued**: Tableau and Power BI rank high, emphasizing the importance of effective data visualization skills for Indian data analysts.

# What I Learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

🧩 Complex Query Crafting: Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
📊 Data Aggregation: Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
💡 Analytical Wizardry: Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

From the analysis, several general insights emerged:

**Top-Paying Data Analyst Jobs**: In India, the top 10 paying data analyst roles range from $64,800 to $119,250, indicating a notable but not exceptionally wide salary spectrum for the profession.
**Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
**Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
**Skills with Higher Salaries**: Specialized tools like Pyspark, Gitlab, and PostgresSQL stand out with the highest average salaries, emphasizing the value of expertise in these specific areas.
**Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market in India. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.