library(DBI)
library(RMySQL)
library(dplyr)
library(stringr)

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

## Analysis: do the most viewed jobs require diff skills? 

#a lot of missing values so this doesnt work
#ds_jobs <- ds_jobs %>%
 # left_join(companies %>% select(company_id, name), by = "company_id")




##new approach 

library(rvest)

html_content <- read_html('https://raw.githubusercontent.com/hbedros/data607_prj3/gss/enhancv_excerpt.html')
li_items <- html_content %>%
  html_nodes("li") %>%
  html_text() %>% 
  str_squish()  

li_items = tolower(li_items)


#Creating a function to extract the skills from description column 
extract_skills <- function(description) {
  description <- tolower(description) #to match li_items case 
  skills <- unlist(strsplit(description, "\\s+"))  #splitting using \\s, turn to vector, and remove duplicates
  skills <- skills[skills %in% li_items]  #filtering for skills in skills_list
  return(paste(unique(skills), collapse = ", "))  #combine matches into one string
}

# apply, create new column.. .
ds_jobs$skills <- sapply(ds_jobs$description, extract_skills, USE.NAMES = FALSE)

ds_jobs$skills

library(tidytext)
q75 <- quantile(ds_jobs$views, 0.75, na.rm = TRUE)

many_views <- ds_jobs %>% 
  filter(views >= q75)

skills_count <- many_views %>%
  unnest_tokens(word, skills) %>%
  count(word, sort = TRUE)

head(skills_count, 20)



