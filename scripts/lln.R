#Testing the Law of Large Numbers (LLN)

N <- 10000000
counter <- 0

for (i in rnorm(N)){
  if(i >= -1 & i <= 1){
    counter <- counter + 1
  }
}
  
meanOfCounts <- counter / N
print(meanOfCounts)
