/*
 Question: What are the most in-demand skills for data analysts?
 - Join job postings to inner join table similar to query 2
 - Identify the top 5 in-demand skills for a data analyst.
 - Focus on all job postings.
 - Why? Retrieves the top 5 skills with the highest demand in the job market, 
 providing insights into the most valuable skills for job seekers.
 */
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
/*
 Here's the breakdown of the most demanded skills for data analysts in India in 2023
 - SQL remains the top in-demand skill for data analysts in India, with a significant demand count of 3167, emphasizing its crucial role in data management and analysis tasks within the Indian job market.
 - Python maintains its significance as the second most in-demand skill in India, with a demand count of 2207, highlighting its widespread usage for data manipulation, statistical analysis, and machine learning applications.
 - Although Excel remains among the top skills, its demand count decreases slightly compared to SQL and Python in the Indian job market, suggesting potential variations in its utilization or priority within data analyst roles specific to India.
 [
 {
 "skills": "sql",
 "demand_count": "3167"
 },
 {
 "skills": "python",
 "demand_count": "2207"
 },
 {
 "skills": "excel",
 "demand_count": "2118"
 },
 {
 "skills": "tableau",
 "demand_count": "1673"
 },
 {
 "skills": "power bi",
 "demand_count": "1285"
 }
 ]
 */