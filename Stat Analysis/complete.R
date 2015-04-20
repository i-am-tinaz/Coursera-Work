complete <- function(directory, id = 1:332) {
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
  output = data.frame()
  for (f in files){
    dt = read.csv(f,header=1)
    num = sum(!is.na(dt[2])&!is.na(dt[3]))
    output = rbind(output,c(dt[1,4],num))
  }
  colnames(output) = c("id","nobs")
  return (output)
}