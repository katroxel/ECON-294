#Kevin Troxell
#Assignment 1

#0. Printing name and studentid
firstname<-"Kevin"
lastname<-"Troxell"
print(paste(firstname, lastname))
studentid<-"1307858"
print(studentid)

#1.Loading data
library(foreign)
df.dta<-read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_dta.dta")
df.csv<-read.csv("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_CSV.csv")
df.td<-read.table("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt")
df.rdata<-load(url("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_RData.RData"))

#2
print("The .dta file=193 KB")
print("The .csv file=142 KB")
print("The .txt file=142 KB")
print("The .RData file=46 KB")
print("The smallest is the .RData file")
print("The file sizes are varied because they are composed differently. For
      example, there may be more blank space in one than in the other.")

#3
typeof(NHIS_2007_RData)
class(NHIS_2007_RData)
print("The type is list and the class is a data.frame")
print(length(NHIS_2007_RData))
print(dim(NHIS_2007_RData))
print(nrow(NHIS_2007_RData))
print(ncol(NHIS_2007_RData))
print(summary(NHIS_2007_RData))


#4
df<-read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta")
print(str(df))
print("There are 1119754 observations and  30 variables")
summary(df$rw)
print("minimum=1.8, mean=19.8, median=15.9, max=354.8")
print("First Quartile=10.7, Third Quartile=24.4")
print("There are 521279 NAs")

#5. Creating a vector 
v<-c(1,2,3,4,5,6,7,4,NULL,NA)
print(length(v))
print("R does not register null, so the length is listed as 9 instead of 10")
print(mean(v, na.rm=TRUE))
print("The mean is 4.")

#6. Creating a matrix
x <- matrix(c(1, 4, 7, 2, 5, 8, 3, 6 ,9), nrow=3, ncol=3)
print(x)
t(x)
print(t(x))
eigen <- eigen(x)
ve <-eigen$vectors
va <-eigen$values
print(va)
print(ve)
y <- matrix(c(1, 3, 2, 2, 2, 3, 3, 1, 0), nrow=3, ncol=3)
print(y)
iy<-solve(y)
print(iy)
miy<-iy%*%y
print(miy)
print(This is called the identity matrix)

#7 Creating data frame
diamond<-data.frame(carat=c(5,2,.5,1.5,5,NA,3),
                    cut=c("fair","good","very good", "good", "fair", "ideal", "fair"),
                    clarity=c("SI1", "I1", "VI1", "VS1", "IF", "VVS2",NA),
                    price=c(850,450,450,NA,750,980,420))
print(diamond)
mean<-mean(diamond$price, na.rm=TRUE)
print(mean)
fair<-subset(diamond, cut=="fair")
print(fair)
meanfair<-mean(fair$price)
print(meanfair)


notfair<-subset(diamond, cut!="fair")
print(notfair)
meannotfair<-mean(notfair$price, na.rm=TRUE)
print(meannotfair)
print("The mean price is 626.67")

medianprice<-subset(diamond, carat>2&(cut=="Ideal"|cut=="very good"))
print(medianprice)
print("The median price does not exist because there are no values in this subset")


