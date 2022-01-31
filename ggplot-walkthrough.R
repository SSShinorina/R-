rm(list=ls())
getwd()
install.packages('ggplot2')
library(ggplot2)
options(scipen=999) 
qplot(x = carat,                            # x variable
      y = price,                            # y variable
      data = mtcars,                      # Data set
      geom = "point",                       # Plot type
      color = clarity,                      # Color points by variable clarity
      xlab = "mpg",                # x label
      ylab = "density",                       # y label
      main = "Cars MPG vs. Density") 
 
ggplot(data=mtcars, aes(x=mpg, y=density)) +  # Initialize plot 
  geom_point(aes(color = clarity))
ggplot(data=mtcars, aes(x=mpg(), y=density)) +          # Initialize plot 
  geom_point(aes(color = clarity), alpha = 0.1)
ggplot(data=mtcars, aes(x=mpg)) +      # Initialize plot 
  
  geom_histogram(fill="skyblue",      # Create histogram with blue bars
                 col="black",         # Set bar outline color to black
                 binwidth = 0.05) +   # Set bin width
  
  xlim(0,3) 
ggplot(data=mtcars, aes(x=mpg, y=density)) +  # Initialize plot 
  
  geom_jitter(alpha=0.05,          # Add jittered data points with transparency
              color="yellow") +   # Set data point color
  
  geom_boxplot(outlier.shape=1,     # Create boxplot and set outlier shape
               alpha = 0  )
ggplot(data=mtcars, aes(x=mpg, y=density)) +   # Initialize plot 
  geom_violin(aes(color=clarity, fill=clarity), # Make violin plot with color
              alpha = 0.55)              # Make inner plot area partially transparent

ggplot(data=mtcars, aes(x=clarity)) +        # Initialize plot 
  
  geom_bar(aes(fill=color),        # Create bar plot, fill based on diamond color
           color="black",                 # Set bar outline color
           position="dodge") +            # Place bars side by side
  
  scale_fill_manual(values=c("#FFFFFF","#F5FCC2",     # Use custom fill colors
                             "#E0ED87","#CCDE57", "#B3C732","#94A813","#718200"))

ggplot(data=mtcars, aes(x=mpg)) +       # Initialize plot 
  xlim(0,2.5)                 +       # Limit the x-axis*
  
  geom_density(position="stack",      # Create a stacked density chart
               aes(fill=cut),         # Fill based on cut
               alpha = 0.5)           # Set transparency

ggplot(data=mtcars, aes(x=mpg, y=density)) +      # Initialize plot 
  
  geom_point(aes(color=color),                # Color based on diamond color
             alpha=0.5)     +
  
  facet_wrap(~clarity)           +            # Facet on clarity
  
  geom_smooth()                  +            # Add an estimated fit line*
  
  theme(legend.position=c(0.85,0.16))         # Set legend position