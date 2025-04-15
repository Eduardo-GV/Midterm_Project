here::i_am("code/06_render_report.R")

library(rmarkdown)
report_filename<- paste0(
  "NBA_Midterm_Project.html"
)
#rendering in production mode
render("Midterm_Project_NBA_Report.Rmd",
       output_file = report_filename)
