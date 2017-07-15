best = function(state,outcome){
 ## read outcome data
 data = read.csv("/Users/lyonce/Desktop/ASN3/outcome-of-care-measures.csv")

 ## check that state and outcome are valid
 states = data[,7]
 outcomes = c("heart attack", "heart failure","pneumonia")
 if ((state %in% states) == FALSE){
   stop("invalid state")
 }
 else if ((outcome %in% outcomes) == FALSE){
   stop("invalid outcome")
 }
 
 ## return hospital name in that state with lowest 30-day death
 col = if (outcome == "heart attack"){
   11
 } else if (outcome == "heart failure"){
   17
 } else{ 23
 }
new_data = subset(data, State == state)
required_columns = as.numeric(new_data[[col]])
bad = is.na(required_columns)
good_data = new_data[!bad, ]

#find the hospitals in the rows with minimum outcome 
col_considered = as.numeric(good_data[[col]])
desired_row = which(col_considered == min(col_considered))
desired_hospital = good_data[desired_row,2]

if (length(desired_hospital) >1){
  hospital_sorted = sort(desired_hospital)
  hospital_sorted[1]
}
else
  desired_hospital

}