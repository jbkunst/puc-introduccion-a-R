#' --- 
#' title: Clase Práctica
#' output:
#'   pdf_document:
#'     toc: false
#' ---

#+ echo = FALSE, message = FALSE, warning = FALSE
knitr::opts_chunk$set(message = FALSE, warning = FALSE)
#'
#' ## Pregunta 0
#' 
#' Necesitaremos algunos paquetes para trabajar. Instale los siguientes
#' paquetes: babynames, nycflights13, maps y carguelos (con `library`) junto 
#' al tidyverse.0
#' 
#' ## Pregunta 1
#' 
#' Considere, la tabla `births` del paquete `babynames`. Esto es:
#' 
library(tidyverse)

data("births", package = "babynames")
births

#' ¿Cuántas columnas y filas posee la tabla _births_?
#' 
#' ## Pregunta 2
#' 
#' Considere, la tabla `births` del paquete `babynames`. Estudie los 
#' nacimientos por años en EE.UU:
theme_set(theme_minimal())

ggplot(births) +
  geom_line(aes(year, births)) 

#' ¿En que _decada_ se obtuvo la menor cantidad de nacimientos?
#' 
#' ## Pregunta 3
#' 
#' Considerando ahora la tabla `babynames` del paquete `babynames`:
data("babynames", package = "babynames")
glimpse(babynames)

#' Una tabla con cinco variables: año, sexo, nombre, n y prop 
#' (n dividido por el número total de solicitantes en ese año, 
#' lo que significa que las proporciones son de personas de ese género
#' con ese nombre nacido en ese año).
#'  
#' Realice el proceso necesario para obtener la misma estructura en cuanto
#' a _columnas_ que la tabla `births`. 
#' 
#' ## Pregunta 4
#' 
#' Genere un data frame partiendo de la tabla babyanes `babynames` y conteniendo
#' los nacimientos de personas de género femenino con el nombre _Nala_, _Ariel_
#' y _Elsa_ desde los años 1980 en adelante. 
#' 
#' ## Pregunta 5
#' 
#' Con el data frame obtenido en la pregunta anterior genere un gráfico que 
#' contenga la información de los nacimientos por año de cada uno de los
#' nombres mencionados y __mencione__ una hipótesis/suposición al respecto de lo 
#' observado.
#' 
#' hint: Use `facet_wrap(~ name, scales = "free_y")`.
#' 
#' ## Pregunta 6
#' 
#' Utilizando la tablas `airports` (aeropuertos) y `flights` (vuelos) 
#' del paquete `nycflights13` obtenga una tabla que contenga conteos de vuelos
#' según su destino `dest` además de la longitud y latidud del aeropuerto (de destino).
#' 
#' ## Pregunta 7
#' 
#' Apoyándose del siguiente gráfico
us <- map_data("state")

glimpse(us)

ggmap <- ggplot() +
  geom_polygon(data = us, aes(long, lat, group = group), 
               alpha = 0.25) +
  coord_fixed() # esto es para mantener la razón 1:1

ggmap

#' Agregue una capa de de puntos ubicando los aeropuertos obtenidos de la pregunta
#' anterior y usando además: `aes(size = la_cantidad_de_vuelos_a_dicho_aeropuerto)`.
#' 
#' ## Pregunta 8
#' 
#' A la izquiera del gráfico anterior se observan 2 puntos. Genere el/los pasos
#' necesarios para seleccionarlos usando la tabla resultante de la pregunta 5
#' para identificar los nombres de dichos areopuertos y responda ¿Dónde están?
#' ¿Que gracias tienen?
#' 
#' ## Pregunta 9
#' 
#' Volviendo con `babynames`. Encuentre/invente/estudie alguna forma de detectar series
#' de nombres que presenten anomalías o comportamientos _llamativos_.
