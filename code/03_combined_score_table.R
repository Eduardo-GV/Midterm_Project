#Creating a table of the top 10 NBA players based on a combined score of (points + assists + rebounds)

here::i_am("code/03_combined_score_table.R")
data<- readRDS(file = here::here("output/nba_data_clean.rds"))

#install.packages(c("dplyr", "readr", "gt"))

library(dplyr)
library(readr)
library(gt)

#Cleaning the data to show only one row for each player
NBA_clean <- data %>%
  group_by(Player) %>%
  filter(n() == 1 | Team == "2TM") %>%
  ungroup()

#Top 10 players based on the combined score
top_10_players <- NBA_clean %>%
  arrange(desc(combined_score)) %>%
  head(10)

# Selecting variables to include in the final table
combined_score_table <- top_10_players %>%
  select(Player, PTS, AST, TRB, combined_score)

# Creating the final formatted table

final_table <- combined_score_table %>% gt() %>%
  tab_header(
    title = "Top 10 NBA Players based on Per 36-Minute Score"
  ) %>%
  cols_label(
    Player = "Player Name",
    PTS = "Points",
    AST = "Assists",
    TRB = "Rebounds",
    combined_score = "Score"
  ) %>%
  tab_spanner(
    label = "Performance",
    columns = c(PTS, AST, TRB, combined_score)
  ) %>%
  tab_style(
    style = list(
      cell_fill(color = "lightyellow"),
      cell_text(weight = "bold")
    ),
    locations = cells_body(columns = c(Player, combined_score))  # fixed this line
  ) %>%
  tab_footnote(
    footnote = "Score is a direct sum of points, assists, and rebounds.",
    locations = cells_title(groups = "title")
  )


#Saving formatted table to output folder
saveRDS(
  final_table,
  file = here::here("output/Combined_score_table.rds")
)


