library(grid)
library(RColorBrewer)

colors()

toldo <- polygonGrob(x = c(0, 0, 1, 1), 
                     y = c(0.0, 0.8, 0.8, 0.3),
                     gp = gpar(fill  = 'salmon1',
                            col = NA))

circulos <- circleGrob(x = seq(0, 1, by = 0.05), 
                       y= rep(0.8, 10),
                       r = 0.028,
                       gp = gpar(fill  = 'salmon1',
                                 col = 'salmon1'))

tri <- polygonGrob(x = c(0, 1, 1), 
                   y = c(0.0, 0, 0.3),
                   gp = gpar(fill  = 'slateblue1',
                             col = 'slateblue1'))

b.rect <- rectGrob(x = 0.5, y = 0.8,
                   gp = gpar(fill  = 'slateblue1',
                             col = 'slateblue1'))

grid.newpage()
grid.draw(b.rect)
grid.draw(toldo)
grid.draw(circulos)
grid.draw(tri)

