library(data.table)
setwd("/Volumes/data/code/datasciencecoursera/gettingCleaningData/quiz1/")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile="./data.csv", method = "curl")
dateDownloaded <- date()
dateDownloaded
DT <- fread("./data.csv", sep=",", header = TRUE)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
mean(DT$pwgtp15,by=DT$SEX)
system.time(mean(DT$pwgtp15,by=DT$SEX))
DT[,mean(pwgtp15),by=SEX]
system.time(DT[,mean(pwgtp15),by=SEX])
sapply(split(DT$pwgtp15,DT$SEX),mean)
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
tapply(DT$pwgtp15,DT$SEX,mean)
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
