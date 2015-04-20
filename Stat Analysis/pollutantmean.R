pollutantmean <- function(directory, pollutant, id = 1:332) {
  num = paste("00",id,sep="")
  n = c()
  for (i in num) {
    if (nchar(i)==4){
      i = substr(i,2,4)
    } else if (nchar(i)==5) {
      i = substr(i,3,5)
    }
    n=c(n,i)
  }
  files = paste("./",directory,"/",n,".csv",sep="")
  vec = c()
  for (f in files) {
    rd = read.csv(f,header=TRUE)
    rdc = subset(rd,select=c(pollutant))
    v = rdc[,]
    vec = c(vec,v[!is.na(v)])
  }
  output = mean(vec)
  return (output)
}