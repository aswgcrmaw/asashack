library(dplyr)
library(xgboost)
#--normalize (unify between 0 and 1) ,function setup
normalise <- function(x) {(x - min(x, na.rm = TRUE))/(max(x, na.rm = TRUE) - min(x, na.rm = TRUE))}


#Data loading
influ <- read.csv("influenza_hk.csv")
coldflu_2062201 <- filter(coldflu_t3, PRODUCT_ID == 2062201)
#coldflu_2136730 <- filter(coldflu_t3, PRODUCT_ID == 2136730)
#coldflu_2168418 <- filter(coldflu_t3, PRODUCT_ID == 2168418)

train_2062201 <- cbind(influ, coldflu_2062201)
#train_2136730 <- cbind(influ, coldflu_2136730)
#train_2168418 <- cbind(influ, coldflu_2168418)

colnames(train_2062201)
train_prep <- select(train_2062201,type_all,Google.Data,chinese_med)
label_prep <- select(train_2062201,qty)

# convert data
train <- data.matrix(train_prep)
label <- data.matrix(label_prep)
# fit model
bst <- xgboost(data = train, label = label, max.depth = 2, eta = 1, nround = 100,
               nthread = 2, objective = "reg:linear")
# validation & predict
#pred <- predict(bst, train)
pred <- predict(bst, train)
plot(label,pred)

#apply
whole_period_train <- cbind(type_all=type_all_pred$yhat,Google.Data=Google.Data_pred$yhat,chinese_med=chinese_med_pred$yhat)
whole_period_pred  <- predict(bst, whole_period_train)

#plot
plot(type_all_pred$ds,whole_period_pred, xlab = "date", ylab = "Predicted Qty for 2062201")
plot(train_2062201$date,train_2062201$qty, xlab = "date", ylab = "Observed Qty for 2062201")

write.csv(whole_period_pred,"whole_period_pred.csv", row.names = F)
write.csv(train_2062201,"train_2062201.csv", row.names = F)

#index creation
whole_period_index <- cbind(type_all=type_all_pred$yhat,Google.Data=Google.Data_pred$yhat,chinese_med=chinese_med_pred$yhat,date=as.character(type_all_pred$ds))
whole_period_index <- as.data.frame(whole_period_index)
write.csv(whole_period_index,"whole_period_index.csv", row.names = F)
