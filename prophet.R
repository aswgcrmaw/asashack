#individual factors prediction

library(prophet)
library(dplyr)

#always two columns ds and y
type_h1,type_h3,type_b,type_c,type_all,
deaths,chinese_med,Google.Data

df <- data.frame(cbind(influ$date,influ$type_h1))
colnames(df) <- c("ds","y")
#df$y = log(df$y)

m <- prophet(df)

future <- make_future_dataframe(m, periods = 365)
tail(future)
head(future)

forecast <- predict(m, future)
tail(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])
head(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])

plot(m, forecast)
prophet_plot_components(m, forecast)



########  seasonality
m <- prophet(daily.seasonality=TRUE)
#m <- add_seasonality(m, name='monthly', period=30.5, fourier.order=5)
m <- fit.prophet(m, df)
forecast <- predict(m, future)
prophet_plot_components(m, forecast)