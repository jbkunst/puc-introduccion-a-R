# Esto es una asignación
x <- c(23, 45, 12, 24)
mi_primer_valor_en_r <- c(12, 34, 34)

x
mi_primer_valor_en_r

plot(x)

# mi_rpimer_valor_en_erre
# esto es un comentario

# este es la magia que haré. 
# borrar la preguntar 7 por ...
# atte, joshua del pasado

# R no solo sirve para guardar
# datos. Sirve también como calculadora
6+7
6*7 + 4
(4 + 2 + 7)/3

# Es una buena práctica
# imprimir (ver que es el objeto)
# la variable que acabo de 
# crear/asignar
mis_notas <- c(4, 2, 7)
mis_notas

mean(mis_notas)

# siempre puedo complicarme :)
mi_promedio <- mean(mis_notas)
mi_promedio

mi_promedio2 <- sum(mis_notas)/3
mi_promedio2

# sigo complicandome :D
# puedo comparar cosas
mi_promedio > 4

# Nos acordamos del SI() 
# de excel <3 (</3)
ifelse(mi_promedio > 4, ":D", ":(")

# quiero ordenar mis notas :D
sort(mis_notas)

# hay funciones que me hacen
# una radiografia completa de un vector
summary(mis_notas)


# Otro año
mis_notas <- c(5,6,30,5,4,5,6,7,7,6,5,4,5,4,3,2)
# el mismo codigo


# P: Como puedor ordenar en 
# orden descendente?
# R: sort
sort(mis_notas)

# MR: sort, pero con otras _opciones_
# con otros argumentos
sort(mis_notas, decreasing = TRUE)

# P: Y si lo quiero con FALSE?
# R: Pongale FALSE
sort(mis_notas, decreasing = FALSE)

# P: Como saber como funciona una
# Función?
# R: Preguntando
# MR: De la forma ?funcion
?sort

# P: Como accedo a cierto elemento?
# Digamos, el 5to?
# R: Con la forma vector[5]
mis_notas
mis_notas[5]

# P: Cambiar un valor de un vector?
# Digamos, quiero corregir mi 5to 
# valor por uno mejor (shhhh)
# R: 
mis_notas[5] <- 7
mis_notas


