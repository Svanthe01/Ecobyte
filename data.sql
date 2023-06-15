-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2020 a las 18:42:25
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `data`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_codigos`
--

CREATE TABLE `c_codigos` (
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `puntos` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `c_codigos`
--

INSERT INTO `c_codigos` (`codigo`, `puntos`) VALUES
('P28D9P0O3P9', '15'),
('V51E0Y2B4U3', '15'),
('W83A9R4F0W0', '150'),
('Y43T3C6Y9O0', '100'),
('Y49W2H4R3U1', '50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_empresas`
--

CREATE TABLE `c_empresas` (
  `id_empresa` smallint(5) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `coordenadas` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` tinytext CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_precios` tinyint(5) DEFAULT 0,
  `enlace` text CHARACTER SET utf8 DEFAULT NULL,
  `fk_noreciclables` tinyint(5) DEFAULT 0,
  `contraseña` varchar(10) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `c_empresas`
--

INSERT INTO `c_empresas` (`id_empresa`, `nombre`, `coordenadas`, `telefono`, `descripcion`, `tipo`, `correo`, `fk_precios`, `enlace`, `fk_noreciclables`, `contraseña`) VALUES
(1, 'Recicladora Medina', '19.421127, -99.130677', '556789345', 'Empresa recicladora que recicla cosas XD', 'v', 'da@gmail.com', 3, 'No disponible', 0, '1234'),
(2, 'Reciclatodo', '19.430051, -99.13466', '556789345', 'Recicla basura', 'v', 'reci@gmail.com', 4, 'No disponible', 0, '1234'),
(3, 'Recicladora Espacial', '19.421127, -99.130677', '9986364748', 'Reciclamos basura hasta en el espacio', 'v', 'espa@gmail.com', 5, 'www.empresa.com', 0, '1234'),
(4, 'Reciclaton', '19.421127, -99.130677', '556789345', 'Evento comunitario de reciclaje en la colonia condesa', 'v', 'reciclaton@gmail.com', 6, 'No disponible', 0, '1234'),
(5, 'Reciclaje para todos', '19.425963, -99.161568', '556789345', 'Evento comunitario de reciclaje en la colonia iztapalapa', 'v', 'recicla@gmail.com', 7, 'No disponible', 0, '1234'),
(6, 'Solo una empresa mÃ¡s', '19.433572, -99.115562', '556789345', 'UNa empresa que recicla cosas', 'v', 'recic@gmail.com', 8, 'No disponible', 0, '1234'),
(7, 'NOmbre cualquiera', '19.421127, -99.130677', '4892355', 'información cualquiera', 'v', 'dag@gmail.com', 9, 'No disponible', 0, '1234'),
(11, 'Garc¡a Zu¤iga t¡o', '19.393258, -99.146633', '4892355', 'Esto es una prueba de caracteres', 'v', 'correo@gmail.com', 10, 'No disponible', 0, '1234'),
(15, 'Padorú Zuñiga', '19.461413, -99.108696', '1234456', 'Esto es una prueba de acentos y s', 'r', 'corr@gamil.com', 0, 'No disponible', 7, '1234'),
(16, 'Zu¤oto Edgard¡o', '19.461413, -99.108696', '334524412', '¤¤¤¡', 'r', 'correoo@gmail.com', 0, 'No disponible', 6, '1234'),
(17, 'La empresa del reciclado', '19.410907, -99.036942', '38924021', 'Somos una empresa empeada en el cuidado del medio ambiente', 'r', 'empresaTal@gmail.com', 0, 'www.empresa.com.mx', 8, '1234'),
(18, 'Empresa X', '19.421106, -99.160538', '5567832903', 'Empresa recicladora comprometida con el medio ambiente y la sociedad', 'r', 'correo@hotmail.com', 0, 'www.empresaX.com.mx', 9, '1234'),
(19, 'Super Reciclado', '19.440533, -99.141312', '5567980341', 'Empresa conprometida con el medio ambiente y su cuidado', 'r', 'empresa@gmail.com', 0, 'www.superecic.com', 10, '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_imagenes`
--

CREATE TABLE `c_imagenes` (
  `ruta` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `numImagen` tinyint(4) DEFAULT NULL,
  `fk_manualidad` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `c_imagenes`
--

INSERT INTO `c_imagenes` (`ruta`, `numImagen`, `fk_manualidad`) VALUES
('1.jpg', 1, 1),
('2.jpg', 2, 1),
('3.jpg', 3, 1),
('4.jpg', 4, 1),
('5.jpg', 5, 1),
('9.jpg', 6, 1),
('cinco.jpg', 1, 2),
('cuatro.jpg', 2, 2),
('diez.jpg', 3, 2),
('doce.jpg', 4, 2),
('dos.jpg', 5, 2),
('nueve.jpg', 6, 2),
('ocho.jpg', 7, 2),
('once.jpg', 8, 2),
('seis.jpg', 9, 2),
('siete.jpg', 10, 2),
('tres.jpg', 11, 2),
('uno.jpg', 12, 2),
('reciclar-frascos-de-vidrio-15.jpg', 1, 4),
('11.jpg', 1, 5),
('22.jpg', 2, 5),
('33.jpg', 3, 5),
('44.jpg', 4, 5),
('55.jpg', 5, 5),
('66.jpg', 6, 5),
('77.jpg', 7, 5),
('88.jpg', 8, 5),
('99.jpg', 9, 5),
('Dobla-el-corazon-de-origami-paso-a-paso.jpg', 1, 6),
('IMG_4237.JPG', 2, 6),
('IMG_4240.JPG', 3, 6),
('IMG_4242.JPG', 4, 6),
('IMG_4250.JPG', 5, 6),
('IMG_4257.JPG', 6, 6),
('IMG_4269.JPG', 7, 6),
('IMG_4289.JPG', 8, 6),
('IMG_4298.JPG', 9, 6),
('IMG_4317.JPG', 10, 6),
('IMG_4321.JPG', 11, 6),
('IMG_4339.JPG', 12, 6),
('IMG_4345.JPG', 13, 6),
('IMG_4354.JPG', 14, 6),
('IMG_5064.JPG', 15, 6),
('a.png', 1, 8),
('b.png', 2, 8),
('c.png', 3, 8),
('d.png', 4, 8),
('e.png', 5, 8),
('f.png', 6, 8),
('g.png', 7, 8),
('h.png', 8, 8),
('i.png', 9, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_manualidades`
--

CREATE TABLE `c_manualidades` (
  `id_manualidad` tinyint(4) NOT NULL,
  `autor` varchar(60) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `titulo` varchar(60) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `categoria` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `materiales` text COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'esta columna guardará todos los materiales unidos en una cadena, pero separados por una coma',
  `medidas` text COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'esta columna guardará las medidas de los materiales en una cadena, separados igualmente por una coma',
  `tipo` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `c_manualidades`
--

INSERT INTO `c_manualidades` (`id_manualidad`, `autor`, `titulo`, `categoria`, `materiales`, `medidas`, `tipo`) VALUES
(1, 'Ramona Flowers', 'JardÃ­n de botellas colgante', 'Plastico', 'Botellas de 2 litros,Tijeras,Pintura acrÃ­lica,Pincel,Rotulador,Plantilla con diseÃ±o,', '2,1,5,1,1,2,', 'i'),
(2, 'Naida', 'Corazones de papel', 'Papel', 'Hoja de papel carta roja,Tijeras,', '1,1,', 'i'),
(4, 'Spike Spiegel', 'Contenedor de especias', 'Vidrio', 'Tarros pequeÃ±os de vidrio,Pegramento UHU,Pintura acrÃ­lica (opcional),Tabla de madera de 1mx30cm,', '7,1,3,1,', 'i'),
(5, 'Dantuski', 'Flores de cartÃ³n', 'Carton', 'CartÃ³n de huevos,Tijeras,Pegamento,Pintura acrÃ­lica (opcional),', '1,1,1,3,', 'i'),
(6, 'Zelda', 'Bolso de sueter viejo', 'Otro', 'Sueter viejo,Tela con diseÃ±o,Tijeras,Hilo y aguja,', '1,1,1,1,', 'i'),
(7, 'Mordekay', 'Ideas para reciclar periÃ³dico', 'Papel', 'PeriÃ³dico viejo,Pegamento,Tijeras,Pintura acrilica,', '3,1,1,3,', 'v'),
(8, 'Rigby', 'Caja hecha de periodico', 'Papel', 'Periodico,Hilo de coser,Pegamento blanco liquido,caja de 25cm x 50cm aprox.,pinzas,Pintura cafÃ©,', '5,1,2,1,12,2,', 'i');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_noreciclables`
--

CREATE TABLE `c_noreciclables` (
  `id_noReciclables` tinyint(5) NOT NULL,
  `aceiteAut` varchar(2) DEFAULT 'n',
  `aceiteCoc` varchar(2) DEFAULT 'n',
  `cartToner` varchar(2) DEFAULT 'n',
  `residuosConst` varchar(2) DEFAULT 'n',
  `electro` varchar(2) DEFAULT 'n',
  `tetrapack` varchar(2) DEFAULT 'n',
  `focos` varchar(2) DEFAULT 'n',
  `medicamentos` varchar(2) DEFAULT 'n',
  `baterias` varchar(2) DEFAULT 'n',
  `pintura` varchar(2) DEFAULT 'n',
  `organicos` varchar(2) DEFAULT 'n',
  `sanitarios` varchar(2) DEFAULT 'n',
  `vidrio` varchar(2) DEFAULT 'n',
  `varios` varchar(2) DEFAULT 'n',
  `unicel` varchar(2) DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c_noreciclables`
--

INSERT INTO `c_noreciclables` (`id_noReciclables`, `aceiteAut`, `aceiteCoc`, `cartToner`, `residuosConst`, `electro`, `tetrapack`, `focos`, `medicamentos`, `baterias`, `pintura`, `organicos`, `sanitarios`, `vidrio`, `varios`, `unicel`) VALUES
(1, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 's', 'n', 'n', 's', 'n', 'n'),
(2, 'n', 'n', 's', 'n', 'n', 'n', 'n', 'n', 's', 'n', 'n', 's', 'n', 'n', 'n'),
(3, 'n', 's', 'n', 's', 'n', 'n', 's', 'n', 'n', 'n', 's', 'n', 'n', 'n', 'n'),
(4, 's', 'n', 'n', 'n', 'n', 's', 's', 's', 'n', 'n', 'n', 'n', 'n', 'n', 's'),
(5, 'n', 's', 'n', 'n', 'n', 'n', 's', 'n', 's', 'n', 'n', 'n', 'n', 'n', 'n'),
(6, 'n', 'n', 'n', 'n', 'n', 's', 'n', 'n', 's', 's', 's', 'n', 'n', 'n', 'n'),
(7, 'n', 's', 'n', 'n', 'n', 's', 'n', 'n', 'n', 's', 'n', 'n', 's', 'n', 's'),
(8, 's', 'n', 'n', 'n', 'n', 's', 's', 'n', 'n', 'n', 'n', 'n', 's', 'n', 'n'),
(9, 's', 'n', 'n', 'n', 'n', 's', 's', 'n', 'n', 's', 'n', 'n', 'n', 's', 'n'),
(10, 's', 's', 'n', 'n', 'n', 's', 's', 'n', 's', 'n', 'n', 'n', 's', 'n', 's');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_parrafos`
--

CREATE TABLE `c_parrafos` (
  `parrafo` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `numParrafo` tinyint(4) DEFAULT NULL,
  `fk_manualidad` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `c_parrafos`
--

INSERT INTO `c_parrafos` (`parrafo`, `numParrafo`, `fk_manualidad`) VALUES
('Pega la plantilla diseÃ±ada sobre el extremo inferior de la botella y marca su contorno con ayuda del rotulador', 1, 1),
('Con ayuda de las tijeras o un cutter recorta la silueta de la plantilla hasta la mitad como se muestra en las imÃ¡genes y luego haz un corte longitudinal para unir ambos extremos de la silueta y desprender la parte inferior de la botella. Â¡No olvides dejar un par de hoyos en los extemos para los lazos que sostendrÃ¡n la mazeta!', 2, 1),
('Usa la pintura acrÃ­lica para hacer el diseÃ±o que prefieras sobre la mazeta y espera a que se seque', 3, 1),
('Haz un par de hoyitos en la parte de abajo de la mazeta para que pueda pasar el agua y no se estanque', 4, 1),
('Recorta por la mitad la hoja de papel y con los extreÃ±os corta cuadrados del mismo tamaÃ±o', 1, 2),
('Para cada uno de los cuadros de papel sigue las intrucciones mostradas en las imÃ¡genes', 2, 2),
('Desprende cualquier etiqueta o pegatina que estÃ© sobre la superficie de los frascos de vidrio y limpialos hasta que no queden restos', 1, 3),
('Haz un siete de marcas a lo largo de la tabla de madera que estÃ©n centradas a lo ancho y a la misma distancia las unas de las otras', 2, 3),
('Coloca algo de pegamento sobre las tapas de los frascos de vidrio y colocalas sobre las marcas que hiciste en la tabla', 3, 3),
('Enbona los frascos en sus respectivas tapaderas y Â¡listo!', 4, 3),
('Recorta cada uno de los contenedores de huevos', 1, 4),
('Con ayuda de las tijeras redonde los bordes de cada uno de los contenedores como se muestra en las imÃ¡genes', 2, 4),
('Pon algo de pegamento en uno de ellos y coloca otro contenedor doblado sobre Ã©ste como se muestra', 3, 4),
('Finalmente puedes agregar algo de pintura si asi lo deseas', 4, 4),
('Recorta el sueter como se muestra en las imÃ¡genes', 1, 5),
('Recorta la tela con diseÃ±o como se muestra y cosela a las tiras hechas con las mangas del sueter para hacer la agarradera de la bolsa.', 2, 5),
('Une la parte inferior del sueter como se muestra para formar el cuerpo de la bolsa, posteriormente coselo y forra su interior con algo de la tela con diseÃ±o', 3, 5),
('une el tirante de la bolsa con el cuerpo y cosela, Â¡listo!', 4, 5),
('Enrolla las hojas de periÃ³dico como se muestra en las imagenes, haciendo tiras largas y resistentes', 1, 8),
('con ayuda del hilo, ata los rollos de tal forma que no se puedan desenvolver', 2, 8),
('Coloca los rollitos de periodico como se muestra sobre la base de cartÃ³n', 3, 8),
('Sosten con ayuda de las pinzas los rollitos de periodica de manera vertical en las cuatro caras de la caja y coeminza a tejer los restantes como se muestra', 4, 8),
('Una vez terminadas las cuatro caras de la caja aplica algo de pegamento blanco diluido en agua y deja secar, posteriormente aplica color', 5, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_reclamados`
--

CREATE TABLE `c_reclamados` (
  `usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(20) CHARACTER SET ascii NOT NULL,
  `fk_recompensa` tinyint(5) NOT NULL,
  `nombre_rec` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `empresa` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `c_reclamados`
--

INSERT INTO `c_reclamados` (`usuario`, `codigo`, `fk_recompensa`, `nombre_rec`, `empresa`) VALUES
('Catan', 'N1J8Z9V8D11', 2, 'Fierro golpeador de parejas felices', 'Empresa X'),
('Catan', 'Y1I5D4E8O12', 4, 'Cubo de rubik', 'Empresa X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_recompensas`
--

CREATE TABLE `c_recompensas` (
  `id_recompensa` mediumint(6) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `costo` mediumint(6) NOT NULL,
  `empresa` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `imagen` varchar(60) CHARACTER SET ascii NOT NULL DEFAULT 'No disponible',
  `stock` tinyint(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `c_recompensas`
--

INSERT INTO `c_recompensas` (`id_recompensa`, `nombre`, `costo`, `empresa`, `descripcion`, `imagen`, `stock`) VALUES
(1, 'Llavero de cipote', 150, 'Ecobyte', 'Llavero tallado en madera con forma de cipote, ideal para cualquier amigo', 'Pop_Team_Fiction.jpg', 0),
(2, 'Fierro golpeador de parejas felices', 200, 'Empresa X', 'Un poderoso artÃ­culo con el que podrÃ¡s ir por el mundo arruinado la felicidad ajena', 'El_Fierro.png', 50),
(3, 'Camiseta skatenergÃ­a', 300, 'Empresa X', 'Camiseta color negro talla mediana para hombre o mujer', 'Samarreta-3-JPG.jpg', 99),
(4, 'Cubo de rubik', 200, 'Empresa X', 'Cubo clasico de rubik de 3 niveles', 'gan-356-i.jpg', 8),
(5, 'Cuadro The legend of Zelda', 200, 'Super Reciclado', 'Cuadro decorativo de dimensiones 25cm x 40cm, edicion especial', 'descarga.jpg', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_usuarios`
--

CREATE TABLE `c_usuarios` (
  `id_user` varchar(17) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(32) CHARACTER SET utf8 NOT NULL,
  `clave` varchar(17) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `puntos` mediumint(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `c_usuarios`
--

INSERT INTO `c_usuarios` (`id_user`, `correo`, `clave`, `puntos`) VALUES
('Catan', 'catan@gmail.com', '1234', 225),
('Ivancito', 'lalaland@gmail.com', 'soy tu', 0),
('newUsa', 'urrs32@gmail.com', '3456', 0),
('Nombre', 'd@gmail.com', '1234', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_videos`
--

CREATE TABLE `c_videos` (
  `ruta` text COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fk_manualidad` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `c_videos`
--

INSERT INTO `c_videos` (`ruta`, `fk_manualidad`) VALUES
('10 Ideas para reciclar papel periÃ³dico __ Manualidades Recicladas __ Ecobrisa.mp4', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios`
--

CREATE TABLE `precios` (
  `id_precios` tinyint(5) NOT NULL,
  `kPlastico` tinyint(5) DEFAULT 0,
  `kVidrio` tinyint(5) DEFAULT 0,
  `kPapel` tinyint(5) DEFAULT 0,
  `kAluminio` tinyint(5) DEFAULT 0,
  `kCarton` tinyint(5) DEFAULT 0,
  `lAceite` tinyint(5) DEFAULT 0,
  `kCobre` tinyint(5) DEFAULT 0,
  `kPet` tinyint(5) DEFAULT 0,
  `kFerroso` tinyint(5) DEFAULT 0,
  `kNoFerroso` tinyint(5) DEFAULT 0,
  `kTextiles` tinyint(5) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `precios`
--

INSERT INTO `precios` (`id_precios`, `kPlastico`, `kVidrio`, `kPapel`, `kAluminio`, `kCarton`, `lAceite`, `kCobre`, `kPet`, `kFerroso`, `kNoFerroso`, `kTextiles`) VALUES
(1, 12, 34, 0, 0, 0, 56, 0, 0, 0, 0, 0),
(2, 12, 0, 0, 45, 0, 0, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 45, 0, 0, 0, 0, 34, 0, 42),
(4, 12, 0, 0, 34, 0, 2, 0, 0, 0, 0, 0),
(5, 0, 0, 0, 34, 67, 0, 0, 12, 12, 0, 0),
(6, 34, 0, 53, 0, 32, 0, 0, 0, 0, 0, 0),
(7, 0, 0, 53, 0, 0, 56, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 32, 32, 0, 0, 56, 0, 0, 0),
(9, 123, 45, 0, 0, 0, 0, 23, 0, 0, 0, 0),
(10, 12, 0, 0, 0, 0, 0, 23, 0, 0, 67, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `id` tinyint(4) NOT NULL,
  `usuario` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `valor` tinyint(4) DEFAULT NULL,
  `puntos` mediumint(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sesion`
--

INSERT INTO `sesion` (`id`, `usuario`, `valor`, `puntos`) VALUES
(3, 'Catan', 1, 225);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesionempresa`
--

CREATE TABLE `sesionempresa` (
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `id` tinyint(5) NOT NULL,
  `valor` tinyint(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sesionempresa`
--

INSERT INTO `sesionempresa` (`nombre`, `id`, `valor`) VALUES
('Empresa X', 3, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `c_codigos`
--
ALTER TABLE `c_codigos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `c_empresas`
--
ALTER TABLE `c_empresas`
  ADD PRIMARY KEY (`id_empresa`),
  ADD KEY `fk_precios_idx` (`fk_precios`);

--
-- Indices de la tabla `c_manualidades`
--
ALTER TABLE `c_manualidades`
  ADD PRIMARY KEY (`id_manualidad`);

--
-- Indices de la tabla `c_noreciclables`
--
ALTER TABLE `c_noreciclables`
  ADD PRIMARY KEY (`id_noReciclables`);

--
-- Indices de la tabla `c_reclamados`
--
ALTER TABLE `c_reclamados`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `c_recompensas`
--
ALTER TABLE `c_recompensas`
  ADD PRIMARY KEY (`id_recompensa`);

--
-- Indices de la tabla `c_usuarios`
--
ALTER TABLE `c_usuarios`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `precios`
--
ALTER TABLE `precios`
  ADD PRIMARY KEY (`id_precios`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `c_empresas`
--
ALTER TABLE `c_empresas`
  MODIFY `id_empresa` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `c_manualidades`
--
ALTER TABLE `c_manualidades`
  MODIFY `id_manualidad` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `c_noreciclables`
--
ALTER TABLE `c_noreciclables`
  MODIFY `id_noReciclables` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `c_recompensas`
--
ALTER TABLE `c_recompensas`
  MODIFY `id_recompensa` mediumint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `precios`
--
ALTER TABLE `precios`
  MODIFY `id_precios` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
