library(tidyverse)
library(ggmap)
library(ggforce)

url <- "http://datos.gob.cl/dataset/c2969d8a-df82-4a6c-a1f8-e5eba36af6cf/resource/cbd329c6-9fe6-4dc1-91e3-a99689fd0254/download/pcma20181017oficio-47702013.xlsx"
url

# descargamos
download.file(url, "archivo.xlsx", mode = "wb")

# leemos
datos <- readxl::read_excel("archivo.xlsx", sheet = "PCMA", skip = 10)

glimpse(datos)

datos <- datos %>% 
  mutate(
    LONGITUD = as.numeric(LONGITUD),
    LATITUD = as.numeric(LATITUD)
  )

datos

ggplot(datos, aes(LONGITUD, LATITUD)) +
  geom_point()

datoss <- datos %>% 
  summarise_at(vars(LONGITUD, LATITUD), list(min = min, max = max)) %>% 
  gather(k, v) %>% 
  mutate(name = c("left", "bottom", "right", "top"))
  
x <- set_names(datoss$v, datoss$name)  


a <- get_stamenmap(bbox = x, zoom = 12)

ggmap(a) +
  geom_density_2d(aes(LONGITUD, LATITUD), data = datos)

