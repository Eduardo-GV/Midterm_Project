#Ella R script
here::i_am("code/04_comparison_league_plot.R")
data<- readRDS(file = here::here("output/nba_data_clean.rds"))

library(dplyr)
library(ggplot2)


# Convert comma-separated list of player names from parameters in YAML into a character vector
args <- commandArgs(trailingOnly = TRUE)
players1 <- args[1]  # Expects a comma-separated string
year <- args[2]
version <- args[3]

my_players <- unlist(strsplit(players1, ",\\s*"))


# Filter for players you selected
player_data <- data %>% filter(Player %in% my_players)

# Calculate average points per game
league_avg_pts <- mean(data$PTS, na.rm = TRUE)

# Add a "Type" column to separate the selected players from the league average
comparison_df <- player_data %>%
  select(Player, PTS) %>%
  mutate(Type = "Player") %>%
  bind_rows(data.frame(Player = "League Average", PTS = league_avg_pts, Type = "Average"))

# Generate plot
plot <- ggplot(comparison_df, aes(x = Player, y = PTS, fill = Type)) +
  geom_col() +
  theme_minimal() +
  labs(
    title = "PTS of Favorite Players vs League Average",
    y = "Points", x = ""
  )

#Saving formatted table to output folder
ggsave(
  here::here("output/selected_player_comparison_plot.png"), 
  plot = plot,
  device = "png"
)
