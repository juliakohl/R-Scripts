library("googleAnalyticsR")
account_list <- ga_account_list()
account_list
ga_id <- account_list$viewId[4]
data_march <- google_analytics(ga_id, date_range = c("2020-03-01", "2020-03-30"), metrics = c("sessions", "bounces", "bounceRate", "pageViews"), dimensions = c("date", "source", "medium"))
write.csv(data_march, file = "gadata_march.csv")
getwd()
