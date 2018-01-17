



Salary
Games
MinutesPlayed


my.data = 1:20

my.data
A = c
A
A[2,3]


#matrix()
B = matrix(my.data, 4, 5, byrow = T)
B[2,5]


#rbind()
r1 = c("I", "am", "happy")
r2 = c("what", "a", "day")
r3 = c(1,2,3)

C = rbind(r1, r2, r3)
C

#cbind()
c1 = 1:5
c2 = -1:-5
D = cbind(c1,c2)
D


#Named Vectors
Charlie = 1:5
Charlie

#give names
names(Charlie) = c("a","b","c","d","e")
Charlie
Charlie["d"]
names(Charlie)


#clear names
names(Charlie) = NULL
Charlie


#naming matirx dimensions 1
temp.vec = 
  rep(c("a", "b", "zZ"), each=3)
temp.vec

Bravo = matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) = c("How", "Are", "You?")
Bravo

colnames(Bravo) = c("X", "y", "z")
Bravo

rownames(Bravo) = NULL
Bravo

# Matrix Ops
Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]

FieldGoals

round(FieldGoals / Games, 1)

round(MinutesPlayed / Games)

round(MinutesPlayed / Games)

#  Visualizing with matplot()
matplot(t(FieldGoals/Games), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)

matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)

# Subsetting - 
x <- c("a", "b", "c", "d", "e")
x
x[c(1,5)]
x[1]


Games
Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2008", "2009")]
Games[1,] #note no row names!
is.matrix(Games[1,])

is.matrix(Games[1,5])

Games[1,,drop=F]
Games[1,5,drop=F] # the drop arg keeps the reulst the same is the original data structure! 

# Visualizing Subsetting
Data <- MinutesPlayed[1,, drop=F ]

matplot(t(Data), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)

Data
