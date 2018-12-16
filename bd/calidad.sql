-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2018 a las 01:45:33
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
-- Base de datos: `calidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterio`
--

CREATE TABLE `criterio` (
  `cr_Id` int(11) NOT NULL,
  `cr_Indice` varchar(10) NOT NULL,
  `cr_Nombre` varchar(52) NOT NULL,
  `cr_Descripcion` varchar(200) NOT NULL,
  `cr_Idh` int(11) DEFAULT NULL,
  `cr_esHoja` int(1) DEFAULT NULL,
  `est_Id` int(1) DEFAULT NULL,
  `cr_estado` int(1) NOT NULL DEFAULT '0' COMMENT '"0" activo\n"1" inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `criterio`
--

INSERT INTO `criterio` (`cr_Id`, `cr_Indice`, `cr_Nombre`, `cr_Descripcion`, `cr_Idh`, `cr_esHoja`, `est_Id`, `cr_estado`) VALUES
(1, '5.1', 'P1', '', NULL, 0, 1, 0),
(2, '5.2', 'P2', '', NULL, 0, 1, 1),
(3, '5.3', 'P3', '', NULL, 0, 1, 1),
(4, '5.1.1.1', 'TAREA1', '', 9, 1, 1, 1),
(5, '5.1.1.2', 'TAREA2', '', 9, 1, 1, 1),
(6, '5.2.1.1', 'TAREA3', '', 12, 1, 1, 1),
(7, '5.2.1.2', 'TAREA1', '', 12, 1, 1, 1),
(8, '5.2.1.3', 'TAREA2', '', 12, 1, 1, 1),
(9, '5.1.1', 'ACT1', '', 1, 0, 1, 0),
(10, '5.1.2', 'ACT2', '', 1, 0, 1, 0),
(11, '5.1.3', 'ACT3', '', 1, 0, 1, 0),
(12, '5.2.1', 'ACT1', '', 2, 0, 1, 0),
(13, '5.2.2', 'ACT2', '', 2, 0, 1, 0),
(14, '5,2,3', 'ACT3', '', 2, 0, 1, 0),
(15, '5.3.1', 'ACT1', '', 3, 0, 1, 0),
(16, '5.3.2', 'ACT2', '', 3, 0, 1, 0),
(17, '5.3.3', 'ACT3', '', 3, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detcab`
--

CREATE TABLE `detcab` (
  `dc_Id` int(11) NOT NULL,
  `cp_Id` int(11) DEFAULT NULL,
  `est_Id` int(11) DEFAULT NULL,
  `dc_Estado` int(1) DEFAULT '0' COMMENT '"0" activo\n"1" inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estandar`
--

CREATE TABLE `estandar` (
  `est_Id` int(11) NOT NULL,
  `est_nombre` varchar(52) NOT NULL,
  `est_descripcion` varchar(70) NOT NULL,
  `est_estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estandar`
--

INSERT INTO `estandar` (`est_Id`, `est_nombre`, `est_descripcion`, `est_estado`) VALUES
(1, 'cmmi', 'cmmi', 1),
(2, 'NTP', 'NTP-ISO/IEC 12207',1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `eva_Id` int(11) NOT NULL,
  `eva_Nombre` varchar(52) NOT NULL,
  `eva_Descripcion` varchar(52) NOT NULL,
  `cr_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evidencia`
--

CREATE TABLE `evidencia` (
  `evi_Id` int(11) NOT NULL,
  `evi_Nombre` varchar(52) NOT NULL,
  `evi_Descripcion` varchar(52) NOT NULL,
  `evi_Estado` varchar(52) NOT NULL,
  `eva_Id` int(11) NOT NULL,
  `evi_Archivo` longblob NOT NULL,
  `evi_urlws` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proycab`
--

CREATE TABLE `proycab` (
  `cp_Id` int(11) NOT NULL,
  `pry_Id` int(11) NOT NULL,
  `cp_Estado` int(1) NOT NULL COMMENT '"0" activo "1" inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `pry_Id` int(11) NOT NULL,
  `pry_Nombre` varchar(52) NOT NULL,
  `pry_Descripcion` varchar(70) NOT NULL,
  `pry_Estado` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`pry_Id`, `pry_Nombre`, `pry_Descripcion`, `pry_Estado`) VALUES
(1, 'pr1', 'pr1', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `criterio`
--
ALTER TABLE `criterio`
  ADD PRIMARY KEY (`cr_Id`),
  ADD KEY `cr_Idh` (`cr_Idh`),
  ADD KEY `est_Id_idx` (`est_Id`);

--
-- Indices de la tabla `detcab`
--
ALTER TABLE `detcab`
  ADD PRIMARY KEY (`dc_Id`),
  ADD KEY `cp_Id` (`cp_Id`),
  ADD KEY `est_Id` (`est_Id`);

--
-- Indices de la tabla `estandar`
--
ALTER TABLE `estandar`
  ADD PRIMARY KEY (`est_Id`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`eva_Id`),
  ADD KEY `cr_Id` (`cr_Id`);

--
-- Indices de la tabla `evidencia`
--
ALTER TABLE `evidencia`
  ADD PRIMARY KEY (`evi_Id`),
  ADD KEY `eva_Id` (`eva_Id`);

--
-- Indices de la tabla `proycab`
--
ALTER TABLE `proycab`
  ADD PRIMARY KEY (`cp_Id`),
  ADD KEY `pry_Id` (`pry_Id`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`pry_Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `criterio`
--
ALTER TABLE `criterio`
  MODIFY `cr_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `detcab`
--
ALTER TABLE `detcab`
  MODIFY `dc_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estandar`
--
ALTER TABLE `estandar`
  MODIFY `est_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `eva_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evidencia`
--
ALTER TABLE `evidencia`
  MODIFY `evi_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proycab`
--
ALTER TABLE `proycab`
  MODIFY `cp_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `pry_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `criterio`
--
ALTER TABLE `criterio`
  ADD CONSTRAINT `cr_Idh` FOREIGN KEY (`cr_Idh`) REFERENCES `criterio` (`cr_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `est_Id` FOREIGN KEY (`est_Id`) REFERENCES `estandar` (`est_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detcab`
--
ALTER TABLE `detcab`
  ADD CONSTRAINT `detcab_ibfk_1` FOREIGN KEY (`cp_Id`) REFERENCES `proycab` (`cp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detcab_ibfk_2` FOREIGN KEY (`est_Id`) REFERENCES `estandar` (`est_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`cr_Id`) REFERENCES `criterio` (`cr_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evidencia`
--
ALTER TABLE `evidencia`
  ADD CONSTRAINT `evidencia_ibfk_1` FOREIGN KEY (`eva_Id`) REFERENCES `evaluacion` (`eva_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proycab`
--
ALTER TABLE `proycab`
  ADD CONSTRAINT `pry_Id` FOREIGN KEY (`pry_Id`) REFERENCES `proyecto` (`pry_Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
