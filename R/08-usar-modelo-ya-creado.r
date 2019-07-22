library(tidyverse)
library(partykit)

nuevosdatos <- read_csv("https://bit.ly/32eNwK2")

nuevosdatos <- nuevosdatos %>% 
  select(-in_sf)

glimpse(nuevosdatos)

nuestro_arbol <- readRDS("data/mimodelo.rds")

nuestro_arbol

plot(nuestro_arbol)

nuevosdatos <- nuevosdatos %>% 
  mutate(
    prediccion = predict(nuestro_arbol,
                         newdata = nuevosdatos,
                         type = "response")
  )


glimpse(nuevosdatos)
