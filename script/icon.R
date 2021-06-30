# logo 

library(ggplot2)

pol1 <- data.frame(
  x = c(1, 2, 4, 3, 1, 5, 6, 8, 7, 5),
  y = c(1, 1, 5, 5, 1, 1, 1, 5, 5, 1),
  id = rep(1:2, each = 5)
)

pol2 <- data.frame(
  x = c(5, 6, 4, 3, 5),
  y = c(1, 1, 5, 5, 1)
)

# dark version

color <- "grey10" # "#006890"
bg.col <- "transparent"

AV_dark <- 
ggplot() +
  geom_polygon(data = pol1, aes(x, y, group = id), 
               fill = bg.col, color = color, size = 1.5) +
  geom_polygon(data = pol2, aes(x, y), 
               fill = color, color = color, size = 1.5) +
  coord_fixed() +
  theme_void() +
  theme(plot.background = element_rect(fill = bg.col, color = NA))



ggsave("AV_dark.svg", 
       AV_dark, 
       height = 2,
       width = 2, bg = "transparent")
ggsave("AV_light.png", 
       AV_light, 
       height = 2,
       width = 2, bg = "transparent")

# light version
color <- "grey90" # "#006890"
bg.col <- "transparent"

AV_light <- 
  ggplot() +
  geom_polygon(data = pol1, aes(x, y, group = id), 
               fill = bg.col, color = color, size = 1.5) +
  geom_polygon(data = pol2, aes(x, y), 
               fill = color, color = color, size = 1.5) +
  coord_fixed() +
  theme_void() +
  theme(plot.background = element_rect(fill = bg.col, color = NA))

ggsave("AV_light.svg", 
       AV_light, 
       height = 2,
       width = 2, bg = "transparent")
ggsave("AV_light.png", 
       AV_light, 
       height = 2,
       width = 2, bg = "transparent")

### some circles and logo sign

library(ggimage)
library(magick)
library(ggforce)
library(cowplot)

x0 = c(1,5,2)
y0 = c(1,2,1)
r = c(2,4,6)
c.color = c("#661919", "#ffd700", "#004c00")
circ <- data.frame(x0, y0, r, c.color)


av <- data.frame(x = 9,
                 y = -5,
                 img = here::here("AV_dark.svg"))

some_circles <- 
ggplot() +
  geom_circle(data = circ, 
              aes(x0 = x0, 
                  y0 = y0,
                  r = r,
                  fill = c.color), 
                  color = NA, 
              alpha = 0.5, show.legend = F)+
  scale_fill_manual(values = c.color) +
  coord_equal() +
  theme_void() +
  theme(plot.background = element_rect(fill = "grey90", color = NA))+
  geom_image(data = av, size = 0.03,
            aes(x = x, y=y, image = img)) 

p <- 
ggdraw(some_circles) + theme(plot.background = element_rect(fill = "grey90", color = NA))

ggsave("some_circles.png", 
       p,
       height = 5,
       width = 5, bg = bg.col)

