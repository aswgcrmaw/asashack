setwd("~/ashack/githack")

#sqlite db setup
library(data.table)
library("RSQLite")
conlite <- dbConnect(SQLite(),dbname= "C:/Users/albertwo/Documents/sqlite_local/ashack_db.sqlite")


setwd("~/ashack/ASWatson")

dbWriteTable(conlite, "lifestyle_sample", fread("lifestyle_sample.csv")
             ,overwrite = TRUE, append = FALSE, field.types = NULL,temporary = FALSE)

dbWriteTable(conlite, "member_subsample", fread("member_subsample.csv")
             ,overwrite = TRUE, append = FALSE, field.types = NULL,temporary = FALSE)

dbWriteTable(conlite, "product", fread("product.csv")
             ,overwrite = TRUE, append = FALSE, field.types = NULL,temporary = FALSE)

dbWriteTable(conlite, "product_item", fread("product_item.csv")
             ,overwrite = TRUE, append = FALSE, field.types = NULL,temporary = FALSE)

dbWriteTable(conlite, "product_margin", fread("product_margin.csv")
             ,overwrite = TRUE, append = FALSE, field.types = NULL,temporary = FALSE)

dbWriteTable(conlite, "store", fread("store.csv")
             ,overwrite = TRUE, append = FALSE, field.types = NULL,temporary = FALSE)

dbWriteTable(conlite, "store_location", fread("store_location.csv")
             ,overwrite = TRUE, append = FALSE, field.types = NULL,temporary = FALSE)

dbWriteTable(conlite, "week", fread("week.csv")
             ,overwrite = TRUE, append = FALSE, field.types = NULL,temporary = FALSE)


dbListTables(conlite)
