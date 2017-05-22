pollutantmean = function(directory, pollutant, id){
#setwd(file.path(getwd(),directory))
  te1 = formatC(id, width = 3, flag="0")

filename = paste(directory, te1, sep = "/")
filename1 = paste(filename,"csv",sep = ".")
pollutantlist = read.csv(file = filename1,sep=",")
pollutant_mean = mean(pollutantlist[[pollutant]], na.rm = TRUE)
return(pollutant_mean)
} 


