library(tidyverse)
library(ggforce)
source("function/random_polygon.R")

cols <- c(
  red1 = "#c22626", 
  yellow = "#e1fd4b",
  #wine = "#65244b", 
  pink = "#c95e8f", 
  lightblue = "#268fc2")

n_pol <- 5
sides <- rep(5, n_pol)
set.seed(25) #25
seeds <- sample(1:2000, n_pol)

cols.rep <- rep(names(cols), 6)[sample(1:(length(cols)*6), length(cols)*6)]

df_pols <- 
  lapply(1:n_pol, function(i){
    
    deviate_x <- ifelse(rbernoulli(1), -1, 1) * runif(1, 0, 6)
    deviate_y <- ifelse(rbernoulli(1), -1, 1) * runif(1, 0, 2)
    
    random_poligon(sides[i], option = "normal", seed = seeds[i]) %>% 
      mutate(
        gr = i,
        fill = cols.rep[i], 
        x = x + deviate_x, 
        y = y + deviate_y) 
  }) %>% 
  bind_rows() 

#fig <- 
  ggplot(df_pols, aes(x, y, group = gr, fill = fill)) +
  geom_polygon(
    alpha = .5,
    color = NA,
    size = .1, 
    show.legend = F) +
 geom_link2(
   color = "grey92", 
   size = 1, 
   lineend = "round"
 ) +
  scale_fill_manual(values = cols) +
  theme_void() +
  theme(
    plot.background = element_rect(fill = "grey92", colour = NA)
  ) +
  coord_equal() 
    


#ggsave(
#  "output/gallery/r_polygon_1.png", 
#  fig, 
#  width = 6,
#  height = 6
#)  
