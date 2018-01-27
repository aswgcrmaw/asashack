library(dplyr)
library(xgboost)


#Data loading of cleaned data
influ <- read.csv("influenza_hk.csv")

#Data filtering
coldflu_2062201 <- filter(coldflu_t3, PRODUCT_ID == 2062201)

#Data manipulation
train_2062201 <- cbind(influ, coldflu_2062201)

#Prepare train set
train_prep <- select(train_2062201,type_all,Google.Data,chinese_med)
label_prep <- select(train_2062201,qty)

# convert data
train <- data.matrix(train_prep)
label <- data.matrix(label_prep)
# fit model
bst <- xgboost(data = train, label = label, max.depth = 2, eta = 0.5, nround = 1000,
               nthread = 2, objective = "reg:linear")

# validation & predict
# need more work on this ~!!
pred <- predict(bst, train)
plot(label,pred)

#apply model to predict
whole_period_train <- cbind(type_all=type_all_pred$yhat,Google.Data=Google.Data_pred$yhat,chinese_med=chinese_med_pred$yhat)
whole_period_pred  <- predict(bst, whole_period_train)

#plot
plot(type_all_pred$ds,whole_period_pred, xlab = "date", ylab = "Predicted Qty for 2062201")
plot(train_2062201$date,train_2062201$qty, xlab = "date", ylab = "Observed Qty for 2062201")

#visual checking of predicted and observed qty for item 2062201
plot(train_2062201$qty,whole_period_pred[1:105],xlab = "Observed Qty for 2062201", ylab = "Predicted Qty for 2062201")

#output
write.csv(whole_period_pred,"whole_period_pred.csv", row.names = F)
write.csv(train_2062201,"train_2062201.csv", row.names = F)

#index creation
whole_period_index <- cbind(type_all=type_all_pred$yhat,Google.Data=Google.Data_pred$yhat,chinese_med=chinese_med_pred$yhat,date=as.character(type_all_pred$ds))
whole_period_index <- as.data.frame(whole_period_index)
#output
write.csv(whole_period_index,"whole_period_index.csv", row.names = F)
