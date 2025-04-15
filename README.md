---
title: Group Midterm Project
author: Joey, Ella, Megan, Shizu and Eduardo
output: github_document
---
# Midterm Project Report READ ME File

> loading data, cleaning data, plots

------------------------------------------------------------------------

##  Code descriptions

`code/00_cleaning_data.R`

  - loads the recent version of the NBA dataset downloaded from online datasource
  - creates new variable for combined score
  - labels variables 
  - saves cleaned datafile as an `.rds` object in `output/` folder

`code/02_ella_plot.R`

  - defines three players to include in plot ("Yuki Kawamura", "Rui Hachimura", "James Harden")
  - calculates average points per game
  - creates plot of average points per game for each player compared to the league average
  - saves plot as an `.png` object in `output/` folder
  
`code/03_combined_score_table.R`

  - makes table of top 10 NBA players scores in 36 minute intervals
  - scores are a sum of the points, assists and rebounds
  - saves table  as `.rds` object in `output/` folder
  
`code/04_player_stats_shisomeya.R`

  - defines three players to include in plot ("Yuki Kawamura", "Rui Hachimura", "James Harden")
  - creating a bar graph of points in 36 minute intervals from favorite players
  - saves plot as `.png` file in `output/` folder
  
`code/05_scatter_age_rank.R`

  - makes scatterplot comparing age and player rank
  - saves plot as `.png` file in `output/` folder

`code/06_render_report.R`

  - renders report

`Makefile`

  - contains rules for building the report
  - `make .nba_data_clean` will generate the cleaned dataset
  - `make .fav_player_ptspread_plot` will generate Ella's plot of her favorite players
  - `make .Combined_score_table` will create Eduardo's table of top scores
  - `make .player_stats_plot_shisomeya` will create Shizu's plot of her favorite players
  - `make .scatter_age_rank_mloutti` will create Megan's scatterplot of age and ranking

