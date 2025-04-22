NBA_Report.html: code/06_render_report.R \
	NBA_Report.Rmd table plots
	Rscript code/06_render_report.R

output/nba_data_clean.rds: code/01_cleaning_data.R data/nba_2025-03-07
	Rscript code/01_cleaning_data.R

output/fav_player_ptspread_plot.png: code/02_ella_plot.R output/fav_player_ptspread_plot.png
	Rscript code/02_ella_plot.R
	
output/Combined_score_table.rds: code/03_combined_score_table.R output/nba_data_clean.rds
	Rscript code/03_combined_score_table.R

output/player_stats_plot_shisomeya.png: code/04_player_stats_shisomeya.R 
	Rscript code/04_player_stats_shisomeya.R
	
output/scatter_age_rank_mloutti.png: code/05_scatter_age_rank.R output/scatter_age_rank_mloutti.png
	Rscript code/05_scatter_age_rank.R

.PHONY: table
table: output/Combined_score_table.rds

.PHONY: plots
plots: output/fav_player_ptspread_plot.png output/player_stats_plot_shisomeya.png \
  output/scatter_age_rank_mloutti.png

.PHONY: clean
clean: 
	rm output/* && rm *.html