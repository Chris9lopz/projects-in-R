# Insercci?n de librerias
library(dplyr)
library(ggplot2)

# En un parque de diversiones, el due?o registra la hora de ingreso
# de los usuarios del parque y la informaci?n obtenida es:

usuarios <- c(7,8,12,14,16,8,7,14,12,15,18,17,18,12,7,8,14,16,12,12,12,13,14,15,14,9,10,17,9,12,14,15)

# Total de usuarios
total_usuarios <- length(usuarios) # 32 

# Se almacena los valores unicos para recorrer valores ?nicos
horarios <- c(unique(usuarios))

# Ordenar el arreglo
horarios <- sort(horarios,decreasing = FALSE)

#Crear arreglo vacio para lueg llenar los valores unicos
contar_usuarios <- c()

# Se recorre los valores ?nicos
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

# Creaci?n de variables acumuladoras
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
  
  # Condicionar los horarios de franja 16 a 18 hrs
  if(horario == "16 hrs" || horario == "17 hrs" || horario == "18 hrs"){
    suma_c <- suma_c + as.numeric(dataf$contar_usuarios[contar])
    contar <- contar + 1
  }
}
# Creaci?n de variables con calculo de tarifa para plan A
plan_a_hor1 <- suma_a * 20000
plan_a_hor2 <- suma_b * 30000
plan_a_hor3 <- suma_c * 10000

# Creaci?n de variables con calculo de tarifa para plan B
plan_b_hor1 <- suma_a * 20000
plan_b_hor2 <- suma_b * 15000
plan_b_hor3 <- suma_c * 20000

# Creaci?n de variables suma de totales por plan A y plan B
total_plan_a <- sum(plan_a_hor1,plan_a_hor2,plan_a_hor3)
total_plan_b <- sum(plan_b_hor1, plan_b_hor2, plan_b_hor3)

# Condiciona cual es el mejor plan e imprime en pantalla
if(total_plan_a > total_plan_b){
  print(paste("El plan que ganar?a m?s dinero ser?a el plan A con un total de", total_plan_a))
} else {
  print(paste("El plan que ganar?a m?s dinero ser?a el plan B con un total de", total_plan_b))
}

# Interpretaci?n

# EL numero mayor de ingreso de usuarios fue a las 12 hrs

# Grafica de barra
bar_total <- plot_ly(dataf,x=horarios,y=contar_usuarios, 
        name = "Total usuarios por horario",
        type = "bar",
        text = contar_usuarios,
        textposition = "auto",
        marker = list(color = 'rgb(158,202,225)',
                      line = list(color = 'rgb(8,48,107)', width = 1.5)))%>%
  layout(title = "Total de usuarios por horario", 
         xaxis = list(title = "Horarios"),
         yaxis = list(title = "Cantidad usuarios"))
bar_total

# El ingreso promedio fue de 2.9091
average <- mean(contar_usuarios)

# El ingreso max por horario fue de 7
max_user <- max(contar_usuarios)

# EL ingreso min por horario fue de 1
min_user <- min(contar_usuarios)

