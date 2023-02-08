-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-02-2023 a las 07:18:03
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `idproducto` int NOT NULL,
  PRIMARY KEY (`categoria`,`idproducto`),
  KEY `idproducto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_pago`
--

DROP TABLE IF EXISTS `datos_pago`;
CREATE TABLE IF NOT EXISTS `datos_pago` (
  `id` int NOT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `titular` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `numero` int NOT NULL,
  `caducidad` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `codigo` int NOT NULL,
  `domicilio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`,`usuario`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineapedido`
--

DROP TABLE IF EXISTS `lineapedido`;
CREATE TABLE IF NOT EXISTS `lineapedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `idpedido` int NOT NULL,
  `idproducto` int NOT NULL,
  Constraint PK_ID_IDPEDIDO Primary Key (`id`, `idpedido`),
  KEY `idpedido` (`idpedido`),
  KEY `idproducto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `total` double NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(1, 'Luxe Ghost', '.', 'Luxe_Ghost', 875),
(2, 'Luxe Spectre', '.', 'Luxe_Spectre', 875),
(3, 'Luxe Judge', '.', 'Luxe_Judge', 875),
(4, 'Luxe Vandal', '.', 'Luxe_Vandal', 875),
(5, 'Luxe Operator', '.', 'Luxe_Operator', 875),
(6, 'Luxe Knife', '.', 'Luxe_Knife', 1750),
(7, 'Aristocrat Sheriff', '.', 'Aristocrat_Sheriff', 1275),
(8, 'Aristocrat Stinger', '.', 'Aristocrat_Stinger', 1275),
(9, 'Aristocrat Bulldog', '.', 'Aristocrat_Bulldog', 1275),
(10, 'Aristocrat Vandal', '.', 'Aristocrat_Vandal', 1275),
(11, 'Aristocrat Ares', '.', 'Aristocrat_Ares', 1275),
(12, 'Galleria Classic', '.', 'Galleria_Classic', 875),
(13, 'Galleria Bucky', '.', 'Galleria_Bucky', 875),
(14, 'Galleria Guardian', '.', 'Galleria_Guardian', 875),
(15, 'Galleria Phantom', '.', 'Galleria_Phantom', 875),
(16, 'Galleria Marshal', '.', 'Galleria_Marshal', 875),
(17, 'Rush Frenzy', '.', 'Rush_Frenzy', 875),
(18, 'Rush Judge', '.', 'Rush_Judge', 875),
(19, 'Rush Bulldog', '.', 'Rush_Bulldog', 875),
(20, 'Rush Phantom', '.', 'Rush_Phantom', 875),
(21, 'Rush Ares', '.', 'Rush_Ares', 875),
(22, 'Sakura Classic', '.', 'Sakura_Classic', 1275),
(23, 'Sakura Sheriff', '.', 'Sakura_Sheriff', 1275),
(24, 'Sakura Stinger', '.', 'Sakura_Stinger', 1275),
(25, 'Sakura Vandal', '.', 'Sakura_Vandal', 1275),
(26, 'Sakura Ares', '.', 'Sakura_Ares', 1275),
(27, 'Convex Sheriff', '.', 'Convex_Sheriff', 875),
(28, 'Convex Spectre', '.', 'Convex_Spectre', 875),
(29, 'Convex Judge', '.', 'Convex_Judge', 875),
(30, 'Convex Bulldog', '.', 'Convex_Bulldog', 875),
(31, 'Convex Operator', '.', 'Convex_Operator', 875),
(32, 'Avalanche Classic', '.', 'Avalanche_Classic', 1275),
(33, 'Avalanche Spectre', '.', 'Avalanche_Spectre', 1275),
(34, 'Avalanche Phantom', '.', 'Avalanche_Phantom', 1275),
(35, 'Avalanche Vandal', '.', 'Avalanche_Vandal', 1275),
(36, 'Avalanche Marshal', '.', 'Avalanche_Marshal', 1275),
(37, 'Sovereign Stinger', '.', 'Sovereign_Stinger', 1775),
(38, 'Sovereign Marshal', '.', 'Sovereign_Marshal', 1775),
(39, 'Sovereign Ghost', '.', 'Sovereign_Ghost', 1775),
(40, 'Sovereign Guardian', '.', 'Sovereign_Guardian', 1775),
(41, 'Sovereign Sword', '.', 'Sovereign_Sword', 3550),
(42, 'Elderflame Frenzy', '.', 'Elderflame_Frenzy', 2475),
(43, 'Elderflame Judge', '.', 'Elderflame_Judge', 2475),
(44, 'Elderflame Vandal', '.', 'Elderflame_Vandal', 2475),
(45, 'Elderflame Operator', '.', 'Elderflame_Operator', 2475),
(46, 'Elderflame Dagger', '.', 'Elderflame_Dagger', 4950),
(47, 'Araxys Shorty', '.', 'Araxys_Shorty', 2175),
(48, 'Araxys Bulldog', '.', 'Araxys_Bulldog', 2175),
(49, 'Araxys Vandal', '.', 'Araxys_Vandal', 2175),
(50, 'Araxys Operator', '.', 'Araxys_Operator', 2175),
(51, 'Araxys Bio Harvester', '.', 'Araxys_Bio_Harvester', 4350);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `domicilio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `codigopostal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `datos_pago`
--
ALTER TABLE `datos_pago`
  ADD CONSTRAINT `datos_pago_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  ADD CONSTRAINT `lineapedido_ibfk_1` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `lineapedido_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
