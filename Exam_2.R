library('faraway')
data(africa)
?africa
summary(africa)

# a
boxplot(miltcoup~oligarchy,data=africa)
boxplot(miltcoup~parties,data=africa)
boxplot(miltcoup~popn,data=africa)
boxplot(miltcoup~size,data=africa)
boxplot(miltcoup~numelec,data=africa)
boxplot(miltcoup~numregim,data=africa)

model = lm(miltcoup ~ . -(pollib+pctvote), data=africa)
summary(model)

summary (model$miltcoup)
model$miltcoup <-factor(model$miltcoup)
summary (model$miltcoup)

summary (model$oligarchy)
model$oligarchy <-factor(model$oligarchy)
summary (model$oligarchy)

summary (model$parties)
model$parties <-factor(model$parties)
summary (model$parties)

summary (model$popn)
model$popn <-factor(model$popn)
summary (model$popn)

summary (model$size)
model$size <-factor(model$size)
summary (model$size)

summary (model$numelec)
model$numelec <-factor(model$numelec)
summary (model$numelec)

summary (model$numregim)
model$numregim <-factor(model$numregim)
summary (model$numregim)

# b
model1 = glm(miltcoup ~ . ,family=gaussian, data = africa)
model1
