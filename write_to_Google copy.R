setwd("~/Documents/Shambhala/PSMC-Comm-IT/statistics/")
# devtools::install_github("jennybc/googlesheets")
# http://htmlpreview.github.io/?https://raw.githubusercontent.com/jennybc/googlesheets/master/vignettes/basic-usage.html

library(googlesheets)
library(httr)

# 2. Register an application at https://cloud.google.com/console#/project
#    Replace key and secret below.
my_google <- oauth_app("google",
  key = Sys.getenv("jds_shambhala_id"),
  secret = Sys.getenv("jds_shambhala_secret" ))

jd8_google <- oauth_app("google",
  key = Sys.getenv("jd8_oauth_id"),
  secret = Sys.getenv("jd8_oauth_secret" ))

# 3. Get OAuth credentials
google_token <- oauth2.0_token(oauth_endpoints("google"), my_google,
                               scope = "https://www.googleapis.com/auth/userinfo.profile")
# get a list of all my sheets:
(my_sheets <- gs_ls())

write.csv(my_df, "my_df.csv", row.names = F)  # create local copy
my_ss <- upload_ss("my_df.csv")  # local copy
file.remove("my_df.csv")  # local copy

# read a spreadsheet:

# the URL from a known spreadhseet would be:
# https://docs.google.com/spreadsheets/d/1XMicermGKd3G5tEFQX6buIDwkx-b6OFxYlGQdzgwlfM/edit#gid=0
#
my_key <- "1XMicermGKd3G5tEFQX6buIDwkx-b6OFxYlGQdzgwlfM"

# most useful
my_ss <- copy_ss( from = my_key, to = "my_csv")
my_csv <- get_via_csv(my_ss, ws = 1)
str(my_csv)
my_csv
delete_ss("my_csv")

# get individual cells  # not likely
my_key <- "1XMicermGKd3G5tEFQX6buIDwkx-b6OFxYlGQdzgwlfM"
my_ss <- my_key %>% register_ss
my_cf <- get_via_cf(my_ss,ws = 1)

# get via "linefeed"  -- may not bring down all rows or columns
my_lf <- get_via_lf(my_ss,ws = 1)
