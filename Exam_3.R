library(mgcv)
library(MASS)

#### a model ####
fac <- rep(1:4,25)
x <- runif(100)
z <- rnorm(100)*0.4
f <- 2*x^3
y <- fac+f*z+rnorm(100)*0.1
fac <- factor(fac)
dat <- data.frame(y=y,fac=fac,x=x,z=z)

model = gam(y ~ fac+s(x,z), data=dat)
model
plot(y)


######  c) thin plate splines  #####
model_thin <- gam(y~ s(x,z), data=dat)
summary(model_thin)
plot(model_thin, residuals=TRUE)

vis.gam(model_thin,plot.type="contour",color="heat")


### d) re-fit & compare results ####
model_cubic <- gam(y~s((x+z),k=2,fx=TRUE,bs="cr"),data=dat)
plot(model_cubic,residuals=TRUE,se=FALSE,pch=1)


