################################# Time Series Analysis ##############################

# importing data Airpassenger
### Timeseries data###
data("AirPassengers")

#Class of Data
class(AirPassengers)
start(AirPassengers)            ##first Data
end(AirPassengers)              ##Last Data from dataset
plot(AirPassengers)             #Ploting time series data


#Linear Regression
abline(reg=lm(AirPassengers~time(AirPassengers)))

#to display ts data
cycle(AirPassengers)
plot(aggregate(AirPassengers, FUN=mean))
boxplot(AirPassengers~cycle(AirPassengers))

#Data is Seasonal - Trend 12 months back. AR=0 , I=1 and MA=1
(fit = arima(AirPassengers, c(0,1,1),seasonal=list(order=c(0,1,1), period=12)))
pred=predict(fit,n.ahead = 15*12)
ts.plot(AirPassengers,pred$pred, lty=c(1,2)) #Plot ts data

#Different Data - EuStockMarket - ARIMA Model selection
data("EuStockMarkets")
summary(EuStockMarkets)
plot(EuStockMarkets)
plot(aggregate(EuStockMarkets,FUN=mean))