make_montain <- function(ntop, size){
  sqnc <- seq(-(0.48*pi), 0.5*pi, by = 0.1)
  sino <- round(sin(sqnc), 2)
  mtx <- matrix(0,  length(sqnc), 2*ntop)
  dir <- 1
  for(i in 1:ncol(mtx)){
    mtx[,i] <- dir*sino
    dir <- -1*dir
  }
  
  seg_size <- rep(size, each = 2)
  
  for(i in 1:ncol(mtx)){
    mtx[,i] <- mtx[,i]*seg_size[i]
  }
  # resize vector
  rv <- matrix(c(2:ncol(mtx), 1), ncol = 2, byrow = T)
  
  
  for(k in 1:nrow(rv)){
    
    s1 <- rv[k,1]
    s2 <- rv[k,2]
    
    cur_diff <- diff(range(mtx[,s1]))
    new_diff <- diff(c(max(mtx[,s1]), min(mtx[,s2])))
    coeff <- abs(cur_diff/new_diff)
    seg_resized <- mtx[,s1]/coeff
    mtx[,s1] <- seg_resized + diff(c(min(seg_resized),  min(mtx[,s2]))) 
    
  }
  
  
  y <- as.numeric(mtx)
  
  x <- seq_along(y)/(max(seq_along(y))/2)
  y <- c(y, y[1])
  x <- c(x, x[1])
  
  #plot(x, y, type = "l")
  return(matrix(c(x,y), ncol = 2))
}



ntop <- 2
size <- c(1, 0.25)

pol <- make_montain(ntop, size)

st_pol <- st_polygon(list(pol))

mont <- st_sfc(st_pol)
mont$y <- pol[,"y"]

ggplot(mont) +
  geom_sf() +
  scale_fill_gradient(n.breaks = 10) +
  theme_void()
