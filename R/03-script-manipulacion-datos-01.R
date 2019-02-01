# cargando paquetes -------------------------------------------------------
library(tidyverse)


# ejemplo de %>% ----------------------------------------------------------
# supongamos que deseo obtener el 
# la tangente de la raiz del coseno de 1

x <- 1
x


# opcion 1
tan(sqrt(cos(1)))

# opcion 2
y <- cos(1)
y

y <- sqrt(y)
y

y <- tan(y)
y


# opcion 3
# leer %>% como "luego aplico"
x %>% cos %>% sqrt %>% tan

# opcion 4
x %>% 
  cos %>% 
  sqrt %>% 
  tan

# Este simbolo se hace con CONTROL + SHIFT + M


# manipulacion de datos ---------------------------------------------------
# usaremos los datos que estan en
# https://raw.githubusercontent.com/rstudio/EDAWR/master/data-raw/storms.csv
# y
# https://raw.githubusercontent.com/rstudio/EDAWR/master/data-raw/pollution.csv


# cargar datos
storms <- read_csv("https://raw.githubusercontent.com/rstudio/EDAWR/master/data-raw/storms.csv")
storms


pollution <- read_csv("https://raw.githubusercontent.com/rstudio/EDAWR/master/data-raw/pollution.csv")
pollution

# filtrar
storms %>% 
  filter(wind > 100)

storms %>% 
  filter(storm == "Allison")

storms %>% 
  filter(storm %in% c("Alberto", "Ana"))


# filtra se puede componer condiciones
storms %>% 
  filter(wind < 80, pressure >= 1010)


# seleccionar
storms %>% 
  select(storm, pressure)


# seleccionar segun algun "patrón", por ejemplo todo lo que tenga "s"
storms %>% 
  select(contains("s"))


# seleccionar sirve para remover columnas 
storms %>% 
  select(-wind, -date)


# seleccionar sirve demás para reordenar columnas
storms

storms %>% 
  select(date, everything())


# arrange ordenar (columnas)
storms %>% 
  arrange(wind)


# arrange: sentido contrario
storms %>% 
  arrange(desc(pressure))


# mutar
storms %>% 
  mutate(ratio = pressure/wind, inverse = 1/ratio)


# mutar tambien sirve tanto para crear variables o reemplazar
storms %>% 
  mutate(
    wind = wind * 1000,
    storm = "Juanin"
  )


# summarize: resumir
pollution %>% 
  summarise(median = median(amount))


# summarize + group_by
pollution


pollution %>%
  group_by(city) %>% 
  summarise(
    promedio = median(amount), 
    suma = sum(amount),
    n = n()
  )

# ojo ojo! oreja, pestaña, lasaña!
pollution %>%
  summarise(promedio = median(amount))

pollution %>%
  group_by(size) %>% 
  summarise(promedio = median(amount))

pollution %>%
  group_by(size, city) %>% 
  summarise(promedio = median(amount))

 

# Recapiltulando ----------------------------------------------------------
# Donde está la ventaja de usar %>%

# Supongamos que de la tabla storm requerimos:
# 1. seleccionar tormentas que la columna wind sea menor que 40
# 2. que la presion sea mayor o igual que 1010
# 3. que debemos ordenarlas por fecha, segun que tan recientes fueron
# 4. para finalmente seleccioanr el nombre

storms %>% 
  filter(wind < 80) %>% 
  filter(pressure >= 1010) %>% 
  arrange(desc(date)) %>% 
  select(storm)

# o mejor!
select(arrange(filter(filter(storms, wind < 80), pressure >= 1010), desc(date)), storm)

# se puede hacer de muchas formas: niguna es la mejor!
resultado <- storms 
resultado

resultado <- resultado %>% 
  filter(wind < 80)
resultado

resultado <- resultado %>% 
  filter(pressure >= 1010)
resultado

resultado <- resultado %>% 
  arrange(desc(date))
resultado

resultado <- resultado %>% 
  select(storm)
resultado



# Ahora usted -------------------------------------------------------------
library(readxl)


# la url de los datos
url <- "http://datos.gob.cl/dataset/c2969d8a-df82-4a6c-a1f8-e5eba36af6cf/resource/cbd329c6-9fe6-4dc1-91e3-a99689fd0254/download/pcma20181017oficio-47702013.xlsx"
url

# descargamos
download.file(url, "archivo.xlsx", mode = "wb")


# leemos
datos <- read_excel("archivo.xlsx", sheet = "PCMA", skip = 10)

datos

glimpse(datos)

# ¿Cuatos registros y filas tiene la tabla?
# ¿Cual es la comuna con mas puntos BIP!?
# ¿Cual es la entidad/comuna menos repetida?
# ¿Cuantos centros BIP existen en La Florida?



