library(tseries)
library(forecast)
data('AirPassengers')

str(AirPassengers)
summary(AirPassengers)
plot(AirPassengers, main='AirPassengers')

adf.test(AirPassengers)
kpss.test(AirPassengers)

plot(diff(log(AirPassengers), 12, 1), main='AirPassengers')

sarima = summary(auto.arima(AirPassengers, seasonal = TRUE))
checkresiduals(sarima)

plot(forecast(sarima, h=10),
     main='Forecast',
     xlab='Year',
     ylab='Passengers',
     col='red')
