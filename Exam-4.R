library(mgcv)
lake
#### a) investigate the data
head(lake); dim(lake)
boxplot(lake)
plot(lake)
summary(lake)

#### b) Model selection
cor(lake)
model0 = lm(ph~cal+lat+lon, data=lake)
summary(model0)
model <- gam(ph~s(cal)+s(lat),data=lake,family=poisson)
summary(model)   
plot(model,pages=1)  
model$sp

#### c)  Model validation
gam.check((model))
rsd <- residuals(model)
qq.gam(model,rep=100)
plot(log(fitted(model)),rsd)

#### d) 
vis.gam(model,plot.type="contour",color="topo")
 
 