# 🛒 RetailPro — Análisis Comercial & Modelado de Datos en SQL

Bienvenido al repositorio oficial del proyecto **RetailPro**, desarrollado en el marco del programa de **Data Analytics**. Este proyecto abarca la exploración, limpieza, transformación, unión de tablas relacionales y preparación de vistas SQL optimizadas para alimentar paneles de inteligencia de negocios en **Power BI**.

---

## 📄 Descripción del Proyecto

El objetivo principal de **RetailPro** es transformar datos transaccionales dispersos en información estratégica para la toma de decisiones comerciales y ejecutivas. A través de este pipeline de análisis en SQL, se abordan problemáticas clave como:
* **Evaluación de Rendimiento Comercial:** Análisis de facturación, volumen de pedidos y ticket promedio mensual.
* **Comportamiento del Cliente:** Identificación de clientes recurrentes y detección de clientes registrados sin compras activas (Anti-Joins).
* **Gestión de Inventario y Catálogo:** Ranking de productos más vendidos y detección de productos sin rotación.
* **Modelo para Power BI:** Consolidación de un modelo en estrella mediante vistas relacionales eficientes.

---

## 📁 Estructura del Repositorio

```bash
Data_Analytics_Coder/
├── .gitignore                    # Archivos y patrones ignorados por Git
├── m4_consultas_agregadas.sql    # Consultas exploratorias, agregaciones, CTEs y rankings de negocio
├── m5_consultas_joins.sql        # Consultas con JOINs (INNER, LEFT), Vistas base y consolidación por canal
└── README.md                     # Documentación general del repositorio
