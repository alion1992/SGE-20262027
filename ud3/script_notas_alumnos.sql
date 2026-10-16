-- ==========================================================
-- EJERCICIO JASPERREPORTS: NOTAS DEL ALUMNADO
-- Esquema: clase
-- Base de datos: PostgreSQL
-- ==========================================================

CREATE SCHEMA IF NOT EXISTS clase;

-- Eliminar las tablas si se desea volver a ejecutar el script.
-- Se eliminan primero las tablas dependientes por las claves foráneas.
DROP TABLE IF EXISTS clase.notas_asignaturas;
DROP TABLE IF EXISTS clase.asignaturas;
DROP TABLE IF EXISTS clase.alumnos;

-- ==========================================================
-- 1. TABLA ALUMNOS
-- ==========================================================

CREATE TABLE clase.alumnos (
    id_alumno SERIAL PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    curso VARCHAR(30) NOT NULL,
    email VARCHAR(120) UNIQUE
);

-- ==========================================================
-- 2. TABLA ASIGNATURAS
-- ==========================================================

CREATE TABLE clase.asignaturas (
    id_asignatura SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    curso_academico VARCHAR(20) NOT NULL DEFAULT '2026-2027'
);

-- ==========================================================
-- 3. TABLA NOTAS_ASIGNATURAS
-- Una fila representa la nota de un alumno en una asignatura.
-- ==========================================================

CREATE TABLE clase.notas_asignaturas (
    id_nota SERIAL PRIMARY KEY,
    id_alumno INTEGER NOT NULL,
    id_asignatura INTEGER NOT NULL,
    nota NUMERIC(4,2) NOT NULL CHECK (nota >= 0 AND nota <= 10),

    CONSTRAINT fk_notas_alumno
        FOREIGN KEY (id_alumno)
        REFERENCES clase.alumnos(id_alumno)
        ON DELETE CASCADE,

    CONSTRAINT fk_notas_asignatura
        FOREIGN KEY (id_asignatura)
        REFERENCES clase.asignaturas(id_asignatura)
        ON DELETE CASCADE,

    CONSTRAINT uq_nota_alumno_asignatura
        UNIQUE (id_alumno, id_asignatura)
);

-- ==========================================================
-- 4. DATOS DE ALUMNOS
-- ==========================================================

INSERT INTO clase.alumnos (nombre, apellidos, curso, email) VALUES
('Lucía', 'García López', '1º DAW', 'lucia.garcia@example.com'),
('Hugo', 'Martín Pérez', '1º DAW', 'hugo.martin@example.com'),
('Sofía', 'Sánchez Ruiz', '1º DAW', 'sofia.sanchez@example.com'),
('Daniel', 'Fernández Díaz', '1º DAW', 'daniel.fernandez@example.com'),
('Paula', 'Gómez Romero', '1º DAW', 'paula.gomez@example.com'),
('Mario', 'Navarro Torres', '1º DAW', 'mario.navarro@example.com'),
('Carla', 'Ruiz Moreno', '1º DAW', 'carla.ruiz@example.com'),
('Adrián', 'Jiménez Castro', '1º DAW', 'adrian.jimenez@example.com');

-- ==========================================================
-- 5. DATOS DE ASIGNATURAS
-- ==========================================================

INSERT INTO clase.asignaturas (nombre) VALUES
('Programación'),
('Bases de Datos'),
('Lenguajes de Marcas'),
('Sistemas Informáticos'),
('Entornos de Desarrollo'),
('Formación y Orientación Laboral');

-- ==========================================================
-- 6. NOTAS
-- Cada alumno tiene una nota en cada asignatura.
-- Nota inferior a 5: suspenso.
-- Nota igual o superior a 5: aprobado.
-- ==========================================================

INSERT INTO clase.notas_asignaturas (id_alumno, id_asignatura, nota) VALUES
-- Lucía García López
(1, 1, 8.50), (1, 2, 7.00), (1, 3, 9.00), (1, 4, 6.50), (1, 5, 7.50), (1, 6, 8.00),
-- Hugo Martín Pérez
(2, 1, 4.00), (2, 2, 3.50), (2, 3, 6.00), (2, 4, 5.00), (2, 5, 4.50), (2, 6, 6.50),
-- Sofía Sánchez Ruiz
(3, 1, 9.00), (3, 2, 8.50), (3, 3, 7.50), (3, 4, 9.50), (3, 5, 8.00), (3, 6, 9.00),
-- Daniel Fernández Díaz
(4, 1, 3.00), (4, 2, 4.50), (4, 3, 4.00), (4, 4, 6.00), (4, 5, 5.50), (4, 6, 4.50),
-- Paula Gómez Romero
(5, 1, 7.00), (5, 2, 6.50), (5, 3, 8.00), (5, 4, 7.50), (5, 5, 6.00), (5, 6, 7.00),
-- Mario Navarro Torres
(6, 1, 2.50), (6, 2, 4.00), (6, 3, 3.50), (6, 4, 4.50), (6, 5, 3.00), (6, 6, 4.00),
-- Carla Ruiz Moreno
(7, 1, 5.00), (7, 2, 5.50), (7, 3, 6.00), (7, 4, 7.00), (7, 5, 5.00), (7, 6, 6.50),
-- Adrián Jiménez Castro
(8, 1, 6.00), (8, 2, 2.50), (8, 3, 4.50), (8, 4, 3.50), (8, 5, 4.00), (8, 6, 5.50);

-- ==========================================================
-- FIN DEL SCRIPT
-- ==========================================================
