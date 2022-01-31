rm(list=ls())
getwd()
install.packages('ggplot2')
library(ggplot2)
options(scipen=999)
x <- 1:10; y = x*x
qplot(x,y)
qplot(x, y, geom=c("point", "line"))
qplot(mpg, wt, data=mtcars)
data("midwest", package = "ggplot2")
 
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) + 
  labs(subtitle="Area Vs Population", 
       y="Population", 
       x="Area", 
       title="Scatterplot", 
       caption = "Source: midwest")

plot(gg)
ToothGrowth$dose <- as.factor(ToothGrowth$dose) #dataprep
# Basic box plot
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot(fill="gray")+
  labs(title="Plot of length per dose",x="Dose (mg)", y = "Length")+
  theme_classic()
bp <- ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) + 
  geom_boxplot()+
  labs(title="Plot of length  per dose",x="Dose (mg)", y = "Length")
bp + theme_classic()
dp <- ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) + 
  geom_violin(trim=FALSE)+
  geom_boxplot(width=0.1, fill="white")+
  labs(title="Plot of length  by dose",x="Dose (mg)", y = "Length")
dp + theme_classic()

ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot()+
  geom_dotplot(binaxis='y', stackdir='center')+
  labs(title="Plot of length  by dose",x="Dose (mg)", y = "Length")+
  theme_classic()
dp <-ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) + 
  geom_dotplot(binaxis='y', stackdir='center')+
  labs(title="Plot of length  by dose",x="Dose (mg)", y = "Length")
dp + theme_classic()
ggplot() +
  geom_density(aes(mpg, fill = "data1"), alpha = .2, data = mtcars) +
  geom_density(aes(hwy, fill = "data2"), alpha = .2, data = mpg) +
  scale_fill_manual(name = "dataset", values = c(data1 = "red", data2 = "green"))
ggplot() +
  geom_histogram(aes(mpg, fill = "data1"), alpha = .4, data = mtcars) +
  geom_histogram(aes(hwy, fill = "data2"), alpha = .4, data = mpg) +
  scale_fill_manual(name = "dataset", values = c(data1 = "red", data2 = "green"))
freqtable <- table(mpg$manufacturer)
df <- as.data.frame.table(freqtable)
g <- ggplot(df, aes(Var1, Freq))
g + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  labs(title="Bar Chart", 
       subtitle="Manufacturer of vehicles", 
       caption="Source: Frequency of Manufacturers from 'mpg' dataset") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
g <- ggplot(mpg, aes(manufacturer))
g + geom_bar(aes(fill=class), width = 0.5) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  labs(title="Categorywise Bar Chart", 
       subtitle="Manufacturer of vehicles", 
       caption="Source: Manufacturers from 'mpg' dataset")