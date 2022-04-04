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
reg_mdl <- lm (total ~ expend+takers+verbal+math+ratio+salary, data=sat)
x<-model.matrix(~ expend+takers+verbal+math, data=sat)
y<-sat$total
#estimate
xtxi<-solve(t(x)%*%x)
# Find beta estimates
beta=xtxi%*%t(x)%*%y

#f
mdl_takers<-lm(takers~expend+ratio+salary+verbal+math+total,data = sat)
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
