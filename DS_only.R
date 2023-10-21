library(DBI)
library(RMySQL)
library(dplyr)

con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "linkedin_job_postings_2023", 
                 host = "database-1-instance-1.cngfftmjinac.us-east-2.rds.amazonaws.com", 
                 port = 3306, 
                 user = "admin", 
                 password = "DDbna}rt2R0h")

dbListTables(con) 

query <- "SELECT * FROM benefits"
benefits <- dbGetQuery(con, query)

query <- "SELECT * FROM cleaned"
cleaned <- dbGetQuery(con, query)

query <- "SELECT * FROM companies"
companies <- dbGetQuery(con, query)

query <- "SELECT * FROM company_industries"
company_industries <- dbGetQuery(con, query)

query <- "SELECT * FROM company_specialities"
company_specialities <- dbGetQuery(con, query)

query <- "SELECT * FROM employee_counts"
employee_counts <- dbGetQuery(con, query)

query <- "SELECT * FROM job_industries"
job_industries <- dbGetQuery(con, query)

query <- "SELECT * FROM job_postings"
job_postings <- dbGetQuery(con, query)

query <- "SELECT * FROM job_skills"
job_skills <- dbGetQuery(con, query)


##### All tables loaded, now I'll filter the postings to only include the data-related roles

ds_jobs <- job_postings %>%
  filter(grepl("Data", title, ignore.case = TRUE))

head(ds_jobs)

#now I'll extract skills from this very large list of skills: 
skills_list <- readLines("https://raw.githubusercontent.com/hbedros/data607_prj3/gss/linkedin%20skill")
skills_list <- tolower(skills_list)

#function; extracting skills from description
extract_skills <- function(description) {
  description <- tolower(description)  # because the list is in lower
  skills <- unique(unlist(strsplit(description, "\\s+"))) #splitting using \\s, turn to vector, and remove duplicates 
  skills <- skills[skills %in% skills_list]  #filtering for skills in skills_list
  return(paste(skills, collapse = ", "))  #combine matches into one string
}

ds_jobs$skills <- sapply(ds_jobs$description, extract_skills, USE.NAMES = FALSE) #apply and create new column 

head(ds_jobs)

