rm(list=ls())
getwd()
?mtcars
car_data <- mtcars
head(car_data, 3)
tail(car_data, 3)
summary(mtcars)
str(car_data)
colSums(is.na(car_data))
quantile(car_data$wt)
quantile(car_data$wt, c(.2, .4, .8))
var(car_data$wt)
var(car_data$mpg)
hist(car_data$mpg, breaks=10, xlab = "mpg", main = "mpg distribution", xlim = range(10:35))
column_means <- colMeans(car_data)
center_matrix <- matrix( rep(column_means, nrow(car_data)), nrow=nrow(car_data),ncol=ncol(car_data), byrow = TRUE)
centered_cars <- car_data - center_matrix     # Subtract column means

print( head(centered_cars))
print(colMeans(centered_cars))  
sd(centered_cars$mpg)
column_sds <- apply(centered_cars, MARGIN = 2, FUN = sd)

print(column_sds) 
scale_matrix <- matrix( rep(column_sds, nrow(car_data)), nrow=nrow(car_data), ncol=ncol(car_data), byrow = TRUE)    
centered_scaled_cars <- centered_cars/scale_matrix
summary(centered_scaled_cars)
auto_scaled_cars <- scale(car_data,              # Numeric data object
                          center=TRUE,        # Center the data?
                          scale=TRUE)         # Scale the data?

summary(auto_scaled_cars) 
cor(car_data[,1:6]) 
pairs(car_data[,1:6])
install.packages('psych')
library(psych)
pairs.panels(car_data[,1:6], method = "pearson", 
             hist.col = "#00AFBB", density = TRUE, # show density plots 
             ellipses = TRUE # show correlation ellipses 
) 
str(mtcars)
hist(mtcars$mpg, breaks=10, xlab = "mpg", main = "mpg distribution", xlim = range(10:35))
cor(mtcars[,1:6]) 
colSums(is.na(mtcars))
quantile(mtcars$wt)
column_means <- colMeans(mtcars)
center_matrix <- matrix( rep(column_means, nrow(mtcars)), nrow=nrow(mtcars),ncol=ncol(mtcars), byrow = TRUE)
centered_cars <- mtcars - center_matrix     # Subtract column means

print( head(centered_cars))
auto_scaled_cars <- scale(mtcars,              # Numeric data object
                          center=TRUE,        # Center the data?
                          scale=TRUE)         # Scale the data?

summary(auto_scaled_cars)  