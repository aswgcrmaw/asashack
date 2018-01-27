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

#folder data load fact pog
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_1.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_10.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_11.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_12.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_13.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_14.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_15.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_16.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_17.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_18.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_19.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_2.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_20.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_21.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_22.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_23.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_24.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_25.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_26.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_27.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_28.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_29.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_3.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_30.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_31.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_4.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_5.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_6.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_7.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_8.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"fact_pog_product_sample", fread("fact_pog_product_sampled_9.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)

#folder load rfm
dbWriteTable(conlite, 	"rfm_sample", fread("rfm_sample_1.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"rfm_sample", fread("rfm_sample_2.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"rfm_sample", fread("rfm_sample_3.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"rfm_sample", fread("rfm_sample_4.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"rfm_sample", fread("rfm_sample_5.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"rfm_sample", fread("rfm_sample_6.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)


#folder load trans
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_1.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_10.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_11.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_12.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_13.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_14.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_15.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_16.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_17.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_18.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_19.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_2.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_20.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_21.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_22.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_23.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_24.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_25.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_26.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_3.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_4.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_5.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_6.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_7.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_8.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)
dbWriteTable(conlite, 	"temp_transcation2", read.csv("temp_transcation_9.csv")	,overwrite = FALSE, append = TRUE, field.types = NULL,temporary = FALSE)



###
Item Id
Item Name
Item Category
Description
Features list

dbGetQuery(conlite, "select * from product LIMIT 2")
product_jack <- dbGetQuery(conlite, "select distinct PRODUCT_ID, PRODUCT_NAME, PRODUCT_HIER_LVL2
,BRAND_TYPE_NAME,BRAND_NAME,PRODUCT_HIER_LVL3,PRODUCT_HIER_LVL1
           from product")



User Id
Item Id
Time

a<-dbGetQuery(conlite, "select distinct MEMBER_ID, PRODUCT_ID, BUSINESS_DATE
              from temp_transcation2 where MEMBER_ID <> 0  LIMIT 5000")
trans_jack<-dbGetQuery(conlite, "select distinct MEMBER_ID, PRODUCT_ID, BUSINESS_DATE
              from temp_transcation2 where MEMBER_ID <> 0")

summary(trans_jack)
str(trans_jack)
library(dplyr)
trans_jack_s <- sample_frac(trans_jack, size = 0.01, replace = FALSE)
str(trans_jack_s)

product_jack <- as.data.frame(product_jack)
trans_jack_s$MEMBER_ID <- factor(trans_jack_s$MEMBER_ID)

write.csv(product_jack,"product_jack.csv",row.names=FALSE)
write.csv2(trans_jack_s,"trans_jack_s.csv",row.names=FALSE)


dbListTables(conlite)
dbGetQuery(conlite, "select * from week LIMIT 2")
dbGetQuery(conlite, "select * from temp_transcation2 LIMIT 2")
