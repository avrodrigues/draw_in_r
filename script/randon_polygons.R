## polygons
library(tidyverse)
source("function/random_polygon.R")

cols <- c(
  green = "#5AC18E", 
  pink = "#F08080", 
  yellow = "#daa520", 
  blue = "#09a2bd")

n_pol <- 4
sides <- rep(4, n_pol)
set.seed(6) #6 - 601
seeds <- sample(1:2000, n_pol)

cols.rep <- rep(names(cols), 6)[sample(1:(length(cols)*6), length(cols)*6)]

df_pols <- 
lapply(1:n_pol, function(i){
  random_poligon(sides[i], option = "uniform", seed = seeds[i]) %>% 
    mutate(gr = i, fill = cols.rep[i])
}) %>% 
  bind_rows() 

fig <- 
ggplot(df_pols, aes(x, y, group = gr, fill = fill)) +
  geom_polygon(
    alpha = .7,
    color = "white",
    size = 1, 
    show.legend = F) +
  scale_fill_manual(values = cols) +
  theme_void() +
  theme(
    plot.background = element_rect(fill = "#3a2015")
  )


ggsave(
  "r_polygon_1.png", 
  fig, 
  width = 6,
  height = 6
)  


