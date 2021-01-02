library(sf)
library(ggplot2)

mont.pt <- c(0.0, 0.0,
             0.4, 2.2,
             0.5, 2.3,
             0.6, 2.55,
             0.7, 2.6,
             1.1, 2.7,
             1.5, 3.0,
             1.6, 3.1,
             2.1, 5.0,
             2.2, 5.5,
             4.0, 8.0,
             4.7, 9.5,
             5.1, 10.0,
             5.6, 9.5,
             6.0, 8.0,
             6.2, 6.2,
             6.5, 6.0,
             7.0, 5.3,
             7.8, 3.3,
             7.9, 3.1,
             8.0, 3.0,
             8.1, 3.05,
             8.3, 3.15,
             9.5, 6.0,
             9.7, 6.2,
             10.05, 6.1,
             10.2, 6.0,
             11.0, 3.5,
             12.0, 2.5,
             12.1, 2.45,
             12.3, 2.2,
             12.7, 1.2,
             12.9, 0.6,
             13.0, 0.0,
             0.0, 0.0)

mont.mtx <- matrix(mont.pt, ncol = 2, byrow = T)

montain <- st_sfc(st_polygon(list(mont.mtx)))
bbox <- st_bbox(montain)

bbox[c(2,4)] <- c(0,2)
mont.slc1 <- st_crop(montain, bbox)

bbox[c(2,4)] <- c(2,4)
mont.slc2 <- st_crop(montain, bbox)

bbox[c(2,4)] <- c(4,6)
mont.slc3 <- st_crop(montain, bbox)

bbox[c(2,4)] <- c(6,8)
mont.slc4 <- st_crop(montain, bbox)

bbox[c(2,4)] <- c(8,10)
mont.slc5 <- st_crop(montain, bbox)

sf_bondary(montain)


ggplot(data = mont.slc1) +
  geom_sf(fill = "red", colour = NA) +
  geom_sf(data = mont.slc2, fill = "blue", colour = NA) +
  geom_sf(data = mont.slc3) +
  geom_sf(data = mont.slc4) +
  geom_sf(data = mont.slc5) + 
  geom_sf(data = st_boundary(montain)) + 
  theme_void()

