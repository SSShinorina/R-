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


# linear model on gender
insurance$sex <- factor(insurance$sex)
model = lm(charges ~ age+sex+bmi+children+smoker+region,data=insurance)
model
insurance$sex <- relevel(insurance$sex, ref=2)
model = lm(charges ~ age+sex+bmi+children+smoker+region,data=insurance)
model

#   liner model on smokers 
insurance$smoker <- factor(insurance$smoker)
model = lm(charges ~ age+sex+bmi+children+smoker+region,data=insurance)
model
insurance$smoker <- relevel(insurance$smoker, ref=2)
model = lm(charges ~ age+sex+bmi+children+smoker+region,data=insurance)
model


#   liner model on region 
insurance$region <- factor(insurance$region)
model = lm(charges ~ age+sex+bmi+children+smoker+region,data=insurance)
model
insurance$region <- relevel(insurance$region, ref = 3)
model = lm(charges ~ age+sex+bmi+children+smoker+region,data=insurance)
model


 