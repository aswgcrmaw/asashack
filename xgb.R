library(dplyr)
library(xgboost)

#Data loading
influ <- read.csv("influenza_hk.csv")
coldflu_2062201 <- filter(coldflu_t3, PRODUCT_ID == 2062201)
coldflu_2136730 <- filter(coldflu_t3, PRODUCT_ID == 2136730)
coldflu_2168418 <- filter(coldflu_t3, PRODUCT_ID == 2168418)

train_2062201 <- cbind(influ, coldflu_2062201)
train_2136730 <- cbind(influ, coldflu_2136730)
train_2168418 <- cbind(influ, coldflu_2168418)

colnames(train_2062201)
train_prep <- select(train_2062201,
                type_h1,type_h3,type_b,type_c,type_all,
                deaths,chinese_med,Google.Data)
label_prep <-  select(train_2062201,qty)


# load data

train <- data.matrix(train_prep)
label <- data.matrix(label_prep)
# fit model
bst <- xgboost(data = train, label = label, max.depth = 2, eta = 1, nround = 20,
               nthread = 2, objective = "reg:linear")
# predict
pred <- predict(bst, train)

plot(label,pred)
