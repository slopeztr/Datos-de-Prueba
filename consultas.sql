USE datos;

-- Analisis de los de datos por medio de consultas SQL

-- 1. Distribución de la población por sexo

-- Esta consulta te dará la distribución de cuántas personas hay en la base de datos 
-- para cada sexo (por ejemplo, masculino, femenino). 
-- Es importante para entender la representatividad de cada género en la población analizada.

SELECT sexo, COUNT(*) AS cantidad
FROM poblacion
GROUP BY sexo;


-- 2. Promedio de ingresos mensuales por nivel educativo

-- Esta consulta proporciona el ingreso promedio para cada nivel educativo. 
-- Es relevante porque puedes analizar si a mayor nivel educativo corresponde un mayor ingreso,
-- lo cual es una tendencia común en muchos estudios económicos.

SELECT nivel_edu, AVG(ingreso_mensual) AS ingreso_promedio
FROM poblacion
GROUP BY nivel_edu
ORDER BY ingreso_promedio DESC;


-- 3. Promedio de años de escolaridad por nivel educativo

-- Aquí obtenemos el promedio de años de escolaridad para cada nivel educativo.
-- Sirve para verificar la consistencia de los datos (es decir, que los años de escolaridad aumenten con el nivel educativo) 
-- y para ver cuántos años, en promedio, le toma a una persona completar un determinado nivel educativo.

SELECT nivel_edu, AVG(anios_esc) AS promedio_anios_esc
FROM poblacion
GROUP BY nivel_edu
ORDER BY nivel_edu;


-- 4. Relación entre años de escolaridad y ingresos mensuales

-- Esta consulta muestra cómo varían los ingresos según los años de escolaridad. 
-- Un mayor número de años de escolaridad debería, en teoría, corresponder a un mayor ingreso. 
-- Esta consulta te permite comprobar si esa relación se cumple en la base de datos.

SELECT anios_esc, AVG(ingreso_mensual) AS ingreso_promedio
FROM poblacion
GROUP BY anios_esc
ORDER BY anios_esc;


-- 5. Desviación estándar de los ingresos por nivel educativo

-- La desviación estándar de los ingresos por nivel educativo es útil para entender la dispersión o 
-- variabilidad de los ingresos dentro de cada nivel educativo. 
-- Una desviación estándar alta puede indicar una gran desigualdad de ingresos dentro de ese grupo.

SELECT nivel_edu, STDDEV(ingreso_mensual) AS desviacion_ingreso
FROM poblacion
GROUP BY nivel_edu;


-- 6. Número de personas con ingresos por debajo de la línea de pobreza

-- Esta consulta te permite saber cuántas personas en la base de datos están por debajo de un umbral específico de ingresos, 
-- como la línea de pobreza. Es relevante para el análisis de la pobreza en la población.

SELECT COUNT(*) AS personas_bajo_pobreza
FROM poblacion
WHERE ingreso_mensual < 1100;


-- 7. Promedio de edad por nivel educativo

-- Muestra la edad promedio de las personas para cada nivel educativo. 
-- Esto puede ser útil para ver la relación entre la edad y el nivel educativo alcanzado. 
-- Por ejemplo, si hay un grupo que ha alcanzado niveles educativos altos a edades más tempranas.

SELECT nivel_edu, AVG(edad) AS promedio_edad
FROM poblacion
GROUP BY nivel_edu;


-- 8. Relación entre género y años de escolaridad

-- El promedio de años de escolaridad por género. 
-- Es útil para estudiar si hay disparidades de género en el acceso a la educación dentro de la población.

SELECT sexo, AVG(anios_esc) AS promedio_anios_esc
FROM poblacion
GROUP BY sexo;