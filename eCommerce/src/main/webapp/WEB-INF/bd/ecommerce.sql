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
(1, 'Luxe Ghost', '.', '.', 875),
(2, 'Luxe Spectre', '.', '.', 875),
(3, 'Luxe Judge', '.', '.', 875),
(4, 'Luxe Vandal ', '.', '.', 875),
(5, 'Luxe Operator', '.', '.', 875),
(6, 'Luxe Knife', '.', '.', 1750),
(7, 'Aristocraft Sheriff', '.', '.', 1275),
(8, 'Aristocraft Stinger', '.', '.', 1275),
(9, 'Aristocraft Bulldog', '.', '.', 1275),
(10, 'Aristocraft Vandal', '.', '.', 1275),
(11, 'Aristocraft Ares', '.', '.', 1275),
(12, 'Galleria Classic', '.', '.', 875),
(13, 'Galleria Bucky', '.', '.', 875),
(14, 'Galleria Guardian', '.', '.', 875),
(15, 'Galleria Phantom', '.', '.', 875),
(16, 'Galleria Marshal', '.', '.', 875),
(17, 'Rush Frenzy', '.', '.', 875),
(18, 'Rush Judge', '.', '.', 875),
(19, 'Rush Bulldog', '.', '.', 875),
(20, 'Rush Phantom', '.', '.', 875),
(21, 'Rush Ares', '.', '.', 875),
(22, 'Sakura Classic', '.', '.', 1275),
(23, 'Sakura Sheriff', '.', '.', 1275),
(24, 'Sakura Stinger', '.', '.', 1275),
(25, 'Sakura Vandal', '.', '.', 1275),
(26, 'Sakura Ares', '.', '.', 1275),
(27, 'Convex Sheriff', '.', '.', 875),
(28, 'Convex Spectre', '.', '.', 875),
(29, 'Convex Jungle', '.', '.', 875),
(30, 'Convex Bulldog', '.', '.', 875),
(31, 'Convex Operator', '.', '.', 875),
(32, 'Avalanche Classic', '.', '.', 1275),
(33, 'Avalanche Spectre', '.', '.', 1275),
(34, 'Avalanche Phantom', '.', '.', 1275),
(35, 'Avalanche Vandal', '.', '.', 1275),
(36, 'Avalanche Marshal', '.', '.', 1275),
(37, 'Sovereign Stinger', '.', '.', 1775),
(38, 'Sovereign Marshal', '.', '.', 1775),
(39, 'Sovereign Ghost', '.', '.', 1775),
(40, 'Sovereign Guardian', '.', '.', 1775),
(41, 'Sovereign  Sword', '.', '.', 3550),
(42, 'Elderflame Frenzy', '.', '.', 2475),
(43, 'Elderflame Judge', '.', '.', 2475),
(44, 'Elderflame Vandal', '.', '.', 2475),
(45, 'Elderflame Operator', '.', '.', 2475),
(46, 'Elderflame Dagger', '.', '.', 4950),
(47, 'Araxys Shorty', '.', '.', 2175),
(48, 'Araxys Bulldog', '.', '.', 2175),
(49, 'Araxys Vandal', '.', '.', 2175),
(50, 'Araxys Operator', '.', '.', 2175),
(51, 'Araxys Bio Harvester', '.', '.', 4350);

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
