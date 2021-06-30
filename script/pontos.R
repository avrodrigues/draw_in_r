library(grid)
library(RColorBrewer)

#aglomerado de pontos
n <- 1000

x <- runif(n, 0.0, 1)
y <- runif(n, 0.0, 1)
size <- runif(n, 0.05, 0.1)
alpha <- runif(n, 0.1, 0.5)

circulos1 <- circleGrob(x = x, 
                       y= y,
                       r = size,
                       gp = gpar(fill  = 'yellow',
                                 col = NA,
                                 alpha = alpha))
x <- runif(n, 0.0, 1)
y <- runif(n, 0.0, 1)
#size <- runif(n, 0.01, 0.02)
alpha <- runif(n, 0.1, 0.5)
circulos2 <- circleGrob(x = x, 
                       y= y,
                       r = size,
                       gp = gpar(fill  = 'tomato',
                                 col = NA,
                                 alpha = alpha))

x <- runif(n, 0.0, 1)
y <- runif(n, 0.0, 1)
#size <- 0.009
alpha <- runif(n, 0.1, 0.5)
circulos3 <- circleGrob(x = x, 
                        y= y,
                        r = size,
                        gp = gpar(fill  = 'sienna2',
                                  col = NA,
                                  alpha = alpha))

x <- runif(n, 0.0, 1)
y <- runif(n, 0.0, 1)
#size <- runif(n, 0.01, 0.02)
alpha <- runif(n, 0.1, 0.5)
circulos3 <- circleGrob(x = x, 
                        y= y,
                        r = size,
                        gp = gpar(fill  = 'tan',
                                  col = NA,
                                  alpha = alpha))


grid.newpage()
grid.draw(circulos1)
grid.draw(circulos2)
grid.draw(circulos3)

