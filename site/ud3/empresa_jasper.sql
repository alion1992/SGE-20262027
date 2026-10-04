CREATE TABLE categorias (id SERIAL PRIMARY KEY,nombre VARCHAR(100) NOT NULL);
CREATE TABLE productos (id SERIAL PRIMARY KEY,nombre VARCHAR(150) NOT NULL,precio NUMERIC(10,2) NOT NULL,stock INTEGER NOT NULL,categoria_id INTEGER REFERENCES categorias(id));
CREATE TABLE clientes (id SERIAL PRIMARY KEY,nombre VARCHAR(150) NOT NULL,ciudad VARCHAR(100),email VARCHAR(150));
CREATE TABLE pedidos (id SERIAL PRIMARY KEY,fecha DATE NOT NULL,cliente_id INTEGER REFERENCES clientes(id));
CREATE TABLE detalle_pedido (id SERIAL PRIMARY KEY,pedido_id INTEGER REFERENCES pedidos(id),producto_id INTEGER REFERENCES productos(id),cantidad INTEGER NOT NULL,precio_unitario NUMERIC(10,2) NOT NULL);

INSERT INTO categorias(nombre) VALUES ('Monitores'),('Periféricos'),('Almacenamiento');
INSERT INTO productos(nombre,precio,stock,categoria_id) VALUES
('Monitor 27 pulgadas',249.99,12,1),('Teclado mecánico',89.99,5,2),('Ratón inalámbrico',39.99,20,2),('SSD 1 TB',79.99,8,3);
INSERT INTO clientes(nombre,ciudad,email) VALUES
('Informática Puertollano S.L.','Puertollano','info@ejemplo.es'),('Tecnología Manchega S.L.','Ciudad Real','ventas@ejemplo.es'),('Cliente Demo','Almagro','cliente@ejemplo.es');
INSERT INTO pedidos(fecha,cliente_id) VALUES ('2026-09-10',1),('2026-09-15',2),('2026-10-01',1);
INSERT INTO detalle_pedido(pedido_id,producto_id,cantidad,precio_unitario) VALUES
(1,1,2,249.99),(1,2,3,89.99),(2,4,4,79.99),(3,3,5,39.99);
