

#------------------------------------------------------------------------->

###Dudley BPD

setwd("C:/Users/Mushtaq/Downloads/ADS/COB Interval data 2014/CY2014 COB Interval data 1")
BPDdudley<-read.csv("COB-BPD.DUDLEY SQ.2014.csv",header=T)
summary(is.na(BPDdudley))
BPDdudleyTime<-BPDdudley[,c(5:292)]
BPDdudleyTranspose<-t(BPDdudleyTime)
head(BPDdudleyTranspose)
a<-0

for(i in seq(from=1,to=ncol(BPDdudleyTranspose),by=3)){
  b<-i
  c<-i+2
  a<-rbind(a,BPDdudleyTranspose[,b:c])
  
}
a=a[-1,]
write.csv(a,file="mushtaq31.csv")
xyz<-read.csv("mushtaq31.csv",header=FALSE)
head(xyz)
xyz=xyz[-1,]
colnames(xyz)<-c("Time","KWh","powerfactor","KVARh")
head(xyz)

library(stringr)
out<-str_split_fixed(xyz$Time,".",2)
nrow(xyz)
nrow(out)
head(xyz)
xyz<-cbind(xyz,out)
xyz<-xyz[,-5]
head(xyz)
colnames(xyz)<-c("Time","KWh","powerfactor","KVARh","time")

xyz$time<-as.character(xyz$time)
library(reshape)
xyz=transform(xyz,time=colsplit(time,split="\\.",names=c('hour','minute')))
head(xyz)
h<-xyz[,c(5)]
hour<-h[,c(1)]
minute<-h[,c(2)]
xyz<-xyz[,-5]
xyz<-cbind(xyz,hour,minute)
head(xyz)

#Now back to main file
BPDdudleyAccount<-BPDdudley[,c(1:2)]
head(BPDdudleyAccount)


#ExpandRows
newDat<-BPDdudleyAccount[c(10),]

a<-0
for(i in seq(from=1,to=nrow(BPDdudleyAccount),by=3))
{
  b<-i
  a<-rbind(a,expandRows(BPDdudleyAccount[c(b),],288,count.is.col = FALSE))
}
head(a)
a=a[-1,]


#Splitting date
datetxt<-a[,c(2)]
datetxt<-as.character(datetxt)
datetxt<-as.Date(datetxt,"%m/%d/%Y")

class(datetxt)
df <- data.frame(month = as.numeric(format(datetxt, format = "%m")),
                 day = as.numeric(format(datetxt, format = "%d")),
                 year = as.numeric(format(datetxt, format = "%Y")))
head(df)

#Column binding
nrow(a)
nrow(xyz)
finalBPDdudley<-cbind(a,df)
finalBPDdudley<-cbind(finalBPDdudley,xyz)
head(final)
write.csv(finalBPDdudley,file="finalBPDdudley.csv")

##------------------------------------------------------------>

#------------------------------------------------------------------------->

###Headquarters BPD

setwd("C:/Users/Mushtaq/Downloads/ADS/COB Interval data 2014/CY2014 COB Interval data 1")
BPDhead<-read.csv("COB-BPD.HEADQUARTERS.2014.csv",header=T)
summary(is.na(BPDhead))
BPDheadTime<-BPDhead[,c(5:292)]
BPDheadTranspose<-t(BPDheadTime)

a<-0

for(i in seq(from=1,to=ncol(BPDheadTranspose),by=3)){
  b<-i
  c<-i+2
  a<-rbind(a,BPDheadTranspose[,b:c])
  
}
a=a[-1,]
write.csv(a,file="mushtaq32.csv")
xyz<-read.csv("mushtaq32.csv",header=FALSE)
head(xyz)
xyz=xyz[-1,]
colnames(xyz)<-c("Time","KWh","powerfactor","KVARh")
head(xyz)

library(stringr)
out<-str_split_fixed(xyz$Time,".",2)
nrow(xyz)
nrow(out)
head(out)
head(xyz)
xyz<-cbind(xyz,out)
head(xyz)
xyz<-xyz[,-5]
head(xyz)
colnames(xyz)<-c("Time","KWh","powerfactor","KVARh","time")

