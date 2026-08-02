1. Transformaciones Realizadas y Orden del Flujo
El proceso en Power Query se ejecutó en el siguiente orden estricto:

- Renombrado de Columnas: Estandarización de nombres técnicos a un lenguaje descriptivo de negocio.
- Corrección de Tipos de Datos: Asignación adecuada a cada campo (fechas, monedas, enteros y texto).
- Limpieza de Nulos y Duplicados: Eliminación de filas repetidas, imputación lógica de nulos y normalización de texto.
- Separación de Tablas (Modelado): Desacoplamiento de la tabla plana en F_Ventas, d_Clientes y d_Productos.

2. Justificación de Tipos de Datos Elegidos
Identificadores (ID Operacion, ID Cliente, ID Producto) → Texto (Text):
Aunque contienen números, no son valores cuantitativos ni deben sumarse o promediarse. Definirlos como texto previene la pérdida de ceros a la izquierda y optimiza el almacenamiento.

Fechas (Fecha Venta, Fecha Alta Cliente) → Fecha (Date):
Se removió la hora (00:00:00) para reducir cardinalidad y permitir el uso de funciones DAX de Inteligencia de Tiempo (SAMEPERIODLASTYEAR, etc.).

Métricas Monetarias (Precio Unitario, Monto Total, Porcentaje Descuento) → Decimal:
Asegura precisión financiera en los cálculos y evita errores de redondeo.

Métricas de Volumen (Cantidad) → Número Entero:
Corresponde a unidades discretas de productos.

Atributos (Nombre Cliente, Ciudad, Canal Venta, etc.) → Texto (Text):
Campos categóricos y cualitativos para filtrado y segmentación.

3. Resolución de Nulos y Duplicados
Duplicados: Se eliminaron 48 filas idénticas en el dataset para evitar sobreestimar la facturación y los indicadores de venta.

Filas Vacías: Se descartaron 4 registros que no contenían ID Operacion ni datos transaccionales válidos.

Normalización de Texto: En Canal Venta, se aplicó formato tipo título (Capitalize Each Word) para unificar variantes como ONLINE, online u Online en categorías únicas.

4. Criterio de Separación: Clientes, Productos y Ventas
Guardar los datos descriptivos del cliente y del producto en cada fila de venta genera redundancia de información (el mismo nombre, dirección o descripción de producto repetidos en cientos de filas). Para optimizar el rendimiento y normalizar el modelo, se separó la base en tres tablas:

D_Cliente (Tabla de Dimensión - Cliente):
Contiene únicamente los atributos del perfil del cliente (ID Cliente, Nombre Cliente, Email, Telefono, Ciudad, Provincia, Segmento Cliente, Estado Cliente, Fecha Alta Cliente).
Se aplicó Quitar Duplicados sobre ID Cliente para garantizar 119 registros únicos (Clave Primaria / PK).

D_Producto (Tabla de Dimensión - Producto):
Contiene los atributos únicos del catálogo de productos (ID Producto, Producto, Categoria Producto, precio).
Se aplicó Quitar Duplicados sobre ID Producto para mantener únicamente la lista maestra de productos (Clave Primaria / PK).

F_Ventas (Tabla de Hechos - Transacciones):
Contiene únicamente los datos propios de cada operación transaccional (ID Operacion, Fecha Venta, Cantidad, Porcentaje Descuento, Monto Total, Moneda, Canal Venta).
Mantiene únicamente las claves de conexión: ID Cliente y ID Producto como Claves Foráneas (FK).
