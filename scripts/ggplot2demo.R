getwd()
setwd("C:/Users/calle/Documents/RProgrammingA-Z/datasets/SECTION 6")
getwd()

movies <- read.csv("Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)

#------------------ Aesthetics
install.packages("ggplot2")
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        colour=Genre, size=BudgetMillions)) +
  geom_point()
#>>> This is #1 (we will imporve it)

#----------------- Plotting with Layers
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        colour=Genre, size=BudgetMillions))

# point
p + geom_point()

#lines
p + geom_line()

#multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#-------------------- Overriding Aesthetics

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre, size=BudgetMillions))

#add geom layer
q + geom_point()

#overriding aesthetics
#ex1
q + geom_point(aes(size=CriticRating))

#ex2
q + geom_point(aes(size=BudgetMillions))

#q remains the same
q + geom_point()

#ex3
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")

#ex4
q + geom_line(size=1) + geom_point()
# reduce line size


#-------------- Mapping vs Setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add clour
#1. Mapping (what we've done so far):
r + geom_point(aes(colour=Genre))
#2. Setting (don't call aesthetic!):
r + geom_point(colour="DarkGreen")
#ERROR
# r + geom_point(aes(colour="DarkGreen"))


#1. Mapping
r + geom_point(aes(size=BudgetMillions))
#2. Setting
r + geom_point(size=10)
#ERROR
# r + geom_point(aes(size=10))

#---------------- Histograms and Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)

#add colour
s + geom_histogram(binwidth=10, aes(fill=Genre))
#add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour = "Black")
#>>> 3 (we will improve it)


#sometimes you may need density charts:
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")


#---------------- Starting Layer Tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10,
                   fill="White", colour="Blue")

#another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10,
                   aes(x=AudienceRating),
                   fill="White", colour="Blue")
#>>> 4

t + geom_histogram(binwidth=10,
                   aes(x=CriticRating),
                   fill="White", colour="Blue")
#>>> 5


t <- ggplot()
#Then do the t + (add whatever you want)



#----------------- Statistical Transformation
?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data = movies, aes(x=Genre, y=AudienceRating,
                               colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip / hack:
u + geom_boxplot(size=1.2) + geom_jitter() #jitter so you can see data
#another way:
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
#>>> 6

#Challenge: do same but for critic ratings
u <- ggplot(data = movies, aes(x=Genre, y=CriticRating,
                               colour=Genre))
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)

#----------------------- Using Facets

v <- ggplot(data = movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black")


#facets (let you make lots of charts!)
v + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") + 
  facet_grid(Genre~., scales="free")



#scatterplots:
w <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               colour=Genre))
w + geom_point(size=3)

#facets
w + geom_point(size=3) +
  facet_grid(.~Genre)

w + geom_point(size=3) +
  facet_grid(~Year)

w + geom_point(size=3) +
  facet_grid(Genre~Year)

w + geom_point(size=3) +
  geom_smooth() +
  facet_grid(Genre~Year)


w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)
#>>> 1 (but still we'll improve)


#------------------ Coordinates

#Today:
#limits
#zoom
m <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               size=BudgetMillions,
                               colour=Genre))
m + geom_point()

m + geom_point() + 
  xlim(50, 100) + 
  ylim(50, 100)

#won't work well always
n <- ggplot(data = movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  ylim(0, 50)

#instead - zoom:
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim=c(0, 50))


#improve #1:
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))



#----------------- Theme
o <- ggplot(data = movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

h

#axes labels
h + xlab("money Axis") +
  ylab("number of Movies")

#label formatting
h + xlab("money Axis") +
  ylab("number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size = 30))

#tick mark formatting
h + xlab("money Axis") +
  ylab("number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size = 30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size = 20))

#legend formatting
h + xlab("money Axis") +
  ylab("number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size = 30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

#title formatting
h + xlab("money Axis") +
  ylab("number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size = 30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=40,
                                  family="Courier"))





















