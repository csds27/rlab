library(tseries)
library(forecast)
data('nottem')

str(nottem)
summary(nottem)
plot(nottem, main='Nottem')

adf.test(nottem)
kpss.test(nottem)

plot(diff(nottem), main='Nottem')

sarima = summary(auto.arima(nottem, seasonal = TRUE))
checkresiduals(sarima)

plot(forecast(sarima, h=10),
     main='Nottem',
     xlab='time',
     ylab='Nottem',
     col='Red')