xyz$time<-as.character(xyz$time)
library(reshape)
xyz=transform(xyz,time=colsplit(time,split="\\.",names=c('hour','minute')))
head(xyz)
h<-xyz[,c(5)]
hour<-h[,c(1)]
minute<-h[,c(2)]
xyz<-xyz[,-5]
xyz<-cbind(xyz,hour,minute)
head(xyz)

#Now back to main file
BPDheadAccount<-BPDhead[,c(1:2)]
head(BPDheadAccount)


#ExpandRows


a<-0
for(i in seq(from=1,to=nrow(BPDheadAccount),by=3))
{
  b<-i
  a<-rbind(a,expandRows(BPDheadAccount[c(b),],288,count.is.col = FALSE))
}
head(a)
a=a[-1,]


#Splitting date
datetxt<-a[,c(2)]
datetxt<-as.character(datetxt)
datetxt<-as.Date(datetxt,"%m/%d/%Y")

class(datetxt)
df <- data.frame(month = as.numeric(format(datetxt, format = "%m")),
                 day = as.numeric(format(datetxt, format = "%d")),
                 year = as.numeric(format(datetxt, format = "%Y")))
head(df)

#Column binding
nrow(a)
nrow(xyz)
finalBPDhead<-cbind(a,df)
finalBPDhead<-cbind(finalBPDhead,xyz)
head(final)
write.csv(finalBPDhead,file="finalBPDhead.csv")

##------------------------------------------------------------>

#------------------------------------------------------------------------->

###Headquarters BPD

setwd("C:/Users/Mushtaq/Downloads/ADS/COB Interval data 2014/CY2014 COB Interval data 1")
BPDhead<-read.csv("COB-BPD.HEADQUARTERS.D-14.csv",header=T)
summary(is.na(BPDhead))
BPDheadTime<-BPDhead[,c(5:292)]
BPDheadTranspose<-t(BPDheadTime)

a<-0

for(i in seq(from=1,to=ncol(BPDheadTranspose),by=3)){
  b<-i
  c<-i+2
  a<-rbind(a,BPDheadTranspose[,b:c])
  
}
a=a[-1,]
write.csv(a,file="mushtaq33.csv")
xyz<-read.csv("mushtaq33.csv",header=FALSE)
head(xyz)
xyz=xyz[-1,]
colnames(xyz)<-c("Time","KWh","powerfactor","KVARh")
head(xyz)

library(stringr)
out<-str_split_fixed(xyz$Time,".",2)
nrow(xyz)
nrow(out)
head(out)
head(xyz)
xyz<-cbind(xyz,out)
head(xyz)
xyz<-xyz[,-5]
head(xyz)
colnames(xyz)<-c("Time","KWh","powerfactor","KVARh","time")

xyz$time<-as.character(xyz$time)
library(reshape)
xyz=transform(xyz,time=colsplit(time,split="\\.",names=c('hour','minute')))
head(xyz)
head(h)
h<-xyz[,c(5)]
hour<-h[,c(1)]
minute<-h[,c(2)]
xyz<-xyz[,-5]
xyz<-cbind(xyz,hour,minute)
head(xyz)

#Now back to main file
BPDheadAccount<-BPDhead[,c(1:2)]
head(BPDheadAccount)


#ExpandRows
library(splitstackshape)

a<-0
for(i in seq(from=1,to=nrow(BPDheadAccount),by=3))
{
  b<-i
  a<-rbind(a,expandRows(BPDheadAccount[c(b),],288,count.is.col = FALSE))
}
head(a)
a=a[-1,]


#Splitting date
datetxt<-a[,c(2)]
datetxt<-as.character(datetxt)
datetxt<-as.Date(datetxt,"%m/%d/%Y")

class(datetxt)
df <- data.frame(month = as.numeric(format(datetxt, format = "%m")),
                 day = as.numeric(format(datetxt, format = "%d")),
                 year = as.numeric(format(datetxt, format = "%Y")))
