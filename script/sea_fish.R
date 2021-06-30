#toldo com ggplot
library(ggplot2)
library(ggforce)
library(ggimage)



rect1 <- data.frame(
  xmin = c(0.0, 0.0, 0.0),
  xmax = c(1.0, 1.0, 1.0),
  ymin = c(0.0, 0.3, 0.4),
  ymax = c(0.3, 0.4, 1.0)
)

color = c("#0B0419", 	"#15082f", "#3b1687")

dist <- 0.05
x0 = rep(seq(0, 1, dist), 3)
y0 = rep(rect1$ymin, each = length(x0)/3)
r = rep(dist/2, length(x0))
c.color = rep(color, each = length(x0)/3)

circ <- data.frame(x0, y0, r, c.color)

fish <- here::here("icon", "fish-solid.svg")

df.fish <- data.frame(
  x = 0.45,
  y = 0.3,
  img = fish
)


ggplot() +
  geom_rect(data = rect1, 
            aes(xmin = xmin, 
                xmax = xmax, 
                ymin = ymin, 
                ymax = ymax),
            fill = color)  +
  geom_circle(data = circ, 
              aes(x0 = x0, 
                  y0 = y0,
                  r = r,
                  fill = c.color, 
                  color = c.color)) +
  scale_colour_identity() + 
  scale_fill_identity() +
  geom_curve(aes(x = 0.4, xend = 0.3, y = 0.35, yend = 0.2),
             curvature = 0.60,
             angle = 60, 
             color = color[3],
             size = 2) +
 # geom_icon(data = df.fish, 
 #            aes(x = x, y=y, icon = img),
 #            size= 0.5, angle=45,
 #            color = "#8593ab") +
  coord_fixed() + 
  coord_cartesian(xlim=c(0, 1), ylim=c(0, 1), expand = F)  +
  
  theme_void() +
  theme(legend.position = 'none') 
  