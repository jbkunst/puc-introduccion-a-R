library(tidyverse)

N <- 20
n <- 5
set.seed(123)
x <- sample(1:10, size = N, replace = TRUE, prob = 1:10)
x <- sort(x)

data  <- data_frame(
  individuo = 1:N,
  satisfaccion = x
)

ggplot(data) +
  geom_point(aes(individuo, satisfaccion))

ggplot(data) +
  geom_histogram(aes(satisfaccion))

ggplot(data) +
  geom_point(aes(individuo, satisfaccion)) +
  # hline de Horizontal Lines
  geom_hline(aes(yintercept = mean(x)))



# obtener una muestra de tamaño 5

m1 <- sample(x, size = 5)
m1

m2 <- sample(x, size = 5)
m2


ggplot() +
  geom_point(aes(x = m1, y = 1)) +
  geom_point(aes(x = m2, y = 2))

