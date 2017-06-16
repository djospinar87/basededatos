-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2017 a las 03:20:55
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `universidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
`id` int(10) NOT NULL,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `teacher_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `teacher_id`) VALUES
(6, 'HTML', 'Curso de desarrollo con Html5 y css', 6),
(10, 'javascript', 'estructura y sintaxis de javascript', 3),
(11, 'java', 'sintaxis, estructura, clases jFrame', 6),
(12, 'Visual basic', 'aprenderemos la estructura, sintaxis y generalidades del desarrollo con Visual basic.', 7),
(13, 'php', 'progracion en php ', 6),
(14, 'visual basic', 'dfghjk', 2),
(15, 'fg', 'xcvbn', 2),
(16, 'fghnmb n', ' cvbnm', 2),
(17, 'cvbn', 'sdfgh', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE IF NOT EXISTS `students` (
`id` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`id`, `name`, `last_name`) VALUES
(1, 'Ricardo', 'guapacho'),
(3, 'rene ', 'ruso'),
(4, 'duncan T', 'dhu'),
(8, 'Camilo', 'Sifuentes barragan'),
(9, 'ricardo', 'alvares'),
(10, 'ricardo', 'alvares'),
(11, 'carmen ', 'rengifo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students_courses`
--

CREATE TABLE IF NOT EXISTS `students_courses` (
`id` int(11) NOT NULL,
  `student_id` int(15) NOT NULL,
  `course_id` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `students_courses`
--

INSERT INTO `students_courses` (`id`, `student_id`, `course_id`) VALUES
(1, 9, 6),
(2, 10, 6),
(4, 4, 15),
(5, 3, 16),
(7, 4, 17),
(8, 9, 14),
(9, 4, 12),
(10, 11, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
`id` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `hdv` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `last_name`, `hdv`) VALUES
(2, 'Rutildo', 'Bañon', 'ingeniero de software.'),
(3, 'Rutildo', 'Cañon', 'ingeniero de software.'),
(4, 'Rutildo  ', 'Bañon', 'ingeniero de software especialista en diseÃ±o.'),
(6, 'Ramon ', 'Verot', 'Administrador de bases de datos'),
(7, 'CAMILO', 'DERRIER', 'CBJJMGL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachers_courses`
--

CREATE TABLE IF NOT EXISTS `teachers_courses` (
`id` int(30) NOT NULL,
  `courses_id` int(30) NOT NULL,
  `teachers_id` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `teachers_courses`
--

INSERT INTO `teachers_courses` (`id`, `courses_id`, `teachers_id`) VALUES
(1, 0, ''),
(2, 0, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `students_courses`
--
ALTER TABLE `students_courses`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `teachers`
--
ALTER TABLE `teachers`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `teachers_courses`
--
ALTER TABLE `teachers_courses`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `students_courses`
--
ALTER TABLE `students_courses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `teachers_courses`
--
ALTER TABLE `teachers_courses`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
