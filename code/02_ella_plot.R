#Ella R script
here::i_am("code/02_ella_plot.R")
data<- readRDS(file = here::here("output/nba_data_clean.rds"))

library(dplyr)
library(ggplot2)


# Define your players
my_players <- c("Yuki Kawamura", "Rui Hachimura", "James Harden")

# Filter player data
player_data <- data %>% filter(Player %in% my_players)

# Calculate league average points per game
league_avg_pts <- mean(data$PTS, na.rm = TRUE)

# Add a "Type" column to separate your players and league average
comparison_df <- player_data %>%
  select(Player, PTS) %>%
  mutate(Type = "Player") %>%
  bind_rows(data.frame(Player = "League Average", PTS = league_avg_pts, Type = "Average"))

# Plot
plot<- ggplot(comparison_df, aes(x = Player, y = PTS, fill = Type)) +
  geom_col() +
  theme_minimal() +
  labs(title = "PTS: My Favorite Players vs League Average", y = "Points", x = "")

#Saving formatted table to output folder
ggsave(
  here::here("output/fav_player_ptspread_plot.png"), 
  plot = plot,
  device = "png"
)
