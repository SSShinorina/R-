install.packages("ggplot2")
var_x<-"Hello"
rm(var_x)
var_x
new_multiply_function<-function(a,b){
  result <- a*b
  print(result)
}
new_multiply_function(5,3)
num_x <- c(1,2,5.3,6,-2,4)
char_x <- c("one","two","three")
log_x <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)
num_x[3]
list_x <- list(c(5,3),5.8,list(2,7.6,"Hi"))
M = matrix(c('a','a','b','c','b','a'), nrow=3,ncol=2,byrow=TRUE)
print(M)
print(class(M))
arr_x <- array(c('one','two'), dim=c(3,3,2))
getwd()
rm(list=ls())
var_int <- 2L
print(var_int)
print(class(var_int))
var_raw <- charToRaw("shaon")
list_x <- list(c(5,3),5.8,list(2,7.9,'Hi'))
print(list_x)
arr_x <- array(c("one","two"), dim=c(3,3,2))
print(arr_x)
print(class(list_x))
df_x <- data.frame(id=c(1,2,3), colour=c("yellow","red","green"), 
                   grade=c(list(2,7.6,"Hi"), list(2,7.6,"Hi"), list(2,7.6,"Hi")))
print(df_x)
print(class(df_x))
