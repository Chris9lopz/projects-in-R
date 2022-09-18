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

#Crear arreglo vacio
contar_usuarios <- c()

# Se recorre los valores únicos
for(i in horarios){
  # Llenar arreglo 
  contar_usuarios <- append(contar_usuarios,length(usuarios[usuarios==i]))
}
# Agregar matrix los valores a una matrix
matrix <- cbind(horarios,contar_usuarios)

# Creamos tabla de los datos
dataf <- data.frame(matrix)

view(dataf)

