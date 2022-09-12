#Libreria
library(tidyverse)

# Función creadora de conjuntos
separadorNombre <- function(texto){
  texto <- str_to_lower(texto) # Toma el texto en minuscula
  vector_texto <- c() # Creación de vector vacío
  # Empieza recorrido de variable texto
  for(i in 1:nchar(texto)){
    # Extraer las letras del nombre
    extraer_letra <- str_sub(texto,i,i)
    # Agregar letras extraídas a un nuevo vector
    vector_texto <- append(vector_texto,extraer_letra,length(vector_texto))
  }
  # Eliminar duplicados
  vector_texto <- unique(vector_texto)
  # Retorno de función
  return (vector_texto)
}

conjunto_a <- separadorNombre("Cuenca") # Asignación de conjunto apellido
conjunto_b <- separadorNombre("Andrea") # Asignación de conjunto nombre
conjunto_c <- c() # Asignación de conjunto vocal (nombre completo)

# Crear unico vector con nombre y apellido
nombre_completo <- c(rbind(conjunto_a,conjunto_b))
# Recorrer elementos nombre_completo
for(i in 1:length(nombre_completo)){
  # Buscar de cada elemento la vocal
  if(nombre_completo[i] == "a" | nombre_completo[i] == "e" | nombre_completo[i] =="i" | nombre_completo[i] =="o" | nombre_completo[i] =="u"){
    conjunto_c <- append(conjunto_c,nombre_completo[i],length(conjunto_c))
  }
}
# Eliminar duplicados de vocales
conjunto_c <- unique(conjunto_c)

# OPERACIONES DE CONJUNTOS -- PARTE 2

punto_1 <- setdiff(union(conjunto_a,conjunto_b),conjunto_a)
punto_2 <- setdiff(union(conjunto_a,conjunto_b),conjunto_b)
punto_3 <- union(intersect(conjunto_a,conjunto_b),setdiff(union(conjunto_a,conjunto_b),conjunto_c))
punto_4 <- union(conjunto_a,setdiff(union(conjunto_a,conjunto_c),conjunto_b))
punto_5 <- union(setdiff(union(conjunto_b,conjunto_c),conjunto_a),conjunto_b)

