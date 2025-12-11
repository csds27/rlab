library(tseries)
library(forecast)
data("sunspots")

str(sunspots)
summary(sunspots)
plot(sunspots, main="Sunspots")

adf.test(sunspots)
kpss.test(sunspots)

plot(diff(log(sunspots), 1), main="Sunspots differenced")

sarima = summary(auto.arima(sunspots, seasonal = TRUE))
checkresiduals(sarima)

plot(forecast(sarima, h=12),
     main="Sunspots Forecast",
     col="blue")
