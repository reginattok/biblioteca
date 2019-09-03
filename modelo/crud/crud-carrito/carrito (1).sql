-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2019 a las 01:03:30
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carrito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcliente`
--

CREATE TABLE `tblcliente` (
  `id` int(11) NOT NULL,
  `apellido` varchar(35) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblcliente`
--

INSERT INTO `tblcliente` (`id`, `apellido`, `nombre`, `dni`, `fecha_nacimiento`) VALUES
(1, 'Fontanellaz', 'Javier', '24912834', '1976-02-06'),
(2, 'Roldan', 'Maria Jose', '25710105', '1976-12-12'),
(3, 'Perez', 'Jose', '33433234', '2019-07-24'),
(4, 'Gomez', 'Ruben', '43223946', '2019-06-03'),
(5, 'Fontanellaz', 'Rosalba', '23004978', '1973-04-02'),
(6, 'Gonzalez', 'Manuel', '27445034', '2019-07-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblprod`
--

CREATE TABLE `tblprod` (
  `id` int(10) UNSIGNED NOT NULL,
  `prod_code` varchar(20) NOT NULL,
  `prod_name` varchar(50) NOT NULL,
  `prod_ctry` varchar(50) NOT NULL,
  `prod_qty` int(20) NOT NULL,
  `price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblprod`
--

INSERT INTO `tblprod` (`id`, `prod_code`, `prod_name`, `prod_ctry`, `prod_qty`, `price`) VALUES
(8, '002', 'Gardenia', 'PanaderÃ­a', 25, '2.50'),
(9, '003', 'Coco Crunch', 'Cereales', 15, '5.25'),
(10, '0001', 'Red Bull', 'Bebidas', 50, '1.25'),
(11, '004', 'Queso Eden', 'LÃ¡cteos', 30, '3.25'),
(12, '005', 'Kiwi', 'Frutas', 20, '2.00'),
(13, '006', 'Porkchop', 'Carnes', 60, '4.25'),
(14, '007', 'Pimienta negra', 'Especies', 5, '1.25'),
(15, '008', 'Miel de aveja', 'Edulcorantes', 40, '3.00'),
(16, '009', 'Coliflor', 'Vegetales', 15, '1.50'),
(18, '0011', 'Uva  ', 'Bebidas', 22, '0.50'),
(19, '001', 'Quaker Oats', 'Cereales', 98, '3.25'),
(21, '0015', 'Avena quaker', 'Cereales', 49, '4.25');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblcliente`
--
ALTER TABLE `tblcliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblprod`
--
ALTER TABLE `tblprod`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `book_id` (`prod_code`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblcliente`
--
ALTER TABLE `tblcliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tblprod`
--
ALTER TABLE `tblprod`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
