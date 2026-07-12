CREATE DATABASE Ejercicio;

USE Ejercicio; 

CREATE TABLE Clientes(
  ID_Clientes int NOT NULL IDENTITY(1,1) PRIMARY KEY, --Entero porque es un ID
  Nombre varchar(100) NOT NULL, --Es un nombre de hasta 100 caracteres
  Perfil_Bio varchar(max), --El largo puede variar, por eso es un caracter con de uso de la cantidad maxima de caracteres
  Fecha_Registro date --Es una fecha sin hora
  );

CREATE TABLE Productos(
  ID_Productos int NOT NULL IDENTITY(1,1) PRIMARY KEY, --Entero porque es un ID
  Descripcion varchar(255), --Una descripcion de maximo 255 caracteres
  Precio decimal(10,2), --Es un precio decimal de maximo 10 caracteres con 2 de ellos luego de la coma
  Esta_Activo INT NOT NULL --Entero porque el estado se puede asignar con un numero
  );

  
