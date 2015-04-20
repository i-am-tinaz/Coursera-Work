data<-read.csv("hw1_data.csv",header=TRUE)
#find the column name
colnames(data)
#extract first two rows of data
head(data,2)
#number of observations(number of rows)
nrow(data)
#extract last two rows of data
tail(data,2)
#the value of Ozone in the 47th row
data[47,1]
#count the number of missing values in Ozone
sum(is.na(data[1]))
#mean of Ozone column excluding NA
oz=data[,1]
mean(oz[!is.na(oz)])
#the mean of Solar.R whereOzone values are above
#31 and Temp values are above 90
sel=subset(data,Ozone>31&Temp>90,select=Solar.R)
mean(sel[,])
#the mean of "Temp" when "Month" is equal to 6
tmp=subset(data,Month==6,select=Temp)
mean(tmp[,])
#the maximum ozone value in the month of May
ozv = data[data$Month==5,][1]
voz=ozv[,]
max(voz[!is.na(voz)])