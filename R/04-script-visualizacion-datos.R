# paquetes y datos --------------------------------------------------------
library(tidyverse)
library(gapminder)

data(gapminder)

gapminder

glimpse(gapminder)

View(gapminder)


# Ejemplo 1 ---------------------------------------------------------------
# P: ¿Antes de ejecutar, que hace la siguiente instruccion?
paises <- gapminder %>% 
  filter(year == max(year))
paises


ggplot(data = paises)


ggplot(data = paises) + 
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap))


ggplot(data = paises) + 
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap), color = "blue")


ggplot(data = paises) + 
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap, size = pop), color = "blue")


ggplot(data = paises) + 
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap, size = pop, color = continent))

ggplot(data = paises) + 
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap, size = pop)) +
  facet_wrap(vars(continent))


# Ejemplo 2: Existen MAS geoms --------------------------------------------
chile <- gapminder %>% 
  filter(country == "Chile")
chile

ggplot(data = chile)

# Tiene sentido?
ggplot(data = chile) +
  geom_point(aes(x = lifeExp, y = gdpPercap))

# ¿y si usamos otras variables?
ggplot(data = chile) +
  geom_point(aes(x = year, y = gdpPercap), size = 2)

# otro geom!
ggplot(data = chile) +
  geom_point(aes(x = year, y = gdpPercap), size = 2) +
  geom_line(aes(x = year, y = gdpPercap))



# Ejemplo 3: Yay! Ahora con todo el continente ----------------------------
# Repitamoslo con Ameira
america <- gapminder %>% 
  filter(continent == "America")
america

gapminder %>% 
  count(continent)

america <- gapminder %>% 
  filter(continent == "Americas")
america

ggplot(data = america) +
  geom_point(aes(x = year, y = gdpPercap), size = 2) +
  geom_line(aes(x = year, y = gdpPercap))
# P: ¿Esta bien segun lo que escribimos?

ggplot(data = america) +
  geom_line(aes(x = year, y = gdpPercap, group = country))


# Ejemplo 4: Los datos pueden venir de mas partes -------------------------
ggplot(data = chile) +
  geom_line(aes(x = year, y = gdpPercap, group = country), color = "red", size = 2)

# es igual a;
ggplot() +
  geom_line(aes(x = year, y = gdpPercap, group = country), color = "red", size = 2, data = chile)


# entonces
ggplot(data = america) +
  geom_line(aes(x = year, y = gdpPercap, group = country), color = "gray70") + 
  geom_line(aes(x = year, y = gdpPercap, group = country), color = "red", size = 2, data = chile)

# Customizacion -----------------------------------------------------------
ggplot(data = america) +
  geom_line(aes(x = year, y = gdpPercap, group = country), color = "gray90", size = 1.2, alpha = 0.5) + 
  geom_line(aes(x = year, y = gdpPercap, group = country), color = "red", size = 3, data = chile) + 
  theme_dark()



# Otros ejemplos ----------------------------------------------------------
library(scales) # esto es para la funcion comma
comma(123345567)

ggplot(paises) + 
  geom_point(aes(lifeExp, gdpPercap, size = pop, color = continent), alpha = 0.7) +
  scale_color_viridis_d(option = "A") + 
  scale_y_sqrt(name = "GDP per Capita", labels = comma, limits = c(NA, NA)) +
  scale_x_continuous(name = "Esperanza de vida", labels = comma, limits = c(NA, NA)) +
  scale_size(labels = comma, range = c(3, 10), breaks = c(100, 1000, 2000)*1e6) +
  labs(title = "Esperanza de vida y GDP per capita ") +
  theme_minimal()


continentes <- paises %>% 
  count(continent)
continentes

ggplot(continentes) +
  geom_col(aes(continent, n, fill = continent), width = 0.5) + 
  scale_fill_viridis_d(guide = FALSE) +
  labs(
    title = "Africa tiene más países que el resto de continentes",
    subtitle = "Un interesante subtitulo para contexto y dar detalles quizás puede ser\nmás largo pero quien soy yo para decir que se debe y lo que no",
    caption = "Importante mencionar la fuente, en caso contrario no me creen",
    x = "Contienentes",
    y = "Países"
  ) + 
  theme(plot.subtitle = element_text(size = 9))
