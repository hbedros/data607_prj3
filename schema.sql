USE linkedin_job_postings_2023;

select count(*) from benefits;

ALTER TABLE benefits
ADD FOREIGN KEY (job_id) REFERENCES job_postings(job_id);

ALTER TABLE job_industries
ADD FOREIGN KEY (job_id) REFERENCES job_postings(job_id);

ALTER TABLE company_industries
ADD FOREIGN KEY (company_id) REFERENCES companies(company_id);

ALTER TABLE company_industries
ADD FOREIGN KEY (company_id) REFERENCES companies(company_id);

ALTER TABLE company_specialities
ADD FOREIGN KEY (company_id) REFERENCES companies(company_id);

ALTER TABLE employee_counts
ADD FOREIGN KEY (company_id) REFERENCES companies(company_id);

SELECT * FROM cleaned;

SELECT * FROM job_postings;


#######

SELECT * FROM mysql.user WHERE user='admin' AND host='database-1-instance-1.cngfftmjinac.us-east-2.rds.amazonaws.com';


INSERT INTO job_postings (
    job_id, 
    company_id, 
    title, 
    description, 
    max_salary, 
    med_salary, 
    min_salary, 
    pay_period, 
    formatted_work_type, 
    location, 
    applies, 
    original_listed_time, 
    remote_allowed, 
    views, 
    job_posting_url, 
    application_url, 
    application_type, 
    expiry, 
    closed_time, 
    formatted_experience_level, 
    skills_desc, 
    listed_time, 
    posting_domain, 
    sponsored, 
    work_type, 
    currency, 
    compensation_type
) VALUES (
    35861624592,
    69642092,
    'Teradata Developer',
    'Months Overview of should be able to develop and support application solutions with a focus on Teradata for a Financial conceptual understanding of the context and business Should be able to understand the business produce Data and design and implement code following the best to perform data quality checks methodically to understand how to accurately utilize client to communicate results and methodology with the project team and Should be able to work in to meet deadlines and thrive in a banking solutions for applications involving large and complex data and provides reconciliation and test Required SkillsShould be and be able to well under stringent deadlinesFinancial Domain KnowledgeExperience in Mainframes and interacting with business understanding requirements and providing quick have excellent exposure to project to learn and adapt to changes Desired Certifications',
    NULL,
    NULL,
    NULL,
    NULL,
    'Contract',
    'United States',
    13,
    NULL,
    1,
    56,
    'https://www.linkedin.com/jobs/view/3586162459/?trk=jobs_biz_prem_srch',
    NULL,
    'ComplexOnsiteApply',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0,
    'CONTRACT',
    NULL,
    NULL,
    NULL
);

