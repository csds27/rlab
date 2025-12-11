library(forecast)
library(tseries)
data('lynx')

summary(lynx)
str(lynx)
plot(lynx, main="Lynx dataset")

adf.test(lynx)
kpss.test(lynx)

plot(diff(log(lynx), 1), main='Lynx dataset')

sarima = summary(auto.arima(lynx, seasonal = TRUE))
checkresiduals(sarima)

plot(forecast(sarima, h=12),
     main='Sarima graph of Lynx dataset')
