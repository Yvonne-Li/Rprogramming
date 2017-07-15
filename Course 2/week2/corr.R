corr = function(directory,threhold=0){
  
setwd(file.path(getwd(),directory))
correlationVector = NULL
  for (i in 1:332){
    if (i <10){
      data = read.csv(paste("00",as.character(i),".csv", sep = ""), 
                            header = T, 
                            na.strings = c("NA","NaN"," "))
      
    }
    else if (i>=10 & i <100){
      data = read.csv(paste("0",as.character(i),".csv", sep = ""),
                                     header = T,
                                     na.strings = c("NA","NaN"," "))
    }
    else {
      data = read.csv(paste(as.character(i),".csv",sep = ""),
                      header = T,
                      na.strings = c("NA","NaN"," "))
    }
    data = na.omit(data)
    if (nrow(data)>threhold){
      correlationVector = c(correlationVector, cor(data[,2],data[,3]))}
  }
  setwd("..")
  return(correlationVector)
  
}