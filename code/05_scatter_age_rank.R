#Megan's objective: make a table displaying players' age and rank

here::i_am("code/05_scatter_age_rank.R")
data<- readRDS(file = here::here("output/nba_data_clean.rds"))


library(dplyr)

# Selecting variables to include in the table
scatter_age_rank <- data %>%
  select(Player, Age, Rk)

# Creating scatterplot of age by rank
library(ggplot2)

scatter_age_rank_mloutti <- ggplot(data = scatter_age_rank, aes(x = Age, y = Rk)) +
  geom_point() +
  geom_smooth(method = lm) +
  scale_y_reverse() +
  labs(
    title = "Relationship Between Age and Player Rank in the NBA",
    x = "Player Age",
    y = "Player Rank")
scatter_age_rank_mloutti
#Saving formatted table to output folder
ggsave(
  here::here("output/scatter_age_rank_mloutti.png"), 
  plot = scatter_age_rank_mloutti,
  device = "png"
)
