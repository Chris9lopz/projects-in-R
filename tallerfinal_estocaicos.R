##Intervalo de confiaza
##con respecto al tiempo se tiene los siguiente datos:

#se halla las estimaciones puntuales
tiempo=c(71.37,66.62,73.23,102.89,71.71,98.35,86.44,69.65,98.68,118.44,118.67,95.55,93.01,65.85,63.45,103.71,79.97,41.07,94.2,118.17,86.01,114.22,101.24,98.71,102.97)
n=length(tiempo)
promedio=mean(tiempo)
varianza=var(tiempo)
Desv.E=sd(tiempo)

##Calcule el intervalo de confianza para estos datos, con un nivel de confianza del 92%. n<30 --> t-student
alpha=0.08
cuantil=qt(alpha/2,n-1,lower.tail =FALSE)
cuantil
limite.inferior=promedio-cuantil*Desv.E/(sqrt(n))
limite.inferior
limite.superior=promedio+cuantil*Desv.E/(sqrt(n))
limite.superior

##intervalo de confianza para un 92% es 82.03 a 96.70, el 92% de las veces van a demorar en promedio este tiempo
## de activida fisica
intervalo=c(limite.inferior,limite.superior)
intervalo

# 4. Para hacer un control de calidad se observó una muestra aleatoria de 730 tuercas 
# resultando defectuosos 77 de ellos. Encuentre un intervalo de confianza para la proporción 
# de tuercas defectuosas en el conjunto de producción con 95% de confianza.

tuercas <- 730
tuercas_defectuosas <- 77
z_interv <- 1.96

p <- round((tuercas_defectuosas / tuercas),2)

total_intervalo <- z_interv * sqrt((p * (1 - p))/tuercas)

neg_int <- round((p - total_intervalo),3)
pos_int <- round((p + total_intervalo),3)

# Resultado
# En intervalo de confianza se encuentra comprendido desde 0.087 a 0.133