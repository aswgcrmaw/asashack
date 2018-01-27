#1. Data loading
#2. Data cleaning
#3. Feature selection
#4. model training
#5. Validation
#6. Deploy


#sqlite db setup
library(data.table)
library("RSQLite")
conlite <- dbConnect(SQLite(),dbname= "C:/Users/albertwo/Documents/sqlite_local/ashack_db.sqlite")


#1. Data loading
flu_data <- fread("flu multiTimeline.csv")

summary(flu_data)
library(ggplot2)
qplot(flu_data$week ,flu_data$flu_index, data=flu_data)
#qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, formula=, facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)


#related products identification
coldflu <- dbGetQuery(conlite, "select * 
           from product where PRODUCT_HIER_LVL3 = 'COLD FLU' ")



coldflu_sales <- dbGetQuery(conlite, "select 
t.PRODUCT_ID, sum(ITEM_AMOUNT) as sales, sum(ITEM_QUANTITY) as qty

                 from temp_transcation2 t, product p, week w where 
                 t.PRODUCT_ID = p.PRODUCT_ID and 
                 PRODUCT_HIER_LVL3 = 'COLD FLU' 
                 
group by t.PRODUCT_ID
                            ")

write.csv(coldflu_sales,"coldflu_sales.csv",row.names=FALSE)


2062201
2136730
2168418

coldflu_sales <- dbGetQuery(conlite, "select 
t.PRODUCT_ID, sum(ITEM_AMOUNT) as sales, sum(ITEM_QUANTITY) as qty

                 from temp_transcation2 t, product p, week w where 
                 t.PRODUCT_ID = p.PRODUCT_ID and 
                 PRODUCT_HIER_LVL3 = 'COLD FLU' 
                 
group by t.PRODUCT_ID
                            ")



coldflu_t3 <- dbGetQuery(conlite, "select distinct t.PRODUCT_ID
, case
when t.business_date <= 20150104 then 201501
when t.business_date <= 20150111 then 201502
when t.business_date <= 20150118 then 201503
when t.business_date <= 20150125 then 201504
when t.business_date <= 20150201 then 201505
when t.business_date <= 20150208 then 201506
when t.business_date <= 20150215 then 201507
when t.business_date <= 20150222 then 201508
when t.business_date <= 20150301 then 201509
when t.business_date <= 20150308 then 201510
when t.business_date <= 20150315 then 201511
when t.business_date <= 20150322 then 201512
when t.business_date <= 20150329 then 201513
when t.business_date <= 20150405 then 201514
when t.business_date <= 20150412 then 201515
when t.business_date <= 20150419 then 201516
when t.business_date <= 20150426 then 201517
when t.business_date <= 20150503 then 201518
when t.business_date <= 20150510 then 201519
when t.business_date <= 20150517 then 201520
when t.business_date <= 20150524 then 201521
when t.business_date <= 20150531 then 201522
when t.business_date <= 20150607 then 201523
when t.business_date <= 20150614 then 201524
when t.business_date <= 20150621 then 201525
when t.business_date <= 20150628 then 201526
when t.business_date <= 20150705 then 201527
when t.business_date <= 20150712 then 201528
when t.business_date <= 20150719 then 201529
when t.business_date <= 20150726 then 201530
when t.business_date <= 20150802 then 201531
when t.business_date <= 20150809 then 201532
when t.business_date <= 20150816 then 201533
when t.business_date <= 20150823 then 201534
when t.business_date <= 20150830 then 201535
when t.business_date <= 20150906 then 201536
when t.business_date <= 20150913 then 201537
when t.business_date <= 20150920 then 201538
when t.business_date <= 20150927 then 201539
when t.business_date <= 20151004 then 201540
when t.business_date <= 20151011 then 201541
when t.business_date <= 20151018 then 201542
when t.business_date <= 20151025 then 201543
when t.business_date <= 20151101 then 201544
when t.business_date <= 20151108 then 201545
when t.business_date <= 20151115 then 201546
when t.business_date <= 20151122 then 201547
when t.business_date <= 20151129 then 201548
when t.business_date <= 20151206 then 201549
when t.business_date <= 20151213 then 201550
when t.business_date <= 20151220 then 201551
when t.business_date <= 20151227 then 201552
when t.business_date <= 20160103 then 201601
when t.business_date <= 20160110 then 201602
when t.business_date <= 20160117 then 201603
when t.business_date <= 20160124 then 201604
when t.business_date <= 20160131 then 201605
when t.business_date <= 20160207 then 201606
when t.business_date <= 20160214 then 201607
when t.business_date <= 20160221 then 201608
when t.business_date <= 20160228 then 201609
when t.business_date <= 20160306 then 201610
when t.business_date <= 20160313 then 201611
when t.business_date <= 20160320 then 201612
when t.business_date <= 20160327 then 201613
when t.business_date <= 20160403 then 201614
when t.business_date <= 20160410 then 201615
when t.business_date <= 20160417 then 201616
when t.business_date <= 20160424 then 201617
when t.business_date <= 20160501 then 201618
when t.business_date <= 20160508 then 201619
when t.business_date <= 20160515 then 201620
when t.business_date <= 20160522 then 201621
when t.business_date <= 20160529 then 201622
when t.business_date <= 20160605 then 201623
when t.business_date <= 20160612 then 201624
when t.business_date <= 20160619 then 201625
when t.business_date <= 20160626 then 201626
when t.business_date <= 20160703 then 201627
when t.business_date <= 20160710 then 201628
when t.business_date <= 20160717 then 201629
when t.business_date <= 20160724 then 201630
when t.business_date <= 20160731 then 201631
when t.business_date <= 20160807 then 201632
when t.business_date <= 20160814 then 201633
when t.business_date <= 20160821 then 201634
when t.business_date <= 20160828 then 201635
when t.business_date <= 20160904 then 201636
when t.business_date <= 20160911 then 201637
when t.business_date <= 20160918 then 201638
when t.business_date <= 20160925 then 201639
when t.business_date <= 20161002 then 201640
when t.business_date <= 20161009 then 201641
when t.business_date <= 20161016 then 201642
when t.business_date <= 20161023 then 201643
when t.business_date <= 20161030 then 201644
when t.business_date <= 20161106 then 201645
when t.business_date <= 20161113 then 201646
when t.business_date <= 20161120 then 201647
when t.business_date <= 20161127 then 201648
when t.business_date <= 20161204 then 201649
when t.business_date <= 20161211 then 201650
when t.business_date <= 20161218 then 201651
when t.business_date <= 20161225 then 201652
when t.business_date <= 20170101 then 201653
end as weekn
, sum(ITEM_AMOUNT) as sales, sum(ITEM_QUANTITY) as qty

from temp_transcation2 t where t.PRODUCT_ID in (
  2062201
  ,2136730
  ,2168418
)

group by 
t.PRODUCT_ID, case
when t.business_date <= 20150104 then 201501
when t.business_date <= 20150111 then 201502
when t.business_date <= 20150118 then 201503
when t.business_date <= 20150125 then 201504
when t.business_date <= 20150201 then 201505
when t.business_date <= 20150208 then 201506
when t.business_date <= 20150215 then 201507
when t.business_date <= 20150222 then 201508
when t.business_date <= 20150301 then 201509
when t.business_date <= 20150308 then 201510
when t.business_date <= 20150315 then 201511
when t.business_date <= 20150322 then 201512
when t.business_date <= 20150329 then 201513
when t.business_date <= 20150405 then 201514
when t.business_date <= 20150412 then 201515
when t.business_date <= 20150419 then 201516
when t.business_date <= 20150426 then 201517
when t.business_date <= 20150503 then 201518
when t.business_date <= 20150510 then 201519
when t.business_date <= 20150517 then 201520
when t.business_date <= 20150524 then 201521
when t.business_date <= 20150531 then 201522
when t.business_date <= 20150607 then 201523
when t.business_date <= 20150614 then 201524
when t.business_date <= 20150621 then 201525
when t.business_date <= 20150628 then 201526
when t.business_date <= 20150705 then 201527
when t.business_date <= 20150712 then 201528
when t.business_date <= 20150719 then 201529
when t.business_date <= 20150726 then 201530
when t.business_date <= 20150802 then 201531
when t.business_date <= 20150809 then 201532
when t.business_date <= 20150816 then 201533
when t.business_date <= 20150823 then 201534
when t.business_date <= 20150830 then 201535
when t.business_date <= 20150906 then 201536
when t.business_date <= 20150913 then 201537
when t.business_date <= 20150920 then 201538
when t.business_date <= 20150927 then 201539
when t.business_date <= 20151004 then 201540
when t.business_date <= 20151011 then 201541
when t.business_date <= 20151018 then 201542
when t.business_date <= 20151025 then 201543
when t.business_date <= 20151101 then 201544
when t.business_date <= 20151108 then 201545
when t.business_date <= 20151115 then 201546
when t.business_date <= 20151122 then 201547
when t.business_date <= 20151129 then 201548
when t.business_date <= 20151206 then 201549
when t.business_date <= 20151213 then 201550
when t.business_date <= 20151220 then 201551
when t.business_date <= 20151227 then 201552
when t.business_date <= 20160103 then 201601
when t.business_date <= 20160110 then 201602
when t.business_date <= 20160117 then 201603
when t.business_date <= 20160124 then 201604
when t.business_date <= 20160131 then 201605
when t.business_date <= 20160207 then 201606
when t.business_date <= 20160214 then 201607
when t.business_date <= 20160221 then 201608
when t.business_date <= 20160228 then 201609
when t.business_date <= 20160306 then 201610
when t.business_date <= 20160313 then 201611
when t.business_date <= 20160320 then 201612
when t.business_date <= 20160327 then 201613
when t.business_date <= 20160403 then 201614
when t.business_date <= 20160410 then 201615
when t.business_date <= 20160417 then 201616
when t.business_date <= 20160424 then 201617
when t.business_date <= 20160501 then 201618
when t.business_date <= 20160508 then 201619
when t.business_date <= 20160515 then 201620
when t.business_date <= 20160522 then 201621
when t.business_date <= 20160529 then 201622
when t.business_date <= 20160605 then 201623
when t.business_date <= 20160612 then 201624
when t.business_date <= 20160619 then 201625
when t.business_date <= 20160626 then 201626
when t.business_date <= 20160703 then 201627
when t.business_date <= 20160710 then 201628
when t.business_date <= 20160717 then 201629
when t.business_date <= 20160724 then 201630
when t.business_date <= 20160731 then 201631
when t.business_date <= 20160807 then 201632
when t.business_date <= 20160814 then 201633
when t.business_date <= 20160821 then 201634
when t.business_date <= 20160828 then 201635
when t.business_date <= 20160904 then 201636
when t.business_date <= 20160911 then 201637
when t.business_date <= 20160918 then 201638
when t.business_date <= 20160925 then 201639
when t.business_date <= 20161002 then 201640
when t.business_date <= 20161009 then 201641
when t.business_date <= 20161016 then 201642
when t.business_date <= 20161023 then 201643
when t.business_date <= 20161030 then 201644
when t.business_date <= 20161106 then 201645
when t.business_date <= 20161113 then 201646
when t.business_date <= 20161120 then 201647
when t.business_date <= 20161127 then 201648
when t.business_date <= 20161204 then 201649
when t.business_date <= 20161211 then 201650
when t.business_date <= 20161218 then 201651
when t.business_date <= 20161225 then 201652
when t.business_date <= 20170101 then 201653
end
")

type_h1,type_h3,type_b,type_c,type_all,
deaths,chinese_med,Google.Data