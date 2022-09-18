# En un parque de diversiones, el dueño registra la hora de ingreso
# de los usuarios del parque y la información obtenida es:

usuarios <- c(7,8,12,14,16,8,7,14,12,15,18,17,18,12,7,8,14,16,12,12,12,13,14,15,14,9,10,17,9,12,14,15)

# Intepretación

# Se identifica el total de usuarios que tiene el arreglo
total_usuarios <- length(usuarios) # 32 

# Se almacena los valores unicos para recorrer valores únicos
valor_unico <- c(unique(usuarios))

# Ordenar el arreglo
valor_unico <- sort(valor_unico,decreasing = FALSE)

#Crear arreglo vacio
contar_usuarios <- list()

# Se recorre los valores únicos
for(i in valor_unico){
  contar_usuarios <- length(usuarios[usuarios==i])
}

valor_unico[5]
contar_usuarios[]
 

# formula
#length(usuarios[usuarios==7])
