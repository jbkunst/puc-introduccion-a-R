# paquetes ----------------------------------------------------------------
library(tidyverse)

# data --------------------------------------------------------------------
songs <- read_csv("https://raw.githubusercontent.com/rstudio/EDAWR/master/data-raw/songs.csv")
songs

artists <- read_csv("https://raw.githubusercontent.com/rstudio/EDAWR/master/data-raw/artists.csv")
artists


# joins -------------------------------------------------------------------
left_join(songs, artists, by = "name")


left_join(songs, artists)

semi_join(songs, artists, by = "name")

anti_join(songs, artists, by = "name")


# spread & gather ---------------------------------------------------------
data("table4a")
table4a

data("table2")
table2



# ejercicio 1
# calcular valores promedio por pais de la tabla table4a
table4a

table4a %>% 
  mutate(promedio = (`1999` + `2000`)/2)

gather(table4a, `1999`, `2000`, key = "year", value = "cases")

table4ag <- gather(table4a, `1999`, `2000`, key = "year", value = "cases")
table4ag

table4ag %>% 
  group_by(country) %>% 
  summarise(promedio = mean(cases))

# ejercicio 2
# obtenga el promedio de casos (columna cases) por pais de la tabla table2
table2

spread(table2, type, count)

table2s <- spread(table2, type, count)
table2s

table4ag %>% 
  group_by(country) %>% 
  summarise(promedio = mean(cases))


# existen muchas formas
table2 %>% 
  filter(type == "cases") %>% 
  group_by(country) %>% 
  summarise(promedio = mean(count))
