install.packages("plot3D")
install.packages("rgl")
library("plot3D")
library("rgl")
data(iris)
head(iris)
x <- sep.l <- iris$Sepal.Length
y <- pet.l <- iris$Petal.Length
z <- sep.w <- iris$Sepal.Width
scatter3D(x, y, z, clab = c("Sepal", "Width (cm)"))

data(VADeaths)
hist3D(z = VADeaths, scale = FALSE, expand = 0.01, bty = "g", phi = 20,
       col = "#0072B2", border = "black", shade = 0.2, ltheta = 90,
       space = 0.3, ticktype = "detailed", d = 2)

rgl.open()  
rgl.points(x, y, z, color ="lightgray")  

 
rgl.bg(color = "white")  
rgl.spheres(x, y, z, r = 0.2, color = "grey")


rgl_init <- function(new.device = FALSE, bg = "white", width = 640) { 
  if( new.device | rgl.cur() == 0 ) {
    rgl.open()
    par3d(windowRect = 50 + c( 0, 0, width, width ) )
    rgl.bg(color = bg )
  }
  rgl.clear(type = c("shapes", "bboxdeco"))
  rgl.viewpoint(theta = 15, phi = 20, zoom = 0.7)
}
rgl_init()
rgl.spheres(x, y, z, r = 0.2, color = "yellow") 
rgl.bbox(color = "#333377") 


rgl_init()
rgl.spheres(x, y, z, r = 0.2, color = "yellow") 
rgl.lines(c(min(x), max(x)), c(0, 0), c(0, 0), color = "black")
rgl.lines(c(0, 0), c(min(y),max(y)), c(0, 0), color = "red")
rgl.lines(c(0, 0), c(0, 0), c(min(z),max(z)), color = "green")

movie3d(f, 3, dir = tempdir(), convert = TRUE)
 
rgl.spheres(x, y, z, r = 0.2, color = "#D95F02") 
rgl_add_axes(x, y, z, show.bbox = TRUE)
 
ellips <- ellipse3d(cov(cbind(x,y,z)), 
                    centre=c(mean(x), mean(y), mean(z)), level = 0.95)
wire3d(ellips, col = "#D95F02",  lit = FALSE)
aspect3d(1,1,1)
 
movie3d(spin3d(axis = c(0, 0, 1)), duration = 3,
        dir = getwd())

library(grid)
qplot(speed, dist, data = cars, geom = c("point", "smooth"))
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
grid.raster(image)