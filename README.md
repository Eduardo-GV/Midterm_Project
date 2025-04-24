---
title: Group Midterm Project
author: Joey, Ella, Megan, Shizu and Eduardo
output: github_document
---
# Midterm Project Report READ ME File

> loading data, cleaning data, plots

------------------------------------------------------------------------
## Customization of Report

The first two sections of our report are for the overall league, 
looking at the combined scores for top 10 players and a scatter plot
of age versus ranking. 

The last two sections are player specific, and can be customized for any three
players you select. Our team initially selected Yuki Kawamura, Rui Hachimura, 
and James Harden to analyze in the report, but three other players that would be
interesting to analyze are Nikola Jokic, Jayson Tatum, and LeBron James.

To customize the report, head to the `NBA_Report.Rmd` file and look in the YAML
header to find the params section. List the three players (i.e. "Nikola Jokic, 
Jayson Tatum, and LeBron James" ) next to the parameter "player1". The Rmd report
and all code sections will automatically select, clean, and analyze the data
for the players you listed. 

## Reading in updated datasets

To read in updated data from the NBA league, head to the `01_cleaning_data.R`
Rscript and update the first section to upload the name of the dataset you are
working with. Make sure to only change the name of the datafile in "", as the 
Rmd report and all code sections will automatically clean and analyze the updated
dataset. 

After changing the Rscript, head to the `NBA_Report.Rmd` file and look in the YAML
header to find the params section. Fill in the "YYYY-MM-DD" (which is the date that
appears in the dataset name) next to the "version" parameter. This will customize 
the year throughout the report. 

##  Code descriptions

`code/01_cleaning_data.R`

  - loads the recent version of the NBA dataset downloaded from online datasource
  - creates new variable for combined score
  - labels variables 
  - saves cleaned datafile as an `.rds` object in `output/` folder

`code/02_combined_score_table.R`

  - makes table of top 10 NBA players scores in 36 minute intervals
  - scores are a sum of the points, assists and rebounds
  - saves table  as `.rds` object in `output/` folder

`code/03_scatter_age_rank.R`
  - makes scatterplot comparing age and player rank
  - saves plot as `.png` file in `output/` folder

`code/04_comparison_league_plot.R`

  - defines three players to include in plot
  - calculates average points per game
  - creates plot of average points per game for each player compared to the league average
  - saves plot as an `.png` object in `output/` folder
  
`code/05_player_stats.R`

  - defines three players to include in plot
  - creating a bar graph of points in 36 minute intervals from favorite players
  - saves plot as `.png` file in `output/` folder

`code/06_render_report.R`

  - renders report
  
##Synchronizing the package repository

  - Ensure your working directory is set to be this midterm_project directory
  - Run `make install` from the command line to install all packages needed to generate the report

`Makefile`

  - contains rules for building the report
  - `make .install` restores the renv packages that are used in the project directory.
  - `make .nba_data_clean` will generate the cleaned dataset
  - `make .Combined_score_table` will create the table of top scores
  - `make .scatter_age_rank` will create the scatterplot of age and ranking
  - `make .selected_player_comparison_plot` will generate the comparison plot
  - `make .player_stats_plot` will create the players stats plot
 

