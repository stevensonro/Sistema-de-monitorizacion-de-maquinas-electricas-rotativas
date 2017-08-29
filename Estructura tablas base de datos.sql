-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
-- Versión del servidor: 10.1.22-MariaDB
-- Versión de PHP: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdmaquina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbambientales`
--

CREATE TABLE `tbambientales` (
  `id` int(5) NOT NULL,
  `registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tiempounix` int(10) NOT NULL,
  `temperaturamaquina` int(5) NOT NULL,
  `temperaturaambiente` int(5) NOT NULL,
  `humedadrelativa` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbimagenes`
--

CREATE TABLE `tbimagenes` (
  `id` int(5) NOT NULL,
  `foto` mediumblob NOT NULL,
  `registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbintantaneos`
--

CREATE TABLE `tbintantaneos` (
  `id` int(5) NOT NULL,
  `registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tiempounix` int(10) NOT NULL,
  `rpm` int(5) NOT NULL,
  `tensionl1` int(5) NOT NULL,
  `corrientel1` int(5) NOT NULL,
  `pactival1` int(5) NOT NULL,
  `preactival1` int(5) NOT NULL,
  `factorpl1` int(5) NOT NULL,
  `tensionl2` int(5) NOT NULL,
  `corrientel2` int(5) NOT NULL,
  `pactival2` int(5) NOT NULL,
  `preactival2` int(5) NOT NULL,
  `factorpl2` int(5) NOT NULL,
  `tensionl3` int(5) NOT NULL,
  `corrientel3` int(5) NOT NULL,
  `pactival3` int(5) NOT NULL,
  `preactival3` int(5) NOT NULL,
  `factorpl3` int(5) NOT NULL,
  `pactiva3f` int(5) NOT NULL,
  `pinductiva3f` int(5) NOT NULL,
  `pcapacitiva3f` int(5) NOT NULL,
  `cosenofi3f` int(5) NOT NULL,
  `factorp3f` int(5) NOT NULL,
  `frecuencia` int(5) NOT NULL,
  `tensionl12` int(5) NOT NULL,
  `tensionl23` int(5) NOT NULL,
  `tensionl31` int(5) NOT NULL,
  `distv1` int(5) NOT NULL,
  `distv2` int(5) NOT NULL,
  `distv3` int(5) NOT NULL,
  `dista1` int(5) NOT NULL,
  `dista2` int(5) NOT NULL,
  `dista3` int(5) NOT NULL,
  `paparente3f` int(5) NOT NULL,
  `maximademanda` int(5) NOT NULL,
  `corrientetrifasicamedia` int(5) NOT NULL,
  `corrientedeneutro` int(5) NOT NULL,
  `maxdemandaa2` int(5) NOT NULL,
  `maxdemandaa3` int(5) NOT NULL,
  `energiaactiva` int(5) NOT NULL,
  `energiareactivai` int(5) NOT NULL,
  `energiareactivac` int(5) NOT NULL,
  `energiaaparente` int(5) NOT NULL,
  `energiaactivag` int(5) NOT NULL,
  `energiareactivaig` int(5) NOT NULL,
  `energiareactivacg` int(5) NOT NULL,
  `energiaaparenteg` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbmaquina`
--

CREATE TABLE `tbmaquina` (
  `id` int(5) NOT NULL,
  `modo de operacion` varchar(9) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `potencia en kva` int(6) NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `propietario` varchar(20) NOT NULL,
  `notas y comentarios` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbmaximos`
--

CREATE TABLE `tbmaximos` (
  `id` int(5) NOT NULL,
  `registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tiempounix` int(10) NOT NULL,
  `tensionl1` int(5) NOT NULL,
  `corrientel1` int(5) NOT NULL,
  `pactival1` int(5) NOT NULL,
  `preactival1` int(5) NOT NULL,
  `factorpl1` int(5) NOT NULL,
  `tensionl2` int(5) NOT NULL,
  `corrientel2` int(5) NOT NULL,
  `pactival2` int(5) NOT NULL,
  `preactival2` int(5) NOT NULL,
  `factorpl2` int(5) NOT NULL,
  `tensionl3` int(5) NOT NULL,
  `corrientel3` int(5) NOT NULL,
  `pactival3` int(5) NOT NULL,
  `preactival3` int(5) NOT NULL,
  `factorpl3` int(5) NOT NULL,
  `pactiva3f` int(5) NOT NULL,
  `pinductiva3f` int(5) NOT NULL,
  `pcapacitiva3f` int(5) NOT NULL,
  `cosenofi3f` int(5) NOT NULL,
  `factorp3f` int(5) NOT NULL,
  `frecuencia` int(5) NOT NULL,
  `tensionl12` int(5) NOT NULL,
  `tensionl23` int(5) NOT NULL,
  `tensionl31` int(5) NOT NULL,
  `distv1` int(5) NOT NULL,
  `distv2` int(5) NOT NULL,
  `distv3` int(5) NOT NULL,
  `dista1` int(5) NOT NULL,
  `dista2` int(5) NOT NULL,
  `dista3` int(5) NOT NULL,
  `paparente3f` int(5) NOT NULL,
  `maximademanda` int(5) NOT NULL,
  `corrientetrifasicamedia` int(5) NOT NULL,
  `corrientedeneutro` int(5) NOT NULL,
  `maxdemandaa2` int(5) NOT NULL,
  `maxdemandaa3` int(5) NOT NULL,
  `energiaactiva` int(5) NOT NULL,
  `energiareactivai` int(5) NOT NULL,
  `energiareactivac` int(5) NOT NULL,
  `energiaaparente` int(5) NOT NULL,
  `energiaactivag` int(5) NOT NULL,
  `energiareactivaig` int(5) NOT NULL,
  `energiareactivacg` int(5) NOT NULL,
  `energiaaparenteg` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbminimos`
--

CREATE TABLE `tbminimos` (
  `id` int(5) NOT NULL,
  `registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tiempounix` int(10) NOT NULL,
  `tensionl1` int(5) NOT NULL,
  `corrientel1` int(5) NOT NULL,
  `pactival1` int(5) NOT NULL,
  `preactival1` int(5) NOT NULL,
  `factorpl1` int(5) NOT NULL,
  `tensionl2` int(5) NOT NULL,
  `corrientel2` int(5) NOT NULL,
  `pactival2` int(5) NOT NULL,
  `preactival2` int(5) NOT NULL,
  `factorpl2` int(5) NOT NULL,
  `tensionl3` int(5) NOT NULL,
  `corrientel3` int(5) NOT NULL,
  `pactival3` int(5) NOT NULL,
  `preactival3` int(5) NOT NULL,
  `factorpl3` int(5) NOT NULL,
  `pactiva3f` int(5) NOT NULL,
  `pinductiva3f` int(5) NOT NULL,
  `pcapacitiva3f` int(5) NOT NULL,
  `cosenofi3f` int(5) NOT NULL,
  `factorp3f` int(5) NOT NULL,
  `frecuencia` int(5) NOT NULL,
  `tensionl12` int(5) NOT NULL,
  `tensionl23` int(5) NOT NULL,
  `tensionl31` int(5) NOT NULL,
  `distv1` int(5) NOT NULL,
  `distv2` int(5) NOT NULL,
  `distv3` int(5) NOT NULL,
  `dista1` int(5) NOT NULL,
  `dista2` int(5) NOT NULL,
  `dista3` int(5) NOT NULL,
  `paparente3f` int(5) NOT NULL,
  `maximademanda` int(5) NOT NULL,
  `corrientetrifasicamedia` int(5) NOT NULL,
  `corrientedeneutro` int(5) NOT NULL,
  `maxdemandaa2` int(5) NOT NULL,
  `maxdemandaa3` int(5) NOT NULL,
  `energiaactiva` int(5) NOT NULL,
  `energiareactivai` int(5) NOT NULL,
  `energiareactivac` int(5) NOT NULL,
  `energiaaparente` int(5) NOT NULL,
  `energiaactivag` int(5) NOT NULL,
  `energiareactivaig` int(5) NOT NULL,
  `energiareactivacg` int(5) NOT NULL,
  `energiaaparenteg` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbambientales`
--
ALTER TABLE `tbambientales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbimagenes`
--
ALTER TABLE `tbimagenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbintantaneos`
--
ALTER TABLE `tbintantaneos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbmaquina`
--
ALTER TABLE `tbmaquina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbmaximos`
--
ALTER TABLE `tbmaximos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbminimos`
--
ALTER TABLE `tbminimos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbambientales`
--
ALTER TABLE `tbambientales`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbimagenes`
--
ALTER TABLE `tbimagenes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbintantaneos`
--
ALTER TABLE `tbintantaneos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbmaximos`
--
ALTER TABLE `tbmaximos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbminimos`
--
ALTER TABLE `tbminimos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
