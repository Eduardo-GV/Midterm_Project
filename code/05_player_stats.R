#Final Objective: Stats from 3 Favorite selected Players
here::i_am("code/05_player_stats.R")
data<- readRDS(file = here::here("output/nba_data_clean.rds"))

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)

# Convert comma-separated list of player names from parameters in YAML into a character vector
args <- commandArgs(trailingOnly = TRUE)
players1 <- args[1]  # Expects a comma-separated string
year <- args[2]
version <- args[3]

my_players <- unlist(strsplit(players1, ",\\s*"))

# Filter for players you selected
player_data <- data %>% filter(Player %in% my_players)

#Bar Plot - Points per 36 Minutes
bar_plot<- ggplot(player_data, aes(x = Player, y = PTS, fill = Player)) +
  geom_col() +
  theme_minimal() +
  labs(title = "Points per 36 Minutes", y = "Points", x = "Player")


#Saving formatted table to output folder
ggsave(
  here::here("output/player_stats_plot.png"), 
  plot = bar_plot,
  device = "png"
)

