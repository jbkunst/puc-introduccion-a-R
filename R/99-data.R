library(tidyverse)
range01 <- function(x){(x-min(x))/(max(x)-min(x))}


# alumnos -----------------------------------------------------------------
set.seed(1)
N <- 3000
x <- rnorm(N)
m <- -0.5555556
b <- 8.3333333
y <- m * x + b + rnorm(length(x))
plot(x, y, col="gray", pch=20, asp=1)
fit <- lm(y ~ x)
abline(fit, lty=2, lwd=2)


confounded_data_frame <- function(x, y, m, num_grp){
  b <- 0 # intercept doesn't matter
  d <- point_line_distance(b, m, x, y)
  d_scaled <- 0.0005 + 0.999 * (d - min(d))/(max(d) - min(d)) # avoid 0 and 1
  data.frame(x=x, y=y, 
             group=as.factor(sprintf("grp%02d", ceiling(num_grp*(d_scaled)))))
}

find_group_coefficients <- function(data){
  coef <- t(sapply(levels(data$group), 
                   function(grp) coefficients(lm(y ~ x, data=data[data$group==grp,]))))
  coef[!is.na(coef[,1]) & ! is.na(coef[,2]),]
}

striped_scatterplot <- function(formula, grouped_data){
  # blue on top and red on bottom, to match the Wikipedia figure
  colors <- rev(rainbow(length(levels(grouped_data$group)), end=2/3))
  plot(formula, grouped_data, bg=colors[grouped_data$group], pch=21, asp=1)
  grp_coef <- find_group_coefficients(grouped_data)
  # if some coefficents get dropped, colors won't match exactly
  for (r in 1:nrow(grp_coef)) 
    abline(grp_coef[r,1], grp_coef[r,2], col=colors[r], lwd=2)
}

point_line_distance <- function(b, m, x, y)
  (y - (m*x + b))/sqrt(m^2 + 1)

m_new <- 1 # the new coefficient we want x to have
cdf <- confounded_data_frame(x, y, m_new, num_grp=5) # see function below
striped_scatterplot(y ~ x, cdf) # also see below
graphics.off()

data <- cdf %>% 
  tbl_df() %>% 
  mutate(
    x = round(range01(x) * 100, 2),
    y = round(range01(y) * 50 + 30, 2)
  ) %>% 
  rename(dificultad = x, satisfaccion = y, grupo = group) 

ggplot(data) +
  geom_point(aes(dificultad, satisfaccion), alpha = 0.5)

writexl::write_xlsx(data, "data/alumnos.xlsx")

alumnos <- read_csv("https://goo.gl/Wy3GsU")


# temperatura -------------------------------------------------------------
temp <- read_csv("https://raw.githubusercontent.com/hrbrmstr/hadcrut/master/data/temps.csv")

write_csv(temp, "data/temperatura.csv")

temperatura <- read_csv("https://docs.google.com/spreadsheets/u/0/d/1dFEFGKBIBBNjoejtFhthn_k9UTiGYhkDiy383fcdRvU/export?format=csv&id=1dFEFGKBIBBNjoejtFhthn_k9UTiGYhkDiy383fcdRvU&gid=0")
temperatura <- read_csv("https://goo.gl/3JUCma")
temperatura