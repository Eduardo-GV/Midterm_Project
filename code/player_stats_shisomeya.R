#Shizu's Objective: Stats from 3 Favorite Players
##Yuki Kawamura, Rui Hachimura, James Harden

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)

#Load the data
nba_data <- read.csv("data/nba_2025-03-07", stringsAsFactors = FALSE)

#Filter for selected players
selected_players <- c("Yuki Kawamura", "Rui Hachimura", "James Harden")
filtered_data <- nba_data %>%
  filter(Player %in% selected_players)

#Bar Plot - Points per 36 Minutes
ggplot(filtered_data, aes(x = Player, y = PTS, fill = Player)) +
  geom_col() +
  theme_minimal() +
  labs(title = "Points per 36 Minutes", y = "Points", x = "Player")

#Save plot
ggsave("output/player_stats_plot_shisomeya.png")
