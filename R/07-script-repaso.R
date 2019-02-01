# paquetes ----------------------------------------------------------------
library(tidyverse)

data <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018-10-23/movie_profit.csv")

glimpse(data)

# contexto ----------------------------------------------------------------
# los datos 
# release_date	    : fecha de lanzamiento
# movie	            : titulo de la pelicula
# production_budget	: dinero gastado para crear la pelicula
# domestic_gross	  : Ganancias en Estados Unidos
# worldwide_gross	  : Ganancias en el mundo
# distributor	      : Compañìa que distribuye
# mpaa_rating	      : Rating para edad
# genre	            : Categorìa de la pelicula
