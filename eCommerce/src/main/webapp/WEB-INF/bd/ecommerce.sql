-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-02-2023 a las 07:06:42
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

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria`, `idproducto`) VALUES
('Select', 1),
('Select', 2),
('Select', 3),
('Select', 4),
('Select', 5),
('Select', 6),
('Deluxe', 7),
('Deluxe', 8),
('Deluxe', 9),
('Deluxe', 10),
('Deluxe', 11),
('Select', 12),
('Select', 13),
('Select', 14),
('Select', 15),
('Select', 16),
('Select', 17),
('Select', 18),
('Select', 19),
('Select', 20),
('Select', 21),
('Deluxe', 22),
('Deluxe', 23),
('Deluxe', 24),
('Deluxe', 25),
('Deluxe', 26),
('Select', 27),
('Select', 28),
('Select', 29),
('Select', 30),
('Select', 31),
('Deluxe', 32),
('Deluxe', 33),
('Deluxe', 34),
('Deluxe', 35),
('Deluxe', 36),
('Premium', 37),
('Premium', 38),
('Premium', 39),
('Premium', 40),
('Premium', 41),
('Ultra', 42),
('Ultra', 43),
('Ultra', 44),
('Ultra', 45),
('Ultra', 46),
('Exclusive', 47),
('Exclusive', 48),
('Exclusive', 49),
('Exclusive', 50),
('Exclusive', 51);

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
  PRIMARY KEY (`id`,`idpedido`),
  KEY `idpedido` (`idpedido`),
  KEY `idproducto` (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `lineapedido`
--

INSERT INTO `lineapedido` (`id`, `cantidad`, `idpedido`, `idproducto`) VALUES
(1, 1, 1, 2),
(1, 1, 2, 2),
(1, 2, 3, 2),
(1, 1, 4, 1),
(1, 1, 5, 1),
(1, 3, 6, 2),
(1, 1, 7, 12),
(2, 1, 1, 3),
(2, 1, 2, 3),
(2, 5, 3, 3),
(2, 2, 4, 2),
(2, 2, 6, 3),
(2, 1, 7, 3),
(3, 1, 2, 4),
(3, 5, 3, 4),
(3, 1, 6, 4),
(3, 6, 7, 2),
(4, 3, 3, 8),
(4, 1, 7, 4),
(5, 2, 3, 11),
(5, 1, 7, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `usuario`, `total`, `fecha`) VALUES
(1, 'ander', 1750, '2023-02-03 00:00:00'),
(2, 'ander', 2625, '2023-02-03 00:00:00'),
(3, 'ander', 16875, '2023-02-03 00:00:00'),
(4, 'ander', 2625, '2023-02-03 00:00:00'),
(5, 'ander', 875, '2023-02-03 00:00:00'),
(6, 'ander', 5250, '2023-02-03 00:00:00'),
(7, 'ander', 8750, '2023-02-04 00:00:00');

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
  `rol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
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
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `rol`, `nombre`, `apellidos`, `password`, `domicilio`, `codigopostal`, `telefono`, `email`) VALUES
('ander', 'admin', 'Ander', 'Panera', 'dw2', 'calle', '01001', '666777888', 'ander@gmail.com'),
('pablo', 'usuario', 'Pablo', 'Gonzalez', 'dw2', 'calee', '01001', '666777888', 'pablo@gmail.com');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`id`);

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
