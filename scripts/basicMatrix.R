



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
