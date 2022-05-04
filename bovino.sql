-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-09-2018 a las 17:48:50
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
-- Base de datos: `bovino`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animales`
--

CREATE TABLE `animales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `peso` int(60) NOT NULL,
  `edad` int(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `animales`
--

INSERT INTO `animales` (`id`, `nombre`, `peso`, `edad`) VALUES
(1, 'carlota', 910, 6),
(2, 'tyger optewin', 500, 7),
(3, 'pepe', 1200, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades`
--

CREATE TABLE `enfermedades` (
  `id` int(60) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `causa` text NOT NULL,
  `tratamiento` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `enfermedades`
--

INSERT INTO `enfermedades` (`id`, `nombre`, `causa`, `tratamiento`) VALUES
(1, 'ACETONEMIA', 'Se le llama también cetosis quetosis, o semanas próximas al parto.\r\nEn los síntomas el animal se enflaca y disminuye la producción de leche, perdida de a papito, rechinamiento de dientes, temblores musculares hasta que cae sin poder levantarse. En sus defecaciones son secas, cubiertos por moco y a veces con diarrea.\r\n', '*Apopar\r\n*Glumafor (glumafos)\r\n*Pregazol\r\n*Tonofosfan (Elfosan, Foston, Tophosal)\r\n'),
(2, 'ACTINOMICOSIS', '(falsa papera, lengua de palo, mal de quijada, lengua leñosa)\r\nSon enfermedades que también atacan a los cerdos (producida por  hongos).\r\nLa actinomicosis en la lengua se presenta con aparición de ulceras de consistencia duras en la lengua, la lengua se le hincha se le pone dura por eso se le llama también legua de palo; La lengua también puede salir de la boca del animal por culpa del hinchazón, afecta también la respiración del animal. \r\n', '*Valvanol\r\n*Yatren-vacuna  E 104\r\n'),
(3, 'AFOSFOROSIS', '(Falta de fosforo) enflaquecimiento  y  no queda preñada fácilmente el animal.\r\nEn animales jóvenes hay debilidad y deformación de los huesos de la nariz, debilidad y deformación de los huesos de los miembros, dolor en las articulaciones, los animales pueden abortar o dar crías raquíticas. \r\n', '*Tonofosfan (Elfosan, Foston, Tophosal)\r\n*Calsitropina\r\n*Glumafor (glumafos)\r\n'),
(4, 'AFTOSA', '(Enfermedad en la boca y pesuñas \"Glosopeda\", fiebre aftosa) \r\nEnfermedad infecto-contagiosa, se presenta en los animales síntomas  como: perdida de apetito, pelo erizado, abdomen contraído, la nariz sucia, inmovilidad al caminar, se cae la salive en forma de  hilos gomosos.\r\n', '*Azul de metileno med\r\n*thoromangan\r\n*Tonfosfan (Elfosan, Foston, Tophosal)\r\n*Yatren-vacuna E 104\r\n*Reverin\r\n'),
(5, 'AGALACTIA ', '(Vacas secas ) disminución o supresión de la producción de la leche des pues del parto.', '*Hipoficina \r\n*Orastina\r\n'),
(6, 'algo', 'sdfghk', 'wsedrghjk');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades_has_animales`
--

CREATE TABLE `enfermedades_has_animales` (
  `enfermedades_id` varchar(250) NOT NULL,
  `aniamles_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` int(60) NOT NULL,
  `detallefactura` varchar(250) NOT NULL,
  `usuario_id` int(60) NOT NULL,
  `medicamento_id` int(60) NOT NULL,
  `enfermedades_has_aniaml_enfermedades_id` int(60) NOT NULL,
  `enfermedades_has_animal_animal_id` int(60) NOT NULL,
  `pago_id` int(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `dosis` varchar(250) NOT NULL,
  `precio` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id`, `nombre`, `dosis`, `precio`) VALUES
(1, 'oxitetraciclina', '50 ml', '100000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) UNSIGNED NOT NULL,
  `tipo` varchar(250) NOT NULL,
  `valor` varchar(60) NOT NULL,
  `usuario_id` int(60) NOT NULL,
  `estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `tipo`, `valor`, `usuario_id`, `estado`) VALUES
(1, 'tarjeta de credito', '200000', 1, 'en tramite');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(60) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `edad` varchar(250) NOT NULL,
  `telefono` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `edad`, `telefono`, `email`) VALUES
(1, 'diego ospina', '37', '34456788956', 'djospinar@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animales`
--
ALTER TABLE `animales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `enfermedades_has_animales`
--
ALTER TABLE `enfermedades_has_animales`
  ADD PRIMARY KEY (`enfermedades_id`),
  ADD UNIQUE KEY `aniamles_id` (`aniamles_id`) USING BTREE;

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `medicamento_id` (`medicamento_id`),
  ADD KEY `enfermedades_has_aniaml_enfermedades_id` (`enfermedades_has_aniaml_enfermedades_id`),
  ADD KEY `enfermedades_has_animal_animal_id` (`enfermedades_has_animal_animal_id`),
  ADD KEY `pago_id` (`pago_id`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `precio` (`precio`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `valor` (`valor`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `animales`
--
ALTER TABLE `animales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  MODIFY `id` int(60) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(60) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
