getwd()
setwd("C:\\Users\\EdwinaC\\Desktop\\ASWatson")
library(arules)
library(data.table)
library(WatsonConnect) # local developed package
library(RSQLite)


# Load the ordernumber and categories information
Cross_shop <- SQLtQuery(DBName = "ashack_db.sqlite", str.query = "Select
                        Distinct
                        product_name, MEMBER_ID
                        From
                        'temp_transcation' t
                        Inner Join 'product' a  on a.Product_ID = t.Product_ID
                        Inner Join 'product_item' b on a.product_ID = b.product_ID
                        Where
                        t.Business_date between 20160101 and 20161231
                        and  Product_Hier_LVL1 = 'MEDICINE'
                        and ( product_name like '%VITAMIN B%' or product_name like '%VITAMIN C%' or Product_Hier_LVL3 in ('COLD FLU')) ")



Cross_shop_3 <- SQLtQuery(DBName = "ashack_db.sqlite", str.query = "Select
                          Distinct
                          product_name, MEMBER_ID
                          From
                          'temp_transcation' t
                          Inner Join 'product' a  on a.Product_ID = t.Product_ID
                          Inner Join 'product_item' b on a.product_ID = b.product_ID
                          Where
                          t.Business_date between 20150101 and 20161231
                          and  Product_Hier_LVL3 in ('COLD FLU') or Product_Hier_LVL2  in ('DISPENSARY','VITAMINS') ")



Cross_shop_4 <- SQLtQuery(DBName = "ashack_db.sqlite", str.query = "Select
                          Distinct
                          product_name, MEMBER_ID
                          From
                          'temp_transcation' t
                          Inner Join 'product' a  on a.Product_ID = t.Product_ID
                          Inner Join 'product_item' b on a.product_ID = b.product_ID
                          Where
                          t.Business_date between 20150101 and 20161231
                          and  (Product_Hier_LVL3 in ('VIT & SUPPLEMENT', 'COLD FLU') OR Product_hier_LVL1 = 'PERSONAL CARE')")


Cross_shop_5 <- SQLtQuery(DBName = "ashack_db.sqlite", str.query = "Select
                          Distinct
                          product_name, ORDER_NUMBER
                          From
                          'temp_transcation' t
                          Inner Join 'product' a  on a.Product_ID = t.Product_ID
                          Inner Join 'product_item' b on a.product_ID = b.product_ID
                          Where
                          t.Business_date between 20150101 and 20161231
                          and  Product_Hier_LVL3 in ('COLD FLU') or Product_Hier_LVL2  in ('DISPENSARY','VITAMINS') ")

Cross_shop_6 <- SQLtQuery(DBName = "ashack_db.sqlite", str.query = "Select
                          Distinct
                          product_name, ORDER_NUMBER
                          From
                          'temp_transcation' t
                          Inner Join 'product' a  on a.Product_ID = t.Product_ID
                          Inner Join 'product_item' b on a.product_ID = b.product_ID
                          Where
                          t.Business_date between 20150101 and 20161231
                          and  Product_Hier_LVL1 = 'MEDICINE'")


# take a look on the data result
head (Cross_shop)


Working <- split(Cross_shop$PRODUCT_NAME, Cross_shop$MEMBER_ID)
head(Working)
asso_trx <- as(Working, 'transactions')
itemFrequencyPlot(asso_trx,topN=20,type="absolute")


# first trail
rules <- apriori(asso_trx,  parameter = list(supp = 0.00001, conf = 0.00001))
sorted <- sort(rules, by= c("lift"), decreasing=TRUE)
inspect(sorted[1:5])
rules_dt <- data.table( lhs = labels( lhs(rules) ),
                        rhs = labels( rhs(rules) ),
                        quality(rules) )[ order(-lift), ]
(rules_dt [1:100])

write.csv(rules_dt2, file = "Basket Analysis - ASWHACK.csv")


# Second trail
Working3 <- split(Cross_shop_3$PRODUCT_NAME, Cross_shop_3$MEMBER_ID)
asso_trx_3 <- as(Working3, 'transactions')
rules3 <- apriori(asso_trx3,  parameter = list(supp = 0.001, conf = 0.001))
sorted3 <- sort(rules3, by= c("lift"), decreasing=TRUE)
inspect(sorted3[1:5])
rules_dt3 <- data.table( lhs = labels( lhs(rules3) ),
                        rhs = labels( rhs(rules3) ),
                        quality(rules3) )[ order(-lift), ]
(rules_dt3 [1:100])

write.csv(rules_dt3, file = "Basket Analysis - ASWHACK_3.csv")

# Third trail
Working4 <- split(Cross_shop_4$PRODUCT_NAME, Cross_shop_4$MEMBER_ID)
asso_trx_4 <- as(Working4, 'transactions')
rules4 <- apriori(asso_trx_4,  parameter = list(supp = 0.001, conf = 0.001))
sorted4 <- sort(rules4, by= c("lift"), decreasing=TRUE)
inspect(sorted4[1:5])
rules_dt4 <- data.table( lhs = labels( lhs(rules4) ),
                         rhs = labels( rhs(rules4) ),
                         quality(rules4) )[ order(-lift), ]
(rules_dt4 [1:100])
write.csv(rules_dt4, file = "Basket Analysis - ASWHACK_4.csv")

# Fouth trail
head(Cross_shop_5)
Working5 <- split(Cross_shop_5$PRODUCT_NAME, Cross_shop_5$ORDER_NUMBER)
asso_trx_5 <- as(Working5, 'transactions')
rules5 <- apriori(asso_trx_5,  parameter = list(supp = 0.001, conf = 0.001))
sorted5 <- sort(rules5, by= c("lift"), decreasing=TRUE)
rules_dt5 <- data.table( lhs = labels( lhs(rules5) ),
                         rhs = labels( rhs(rules5) ),
                         quality(rules5) )[ order(-lift), ]
write.csv(rules_dt5, file = "Basket Analysis - ASWHACK_5.csv")


# Fifth trail
head(Cross_shop_6)
Working6 <- split(Cross_shop_6$PRODUCT_NAME, Cross_shop_6$ORDER_NUMBER)
asso_trx_6 <- as(Working6, 'transactions')
rules6 <- apriori(asso_trx_6,  parameter = list(supp = 0.001, conf = 0.001))
sorted6 <- sort(rules6, by= c("lift"), decreasing=TRUE)
rules_dt6 <- data.table( lhs = labels( lhs(rules6) ),
                         rhs = labels( rhs(rules6) ),
                         quality(rules6) )[ order(-lift), ]
write.csv(rules_dt6, file = "Basket Analysis - ASWHACK_6.csv")

