install.packages("lattice")
library("lattice")
insurance=read.csv('C:\\Users\\User\\Documents\\R Work\\insurance.csv')
insurance
summary(insurance)
 
xyplot(charges ~ age, data = insurance)
xyplot(charges ~ bmi, data = insurance)
xyplot(charges ~ children, data=insurance)
dotplot(charges ~ smoker, data=insurance, xlab = "smoker", ylab="charges")
dotplot(charges ~ region,  data = insurance,
        xlab = "region", ylab = "charges")
dotplot(charges ~ sex,  data = insurance,
        xlab = "sex", ylab = "charges")

model = lm(charges ~ age + sex-1 + bmi + children + smoker-1 + region, data=insurance)
summary(model)
 

 