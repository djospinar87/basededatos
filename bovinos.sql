-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2018 a las 18:38:16
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bovinos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animales`
--

CREATE TABLE `animales` (
  `idAnimal` int(11) NOT NULL,
  `NombreAnimal` varchar(45) NOT NULL,
  `Peso` int(250) NOT NULL,
  `Edad` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `animales`
--

INSERT INTO `animales` (`idAnimal`, `NombreAnimal`, `Peso`, `Edad`) VALUES
(0, 'carlota', 809, 6),
(1, 'carlota', 900, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades`
--

CREATE TABLE `enfermedades` (
  `idEnfermedades` int(11) NOT NULL,
  `NombreEnfermedad` varchar(45) NOT NULL,
  `CausaEnfermedad` text NOT NULL,
  `TratamientoEnfermedad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `enfermedades`
--

INSERT INTO `enfermedades` (`idEnfermedades`, `NombreEnfermedad`, `CausaEnfermedad`, `TratamientoEnfermedad`) VALUES
(1, 'ACETONEMIA', 'el animal se enflaca y disminuye la producció', '*Apopar *Glumafor (glumafos) *Pregazol *Tonof');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades_has_animales`
--

CREATE TABLE `enfermedades_has_animales` (
  `Enfermedades_idEnfermedades` int(11) NOT NULL,
  `Animal_idAnimal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` int(11) NOT NULL,
  `DetalleFactura` varchar(45) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Medicamento_idMedicamento` int(11) NOT NULL,
  `Enfermedades_has_Animal_Enfermedades_idEnfermedades` int(11) NOT NULL,
  `Enfermedades_has_Animal_Animal_idAnimal` int(11) NOT NULL,
  `Pago_idPago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `idMedicamento` int(11) NOT NULL,
  `NombreMedicamento` varchar(45) NOT NULL,
  `AplicacionMedicamento` varchar(60) NOT NULL,
  `PrecioMedicamento` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPago` int(11) NOT NULL,
  `Tipopago` varchar(45) NOT NULL,
  `ValorPago` double NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `EstadoPago` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `NombreUsuario` varchar(45) NOT NULL,
  `EdadUsuario` varchar(45) NOT NULL,
  `TelefonoUsuario` varchar(45) NOT NULL,
  `EmailUsuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animales`
--
ALTER TABLE `animales`
  ADD PRIMARY KEY (`idAnimal`);

--
-- Indices de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD PRIMARY KEY (`idEnfermedades`);

--
-- Indices de la tabla `enfermedades_has_animales`
--
ALTER TABLE `enfermedades_has_animales`
  ADD PRIMARY KEY (`Enfermedades_idEnfermedades`,`Animal_idAnimal`),
  ADD KEY `fk_Enfermedades_has_Animal_Animal1` (`Animal_idAnimal`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `fk_Factura_Usuario` (`Usuario_idUsuario`),
  ADD KEY `fk_Factura_Medicamento1` (`Medicamento_idMedicamento`),
  ADD KEY `fk_Factura_Enfermedades_has_Animal1` (`Enfermedades_has_Animal_Enfermedades_idEnfermedades`,`Enfermedades_has_Animal_Animal_idAnimal`),
  ADD KEY `fk_Factura_Pago1` (`Pago_idPago`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`idMedicamento`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `fk_Pago_Usuario1` (`Usuario_idUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `enfermedades_has_animales`
--
ALTER TABLE `enfermedades_has_animales`
  ADD CONSTRAINT `fk_Enfermedades_has_Animal_Animal1` FOREIGN KEY (`Animal_idAnimal`) REFERENCES `animales` (`idAnimal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Enfermedades_has_Animal_Enfermedades1` FOREIGN KEY (`Enfermedades_idEnfermedades`) REFERENCES `enfermedades` (`idEnfermedades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_Factura_Enfermedades_has_Animal1` FOREIGN KEY (`Enfermedades_has_Animal_Enfermedades_idEnfermedades`,`Enfermedades_has_Animal_Animal_idAnimal`) REFERENCES `enfermedades_has_animales` (`Enfermedades_idEnfermedades`, `Animal_idAnimal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_Medicamento1` FOREIGN KEY (`Medicamento_idMedicamento`) REFERENCES `medicamentos` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_Pago1` FOREIGN KEY (`Pago_idPago`) REFERENCES `pagos` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_Usuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_Pago_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
