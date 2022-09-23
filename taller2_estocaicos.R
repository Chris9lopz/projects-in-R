# Insercción de librerias
library(dplyr)
library(ggplot2)

# En un parque de diversiones, el dueño registra la hora de ingreso
# de los usuarios del parque y la información obtenida es:

usuarios <- c(7,8,12,14,16,8,7,14,12,15,18,17,18,12,7,8,14,16,12,12,12,13,14,15,14,9,10,17,9,12,14,15)

# Intepretación

# Total de usuarios
total_usuarios <- length(usuarios) # 32 

# Se almacena los valores unicos para recorrer valores únicos
horarios <- c(unique(usuarios))

# Ordenar el arreglo
horarios <- sort(horarios,decreasing = FALSE)

#Crear arreglo vacio para lueg llenar los valores unicos
contar_usuarios <- c()

# Se recorre los valores únicos
for(i in horarios){
  # Llenar arreglo 
  contar_usuarios <- append(contar_usuarios,length(usuarios[usuarios==i]))
}
# Convertir variable horarios a caracter con concat de hr
horarios <- paste(as.character(horarios), "hrs")

# Agregar matrix los valores a una matrix
matrix <- cbind(horarios,contar_usuarios)

# Creamos tabla de los datos
dataf <- data.frame(matrix)

# Creación de variables acumuladoras
suma_a <- 0
suma_b <- 0
suma_c <- 0
contar <- 1 # Variable de recorrido a las posiciones de campo contar usuario

# Recorrido de cada horario
for(horario in dataf$horarios){
  
  # Condicionar los horarios de franja 7 a 10 hrs
  if(horario == "7 hrs" || horario == "8 hrs" || horario == "9 hrs" || horario == "10 hrs"){
    suma_a <- suma_a + as.numeric(dataf$contar_usuarios[contar])
    contar <- contar + 1
  }
 
   # Condicionar los horarios de franja 11 a 15 hrs
  if(horario == "11 hrs" || horario == "12 hrs" || horario == "13 hrs" || horario == "14 hrs" || horario == "15 hrs"){
    suma_b <- suma_b + as.numeric(dataf$contar_usuarios[contar])
    contar <- contar + 1
  }
  
  # COndicionar los horarios de franja 16 a 18 hrs
  if(horario == "16 hrs" || horario == "17 hrs" || horario == "18 hrs"){
    suma_c <- suma_c + as.numeric(dataf$contar_usuarios[contar])
    contar <- contar + 1
  }
}
# Creacion de variables con calculo de tarifa para plan A
plan_a_hor1 <- suma_a * 20000
plan_a_hor2 <- suma_b * 30000
plan_a_hor3 <- suma_c * 10000

# Creacion de variables con calculo de tarifa para plan B
plan_b_hor1 <- suma_a * 20000
plan_b_hor2 <- suma_b * 15000
plan_b_hor3 <- suma_c * 20000

# Creación de variables suma de totales por plan A y plan B
total_plan_a <- sum(plan_a_hor1,plan_a_hor2,plan_a_hor3)
total_plan_b <- sum(plan_b_hor1, plan_b_hor2, plan_b_hor3)

# Condiciona cual es el mejor plan e imprime en pantalla
if(total_plan_a > total_plan_b){
  print(paste("El plan que ganaría más dinero sería el plan A con un total de", total_plan_a))
} else {
  print(paste("El plan que ganaría más dinero sería el plan B con un total de", total_plan_b))
}


