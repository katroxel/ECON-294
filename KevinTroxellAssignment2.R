#0
KevinTroxellAssignment2 <- list (
firstname = "Kevin",
lastname = "Troxell",
email = "katroxel@ucsc.edu",
studentID = "1307858" )

#1
library(foreign)
diamonds<-read.dta("/Users/ktrox39/Documents/Winter 2016/Econ 294/data")
KevinTroxellAssignment2$s1a <- nrow(diamonds)
KevinTroxellAssignment2$s1b <- ncol(diamonds)
KevinTroxellAssignment2$s1c <- names(diamonds)
KevinTroxellAssignment2$s1d <- summary(diamonds$price)

#2
NHIS<-read.txt("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt")
KevinTroxellAssignment2$s2a <- nrow(NHIS_2007_TSV)
KevinTroxellAssignment2$s2b <- ncol(NHIS_2007_TSV)
KevinTroxellAssignment2$s2c <- names(NHIS_2007_TSV)
KevinTroxellAssignment2$s2d <- mean(NHIS_2007_TSV$weight)
KevinTroxellAssignment2$s2e <- median(NHIS_2007_TSV$weight)
NHIS_2007_TSV$Weight <- ifelse(NHIS_2007_TSV$weight<900, NHIS_2007_TSV$weight, NA)   
KevinTroxellAssignment2$s2f <- hist(NHIS_2007_TSV$Weight)
KevinTroxellAssignment2$s2g <- mean(NHIS_2007_TSV$Weight, na.rm=TRUE)
KevinTroxellAssignment2$s2h <- median(NHIS_2007_TSV$Weight, na.rm=TRUE)
KevinTroxellAssignment2$s2i <- ifelse(NHIS_2007_TSV$SEX==2, summary(NHIS_2007_TSV$Weight), NA)
KevinTroxellAssignment2$s2j <- ifelse(NHIS_2007_TSV$SEX==1, summary(NHIS_2007_TSV$Weight),NA)


#3
vec <- c(letters, LETTERS)
KevinTroxellAssignment2$s3a <- vec[seq(1, 52, 2)]
KevinTroxellAssignment2$s3b <- paste(vec[c(37, 5, 22)], collapse="")

arr <- array(c(letters,LETTERS), dim = c(3,3,3))
KevinTroxellAssignment2$s3c <- arr[,1,2]
KevinTroxellAssignment2$s3c <- arr[2,2,]
KevinTroxellAssignment2$s3c <- paste(arr[2,1,2],arr[2,2,1],arr[1,2,3], sep="")

#4
hw2<-read.dta("http://people.ucsc.edu/~aspearot/Econ_217_Data/org_example.dta")

