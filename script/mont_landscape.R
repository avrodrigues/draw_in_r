library(grid)

set.seed(1985)
x <- sapply(1:5, function(i){
  x <- seq(0, 1, by = 0.1)
  x <- sample(x, 8)
  x <- x[order(x)]
  x
})

y <- sapply(5:1, function(i){
  alt <- log10(i) 
  c(0, rnorm(6, alt, 0.15), 0)
  
  })

greens <- c("#4da23c",
            "#85a03d",
            "#8ba069",
            "#67ae71",
            "#4ad37a",
            "#a8ca4d",
            "#81d368",
            "#add590")

sun.col <- c("#f9b222",
             "#f29d31",
             "#eeb326")

fundo.col <- c("#44a2d4",
               "#3895ac",
               "#339e3f",
               "#37a625")




mont <- polygonGrob(x=(x[,4]+0.1)*0.89, 
                    y=(y[,4]+0.3)*0.89,
                    gp=gpar(fill = greens[2],
                            col = greens[1]))


sol <- circleGrob(x = rep(0.75, 3), 
                  y= rep(0.6, 3),
                  r = c(0.15, 0.08, 0.05),
                  gp = gpar(fill = sun.col[3:1],
                         col = NA, 
                         alpha = c(0.6, 0.8, 1)))


fundo <- rectGrob(x = rep(0.5,4), 
                  y=c(0.1, 0.6, 0.8, 0.9), 
                  gp = gpar(fill = fundo.col[4:1],
                            col = NA))

png(here::here("output", "montain_ladscape.png"), 600, 400)
grid.newpage()
grid.draw(fundo)
grid.draw(sol)
grid.draw(mont)
dev.off()