head(df)

#Column binding
nrow(a)
nrow(xyz)
finalBPDhead<-cbind(a,df)
finalBPDhead<-cbind(finalBPDhead,xyz)
head(finalBPDhead)
write.csv(finalBPDhead,file="finalBPDheadD.csv")


##------------------------------------------------------------>

#------------------------------------------------------------------------->

###District 1 BPD

setwd("C:/Users/Mushtaq/Downloads/ADS/COB Interval data 2014/CY2014 COB Interval data 1")
BPDdistrict<-read.csv("finalBPDdistrict.csv",header=T)
BPDdudley<-read.csv("finalBPDdudley.csv",header=T)
BPDhead<-read.csv("finalBPDhead.csv",header=T)
BPDheadD<-read.csv("finalBPDheadD.csv",header=T)
BPDstation<-read.csv("finalBPDstation.csv",header=T)
finalBPD<-rbind(BPDstation,BPDheadD,BPDhead,BPDdudley,BPDdistrict)
write.csv(finalBPD,file="finalBPD.csv")

BPDdistrict<-read.csv("finalBPLcopley.csv",header=T)
BPDhead<-read.csv("finalBPLharvard.csv",header=T)
BPDheadD<-read.csv("finalBPLhydepark.csv",header=T)
BPDstation<-read.csv("finalBPLmattapan.csv",header=T)
finalBPD<-rbind(BPDdistrict,BPDhead,BPDheadD,BPDstation)
write.csv(finalBPD,file="finalBPL.csv")

BPDhead<-read.csv("COB-BPL.MATTAPAN.2014.csv",header=T)
summary(is.na(BPDhead))
BPDheadTime<-BPDhead[,c(5:292)]
BPDheadTranspose<-t(BPDheadTime)

a<-0

for(i in seq(from=1,to=ncol(BPDheadTranspose),by=3)){
  b<-i
  c<-i+2
  a<-rbind(a,BPDheadTranspose[,b:c])
  
}
a=a[-1,]
head(a)
write.csv(a,file="mushtaq35.csv")
xyz<-read.csv("mushtaq35.csv",header=FALSE)
head(xyz)
xyz=xyz[-1,]
colnames(xyz)<-c("Time","KWh","powerfactor","KVARh")
head(xyz)

library(stringr)
out<-str_split_fixed(xyz$Time,".",2)
head(out)
head(xyz)
xyz<-cbind(xyz,out)
head(xyz)
xyz<-xyz[,-5]
head(xyz)
colnames(xyz)<-c("Time","KWh","powerfactor","KVARh","time")

xyz$time<-as.character(xyz$time)
library(reshape)
xyz=transform(xyz,time=colsplit(time,split="\\.",names=c('hour','minute')))
head(xyz)
head(h)
h<-xyz[,c(5)]
hour<-h[,c(1)]
minute<-h[,c(2)]
xyz<-xyz[,-5]
xyz<-cbind(xyz,hour,minute)
head(xyz)

#Now back to main file
BPDheadAccount<-BPDhead[,c(1:2)]
head(BPDheadAccount)


#ExpandRows
library(splitstackshape)

a<-0
for(i in seq(from=1,to=nrow(BPDheadAccount),by=3))
{
  b<-i
  a<-rbind(a,expandRows(BPDheadAccount[c(b),],288,count.is.col = FALSE))
}
head(a)
a=a[-1,]
head(a)

#Splitting date
datetxt<-a[,c(2)]
datetxt<-as.character(datetxt)
datetxt<-as.Date(datetxt,"%m/%d/%Y")

class(datetxt)
df <- data.frame(month = as.numeric(format(datetxt, format = "%m")),
                 day = as.numeric(format(datetxt, format = "%d")),
                 year = as.numeric(format(datetxt, format = "%Y")))
head(df)

#Column binding
nrow(a)
nrow(xyz)
finalBPDhead<-cbind(a,df)
finalBPDhead<-cbind(finalBPDhead,xyz)
head(finalBPDhead)
write.csv(finalBPDhead,file="finalBPLhead.csv")

