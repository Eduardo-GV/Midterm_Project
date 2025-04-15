#Megan's objective: make a table displaying players' age and rank

here::i_am("code/scatter_age_rank_mloutti.R")
NBA_data <- read.csv((here::here("data/nba_2025-03-07")))

library(dplyr)

# Selecting variables to include in the table
scatter_age_rank <- NBA_data %>%
  select(Player, Age, Rk)

# Creating scatterplot of age by rank
library(ggplot2)

scatter_age_rank_mloutti <- ggplot(data = NBA_data, aes(x = Age, y = Rk)) +
  geom_point() +
  geom_smooth(method = lm) +
  scale_y_reverse() +
  labs(
    title = "Relationship Between Age and Player Rank in the NBA",
    x = "Player Age",
    y = "Player Rank")

#Saving formatted table to output folder
ggsave(
  here::here("output/scatter_age_rank_mloutti.png"), 
  plot = scatter_age_rank_mloutti,
  device = "png"
)
