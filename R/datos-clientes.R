library(tidyverse)


clientes_ori <- read_csv("https://raw.githubusercontent.com/jbkunst/riskr/master/data/credit.csv")

glimpse(clientes_ori)

# clientes_ori <- mutate_if(clientes_ori, is.character, as.factor)

count(clientes_ori, bad)

# partykit::ctree(bad ~ ., data = clientes_ori, control = partykit::ctree_control(maxdepth = 4)) %>% 
#   plot()

clientes <- clientes_ori %>% 
  mutate(
    personal_net_income = 1.5 * personal_net_income * 1000,
    id_client = id_client * 500 + 1000000
  ) %>% 
  rename(
    rut_cliente = id_client,
    malo_en_los_12m = bad,
    # genero = sex,
    cantidad_tarjetas_credito = quant_add_cards,
    ingreso = personal_net_income,
    edad = age,
    meses_en_su_actual_trabajo = months_in_the_job,
    memes_en_su_actual_residencia = months_in_residence
  ) %>%
  select(
    rut_cliente,
    malo_en_los_12m,
    # genero,
    cantidad_tarjetas_credito,
    ingreso,
    edad,
    meses_en_su_actual_trabajo,
    # memes_en_su_actual_residencia,
  ) %>% 
  glimpse()

clientes <- clientes %>% 
  filter(quantile(ingreso, .05) <= ingreso, ingreso <= quantile(ingreso, .95)) %>% 
  filter(quantile(edad   , .05) <= edad   , edad    <= quantile(edad   , .95)) %>% 
  filter(
    quantile(meses_en_su_actual_trabajo, .05) <= meses_en_su_actual_trabajo,
    meses_en_su_actual_trabajo <= quantile(meses_en_su_actual_trabajo   , .95)) 

clientes %>% 
  count(malo_en_los_12m)

# set.seed(123)
# clientes <- clientes %>% 
#   group_by(malo_en_los_12m) %>% 
#   sample_n(8000)

clientes %>% 
  group_by(cantidad_tarjetas_credito) %>% 
  summarise(
    n = n(),
    br = mean(malo_en_los_12m)
  )

write_csv(clientes %>% select(-edad),                                "data/clientes.csv")

set.seed(123)
write_csv(clientes %>% select(rut_cliente, edad) %>% sample_frac(1), "data/clientes-edad.csv")

set.seed(123)

clientes %>% 
  mutate(aux = ggplot2::cut_number(edad, 5)) %>% 
  group_by(aux) %>% 
  sample_n(1) %>% 
  select(-aux) %>% 
  write_csv("data/clientes-nuevos.csv")


tree <- partykit::ctree(factor(malo_en_los_12m) ~ ., data = clientes)
plot(tree)

predict(tree, clientes_nuevos)
predict(tree, clientes_nuevos, type = "prob")
predict(tree, clientes_nuevos, type = "node")
