#selected factors prediction

library(prophet)
library(dplyr)

#data loading
df <- select(influ,date,type_all)
colnames(df) <- c("ds","y")
#data transformation
df$y = log(df$y)

m <- prophet(df, yearly.seasonality = TRUE)

#creating future dates
future <- make_future_dataframe(m, periods = 750)
tail(future)

#apply model to predict
forecast <- predict(m, future)
tail(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])

#visual plots
plot(m, forecast)
prophet_plot_components(m, forecast)

type_all_pred <- select(forecast,ds,yhat)
#type_all_pred$yhat <- exp(type_all_pred$yhat)

Google.Data_pred <- select(forecast,ds,yhat)
chinese_med_pred <- select(forecast,ds,yhat)


