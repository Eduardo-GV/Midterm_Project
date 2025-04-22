NBA_Report.html: code/06_render_report.R \
	NBA_Report.Rmd table plots
	Rscript code/06_render_report.R

output/nba_data_clean.rds: code/01_cleaning_data.R data/nba_2025-03-07
	Rscript code/01_cleaning_data.R

output/Combined_score_table.rds: code/02_combined_score_table.R output/nba_data_clean.rds
	Rscript code/02_combined_score_table.R
	
output/scatter_age_rank.png: code/03_scatter_age_rank.R output/scatter_age_rank.png
	Rscript code/03_scatter_age_rank.R
	
output/selected_player_comparison_plot.png: code/04_comparison_league_plot.R output/selected_player_comparison_plot.png
	Rscript code/04_comparison_league_plot.R "Yuki Kawamura, Rui Hachimura, James Harden" 2025 "2025-03-07"

output/player_stats_plot.png: code/05_player_stats.R output/player_stats_plot.png
	Rscript code/05_player_stats.R "Yuki Kawamura, Rui Hachimura, James Harden" 2025 "2025-03-07"

.PHONY: table
table: output/Combined_score_table.rds

.PHONY: plots
plots: output/scatter_age_rank.png output/selected_player_comparison_plot.png \
  output/player_stats_plot.png

.PHONY: clean
clean: 
	rm output/* && rm *.html