#' Create random polygons for a given number of sides
#' 
#' Based on a number of sides, the function generates random points and order it 
#' to be used in ggplot with geom_polygon. The ordering of points ensure the 
#' polygon side will not overlap. 
#'
#' @param n_sides a integer with the number of sides of the polygon
#' @param option set the type of random sample. options are 'uniform' (default) or 'normal
#' @param seed insert a seed to permit reproduction. Default is NULL
#'
#' @return
#' @export
#'
#' @importFrom dplyr mutate select arrange
#'
#' @examples
random_poligon <- function(
  n_sides, 
  option = "uniform", # "normal",
  seed = NULL
){
  if(any(!option %in% c("uniform", "normal"))) stop(
    "option must be 'uniform' or 'normal'"
  )
  
  if(n_sides < 3) stop(
    "n_sides must be greater than 2"
  )
  
  if(option == "uniform"){
    if(!is.null(seed)) set.seed(seed)
    x <- sample(runif(100, 0, 5), n_sides)
    y <- sample(runif(100, 0, 5), n_sides) 
  }
 
  if(option == "normal"){
    if(!is.null(seed)) set.seed(seed)
    x <- sample(rnorm(100, 0, 5), n_sides)
    y <- sample(rnorm(100, 0, 5), n_sides) 
  }
  
  xm = mean(range(x))
  ym = mean(range(y))
  
    data.frame(x, y) %>% 
      dplyr::mutate(
      atan = atan2(y-ym, x-xm)
    )  %>% 
      dplyr::arrange(atan) %>% 
      dplyr::select(x, y)
}
  
  