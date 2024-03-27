-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2024 a las 22:36:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app_inventario`
--
CREATE DATABASE IF NOT EXISTS `app_inventario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `app_inventario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivo`
--

CREATE TABLE `dispositivo` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `serie` varchar(255) DEFAULT NULL,
  `fabricante_id` bigint(20) DEFAULT NULL,
  `tipo_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricante`
--

CREATE TABLE `fabricante` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `modelo_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` bigint(20) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `estado_general` bit(1) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `dispositivo_id` bigint(20) DEFAULT NULL,
  `grupo_id` bigint(20) DEFAULT NULL,
  `id_person` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id`, `descripcion`) VALUES
(1, 'MT09ET'),
(2, 'MT08ET');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `identificacion` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `primer_apellido` varchar(255) DEFAULT NULL,
  `primer_nombre` varchar(255) DEFAULT NULL,
  `segundo_apellido` varchar(255) DEFAULT NULL,
  `segundo_nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `grupo_id` bigint(20) DEFAULT NULL,
  `rol_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dispositivo`
--
ALTER TABLE `dispositivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrn3ip2gymj21977ra83plti3s` (`fabricante_id`),
  ADD KEY `FK6eslx74wihqvoaeslgallqiqf` (`tipo_id`);

--
-- Indices de la tabla `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKadgmv164t2txgo789ry67puag` (`modelo_id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi87nal2gy7kss55v0k4nvc61t` (`dispositivo_id`),
  ADD KEY `FKm3bdktofyby8a6aiclts8dtjk` (`grupo_id`),
  ADD KEY `FKdkox087b86vr93r2pgder8fg3` (`id_person`),
  ADD KEY `FKa9c6i31t9ucokk14ueyjys4pf` (`user_id`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi3d76s96om1axvsho8fxrfrkt` (`grupo_id`),
  ADD KEY `FKpikdt34c2nqt413csrypwhe69` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dispositivo`
--
ALTER TABLE `dispositivo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dispositivo`
--
ALTER TABLE `dispositivo`
  ADD CONSTRAINT `FK6eslx74wihqvoaeslgallqiqf` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`id`),
  ADD CONSTRAINT `FKrn3ip2gymj21977ra83plti3s` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricante` (`id`);

--
-- Filtros para la tabla `fabricante`
--
ALTER TABLE `fabricante`
  ADD CONSTRAINT `FKadgmv164t2txgo789ry67puag` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `FKa9c6i31t9ucokk14ueyjys4pf` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKdkox087b86vr93r2pgder8fg3` FOREIGN KEY (`id_person`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `FKi87nal2gy7kss55v0k4nvc61t` FOREIGN KEY (`dispositivo_id`) REFERENCES `dispositivo` (`id`),
  ADD CONSTRAINT `FKm3bdktofyby8a6aiclts8dtjk` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKi3d76s96om1axvsho8fxrfrkt` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `FKpikdt34c2nqt413csrypwhe69` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);
--
-- Base de datos: `app_portfolio`
--
CREATE DATABASE IF NOT EXISTS `app_portfolio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `app_portfolio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experience`
--

CREATE TABLE `experience` (
  `id` bigint(20) NOT NULL,
  `ages` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `id_person` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `id` bigint(20) NOT NULL,
  `about` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `ubication` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `about`, `country`, `description`, `email`, `github`, `image`, `linkedin`, `name`, `resume`, `ubication`, `whatsapp`) VALUES
(1, 'person1', 'colombia', 'prueba1', 'preuba1@gmail.com', 'n/a', 'n/a', 'n/a', 'person1', NULL, NULL, NULL),
(2, 'person22', 'colombia', 'prueba22', 'preuba22@gmail.com', 'n/a', 'n/a', 'n/a', 'person22', NULL, NULL, NULL),
(3, 'person3', 'colombia', 'prueba3', 'preuba3@gmail.com', 'n/a', 'n/a', 'n/a', 'person3', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portfolio`
--

CREATE TABLE `portfolio` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `id_person` bigint(20) DEFAULT NULL,
  `id_services` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_person` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skill`
--

CREATE TABLE `skill` (
  `id` bigint(20) NOT NULL,
  `porcentage` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `id_person` bigint(20) DEFAULT NULL,
  `id_skill_group` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skill_group`
--

CREATE TABLE `skill_group` (
  `id` bigint(20) NOT NULL,
  `ages` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `id_person` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `studies`
--

CREATE TABLE `studies` (
  `id` bigint(20) NOT NULL,
  `carrer` varchar(255) DEFAULT NULL,
  `end` bigint(20) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `start` bigint(20) DEFAULT NULL,
  `id_person` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task`
--

CREATE TABLE `task` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `id_person` bigint(20) DEFAULT NULL,
  `id_services` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `worked`
--

CREATE TABLE `worked` (
  `id` bigint(20) NOT NULL,
  `bussines` varchar(255) DEFAULT NULL,
  `end` bigint(20) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `start` bigint(20) DEFAULT NULL,
  `id_person` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3uv5r9udsc1ba87owc0ujkain` (`id_person`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKppcqf9snnsiokyr4e7h2h1f78` (`id_person`),
  ADD KEY `FKdax354mmpqute4rhlnam566yi` (`id_services`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoge63k9qaa8phlmnptiley7gy` (`id_person`);

--
-- Indices de la tabla `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKo367joessn1hebx5pxoj6m8q0` (`id_person`),
  ADD KEY `FKanw5hr2h2d42e90ydcnac0c6g` (`id_skill_group`);

--
-- Indices de la tabla `skill_group`
--
ALTER TABLE `skill_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt1jujlqrabdoq2d410xfh3tmk` (`id_person`);

--
-- Indices de la tabla `studies`
--
ALTER TABLE `studies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKd0mbmjp7vjkytf7xqcxdfih6u` (`id_person`);

--
-- Indices de la tabla `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoa0ugb13k8pgqmrwvr5x8ov10` (`id_person`),
  ADD KEY `FKigbp18f3a8lf8psdh74dg0y6c` (`id_services`);

--
-- Indices de la tabla `worked`
--
ALTER TABLE `worked`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4yv6bao1x6817vniweijjmsvr` (`id_person`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `experience`
--
ALTER TABLE `experience`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `person`
--
ALTER TABLE `person`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `skill`
--
ALTER TABLE `skill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `skill_group`
--
ALTER TABLE `skill_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `studies`
--
ALTER TABLE `studies`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `task`
--
ALTER TABLE `task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `worked`
--
ALTER TABLE `worked`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `FK3uv5r9udsc1ba87owc0ujkain` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `portfolio`
--
ALTER TABLE `portfolio`
  ADD CONSTRAINT `FKdax354mmpqute4rhlnam566yi` FOREIGN KEY (`id_services`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `FKppcqf9snnsiokyr4e7h2h1f78` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `FKoge63k9qaa8phlmnptiley7gy` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `FKanw5hr2h2d42e90ydcnac0c6g` FOREIGN KEY (`id_skill_group`) REFERENCES `skill_group` (`id`),
  ADD CONSTRAINT `FKo367joessn1hebx5pxoj6m8q0` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `skill_group`
--
ALTER TABLE `skill_group`
  ADD CONSTRAINT `FKt1jujlqrabdoq2d410xfh3tmk` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `studies`
--
ALTER TABLE `studies`
  ADD CONSTRAINT `FKd0mbmjp7vjkytf7xqcxdfih6u` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FKigbp18f3a8lf8psdh74dg0y6c` FOREIGN KEY (`id_services`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `FKoa0ugb13k8pgqmrwvr5x8ov10` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `worked`
--
ALTER TABLE `worked`
  ADD CONSTRAINT `FK4yv6bao1x6817vniweijjmsvr` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`);
--
-- Base de datos: `bd-crud-estudiante`
--
CREATE DATABASE IF NOT EXISTS `bd-crud-estudiante` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd-crud-estudiante`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint(20) NOT NULL,
  `creditos` int(11) NOT NULL,
  `nombrec` varchar(75) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `creditos`, `nombrec`) VALUES
(1, 4, 'Español'),
(2, 2, 'Ingles'),
(3, 5, '123wil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(75) NOT NULL,
  `email` varchar(75) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `grados_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `apellido`, `email`, `nombre`, `grados_id`) VALUES
(1, 'Luna', 'luna@gmail.com', 'Andres', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `id` bigint(20) NOT NULL,
  `nombreg` varchar(75) NOT NULL,
  `seccion` varchar(75) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`id`, `nombreg`, `seccion`) VALUES
(1, 'Quinto', 'Dos'),
(2, 'Once', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados_cursos`
--

CREATE TABLE `grados_cursos` (
  `id` bigint(20) NOT NULL,
  `cursos_id` bigint(20) NOT NULL,
  `grados_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grados_cursos`
--

INSERT INTO `grados_cursos` (`id`, `cursos_id`, `grados_id`) VALUES
(1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ks74get5br3cnt3bugfama4b4` (`email`),
  ADD KEY `FK3lalwvb6wh7euarmp5v5ex3fr` (`grados_id`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grados_cursos`
--
ALTER TABLE `grados_cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1a1aonr48xclesowg5dt2d3be` (`cursos_id`),
  ADD KEY `FKewve44nmsbjpvexi4frh5ntk2` (`grados_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `grados_cursos`
--
ALTER TABLE `grados_cursos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de datos: `db_springboot`
--
CREATE DATABASE IF NOT EXISTS `db_springboot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_springboot`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorities`
--
-- Error leyendo la estructura de la tabla db_springboot.authorities: #1932 - Table &#039;db_springboot.authorities&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla db_springboot.authorities: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `db_springboot`.`authorities`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--
-- Error leyendo la estructura de la tabla db_springboot.clientes: #1932 - Table &#039;db_springboot.clientes&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla db_springboot.clientes: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `db_springboot`.`clientes`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--
-- Error leyendo la estructura de la tabla db_springboot.facturas: #1932 - Table &#039;db_springboot.facturas&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla db_springboot.facturas: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `db_springboot`.`facturas`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas_items`
--
-- Error leyendo la estructura de la tabla db_springboot.facturas_items: #1932 - Table &#039;db_springboot.facturas_items&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla db_springboot.facturas_items: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `db_springboot`.`facturas_items`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--
-- Error leyendo la estructura de la tabla db_springboot.productos: #1932 - Table &#039;db_springboot.productos&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla db_springboot.productos: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `db_springboot`.`productos`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--
-- Error leyendo la estructura de la tabla db_springboot.users: #1932 - Table &#039;db_springboot.users&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla db_springboot.users: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `db_springboot`.`users`&#039; en la linea 1
--
-- Base de datos: `login_system`
--
CREATE DATABASE IF NOT EXISTS `login_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `login_system`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--
-- Error leyendo la estructura de la tabla login_system.roles: #1932 - Table &#039;login_system.roles&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla login_system.roles: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `login_system`.`roles`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--
-- Error leyendo la estructura de la tabla login_system.users: #1932 - Table &#039;login_system.users&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla login_system.users: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `login_system`.`users`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_roles`
--
-- Error leyendo la estructura de la tabla login_system.users_roles: #1932 - Table &#039;login_system.users_roles&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla login_system.users_roles: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `login_system`.`users_roles`&#039; en la linea 1
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"app_inventario\",\"table\":\"modelo\"},{\"db\":\"app_portfolio\",\"table\":\"person\"},{\"db\":\"app_portfolio\",\"table\":\"experience\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-03-26 13:20:56', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
