¿Qué hace exactamente el bloque let...in en lenguaje M? ¿Por qué cada paso puede referenciar al anterior?
• El bloque let declara secuencialmente los pasos de transformación (variables) y el bloque in indica cuál de esos pasos será el resultado devuelto por la consulta.
• Cada paso puede referenciar al anterior porque en M las tablas son inmutables: cada línea toma la tabla generada en el paso previo, le aplica una función y genera una nueva versión, creando una cadena lineal de dependencias.

¿Por qué M es Case Sensitive y qué consecuencia práctica tiene? Dá un ejemplo de un error que esto puede causar.
• M distingue estrictamente entre mayúsculas y minúsculas en funciones, variables y columnas.
• Ignorarlo rompe la ejecución de la consulta. Por ejemplo, escribir table.selectrows en minúsculas en lugar de Table.SelectRows causa el error: Expression.Error: The name 'table.selectrows' wasn't recognized.

¿Cuál es la diferencia entre usar Text.Trim y Text.Clean en M?
• Text.Trim: Elimina espacios en blanco tradicionales (" ") al inicio y al final de un texto.
• Text.Clean: Elimina caracteres invisibles de control no imprimibles (como saltos de línea \n o tabulaciones \t).

¿Por qué filtraste los registros "PRUEBA" después de estandarizar la categoría y no antes?
• Al ser M Case Sensitive, evaluar [categoria] <> "Prueba" antes de estandarizar no habría eliminado el texto original "PRUEBA" (en mayúsculas) por no ser una coincidencia exacta.
• Aplicar primero Text.Proper convirtió "PRUEBA" en "Prueba", garantizando que el filtro posterior lo reconociera y eliminara correctamente.
