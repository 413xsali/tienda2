CREATE DATABASE IF NOT EXISTS tienda;

USE tienda;

CREATE TABLE IF NOT EXISTS t_usuarios(
    id_usuario      int(11)         auto_increment NOT NULL,
    nombre          varchar(100)    NOT NULL,
    apellidos       varchar(100)    NOT NULL,
    email           varchar(200)    NOT NULL,
    password        varchar(250)    NOT NULL,
    CONSTRAINT      pk_usuario  PRIMARY KEY (id_usuario),
    CONSTRAINT      uq_email    UNIQUE (email)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_categorias(
    id_categoria        int(11)         auto_increment NOT NULL,
    nombre_categoria    varchar(100)    NOT NULL,
    CONSTRAINT          pk_categoria PRIMARY KEY(id_categoria)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_producto(
    id_producto         int(11)         auto_increment NOT NULL,
    nombre_producto     varchar(100)    NOT NULL,
    descripcion         varchar(255)    NOT NULL, -- Mejor aumentar el tamaño o usar TEXT
    precio              DECIMAL(10,2)   NOT NULL,
    stock               int(11)         NOT NULL,
    oferta              varchar(255),
    fecha               date            NOT NULL,
    imagen              varchar(255),
    id_categoria        int(11)         NOT NULL,
    CONSTRAINT      pk_producto PRIMARY KEY(id_producto),
    CONSTRAINT      fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES t_categorias(id_categoria)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_pedidos(
    id_pedido       int(11)         auto_increment NOT NULL,
    ciudad          varchar(50)     NOT  NULL,
    direccion       varchar(100)    NOT NULL,
    costo           DECIMAL(10,2)   NOT NULL,
    estado          varchar(20)     NOT NULL,
    fecha           date            NOT NULL,
    hora            time            NOT NULL,
    id_usuario      int(11)         NOT NULL,
    CONSTRAINT      pk_pedido   PRIMARY KEY (id_pedido),
    CONSTRAINT      fk_pedido_usuario   FOREIGN KEY (id_usuario) REFERENCES t_usuarios(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_linea_pedidos(
    id_linea_pedidos        int(11) auto_increment NOT NULL,
    id_pedido               int(11) NOT NULL,
    id_producto             int(11) NOT NULL,
    unidades                int(11) NOT NULL,
    CONSTRAINT              pk_linea_pedidos PRIMARY KEY (id_linea_pedidos),
    CONSTRAINT              fk_linea_pedidos_pedidos FOREIGN KEY (id_pedido) REFERENCES t_pedidos(id_pedido),
    CONSTRAINT              fk_linea_pedidos_producto FOREIGN KEY (id_producto) REFERENCES t_producto(id_producto)
)ENGINE=InnoDB;