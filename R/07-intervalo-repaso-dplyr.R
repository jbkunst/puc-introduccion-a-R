# pregunta 1 --------------------------------------------------------------
library(tidyverse)

# install.packages("babynames")
data("births", package = "babynames")

births

# R: 109 filas, 2 columnas numéricas


# pregunta 2 --------------------------------------------------------------
theme_set(theme_minimal())

ggplot(births) +
  geom_line(aes(year, births))

# source("https://install-github.me/tylermorganwall/rayshader")

births

births <- births %>% 
  mutate(decada = floor(year/10)*10)
  
births_decada <- births %>% 
  group_by(decada) %>% 
  summarise(total = sum(births), totaldecada = sum(decada)) %>% 
  arrange(total)
  
births %>% 
  mutate(decada = str_c(str_sub(year, 1, 3), 0))


# pregunta 3 --------------------------------------------------------------
data("babynames", package = "babynames")
glimpse(babynames)

babynames %>% 
  group_by(year) %>% 
  summarise(nacimientos = sum(n))



# intervalo ---------------------------------------------------------------
# CTRL+SHIFT+R
# satisfaccion poblacion
satis_pob <- c(2, 2, 3, 3, 3, 4, 5, 6, 7, 7, 7,
               8, 8, 8, 9, 9, 9, 10, 10, 10)

mean(satis_pob)

# ojo ojo oreja 
# el promedio no es necesariamente donde se CONCENTRAN
# los datos
pop_rara <- c(2,2,2,2,2,2,10,10,10,10,10, 10, 10)
mean(pop_rara)
hist(pop_rara)

pop_rara2 <- c(5,5,5,5,5,5,6,6,6,6,6,6,6, 6, 6)
mean(pop_rara2)

# muestra 1
muestra_1 <- c(2, 2, 3, 3, 3)

mean(muestra_1)
sd(muestra_1)

# el intervalo de confianza para mi muestra
t.test(muestra_1)


# muestra 2
muestra_2 <- c(9, 9, 10, 10, 10)

mean(muestra_2)
sd(muestra_2)

t.test(muestra_2)

# muestra 3, ponle un muestra aleatoria
set.seed(123)
muestra_3 <- sample(satis_pob, size = 5)
muestra_3

mean(muestra_3)
sd(muestra_3)

t.test(muestra_3)


# muestra 4, ponle mas money compadre
set.seed(111)
muestra_4 <- sample(satis_pob, size = 10)
muestra_4

mean(muestra_4)
sd(muestra_4)

t.test(muestra_4)


