here::i_am("code/06_render_report.R")

library(rmarkdown)
report_filename<- paste0(
  "NBA_Report.html"
)
#rendering in production mode
render("NBA_Report.Rmd",
       output_file = report_filename)
