library(tidyverse)
library(partykit)
library(rpart)
# source("https://install-github.me/martin-borkovec/ggparty")
# library(ggparty)

datos <- read_csv("https://bit.ly/32eNwK2")

glimpse(datos)

set.seed(123)

datos <- datos %>% 
  mutate(in_sf = as.factor(in_sf)) %>% 
  sample_frac()

datos1 <- datos %>% 
  filter(row_number() <= 250)

datos2 <- datos %>% 
  filter(row_number() > 250)


# arbol 1 -----------------------------------------------------------------
# https://stats.stackexchange.com/questions/12140/conditional-inference-trees-vs-traditional-decision-trees
arbol1 <- ctree(in_sf ~ .,
                data = datos1,
                control = ctree_control())

plot(arbol1)

arbol1

predict(arbol1, type = "response")

predict(arbol1, newdata = datos2, type = "prob")

predict(arbol1, newdata = datos2, type = "response")

predict(arbol1, newdata = datos2, type = "node")

datos2 <- datos2 %>% 
  mutate(
    pred = predict(arbol1, newdata = datos2, type = "response"),
    nodo = predict(arbol1, newdata = datos2, type = "node")
    )

glimpse(datos2)

# como valido? 
# matriz de confusi?n
datos2_validacion <- datos2 %>% 
  count(in_sf, pred) %>% 
  mutate(p = n/sum(n))

datos2_validacion

saveRDS(arbol1, "data/mimodelo.rds")

# como se una un arbol en el futuro ---------------------------------------




# arbol 2 -----------------------------------------------------------------
arbol2 <- rpart(in_sf ~ ., data = datos1, control = rpart.control(cp = -1))

plot(arbol2)
text(arbol2)

predict(arbol2, type = "class")


# repliquemos graficos de: ------------------------------------------------
# https://attilagk.github.io/R-you-experienced/2017-10-17-classification.html

