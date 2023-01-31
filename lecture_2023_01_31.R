###### Unit 2, lecture 4 and 5
### ELH
### 2023-01-31

##########################
## mauna loa data
##########################

url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'
co2 = read.table(url, col.names = c("year", "month", "decimal_date", "monthly_average", "deseasonalized", "n_days", "st_dev_days", "monthly_mean_uncertainty"))

class(co2)
head(co2)
summary(co2)


plot(monthly_average~decimal_date,data=co2,type='l',ylab='CO2 (ppm)', xlab='Year',main='Keeling Curve') + 
  lines(y=co2$deseasonalized,x=co2$decimal_date,col='red')
# can't use the y~x format for line fxn

pdf('figures/keeling_curve.pdf',width=7,height=5)
plot(monthly_average~decimal_date,data=co2,type='l',ylab='CO2 (ppm)', xlab='Year',main='Keeling Curve') + 
  lines(y=co2$deseasonalized,x=co2$decimal_date,col='red')
dev.off()

## now lets look at the seasonal cycle only

co2$seasonal_cycle = co2$monthly_average-co2$deseasonalized
head(co2)

plot(seasonal_cycle~decimal_date, data=co2, type='l')

## lets look at a few recent years
summary(co2$decimal_date>2016) # doesn't work very well, just says number of T and F
summary(which(co2$decimal_date>2016)) # nice

co2_2017to2020 = co2[co2$decimal_date>2016,]

plot(seasonal_cycle~decimal_date, type='l',data=co2_2017to2020,ylab='Seasonal Anomaly in CO2 (ppm)',xlab='Year')


jan_anomalies=co2$seasonal_cycle[which(co2$month==1)]
mean(jan_anomalies)


co2_monthly_cycle = data.frame(month=c(1:12),detrended_monthly_cycle=NA)
head(co2_monthly_cycle)


for (i in 1:12) {
  co2_monthly_cycle$detrended_monthly_cycle[i]=mean(co2[co2$month==i,'seasonal_cycle'])
}

head(co2_monthly_cycle)

plot(detrended_monthly_cycle~month,data=co2_monthly_cycle,type='l')

## Exercise 4.1
year1959=co2[which(co2$decimal_date>1959),'seasonal_cycle']
year1959=year1959[which(co2$decimal_date<1960),'seasonal_cycle']
year2019=co2[co2$decimal_date==2019,'seasonal_cycle']
#plot(year1959~)

##########################
## for loops
##########################

## exercise 5.1

num=6
fact=1

for (i in 1:num) {
  fact=fact*i
  if (i==num) {
    print(fact)
  }
}

## nested loops

mymat=matrix(c(2,0,8,3,5,-4),nrow=2,ncol=3)
mymatsq=matrix(rep(NA,6),nrow=2,ncol=3)

for (i in seq(dim(mymat)[1])) {
  for (j in seq(dim(mymat)[2])) {
    mymatsq[i,j]=mymat[i,j]^2
  }
}


mymatsq








