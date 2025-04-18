## cleaning and loading data file
#make sure working directory is set to the midterm_project folder
# Load 'here' package, installing if necessary
if (!require("here")) install.packages("here", repos = "http://cran.us.r-project.org")
library(here)
here::i_am("code/01_cleaning_data.R")
absolute_path_to_data<- here::here("data/nba_2025-03-07")

data<- read.csv(absolute_path_to_data, header = TRUE)

library(dplyr)
library(labelled)

NBA_stats <- data %>%
  mutate(combined_score = PTS + AST + TRB)

var_label(NBA_stats)<-list(Player = "Player Name",
                           PTS = "Points",
                           AST = "Assists",
                           TRB = "Rebounds",
                           combined_score = "Score")
  

saveRDS(
  NBA_stats, 
  file = here::here("output/nba_data_clean.rds")
)