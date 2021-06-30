library(magick)
library(ggplot2)

mont.img <- image_read(here::here("output", "mont.png")) %>% 
  image_fill(color = "white", point = "+10+10", fuzz = 50) %>% 
  image_fill(color = 'transparent', point = "+750+1000", fuzz = 50) 


plot(mont.img)

cols <- c("#aed4c0", "#5ac18e", "#065535")

l.data <- list(c(10,10,10), 
               c(12,9,9), 
               c(15,6,9), 
               c(20,5,5), 
               c(18,7,5), 
               c(18,5,7), 
               c(13,7,10),
               c(10,9,11),
               c(8,12,10))

img <- image_graph(500, 300, res = 96)

out <- lapply(l.data, function(data){
  data.df <- data.frame(x = rep('a', 3), y = data, c = letters[1:3])
  
  change.plot <- 
    ggplot(data.df, aes(x = x, y = y, fill = c)) +
    geom_col(position = "stack", show.legend = F, width = 100) +
    scale_fill_manual(values = cols)+
    theme_void() +
    annotation_raster(mont.img, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf)
  print(change.plot)
})
dev.off()
animation <- image_animate(img, fps = 1, optimize = TRUE)
print(animation)
