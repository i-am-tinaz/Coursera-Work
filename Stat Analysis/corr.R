corr = function(directory,threshold=0){
  id = 1:332
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
  output = c()
  for (f in files){
    dt = read.csv(f,header=1)
    workdat = subset(dt,!is.na(dt[2])&!is.na(dt[3]))
    if (nrow(workdat)>=threshold) {
      nitrate = workdat[3]
      sulfate = workdat[2]
      x = cor(nitrate,sulfate)
      output =  c(output,x[1])
    }
  }
  return (output)
}