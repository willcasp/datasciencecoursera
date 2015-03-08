if(!file.exists("data")) {dir.create"data"}
library(xlsx)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL,destfile="natgas.xlsx",method="curl")
dateDownloaded <- date()
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("natgas.xlsx",sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
dat
sum(dat$Zip*dat$Ext,na.rm=T)
