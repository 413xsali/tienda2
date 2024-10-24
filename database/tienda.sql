CREATE DATABASE if NOT EXISTS tienda;

USE tienda;

CREATE TABLE IF NOT EXISTS t_usuarios(
    id_usuario      int(11) auto_increment NOT NULL,
    nombre          varchar(100) NOT NULL,
    apellidos       varchar(100) NOT NULL,
    email           varchar(200) NOT NULL,
    password        varchar(255) NOT NULL,
    CONSTRAINT      pk_usuarios  PRIMARY KEY(id_usuario),
    CONSTRAINT      uq_email    UNIQUE(email)

)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS t_categorias(
    id_categoria        int(11) auto_increment NOT NULL,
    nombre_categoria    varchar(100) NOT NULL,
    CONSTRAINT          pk_categorias PRIMARY KEY(id_categoria)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS t_producto(
    id_producto        int(11) auto_increment NOT NULL,
    nombre_producto    varchar(100) NOT NULL,
    descripcion        varchar(255) NOT NULL,
    precio             float(100,2) NOT NULL,
    stock              int(100) NOT NULL,
    oferta             varchar(100) NOT NULL,
    fecha              DATE(100) NOT NULL,
    imagen             varchar(255) NOT NULL,
    id_categoria       int(11) NOT NULL
    CONSTRAINT          pk_producto PRIMARY KEY(id_producto)
    CONSTRAINT          fk_producto_categoria FOREIGN KEY(id_producto) REFERENCES t_categoria(id_categoria)

)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS t_pedidos(
    id_pedido           int(11) auto_increment NOT NULL,
    id_usuario          int(11) NOT NULL,
    ciudad              varchar(50) NOT NULL,
    direccion           varchar(255) NOT NULL,
    costo               float(100,2) NOT NULL,
    estado              int(20) NOT NULL,
    fecha               DATE,
    hora                TIME,
    CONSTRAINT          pk_pedidos PRIMARY KEY(id_pedido)
    CONSTRAINT          fk_pedido_usuario FOREIGN KEY(id_pedido) REFERENCES t_usuarios(id_usuario)

)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS t_linea_pedidos(
    id_linea_pedido    int(11) auto_increment NOT NULL,
    id_pedido         int(11) NOT NULL,
    id_producto          int(11) NOT NULL,
    unidades           int(10) NOT NULL,
    CONSTRAINT          pk_linea_pedidos PRIMARY KEY(id_linea_pedido)
    CONSTRAINT          fk_linea_pedido_pedido FOREIGN KEY(id_pedido) REFERENCES t_pedido(id_pedido)

)ENGINE=InnoDb;

