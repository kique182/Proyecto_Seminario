-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-11-2014 a las 22:54:03
-- Versión del servidor: 10.0.13-MariaDB
-- Versión de PHP: 5.6.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `Tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_asignacion`
--

CREATE TABLE IF NOT EXISTS `auth_asignacion` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_asignacion`
--

INSERT INTO `auth_asignacion` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('Administrador', 'javio', NULL, 'N;'),
('Usuario', 'Alexander', NULL, 'N;'),
('Usuario', 'majo', 'NULL', 'N;'),
('Usuario', 'pedro', NULL, 'N;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_items`
--

CREATE TABLE IF NOT EXISTS `auth_items` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_items`
--

INSERT INTO `auth_items` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('Administrador', 2, 'Rol de Administrador', NULL, 'N;'),
('Usuario', 2, 'Rol de Usuario', NULL, 'N;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_relacion`
--

CREATE TABLE IF NOT EXISTS `auth_relacion` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categoria`
--

CREATE TABLE IF NOT EXISTS `Categoria` (
`idcategoria` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Historial_Compras`
--

CREATE TABLE IF NOT EXISTS `Historial_Compras` (
  `idHistorial_Compras` int(11) NOT NULL,
  `Pedido_idpedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Inventario`
--

CREATE TABLE IF NOT EXISTS `Inventario` (
  `idInventario` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `Producto_idproducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodoenvio`
--

CREATE TABLE IF NOT EXISTS `metodoenvio` (
`idmetodoenvio` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE IF NOT EXISTS `metodopago` (
`idmetodopago` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedido`
--

CREATE TABLE IF NOT EXISTS `Pedido` (
`idpedido` int(11) NOT NULL,
  `numero_pedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `Usuario_idusuario` int(11) NOT NULL,
  `metodoenvio_idmetodoenvio` int(11) NOT NULL,
  `metodopago_idmetodopago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto`
--

CREATE TABLE IF NOT EXISTS `Producto` (
`idproducto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `precio` decimal(3,0) NOT NULL,
  `Categoria_idcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto_Pedido`
--

CREATE TABLE IF NOT EXISTS `Producto_Pedido` (
  `idProducto_Pedido` int(11) NOT NULL,
  `Precio_Compra` decimal(6,0) NOT NULL,
  `Pedido_idpedido` int(11) NOT NULL,
  `Producto_idproducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reclamo`
--

CREATE TABLE IF NOT EXISTS `Reclamo` (
  `idReclamo` int(11) NOT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `Respuesta` varchar(150) DEFAULT NULL,
  `Usuario_idusuario` int(11) NOT NULL,
  `Pedido_idpedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rol`
--

CREATE TABLE IF NOT EXISTS `Rol` (
`idrol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Rol`
--

INSERT INTO `Rol` (`idrol`, `nombre`, `descripcion`) VALUES
(1, 'Administrador', 'Rol de los Administradores'),
(2, 'Cliente', 'Rol de los clientes'),
(3, 'Usuario', 'Rol de usuarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE IF NOT EXISTS `Usuarios` (
`idusuario` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `Rol_idrol` int(11) NOT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`idusuario`, `nombre`, `apellido`, `email`, `username`, `password`, `telefono`, `estado`, `Rol_idrol`, `fecha_registro`) VALUES
(2, 'Alexander', 'Moreno Urbina', 'alexandermoreno1@gmail.com', 'Alexander', 'c20ad4d76fe97759aa27a0c99bff6710', '04264567689', 'noactivo', 2, NULL),
(9, 'Alexis Javier', 'Moreno Urbina', 'javiomoreno@gmail.com', 'javio', '2396d5f8cd3b89883d94a39c9e87158b', '04264567689', 'activo', 1, '2014-11-24'),
(23, 'Maria Jose', 'Zambrano Escalante', 'majozaes@gmail.com', 'majo', '827ccb0eea8a706c4c34a16891f84e7b', '04264567689', 'activo', 3, '2014-11-24'),
(27, 'g', 'g', 'petro@gmail.com', 'pedro', '202cb962ac59075b964b07152d234b70', '04264567689', 'activo', 2, '2014-11-24');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_asignacion`
--
ALTER TABLE `auth_asignacion`
 ADD PRIMARY KEY (`itemname`,`userid`);

--
-- Indices de la tabla `auth_items`
--
ALTER TABLE `auth_items`
 ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `auth_relacion`
--
ALTER TABLE `auth_relacion`
 ADD PRIMARY KEY (`parent`,`child`), ADD KEY `child` (`child`);

--
-- Indices de la tabla `Categoria`
--
ALTER TABLE `Categoria`
 ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `Historial_Compras`
--
ALTER TABLE `Historial_Compras`
 ADD PRIMARY KEY (`idHistorial_Compras`), ADD KEY `fk_Historial_Compras_Pedido1_idx` (`Pedido_idpedido`);

--
-- Indices de la tabla `Inventario`
--
ALTER TABLE `Inventario`
 ADD PRIMARY KEY (`idInventario`), ADD KEY `fk_Inventario_Producto1_idx` (`Producto_idproducto`);

--
-- Indices de la tabla `metodoenvio`
--
ALTER TABLE `metodoenvio`
 ADD PRIMARY KEY (`idmetodoenvio`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
 ADD PRIMARY KEY (`idmetodopago`);

--
-- Indices de la tabla `Pedido`
--
ALTER TABLE `Pedido`
 ADD PRIMARY KEY (`idpedido`), ADD KEY `fk_Pedido_Usuario1_idx` (`Usuario_idusuario`), ADD KEY `fk_Pedido_metodoenvio1_idx` (`metodoenvio_idmetodoenvio`), ADD KEY `fk_Pedido_metodopago1_idx` (`metodopago_idmetodopago`);

--
-- Indices de la tabla `Producto`
--
ALTER TABLE `Producto`
 ADD PRIMARY KEY (`idproducto`), ADD KEY `fk_Producto_Categoria1_idx` (`Categoria_idcategoria`);

--
-- Indices de la tabla `Producto_Pedido`
--
ALTER TABLE `Producto_Pedido`
 ADD PRIMARY KEY (`idProducto_Pedido`), ADD KEY `fk_Producto_Pedido_Pedido1_idx` (`Pedido_idpedido`), ADD KEY `fk_Producto_Pedido_Producto1_idx` (`Producto_idproducto`);

--
-- Indices de la tabla `Reclamo`
--
ALTER TABLE `Reclamo`
 ADD PRIMARY KEY (`idReclamo`), ADD KEY `fk_Reclamo_Usuario1_idx` (`Usuario_idusuario`), ADD KEY `fk_Reclamo_Pedido1_idx` (`Pedido_idpedido`);

--
-- Indices de la tabla `Rol`
--
ALTER TABLE `Rol`
 ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
 ADD PRIMARY KEY (`idusuario`), ADD KEY `fk_Usuario_Rol_idx` (`Rol_idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Categoria`
--
ALTER TABLE `Categoria`
MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `metodoenvio`
--
ALTER TABLE `metodoenvio`
MODIFY `idmetodoenvio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
MODIFY `idmetodopago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Pedido`
--
ALTER TABLE `Pedido`
MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Producto`
--
ALTER TABLE `Producto`
MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Rol`
--
ALTER TABLE `Rol`
MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_asignacion`
--
ALTER TABLE `auth_asignacion`
ADD CONSTRAINT `auth_asignacion_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `auth_items` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_relacion`
--
ALTER TABLE `auth_relacion`
ADD CONSTRAINT `auth_relacion_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_items` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `auth_relacion_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_items` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Historial_Compras`
--
ALTER TABLE `Historial_Compras`
ADD CONSTRAINT `fk_Historial_Compras_Pedido1` FOREIGN KEY (`Pedido_idpedido`) REFERENCES `Pedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Inventario`
--
ALTER TABLE `Inventario`
ADD CONSTRAINT `fk_Inventario_Producto1` FOREIGN KEY (`Producto_idproducto`) REFERENCES `Producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Pedido`
--
ALTER TABLE `Pedido`
ADD CONSTRAINT `fk_Pedido_metodoenvio1` FOREIGN KEY (`metodoenvio_idmetodoenvio`) REFERENCES `metodoenvio` (`idmetodoenvio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Pedido_metodopago1` FOREIGN KEY (`metodopago_idmetodopago`) REFERENCES `metodopago` (`idmetodopago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Pedido_Usuario1` FOREIGN KEY (`Usuario_idusuario`) REFERENCES `Usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Producto`
--
ALTER TABLE `Producto`
ADD CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`Categoria_idcategoria`) REFERENCES `Categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Producto_Pedido`
--
ALTER TABLE `Producto_Pedido`
ADD CONSTRAINT `fk_Producto_Pedido_Pedido1` FOREIGN KEY (`Pedido_idpedido`) REFERENCES `Pedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Producto_Pedido_Producto1` FOREIGN KEY (`Producto_idproducto`) REFERENCES `Producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Reclamo`
--
ALTER TABLE `Reclamo`
ADD CONSTRAINT `fk_Reclamo_Pedido1` FOREIGN KEY (`Pedido_idpedido`) REFERENCES `Pedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Reclamo_Usuario1` FOREIGN KEY (`Usuario_idusuario`) REFERENCES `Usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
ADD CONSTRAINT `fk_Usuario_Rol` FOREIGN KEY (`Rol_idrol`) REFERENCES `Rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;