-- Crear el esquema
CREATE SCHEMA IF NOT EXISTS clase;

-- =========================================
-- TABLA CENTRO
-- =========================================

CREATE TABLE clase.centro (
    id_centro SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    localidad VARCHAR(100) NOT NULL
);

-- =========================================
-- TABLA DEPARTAMENTO
-- =========================================

CREATE TABLE clase.departamento (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_centro INTEGER NOT NULL,

    CONSTRAINT fk_departamento_centro
        FOREIGN KEY (id_centro)
        REFERENCES clase.centro(id_centro)
);

-- =========================================
-- TABLA GASTOS
-- =========================================

CREATE TABLE clase.gastos (
    id_gasto SERIAL PRIMARY KEY,
    concepto VARCHAR(150) NOT NULL,
    fecha DATE NOT NULL,
    importe NUMERIC(10,2) NOT NULL
        CHECK (importe >= 0),
    id_departamento INTEGER NOT NULL,

    CONSTRAINT fk_gastos_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES clase.departamento(id_departamento)
);

-- =========================================
-- INSERTAR CENTROS
-- =========================================

INSERT INTO clase.centro (nombre, localidad) VALUES
('Centro Norte', 'Puertollano'),
('Centro Sur', 'Ciudad Real'),
('Centro Este', 'Tomelloso');

-- =========================================
-- INSERTAR DEPARTAMENTOS
-- =========================================

INSERT INTO clase.departamento (nombre, id_centro) VALUES
('Informática', 1),
('Administración', 1),
('Mantenimiento', 1),
('Informática', 2),
('Recursos Humanos', 2),
('Administración', 3),
('Mantenimiento', 3);

-- =========================================
-- INSERTAR GASTOS
-- =========================================

INSERT INTO clase.gastos
(concepto, fecha, importe, id_departamento)
VALUES
('Compra de ordenadores', '2026-01-10', 2400.00, 1),
('Licencias de software', '2026-01-15', 650.00, 1),
('Material de oficina', '2026-01-20', 180.50, 2),
('Impresora', '2026-02-05', 320.00, 2),
('Reparación eléctrica', '2026-02-10', 450.00, 3),
('Herramientas', '2026-02-18', 275.00, 3),
('Portátiles', '2026-03-02', 1800.00, 4),
('Antivirus', '2026-03-05', 350.00, 4),
('Formación laboral', '2026-03-12', 600.00, 5),
('Material de oficina', '2026-03-15', 125.00, 5),
('Archivadores', '2026-04-01', 210.00, 6),
('Consumibles', '2026-04-08', 95.50, 6),
('Revisión de climatización', '2026-04-12', 700.00, 7),
('Material de mantenimiento', '2026-04-20', 160.00, 7);

