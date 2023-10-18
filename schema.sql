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

