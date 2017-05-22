complete = function (directory,id){
  setwd(file.path(getwd(),directory))
  dataframe = NULL
  for (i in id){
    if (i<10){
      data = read.csv(paste("00",as.character(i),".csv", sep = ""),
                      header = T, 
                      na.strings = c("NA","NaN"," "))
      
    }
    else if (i>=10 & i<100){
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
    dataframe = rbind(dataframe,c(i,nrow(data)))
    
    
  }   
  setwd("..")
  dataframe = data.frame(dataframe)
  names(dataframe) = c('id','nobes')
  return(dataframe)
  
}