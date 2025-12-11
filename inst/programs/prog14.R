library(forecast)
library(tseries)
data('USAccDeaths')

str(USAccDeaths)
summary(USAccDeaths)
plot(USAccDeaths, main="USAccDeaths")

adf.test(USAccDeaths)
kpss.test(USAccDeaths)

plot(diff(log(USAccDeaths), 1), main='USAccDeaths')

sarima = auto.arima(USAccDeaths, seasonal = TRUE)
summary(sarima)
checkresiduals(sarima)

plot(forecast(sarima, h=12),
     main='USAccDeaths',
     col='Red')
