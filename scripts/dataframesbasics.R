
?read.csv()

# Method 1: Select the file manually
stats <- read.csv(file.choose())


# Method 2: Set WD and read data
getwd()
# Windows:
setwd("C:/Users/calle/Documents/RProgrammingA-Z/datasets/SECTION 5")

getwd()
rm(stats)
stats <- read.csv("DemographicData.csv")

#---------------- Exploring Data
stats
nrow(stats) # number of rows
# Imported 195 rows
ncol(stats)
head(stats, n=10)
tail(stats)
str(stats)

summary(stats)

#---------------- Using the $ sign
stats
head(stats)
stats[3, 3]
stats[3, "Birth.rate"]
stats["Angola", 3]
stats$Internet.users
stats$Internet.users[2]
stats[, "Internet.users"]

levels(stats$Income.Group)
is.vector(levels(stats$Income.Group))

#--------------- Basic Operations with a DF
stats[1:10,] # first 10 rows, all the cols
stats[3:9,]
stats[c(4,100),]

# Remember how the {} work:
stats[1,]
is.data.frame(stats[1,]) # no need for drop=F
stats[,1]
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])

# multiply cols
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

# add cols
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
 
# Knowledge check
stats$xyz <- 1:4
head(stats, n=10)

# Remove a column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL

#--------------- Filtering DFs
head(stats)
stats$Internet.users < 2
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]

stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]

#--------------- Intro to qplot()
install.packages("ggplot2")
library(ggplot2)
?qplot

qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),
      colour=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")

#--------------- Visualizing what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4), colour=I("red"))

qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4), colour=Income.Group)

#------------------- Creating DFs
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset,
                   Regions_2012_Dataset)
head(mydf)
# colnames(mydf) <- c("Country", "Code", "Region")
# head(mydf)
rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)
head(mydf)

tail(mydf)

summary(mydf)

str(mydf)

#------------------- Merging DFs
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)

#------------------- Visualizing with new split
# 1. Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Region, shape=I(23))

# 2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Region, shape=I(19),
      alpha=I(0.6))

# 3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Region, shape=I(17),
      alpha=I(.6),
      main="Birth Rate vs Internet Users")






