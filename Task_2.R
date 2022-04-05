packageName('faraway')
library(faraway)
data(sat)
sat
summary(sat)

#a
plot(sat$takers,sat$verbal)
plot(takers~math, data=sat)
plot(verbal~total, data=sat)
plot(math~total, data=sat)

#b
mdl <- lm (total ~ takers, data=sat)
residuals(mdl)
deviance(mdl)
fitted(mdl)
coef(mdl)
summary(mdl)

x<-model.matrix(~ takers, data=sat)
y<-sat$total
#estimate
xtxi<-solve(t(x)%*%x)
# Find beta estimates
beta=xtxi%*%t(x)%*%y

#d
reg_mdl <- lm (total ~ expend+takers+ratio+salary, data=sat)
x<-model.matrix(~ expend+takers, data=sat)
y<-sat$total
#estimate
xtxi<-solve(t(x)%*%x)
# Find beta estimates
beta=xtxi%*%t(x)%*%y
beta

#f
mdl_takers<-lm(takers~expend+ratio+salary+total,data = sat)
summary(mdl_takers)


#g
confint(mdl_takers)

library(ellipse)
plot(ellipse(mdl_takers,c(2,3)),type="l")
points(0,0,pch=3,col=2)
points(coef(mdl_takers)[2],coef(mdl_takers)[3],pch=18)
abline(v=confint(mdl_takers)[2,],lty=2)
abline(h=confint(mdl_takers)[3,],lty=2)


#h
mdl0<-sat$takers
n=50;p=5;q=4;
df_Omega=n-p;
df_omega=n-q;
RSS_Omega=deviance(reg_mdl)
RSS_omega=deviance(mdl0)
F_stat=((RSS_omega-RSS_Omega)/(df_omega-df_Omega))/(RSS_Omega/df_Omega)
F_stat

#i
mdl_1<-lm(total~expend+ratio+salary+takers+verbal+math, data=sat)
mdl_1
mdl_2<-lm(total~expend+salary+takers+verbal+math, data=sat)
mdl_2
mdl_3<-lm(total~ expend+salary+verbal+math, data=sat)
mdl_3
mdl_4<-lm(total~salary+verbal+math, data=sat)
mdl_4
mdl_5<-lm(total~verbal+math, data=sat)
mdl_5
mdl_6<-lm(total~ math, data=sat)
mdl_6
mdl_7<-lm(total~ verbal, data=sat)
mdl_7


#j 1st
par(mfrow=c(1,2))
plot(fitted(mdl_6),residuals(mdl_6),xlab="Fitted",ylab="Residuals")
abline(h=0)
plot(fitted(mdl_6),sqrt(abs(residuals(mdl_6))),xlab="Fitted",ylab="Residuals")
par(mfrow=c(1,1))


#j 2nd
shapiro.test(residuals(mdl_6))

#j 3rd
hatv<-hatvalues(mdl_6)
sum(hatv)
scores=rownames(sat)
halfnorm(hatv,labs=scores,ylab="Laverages")
abline(h=2*sum(hatv)/nrow(sat))

#j 4th
lmod<-lm(total~math, sat)
plot(mdl_6)
abline(lmod)

#j 5th
par(mfrow=c(1,3))
#Add first point
p1 <- c(300,600)
lmod1 <- lm(total~math, rbind(sat, p1))
plot(total ~ math, rbind(sat, p1))
points(300,600,pch=4,cex=2)
abline(lmod)
abline(lmod1, lty=2)
#Add second point
p2 <- c(700,2000)
lmod2 <- lm(total ~ math, rbind(sat, p2))
plot(total ~ math, rbind(sat, p2))
points(700,2000,pch=4,cex=2)
abline(lmod)
abline(lmod2,lty=2)
#Add third point 
p3 <- c(2000,700)
lmod3 <- lm(total ~ math, rbind(sat, p3))
plot(total ~ math, rbind(sat, p3))
points(2000,700,pch=4,cex=2)
abline(lmod)
abline(lmod3,lty=2)
par(mfrow=c(1,1))


