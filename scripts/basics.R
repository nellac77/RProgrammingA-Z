


while(T){
  print("hello")
}


counter <- 1
while(counter < 12){
  print(counter)
  counter <- counter + 1
}


for(i in 1:5){
  print("hello r")
}


#---- -2 ----- -1 ----- 0 ---- 1 ---- 2

rm(answer)
x <- rnorm(1)
if(x > 1){
  answer <- "Greater then 1"
} else if(x >= -1){
  answer <- "Between -1 and 1"
} else{
  answer <- "Less than -1"
}

