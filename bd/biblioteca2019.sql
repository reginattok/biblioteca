-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-08-2019 a las 22:33:03
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca2019`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `idautor` int(11) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterio_prestamo`
--

CREATE TABLE `criterio_prestamo` (
  `idcriterio_prestamo` int(11) NOT NULL,
  `tiempo_permitido` int(11) DEFAULT NULL,
  `unidad_tiempo` enum('Horas','Dias') DEFAULT NULL,
  `lugar_permitido` enum('CUALQUIER LUGAR','ESCUELA','BIBLIOTECA') DEFAULT NULL,
  `material_idmaterial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `idmaterial` int(11) NOT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_audio_visual`
--

CREATE TABLE `material_audio_visual` (
  `idelectronico` int(11) NOT NULL,
  `caracteristica` varchar(45) DEFAULT NULL,
  `inventario_biblioteca` varchar(45) DEFAULT NULL,
  `material_idmaterial` int(11) NOT NULL,
  `material_audio_visualcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_electronico`
--

CREATE TABLE `material_electronico` (
  `idelectronico` int(11) NOT NULL,
  `caracteristica` varchar(45) DEFAULT NULL,
  `inventario_biblioteca` varchar(45) DEFAULT NULL,
  `material_idmaterial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_libro`
--

CREATE TABLE `material_libro` (
  `idlibro` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `isbn` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `material_idmaterial` int(11) NOT NULL,
  `inventario_biblioteca` varchar(45) DEFAULT NULL,
  `autor_idautor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `idprestamo` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `socio_idsocio` int(11) NOT NULL,
  `material_idmaterial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `idsocio` int(11) NOT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `categoria` enum('Profesor','Alumno') DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `tipo_usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `socio_idsocio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idautor`);

--
-- Indices de la tabla `criterio_prestamo`
--
ALTER TABLE `criterio_prestamo`
  ADD PRIMARY KEY (`idcriterio_prestamo`),
  ADD KEY `fk_criterio_prestamo_material_idx` (`material_idmaterial`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`idmaterial`);

--
-- Indices de la tabla `material_audio_visual`
--
ALTER TABLE `material_audio_visual`
  ADD PRIMARY KEY (`idelectronico`),
  ADD KEY `fk_proyector_material1_idx` (`material_idmaterial`);

--
-- Indices de la tabla `material_electronico`
--
ALTER TABLE `material_electronico`
  ADD PRIMARY KEY (`idelectronico`),
  ADD KEY `fk_proyector_material1_idx` (`material_idmaterial`);

--
-- Indices de la tabla `material_libro`
--
ALTER TABLE `material_libro`
  ADD PRIMARY KEY (`idlibro`),
  ADD KEY `fk_libro_material1_idx` (`material_idmaterial`),
  ADD KEY `fk_libro_autor1_idx` (`autor_idautor`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`idprestamo`),
  ADD KEY `fk_prestamo_socio1_idx` (`socio_idsocio`),
  ADD KEY `fk_prestamo_material1_idx` (`material_idmaterial`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`idsocio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_socio1_idx` (`socio_idsocio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `idautor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `criterio_prestamo`
--
ALTER TABLE `criterio_prestamo`
  MODIFY `idcriterio_prestamo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `idmaterial` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `material_audio_visual`
--
ALTER TABLE `material_audio_visual`
  MODIFY `idelectronico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `material_electronico`
--
ALTER TABLE `material_electronico`
  MODIFY `idelectronico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `material_libro`
--
ALTER TABLE `material_libro`
  MODIFY `idlibro` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `idprestamo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `idsocio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `criterio_prestamo`
--
ALTER TABLE `criterio_prestamo`
  ADD CONSTRAINT `fk_criterio_prestamo_material` FOREIGN KEY (`material_idmaterial`) REFERENCES `material` (`idmaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `material_audio_visual`
--
ALTER TABLE `material_audio_visual`
  ADD CONSTRAINT `fk_proyector_material10` FOREIGN KEY (`material_idmaterial`) REFERENCES `material` (`idmaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `material_electronico`
--
ALTER TABLE `material_electronico`
  ADD CONSTRAINT `fk_proyector_material1` FOREIGN KEY (`material_idmaterial`) REFERENCES `material` (`idmaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `material_libro`
--
ALTER TABLE `material_libro`
  ADD CONSTRAINT `fk_libro_autor1` FOREIGN KEY (`autor_idautor`) REFERENCES `autor` (`idautor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_libro_material1` FOREIGN KEY (`material_idmaterial`) REFERENCES `material` (`idmaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_prestamo_material1` FOREIGN KEY (`material_idmaterial`) REFERENCES `material` (`idmaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prestamo_socio1` FOREIGN KEY (`socio_idsocio`) REFERENCES `socio` (`idsocio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_socio1` FOREIGN KEY (`socio_idsocio`) REFERENCES `socio` (`idsocio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
