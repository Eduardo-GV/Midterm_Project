#Shizu's Objective: Stats from 3 Favorite Players
##Yuki Kawamura, Rui Hachimura, James Harden
here::i_am("code/04_player_stats_shisomeya.R")
data<- readRDS(file = here::here("output/nba_data_clean.rds"))

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)

#Filter for selected players
selected_players <- c("Yuki Kawamura", "Rui Hachimura", "James Harden")
filtered_data <- data %>%
  filter(Player %in% selected_players)

#Bar Plot - Points per 36 Minutes
bar_plot<- ggplot(filtered_data, aes(x = Player, y = PTS, fill = Player)) +
  geom_col() +
  theme_minimal() +
  labs(title = "Points per 36 Minutes", y = "Points", x = "Player")


#Saving formatted table to output folder
ggsave(
  here::here("output/player_stats_plot_shisomeya.png"), 
  plot = bar_plot,
  device = "png"
)

