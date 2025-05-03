-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-11-2024 a las 03:37:05
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto5`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `caja_id` int(5) NOT NULL,
  `caja_numero` int(5) NOT NULL,
  `caja_nombre` varchar(100) NOT NULL,
  `caja_efectivo` decimal(30,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`caja_id`, `caja_numero`, `caja_nombre`, `caja_efectivo`) VALUES
(1, 1, 'Caja Principal', 0.00),
(5, 2, 'Caja rapida', 150.00),
(6, 3, 'Caja Ventas Matutina', 1500.50),
(7, 4, 'Caja Ventas Vespertina', 1275.25),
(8, 5, 'Caja Sucursal Norte', 3000.00),
(9, 6, 'Caja Sucursal Sur', 1250.00),
(10, 7, 'Caja Servicios Generales', 2400.00),
(11, 8, 'Caja Pagos de Proveedores', 3500.00),
(12, 9, 'Caja Ventas Online', 1350.00),
(13, 10, 'Caja Atención al Cliente', 2125.75),
(14, 11, 'Caja Ventas Fin de Semana', 6000.00),
(15, 12, 'Caja Fondo de Emergencia', 1800.00),
(16, 13, 'Caja 1', 1125.00),
(17, 14, 'Caja 2', 2000.00),
(18, 15, 'Caja 3', 3500.00),
(19, 16, 'Caja 4', 2150.00),
(20, 17, 'Caja 5', 2750.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(7) NOT NULL,
  `categoria_nombre` varchar(50) NOT NULL,
  `categoria_ubicacion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_ubicacion`) VALUES
(7, 'Medicamento', 'Pasillo 1'),
(8, 'Primeros Auxilios', 'Pasillo 2'),
(9, 'Alivio del Dolor', 'Pasillo 9'),
(10, 'Cuidado Capilar', 'Pasillo 3'),
(11, 'Gaseosas', 'Pasillo 4'),
(12, 'Jugos', 'Pasillo 4'),
(13, 'Ofertas', 'Pasillo 1'),
(14, 'Bioseguridad', 'Pasillo 2'),
(15, 'Cuidado Bucal', 'Pasillo 3'),
(16, 'Salud Respiratoria y Gripe', 'Pasillo 5'),
(17, 'Vitaminas Minerales Suplementos', 'Pasillo 7'),
(18, 'Snacks Golosinas Chocolates', 'pasillo 12'),
(19, 'Panes y Horneados', 'Pasillo 12'),
(20, 'Lácteos y derivados', 'Pasillo 12'),
(21, 'Infusiones Te Cafe y Otros', 'Pasillo 12'),
(22, 'Dermatológico', 'Pasillo 5'),
(23, 'Test de Embarazo', 'Pasillo 7'),
(24, 'Pañales y Toallas Humedas', 'Pasillo 7'),
(25, 'Nutrición infantil', 'Pasillo 7'),
(26, 'Higiene del bebé', 'Pasillo 7'),
(27, 'Accesorios Mamá y Bebé', 'Pasillo 7'),
(28, 'Cuidado Personal', 'Pasillo 8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(10) NOT NULL,
  `cliente_tipo_documento` varchar(20) NOT NULL,
  `cliente_numero_documento` varchar(35) NOT NULL,
  `cliente_nombre` varchar(50) NOT NULL,
  `cliente_apellido` varchar(50) NOT NULL,
  `cliente_provincia` varchar(30) NOT NULL,
  `cliente_ciudad` varchar(30) NOT NULL,
  `cliente_direccion` varchar(70) NOT NULL,
  `cliente_telefono` varchar(20) NOT NULL,
  `cliente_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_tipo_documento`, `cliente_numero_documento`, `cliente_nombre`, `cliente_apellido`, `cliente_provincia`, `cliente_ciudad`, `cliente_direccion`, `cliente_telefono`, `cliente_email`) VALUES
(1, 'Otro', 'N/A', 'Publico', 'General', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(7, 'Cedula', '6724573', 'Andrés', 'Urquidi', 'La Paz', 'La Paz', 'Pampahasi Bajo calle 10 #134', '76593487', 'prueba.cliente@gmail.com'),
(8, 'CI', '5856328', 'Juan', 'Mamani', 'La Paz', 'La Paz', 'Calle Comercio #155', '70123456', 'juan.mamani@gmail.com'),
(9, 'DUI', '78965412', 'Lucia', 'Gonzales', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Av. Busch, Zona Equipetrol', '78543210', 'lucia.gonzales@gmail.com'),
(10, 'Cedula', '4963541', 'Miguel', 'Perez', 'Cochabamba', 'Cochabamba', 'Av. Blanco Galindo, Km 5', '71452367', 'miguel.perez@gmail.com'),
(11, 'CI', '7853421', 'Sandra', 'Ticona', 'La Paz', 'El Alto', 'Av. 6 de Marzo #2145', '76321456', 'sandra.ticona@gmail.com'),
(12, 'DNI', '8956432', 'Ana', 'Lopez', 'Oruro', 'Oruro', 'Calle Bolívar #56', '71354678', 'ana.lopez@gmail.com'),
(13, 'Licencia', '4561324', 'Jose', 'Torres', 'Chuquisaca', 'Sucre', 'Av. Las Americas, Zona Sur', '75412369', 'jose.torres@gmail.com'),
(14, 'Pasaporte', 'PA789456', 'Maria', 'Vargas', 'Santa Cruz', 'Montero', 'Calle 24 de Septiembre #102', '76543210', 'maria.vargas@gmail.com'),
(15, 'CI', '7985321', 'Luis', 'Gomez', 'Potosí', 'Potosí', 'Zona Central, Calle La Paz #34', '75412385', 'luis.gomez@gmail.com'),
(16, 'Cedula', '6032587', 'Carmen', 'Villca', 'Tarija', 'Tarija', 'Av. Circunvalación #45', '78653214', 'carmen.villca@gmail.com'),
(17, 'DNI', '9086754', 'Andres', 'Vaca', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Av. Beni, 3er Anillo', '75321489', 'andres.vaca@gmail.com'),
(18, 'Pasaporte', 'PA123456', 'Rosa', 'Gutierrez', 'Cochabamba', 'Sacaba', 'Calle Sucre #75', '71234567', 'rosa.gutierrez@gmail.com'),
(19, 'CI', '7623549', 'Daniel', 'Salazar', 'Beni', 'Trinidad', 'Calle Comercio #25', '73125498', 'daniel.salazar@gmail.com'),
(20, 'Licencia', '5423687', 'Liliana', 'Arias', 'La Paz', 'La Paz', 'Av. Arce #459', '79456123', 'liliana.arias@gmail.com'),
(21, 'Otro', 'NIT546873', 'Fernando', 'Castro', 'Santa Cruz', 'Warnes', 'Av. Warnes #874', '75421653', 'fernando.castro@gmail.com'),
(22, 'DNI', '6452319', 'Patricia', 'Flores', 'La Paz', 'Viacha', 'Calle 20 de Octubre #52', '76452318', 'patricia.flores@gmail.com'),
(23, 'CI', '8743216', 'Carla', 'Luna', 'Pando', 'Cobija', 'Calle Sucre #24', '72351489', 'carla.luna@gmail.com'),
(24, 'Cedula', '9527413', 'David', 'Quispe', 'Cochabamba', 'Quillacollo', 'Av. Blanco Galindo #2045', '75463218', 'david.quispe@gmail.com'),
(25, 'Pasaporte', 'PA654321', 'Gloria', 'Fernandez', 'Chuquisaca', 'Sucre', 'Calle Junín #214', '72354698', 'gloria.fernandez@gmail.com'),
(26, 'DNI', '3652148', 'Pedro', 'Choque', 'Oruro', 'Oruro', 'Av. España #102', '73452167', 'pedro.choque@gmail.com'),
(27, 'Licencia', '4785261', 'Monica', 'Paredes', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Av. Banzer, 4to Anillo', '78541236', 'monica.paredes@gmail.com'),
(28, 'CI', '8743652', 'Raul', 'Arancibia', 'Tarija', 'Yacuiba', 'Zona Mercado, Calle Bolívar #76', '75431265', 'raul.arancibia@gmail.com'),
(29, 'Otro', 'NIT147852', 'Isabel', 'Sandoval', 'Potosí', 'Uyuni', 'Av. Ferroviaria #315', '76412358', 'isabel.sandoval@gmail.com'),
(30, 'DNI', '7145632', 'Gabriel', 'Rojas', 'Cochabamba', 'Cochabamba', 'Av. Heroínas #45', '76452310', 'gabriel.rojas@gmail.com'),
(31, 'Cedula', '4963287', 'Patricia', 'Reyes', 'Santa Cruz', 'San Ignacio de Velasco', 'Calle Central #79', '75419863', 'patricia.reyes@gmail.com'),
(32, 'Pasaporte', 'PA478529', 'Erick', 'Rivera', 'Pando', 'Cobija', 'Av. 9 de Febrero #120', '78451239', 'erick.rivera@gmail.com'),
(33, 'CI', '7145893', 'Natalia', 'Alvarez', 'La Paz', 'Achacachi', 'Zona Norte, Calle 15', '71325498', 'natalia.alvarez@gmail.com'),
(34, 'Cedula', '5236897', 'Fernando', 'Romero', 'Chuquisaca', 'Sucre', 'Calle Bolívar #145', '76451238', 'fernando.romero@gmail.com'),
(35, 'DNI', '9654321', 'Monica', 'Terrazas', 'Santa Cruz', 'Camiri', 'Av. Gral. Camacho #45', '74321589', 'monica.terrazas@gmail.com'),
(36, 'Licencia', '4785693', 'Mario', 'Sánchez', 'Beni', 'Riberalta', 'Calle Murillo #25', '73421587', 'mario.sanchez@gmail.com'),
(37, 'Otro', 'NIT234789', 'Liliana', 'Rodriguez', 'Potosí', 'Potosí', 'Av. Universidad #120', '74523618', 'liliana.rodriguez@gmail.com'),
(38, 'CI', '8546219', 'Roberto', 'Quintana', 'Oruro', 'Oruro', 'Zona Norte, Calle 12', '75231468', 'roberto.quintana@gmail.com'),
(39, 'Pasaporte', 'PA874521', 'Sara', 'Fuentes', 'Tarija', 'Villamontes', 'Calle Comercio #76', '78521436', 'sara.fuentes@gmail.com'),
(40, 'DNI', '6598741', 'Esteban', 'Guzman', 'La Paz', 'El Alto', 'Calle 1ro de Mayo #159', '79456123', 'esteban.guzman@gmail.com'),
(41, 'Licencia', '4123659', 'Yolanda', 'Pinto', 'Cochabamba', 'Cochabamba', 'Zona Sur, Av. Chapare #34', '76321458', 'yolanda.pinto@gmail.com'),
(42, 'CI', '7541268', 'Sofia', 'Medina', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Zona Equipetrol, Calle 7', '71236549', 'sofia.medina@gmail.com'),
(43, 'Cedula', '8541236', 'Carlos', 'Salinas', 'Chuquisaca', 'Sucre', 'Calle Real #54', '76452310', 'carlos.salinas@gmail.com'),
(44, 'DNI', '9654123', 'Roxana', 'Loza', 'Oruro', 'Huanuni', 'Calle Central #63', '71325846', 'roxana.loza@gmail.com'),
(45, 'Pasaporte', 'PA214365', 'Samuel', 'Jimenez', 'Potosí', 'Uyuni', 'Zona Ferroviaria, Calle Beni #85', '74231568', 'samuel.jimenez@gmail.com'),
(46, 'CI', '8741326', 'Elena', 'Saavedra', 'La Paz', 'Patacamaya', 'Zona Norte, Calle 23', '76412538', 'elena.saavedra@gmail.com'),
(47, 'Licencia', '3254786', 'Guillermo', 'Escobar', 'Cochabamba', 'Cochabamba', 'Zona Central, Av. Libertador #145', '75412365', 'guillermo.escobar@gmail.com'),
(48, 'DNI', '7453268', 'Paola', 'Flores', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Zona Norte, Av. Busch', '76325489', 'paola.flores@gmail.com'),
(49, 'Otro', 'NIT986532', 'Manuel', 'Ordoñez', 'Beni', 'Guayaramerin', 'Av. Beni #78', '76325148', 'manuel.ordonez@gmail.com'),
(50, 'CI', '9856231', 'Martha', 'Maldonado', 'Tarija', 'Bermejo', 'Calle del Mercado #5', '73425168', 'martha.maldonado@gmail.com'),
(51, 'CI', '6012347', 'Adriana', 'Calle', 'Cochabamba', 'Cochabamba', 'Av. Oquendo #245', '71234567', 'adriana.calle@gmail.com'),
(52, 'DNI', '7563214', 'Mario', 'Gutierrez', 'Santa Cruz', 'Cotoca', 'Calle 1ro de Mayo #78', '76543218', 'mario.gutierrez@gmail.com'),
(53, 'Licencia', '4589632', 'Beatriz', 'Hinojosa', 'Pando', 'Cobija', 'Av. Central #54', '78456932', 'beatriz.hinojosa@gmail.com'),
(54, 'CI', '3652487', 'Juan', 'Rojas', 'La Paz', 'Viacha', 'Calle de los Andes #15', '71234589', 'juan.rojas@gmail.com'),
(55, 'DNI', '4523651', 'Andrea', 'Perez', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Zona Equipetrol, Calle 10', '78456239', 'andrea.perez@gmail.com'),
(56, 'Pasaporte', 'PA789564', 'Raquel', 'Avila', 'Beni', 'Trinidad', 'Av. Banzer #452', '73415987', 'raquel.avila@gmail.com'),
(57, 'CI', '7845632', 'Alvaro', 'Cespedes', 'Chuquisaca', 'Sucre', 'Zona Central, Calle Murillo #24', '78452639', 'alvaro.cespedes@gmail.com'),
(58, 'Licencia', '7532148', 'Silvia', 'Soria', 'Cochabamba', 'Sacaba', 'Av. Villazon, Zona Norte', '71456392', 'silvia.soria@gmail.com'),
(59, 'DNI', '6321458', 'Felipe', 'Montano', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Av. Beni, 4to Anillo', '79563421', 'felipe.montano@gmail.com'),
(60, 'Cedula', '5236984', 'Marcelo', 'Quinteros', 'La Paz', 'La Paz', 'Calle Jaen #145', '71234576', 'marcelo.quinteros@gmail.com'),
(61, 'Pasaporte', 'PA123789', 'Estela', 'Villarroel', 'Potosí', 'Potosí', 'Zona Ferroviaria, Calle Beni #78', '75689412', 'estela.villarroel@gmail.com'),
(62, 'DNI', '1478529', 'Vicente', 'Ibanez', 'Tarija', 'Yacuiba', 'Calle Comercio #76', '76423518', 'vicente.ibanez@gmail.com'),
(63, 'Licencia', '4123658', 'Nestor', 'Camacho', 'Santa Cruz', 'Montero', 'Av. El Trompillo, Zona Norte', '76321489', 'nestor.camacho@gmail.com'),
(64, 'CI', '4785263', 'Paulina', 'Choque', 'La Paz', 'Patacamaya', 'Calle Sucre #89', '73124587', 'paulina.choque@gmail.com'),
(65, 'Otro', 'NIT321456', 'Miriam', 'Arze', 'Cochabamba', 'Quillacollo', 'Av. Circunvalación #56', '79531246', 'miriam.arze@gmail.com'),
(66, 'Cedula', '5369814', 'Sergio', 'Suarez', 'Potosí', 'Uyuni', 'Zona Norte, Calle Bolívar #11', '79456321', 'sergio.suarez@gmail.com'),
(67, 'CI', '9856234', 'Daniela', 'Arce', 'La Paz', 'El Alto', 'Zona Sur, Av. Arce #34', '71456239', 'daniela.arce@gmail.com'),
(68, 'Licencia', '3124789', 'Jaime', 'Ortiz', 'Chuquisaca', 'Sucre', 'Av. Juana Azurduy #102', '76321584', 'jaime.ortiz@gmail.com'),
(69, 'DNI', '7589632', 'Elena', 'Fuentes', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Zona Centro, Av. Grigotá #58', '78236415', 'elena.fuentes@gmail.com'),
(70, 'Pasaporte', 'PA456789', 'Lucas', 'Zeballos', 'Cochabamba', 'Cochabamba', 'Av. América #148', '72596314', 'lucas.zeballos@gmail.com'),
(71, 'CI', '2143658', 'Oscar', 'Guzman', 'Tarija', 'Tarija', 'Calle 15 de Abril #45', '71258496', 'oscar.guzman@gmail.com'),
(72, 'Cedula', '4123567', 'Fabiana', 'Rios', 'Beni', 'Trinidad', 'Zona Central, Calle Comercio #87', '75421683', 'fabiana.rios@gmail.com'),
(73, 'DNI', '6987451', 'Manuel', 'Lopez', 'Pando', 'Cobija', 'Calle 9 de Febrero #36', '72416389', 'manuel.lopez@gmail.com'),
(74, 'CI', '5632147', 'Antonia', 'Maldonado', 'La Paz', 'Achacachi', 'Zona Centro, Calle 20 de Octubre #52', '71452639', 'antonia.maldonado@gmail.com'),
(75, 'Licencia', '4789561', 'Renato', 'Vargas', 'Santa Cruz', 'Warnes', 'Zona Norte, Calle San Martin #89', '75214863', 'renato.vargas@gmail.com'),
(76, 'Otro', 'NIT963258', 'Susana', 'Cardenas', 'Chuquisaca', 'Sucre', 'Zona Sur, Calle España #102', '72546312', 'susana.cardenas@gmail.com'),
(77, 'Cedula', '7896325', 'Carlos', 'Torrico', 'La Paz', 'Viacha', 'Zona Norte, Av. General #78', '71236589', 'carlos.torrico@gmail.com'),
(78, 'Pasaporte', 'PA987654', 'Ana', 'Menacho', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Av. Roca y Coronado #65', '76321549', 'ana.menacho@gmail.com'),
(79, 'CI', '4512368', 'Martin', 'Escalante', 'Potosí', 'Potosí', 'Zona Sur, Calle Junin #10', '78459312', 'martin.escalante@gmail.com'),
(80, 'Licencia', '3214789', 'Evelyn', 'Roca', 'Oruro', 'Huanuni', 'Av. Murillo #97', '76324589', 'evelyn.roca@gmail.com'),
(81, 'DNI', '8745632', 'Julio', 'Salinas', 'Cochabamba', 'Cochabamba', 'Av. Blanco Galindo #120', '72365489', 'julio.salinas@gmail.com'),
(82, 'Pasaporte', 'PA215478', 'Monica', 'Oliva', 'La Paz', 'La Paz', 'Calle Comercio #102', '72365841', 'monica.oliva@gmail.com'),
(83, 'CI', '6541237', 'Sofia', 'Mendoza', 'Tarija', 'Bermejo', 'Calle del Comercio #58', '71234568', 'sofia.mendoza@gmail.com'),
(84, 'Cedula', '4158963', 'Gabriela', 'Romero', 'Beni', 'Riberalta', 'Calle Colon #76', '76324518', 'gabriela.romero@gmail.com'),
(85, 'Otro', 'NIT475632', 'Luis', 'Villanueva', 'Pando', 'Cobija', 'Zona Norte, Calle Sucre #34', '74231586', 'luis.villanueva@gmail.com'),
(86, 'CI', '7854123', 'Cecilia', 'Chavez', 'La Paz', 'La Paz', 'Calle Potosí #14', '71236587', 'cecilia.chavez@gmail.com'),
(87, 'DNI', '9632587', 'Roberto', 'Aguirre', 'Santa Cruz', 'Montero', 'Av. Banzer #102', '72543618', 'roberto.aguirre@gmail.com'),
(88, 'Licencia', '3265874', 'Natalia', 'Serrano', 'Cochabamba', 'Quillacollo', 'Calle Padilla #56', '75432168', 'natalia.serrano@gmail.com'),
(89, 'CI', '4125863', 'Claudia', 'Morales', 'Potosí', 'Uyuni', 'Zona Central, Calle Jaen #15', '71548932', 'claudia.morales@gmail.com'),
(90, 'Pasaporte', 'PA365214', 'Rafael', 'Quispe', 'La Paz', 'El Alto', 'Zona 12 de Octubre #87', '76321546', 'rafael.quispe@gmail.com'),
(91, 'Cedula', '7412365', 'Fernando', 'Delgado', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Av. Cañoto #45', '79562143', 'fernando.delgado@gmail.com'),
(92, 'CI', '5896231', 'Patricia', 'Loza', 'Tarija', 'Yacuiba', 'Calle Comercio #16', '73421568', 'patricia.loza@gmail.com'),
(93, 'Otro', 'NIT698532', 'Bernardo', 'Villegas', 'Chuquisaca', 'Sucre', 'Av. Real #23', '76453218', 'bernardo.villegas@gmail.com'),
(94, 'DNI', '5874621', 'Hilda', 'Cabrera', 'Beni', 'Guayaramerin', 'Av. Comercio #54', '74521368', 'hilda.cabrera@gmail.com'),
(95, 'Licencia', '3257418', 'Sandra', 'Mamani', 'Potosí', 'Uyuni', 'Calle Colon #27', '78412369', 'sandra.mamani@gmail.com'),
(96, 'CI', '7845629', 'Oscar', 'Beltran', 'Cochabamba', 'Sacaba', 'Av. Circunvalación #96', '75213468', 'oscar.beltran@gmail.com'),
(97, 'Pasaporte', 'PA632589', 'Ivana', 'Cabrera', 'Pando', 'Cobija', 'Zona Norte, Av. Central', '75486312', 'ivana.cabrera@gmail.com'),
(98, 'Cedula', '5412368', 'Ernesto', 'Peralta', 'La Paz', 'La Paz', 'Calle Comercio #58', '71245896', 'ernesto.peralta@gmail.com'),
(99, 'DNI', '8741523', 'Nadia', 'Gallardo', 'Tarija', 'Tarija', 'Calle Murillo #78', '76231598', 'nadia.gallardo@gmail.com'),
(100, 'Licencia', '3658742', 'Rodrigo', 'Palacios', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Av. Paragua #45', '78945623', 'rodrigo.palacios@gmail.com'),
(101, 'CI', '8576312', 'Hugo', 'Valencia', 'La Paz', 'La Paz', 'Av. Camacho #120', '73124589', 'hugo.valencia@gmail.com'),
(102, 'DUI', '56483921', 'Leticia', 'Mendoza', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Calle Libertad #97', '76453210', 'leticia.mendoza@gmail.com'),
(103, 'Cedula', '7463258', 'Bruno', 'Arce', 'Cochabamba', 'Cochabamba', 'Av. Ayacucho #455', '71236458', 'bruno.arce@gmail.com'),
(104, 'CI', '9658741', 'Mariana', 'Ramos', 'Oruro', 'Oruro', 'Zona Sur, Calle Murillo', '75412369', 'mariana.ramos@gmail.com'),
(105, 'Pasaporte', 'PA568412', 'Felipe', 'Gutierrez', 'Potosí', 'Potosí', 'Calle Ferroviaria #98', '74325169', 'felipe.gutierrez@gmail.com'),
(106, 'Licencia', '8741596', 'Sofia', 'Romero', 'Tarija', 'Tarija', 'Zona Central, Av. Sucre #32', '75321458', 'sofia.romero@gmail.com'),
(107, 'Otro', 'NIT753201', 'Manuel', 'Cruz', 'Chuquisaca', 'Sucre', 'Av. Las Américas #89', '76412578', 'manuel.cruz@gmail.com'),
(108, 'DNI', '6789453', 'Silvia', 'Pérez', 'La Paz', 'El Alto', 'Calle La Paz #45', '71453627', 'silvia.perez@gmail.com'),
(109, 'CI', '5496231', 'Ramiro', 'Hurtado', 'Beni', 'Trinidad', 'Calle Beni #12', '73125864', 'ramiro.hurtado@gmail.com'),
(110, 'Cedula', '8745623', 'Gabriela', 'Lopez', 'Cochabamba', 'Sacaba', 'Zona Norte, Calle Colon', '73214569', 'gabriela.lopez@gmail.com'),
(111, 'DNI', '3265987', 'Claudia', 'Alvarez', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Av. Paragua, 4to Anillo', '72135698', 'claudia.alvarez@gmail.com'),
(112, 'Licencia', '7452319', 'Victor', 'Martinez', 'Oruro', 'Huanuni', 'Calle Independencia #8', '73125486', 'victor.martinez@gmail.com'),
(113, 'Pasaporte', 'PA632147', 'Andrea', 'López', 'Pando', 'Cobija', 'Zona Centro, Calle Sucre', '73214587', 'andrea.lopez@gmail.com'),
(114, 'CI', '7623145', 'Lucas', 'Fernandez', 'Tarija', 'Bermejo', 'Av. América #25', '75432178', 'lucas.fernandez@gmail.com'),
(115, 'Otro', 'NIT784632', 'Karla', 'Soto', 'La Paz', 'Viacha', 'Zona Este, Calle Santa Cruz', '74231568', 'karla.soto@gmail.com'),
(116, 'DNI', '9874135', 'Julio', 'Rojas', 'Potosí', 'Uyuni', 'Av. Libertad #37', '73421597', 'julio.rojas@gmail.com'),
(117, 'Cedula', '4153269', 'Verónica', 'Quispe', 'Chuquisaca', 'Sucre', 'Zona Sur, Calle Bolívar', '76421598', 'veronica.quispe@gmail.com'),
(118, 'Licencia', '8564312', 'Mario', 'Guzman', 'Santa Cruz', 'Camiri', 'Zona Centro, Av. Principal', '75321489', 'mario.guzman@gmail.com'),
(119, 'CI', '7814562', 'Flor', 'Mamani', 'La Paz', 'Achacachi', 'Calle Comercio #78', '71236547', 'flor.mamani@gmail.com'),
(120, 'Pasaporte', 'PA475263', 'Raquel', 'Vargas', 'Beni', 'Guayaramerin', 'Av. 9 de Febrero #102', '76325149', 'raquel.vargas@gmail.com'),
(121, 'DUI', '7849651', 'Carlos', 'Llanos', 'Potosí', 'Uyuni', 'Zona Ferroviaria, Av. Principal', '74325816', 'carlos.llanos@gmail.com'),
(122, 'DNI', '6325987', 'Javier', 'Medina', 'Cochabamba', 'Quillacollo', 'Calle Central #56', '74312589', 'javier.medina@gmail.com'),
(123, 'Otro', 'NIT546372', 'Magdalena', 'Ortiz', 'Santa Cruz', 'Montero', 'Av. Busch #78', '73214598', 'magdalena.ortiz@gmail.com'),
(124, 'Licencia', '7452369', 'Luis', 'Roca', 'La Paz', 'Patacamaya', 'Zona Norte, Av. Litoral', '76321548', 'luis.roca@gmail.com'),
(125, 'Cedula', '6452379', 'Marina', 'Escobar', 'Oruro', 'Oruro', 'Calle Ayacucho #23', '75412365', 'marina.escobar@gmail.com'),
(126, 'CI', '7523641', 'Victor', 'Hinojosa', 'Tarija', 'Yacuiba', 'Av. Comercio #45', '75321456', 'victor.hinojosa@gmail.com'),
(127, 'DNI', '3652418', 'Sara', 'Lopez', 'Pando', 'Cobija', 'Zona Norte, Calle Murillo', '74125698', 'sara.lopez@gmail.com'),
(128, 'Pasaporte', 'PA475623', 'Jorge', 'Ramirez', 'Cochabamba', 'Cochabamba', 'Av. Oquendo #78', '71452396', 'jorge.ramirez@gmail.com'),
(129, 'Otro', 'NIT123678', 'Iris', 'Salinas', 'Chuquisaca', 'Sucre', 'Zona Sur, Calle Junín', '73214589', 'iris.salinas@gmail.com'),
(130, 'CI', '8753241', 'Samuel', 'Vilca', 'Beni', 'Trinidad', 'Calle Comercio #65', '76321487', 'samuel.vilca@gmail.com'),
(131, 'DNI', '5632148', 'Olga', 'Monje', 'Santa Cruz', 'Santa Cruz de la Sierra', 'Av. Mutualista #43', '75412569', 'olga.monje@gmail.com'),
(132, 'Licencia', '4123658', 'Luis', 'Rivera', 'Tarija', 'Villamontes', 'Calle Principal #10', '76451235', 'luis.rivera@gmail.com'),
(133, 'Pasaporte', 'PA632457', 'Diana', 'Guerra', 'Potosí', 'Potosí', 'Zona Central, Calle 25 de Mayo', '74321568', 'diana.guerra@gmail.com'),
(134, 'Cedula', '8745362', 'Raul', 'Aramayo', 'La Paz', 'El Alto', 'Calle México #56', '76325178', 'raul.aramayo@gmail.com'),
(135, 'CI', '6324158', 'Natalia', 'Coronel', 'Chuquisaca', 'Sucre', 'Zona Norte, Calle Colon', '76451278', 'natalia.coronel@gmail.com'),
(136, 'Otro', 'NIT897561', 'Erika', 'Campos', 'Pando', 'Cobija', 'Zona Este, Calle La Paz', '74325169', 'erika.campos@gmail.com'),
(137, 'DNI', '8745621', 'Carlos', 'Serrano', 'Cochabamba', 'Cochabamba', 'Zona Sur, Calle España', '75412598', 'carlos.serrano@gmail.com'),
(138, 'Pasaporte', 'PA965412', 'Sofia', 'Gonzalez', 'Santa Cruz', 'San Ignacio de Velasco', 'Calle Central #45', '76421539', 'sofia.gonzalez@gmail.com'),
(139, 'Licencia', '7452639', 'Leonardo', 'Mendoza', 'Oruro', 'Huanuni', 'Calle Libertador #78', '75412365', 'leonardo.mendoza@gmail.com'),
(140, 'DNI', '7841236', 'Jimena', 'Espinoza', 'Beni', 'Riberalta', 'Zona Oeste, Calle Sucre', '74125697', 'jimena.espinoza@gmail.com'),
(141, 'Cedula', '6325471', 'Joaquin', 'Blanco', 'La Paz', 'Viacha', 'Av. Villazón #63', '75321485', 'joaquin.blanco@gmail.com'),
(142, 'CI', '8547326', 'Monica', 'Salas', 'Cochabamba', 'Tiquipaya', 'Calle Central #12', '74321548', 'monica.salas@gmail.com'),
(143, 'Otro', 'NIT542136', 'Esteban', 'Mercado', 'Santa Cruz', 'Warnes', 'Zona Norte, Av. Santa Cruz', '73421569', 'esteban.mercado@gmail.com'),
(144, 'Pasaporte', 'PA632154', 'Lorena', 'Pacheco', 'Tarija', 'Tarija', 'Calle Bolívar #27', '73214576', 'lorena.pacheco@gmail.com'),
(145, 'DNI', '5642138', 'Gabriel', 'Flores', 'Potosí', 'Llallagua', 'Calle Ayacucho #9', '71236587', 'gabriel.flores@gmail.com'),
(146, 'Licencia', '7452136', 'Elisa', 'Ruiz', 'La Paz', 'La Paz', 'Av. Hernando Siles #78', '74325689', 'elisa.ruiz@gmail.com'),
(147, 'CI', '8745613', 'Fernando', 'Ortiz', 'Santa Cruz', 'Cotoca', 'Av. Principal #99', '76421589', 'fernando.ortiz@gmail.com'),
(148, 'Cedula', '6325478', 'Marcos', 'Quintana', 'Beni', 'Trinidad', 'Calle Comercio #22', '75321469', 'marcos.quintana@gmail.com'),
(149, 'DUI', '8745632', 'Nadia', 'Paz', 'Cochabamba', 'Quillacollo', 'Zona Central, Calle General Pando', '76451239', 'nadia.paz@gmail.com'),
(150, 'Pasaporte', 'PA478523', 'Carmen', 'Zeballos', 'Chuquisaca', 'Sucre', 'Zona Norte, Av. Bolivia', '73214567', 'carmen.zeballos@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `detalle_id` int(11) NOT NULL,
  `codigo_pedido` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `producto_nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`detalle_id`, `codigo_pedido`, `cantidad`, `producto_nombre`, `precio`, `fecha`) VALUES
(16, 'PED20241029042044', 1, 'Ibuprofeno', 10.00, '2024-10-28 23:20:44'),
(17, 'PED20241106161808', 1, 'Mentisan', 16.65, '2024-11-06 11:18:08'),
(18, 'PED20241106161808', 1, 'Nexcare Micropore', 34.00, '2024-11-06 11:18:08'),
(19, 'PED20241106161808', 1, 'Aspirinetas', 65.75, '2024-11-06 11:18:08'),
(20, 'PED20241106161808', 1, 'L-Arginine 500', 195.00, '2024-11-06 11:18:08'),
(21, 'PED20241106161808', 1, 'Coca Cola', 3.00, '2024-11-06 11:18:08'),
(22, 'PED20241106163503', 1, 'Coca Cola', 3.00, '2024-11-06 11:35:03'),
(23, 'PED20241106163503', 1, 'L-Arginine 500', 195.00, '2024-11-06 11:35:03'),
(24, 'PED20241106163503', 1, 'Aspirinetas', 65.75, '2024-11-06 11:35:03'),
(25, 'PED20241106164318', 1, 'Digestan Compuesto', 4.84, '2024-11-06 11:43:18'),
(26, 'PED20241106164318', 1, 'Omeprazol', 1.00, '2024-11-06 11:43:18'),
(27, 'PED20241106164318', 1, 'Resfrianex Comprimidos', 2.61, '2024-11-06 11:43:18'),
(28, 'PED20241106164318', 1, 'Coca Cola', 3.00, '2024-11-06 11:43:18'),
(29, 'PED20241106164318', 1, 'Aspirinetas', 65.75, '2024-11-06 11:43:18'),
(30, 'PED20241107042246', 1, 'Resfrianex Comprimidos', 2.61, '2024-11-06 23:22:46'),
(31, 'PED20241107052449', 1, 'Digestan Compuesto', 4.84, '2024-11-07 00:24:49'),
(32, 'PED20241107052449', 1, 'Mentisan', 16.65, '2024-11-07 00:24:49'),
(33, 'PED20241107052449', 1, 'Nexcare Micropore', 34.00, '2024-11-07 00:24:49'),
(34, 'PED20241108060700', 2, 'Coca Cola', 3.00, '2024-11-08 01:07:00'),
(35, 'PED20241108060700', 3, 'L-Arginine 500', 195.00, '2024-11-08 01:07:00'),
(36, 'PED20241109003929', 2, 'L-Arginine 500', 195.00, '2024-11-08 19:39:29'),
(37, 'PED20241109003929', 1, 'Pepsi', 13.00, '2024-11-08 19:39:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `empresa_nombre` varchar(90) NOT NULL,
  `empresa_telefono` varchar(20) NOT NULL,
  `empresa_email` varchar(50) NOT NULL,
  `empresa_direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `empresa_nombre`, `empresa_telefono`, `empresa_email`, `empresa_direccion`) VALUES
(2, 'Farmacias Corporativas S.A.', '61553333', 'pmcfarlane@farmacorp.com', 'Calle Pedro Salazar, esquina Avenida 6 de Agosto, La Paz, Bolivia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `pedido_id` int(11) NOT NULL,
  `codigo_pedido` varchar(100) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `correo_cliente` varchar(100) DEFAULT NULL,
  `celular_cliente` varchar(20) DEFAULT NULL,
  `estado` enum('pendiente','comprobado','completado') DEFAULT 'pendiente',
  `metodo_pago` varchar(100) DEFAULT NULL,
  `razon_social` varchar(100) DEFAULT NULL,
  `nit_cliente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`pedido_id`, `codigo_pedido`, `fecha`, `nombre_cliente`, `correo_cliente`, `celular_cliente`, `estado`, `metodo_pago`, `razon_social`, `nit_cliente`) VALUES
(11, 'PED20241029042044', '2024-10-28 23:20:44', 'Juan', 'ejemplo@gmial.com', '12345678', 'pendiente', NULL, NULL, NULL),
(12, 'PED20241106161808', '2024-11-06 11:18:08', 'Andres Jauregui', 'aduj@gmail.com', '76435641', 'completado', NULL, NULL, '2710350'),
(13, 'PED20241106163503', '2024-11-06 11:35:03', 'Jhonny Peralta', 'johnnyper@gmail.com', '65170328', 'comprobado', NULL, NULL, '3385763'),
(14, 'PED20241106164318', '2024-11-06 11:43:18', 'Vera Oroza', 'lucioVerOr@gmail.com', '77364521', 'pendiente', 'efectivo', 'Oroza', '5924256'),
(15, 'PED20241107042246', '2024-11-06 23:22:46', 'asd', 'juan941188@gmail.com', '64023012', 'pendiente', 'efectivo', 'asd', '12312412412'),
(16, 'PED20241107052449', '2024-11-07 00:24:49', 'Andres Alfaro', 'ejemplo@gmail.com', '76384734', 'comprobado', NULL, NULL, NULL),
(17, 'PED20241108060700', '2024-11-08 01:07:00', 'Leonee Londono', 'ejemplo2@gmail.com', '4444444', 'pendiente', 'qrPago', NULL, '44444444'),
(18, 'PED20241109003929', '2024-11-08 19:39:29', 'Daniela Ovando', 'ejmplo@ucb.edu.bo', '11111111', 'pendiente', 'tarjetaCredito', NULL, '22222222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `producto_id` int(20) NOT NULL,
  `producto_codigo` varchar(77) NOT NULL,
  `producto_nombre` varchar(100) NOT NULL,
  `producto_stock_total` int(25) NOT NULL,
  `producto_tipo_unidad` varchar(20) NOT NULL,
  `producto_precio_compra` decimal(30,2) NOT NULL,
  `producto_precio_venta` decimal(30,2) NOT NULL,
  `producto_marca` varchar(35) NOT NULL,
  `producto_modelo` varchar(35) NOT NULL,
  `producto_estado` varchar(20) NOT NULL,
  `producto_foto` varchar(500) NOT NULL,
  `categoria_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_nombre`, `producto_stock_total`, `producto_tipo_unidad`, `producto_precio_compra`, `producto_precio_venta`, `producto_marca`, `producto_modelo`, `producto_estado`, `producto_foto`, `categoria_id`) VALUES
(33, '123456789', 'Ibuprofeno', 5, 'Unidad', 5.00, 10.00, 'BAGO', '', 'Habilitado', '', 7),
(34, '7771234567890', 'Digestan Compuesto', 700, 'Sobre', 2.80, 4.84, 'VITA', '5.75 g.', 'Habilitado', '', 8),
(35, '7771234567891', 'Actron', 3000, 'Caja', 3.50, 4.90, 'Actron', '600 mg.', 'Habilitado', '7771234567891_91.png', 7),
(36, '7771234567892', 'Mentisan', 40, 'Lata', 12.00, 16.65, 'INTI', '25 G', 'Habilitado', '7771234567892_16.png', 8),
(37, '7771234567893', 'Omeprazol', 1000, 'Caja', 0.50, 1.00, 'La Sante', '20 mg.', 'Habilitado', '7771234567893_31.png', 7),
(38, '7771234567894', 'Resfrianex Comprimidos', 500, 'Caja', 1.50, 2.61, 'Bagó', 'Comprimidos', 'Habilitado', '7771234567894_23.png', 7),
(39, '7771234567895', 'Nexcare Micropore', 25, 'Caja', 25.00, 34.00, '3M', 'Color piel, 5 cm. x 9.1 m.', 'Habilitado', '7771234567895_18.png', 8),
(40, '7771234567896', 'Nan 2 Optipro', 150, 'Lata', 85.43, 95.00, 'Nestle', '1,1 Kg.', 'Habilitado', '7771234567896_2.png', 7),
(41, '7771234567897', 'L-Arginine 500', 100, 'Botella', 180.00, 195.00, 'GNC', '90 Cápsulas', 'Habilitado', '7771234567897_27.png', 7),
(42, '7771234567898', 'Coca Cola', 260, 'Botella', 2.50, 3.00, 'The Coca-Cola Company', '300 ml', 'Habilitado', '7771234567898_29.png', 11),
(43, '7771234567899', 'Aspirinetas', 60, 'Caja', 60.00, 65.75, 'Bayer', '100 mg.', 'Habilitado', '7771234567899_69.png', 7),
(44, '7771234567800', 'Curadil', 170, 'Caja', 27.30, 33.90, 'Alcos', '250 ml.', 'Habilitado', '7771234567800_49.png', 7),
(45, '7771234567801', 'Huggies Natural Care XXG', 78, 'Paquete', 100.00, 120.00, 'Huggies', 'Pañales hasta 20 kg. X 58U', 'Habilitado', '7771234567801_61.png', 7),
(46, '7771234567802', 'Pepsi', 90, 'Botella', 11.50, 13.00, 'PepsiCo, Inc.', '3 lt', 'Habilitado', '7771234567802_0.jpg', 8),
(47, '7771234567803', 'Dolorsan', 65, 'Lata', 7.80, 9.27, 'ifc', 'Unguento', 'Habilitado', '7771234567803_21.jpg', 9),
(48, '7771234567804', 'Tialgin Paracetamol', 48, 'Caja', 2.99, 4.00, 'Tecnofarma', '1 g.', 'Habilitado', '7771234567804_89.jpg', 9),
(49, '7771234567805', 'Migranol', 160, 'Tira', 6.00, 7.15, 'Bagó', 'Comprimidos', 'Habilitado', '7771234567805_24.png', 9),
(50, '7771234567806', 'Bio Electro', 90, 'Caja', 2.50, 3.20, 'Genomma Lab', 'PCM 250, AS 250, CAF 65 (mg))', 'Habilitado', '7771234567806_97.jpg', 9),
(51, '7771234567807', 'Anaflex Mujer', 230, 'Caja', 3.56, 3.83, 'Bagó', 'PCM 500, DIC 50, CAF 30 (mg)', 'Habilitado', '7771234567807_63.png', 9),
(52, '7771234567808', 'Diclofenac Gel', 140, 'Caja', 22.00, 25.00, 'Bagó', 'Diclofenaco sódico 100g.', 'Habilitado', '7771234567808_94.png', 9),
(53, '7771234567809', 'Novadol Gel', 250, 'Caja', 74.60, 80.40, 'Breskot Pharma', 'DIC 2,SM 10.5 ,MTL 5.5 (pje)', 'Habilitado', '7771234567809_69.jpg', 9),
(54, '7771234567810', 'Parche Térmico León', 260, 'Sobre', 15.30, 24.95, 'Hansaplast', 'Parche 12 x 18 (cm.)', 'Habilitado', '7771234567810_47.jpg', 9),
(55, '7771234567811', 'Flogiatrin Pomada', 120, 'Otro', 84.24, 89.79, 'Megalabs', '100 gr', 'Habilitado', '7771234567811_2.jpg', 9),
(56, '7771234567812', 'Agua Vital', 340, 'Botella', 6.20, 7.50, 'The Coca-Cola Company', '2 lt.', 'Habilitado', '7771234567812_77.jpg', 12),
(57, '7771234567813', 'Agua Vital', 467, 'Botella', 3.50, 4.00, 'The Coca-Cola Company', '600 ml.', 'Habilitado', '7771234567813_93.png', 12),
(58, '7771234567814', 'Del Valle Fresh', 235, 'Botella', 10.00, 11.50, 'The Coca-Cola Company', '2.5 lt.', 'Habilitado', '7771234567814_86.jpg', 12),
(59, '7771234567815', 'Fanta Pomelo', 120, 'Botella', 7.50, 9.00, 'The Coca-Cola Company', '2.25 lt.', 'Habilitado', '7771234567815_51.png', 11),
(60, '7771234567816', 'Fanta Guaraná', 156, 'Botella', 10.00, 12.00, 'The Coca-Cola Company', '3 lt.', 'Habilitado', '7771234567816_37.jpg', 11),
(61, '7771234567817', 'Novadol Cápsulas', 145, 'Caja', 3.50, 5.19, 'Breskot Pharma', 'PCM 500, DIC 50 (mg.)', 'Habilitado', '7771234567817_44.png', 9),
(62, '7771234567818', 'Coca-Cola Oreo Zero', 78, 'Botella', 4.80, 6.50, 'The Coca-Cola Company', '500 ml.', 'Habilitado', '7771234567818_27.png', 11),
(63, '7771234567819', 'Ballerina Shampoo Brillo Luminoso', 60, 'Botella', 22.00, 23.60, 'Ballerina', '410 ml', 'Habilitado', '7771234567819_79.png', 10),
(64, '7771234567820', 'Algabo Baby Shampoo Manzanilla', 167, 'Botella', 26.70, 30.30, 'Algabo', '444ml', 'Habilitado', '7771234567820_92.png', 10),
(65, '7771234567821', 'Algabo Baby Shampoo Extra Suave', 290, 'Botella', 26.00, 29.30, 'Algabo', '200 ml.', 'Habilitado', '7771234567821_89.png', 10),
(66, '7771234567822', 'Agua Vital', 348, 'Botella', 6.00, 7.50, 'The Coca-Cola Company', '990 ml', 'Habilitado', '7771234567822_93.png', 12),
(67, '7771234567823', 'Ades Tropical', 110, 'Caja', 9.00, 13.00, 'The Coca-Cola Company', '1 lt.', 'Habilitado', '7771234567823_49.png', 12),
(68, '7771234567824', 'Acondicionador Elvive Oleo Coco', 99, 'Botella', 39.10, 42.30, 'Elvive', '370 ml.', 'Habilitado', '7771234567824_87.png', 10),
(69, '7771234567825', 'Acondicionador Elvive Dream', 175, 'Botella', 46.50, 48.40, 'Elvive', '370 ml.', 'Habilitado', '7771234567825_20.png', 10),
(70, '7771234567826', 'Aceite Capilar Farmax Lavanda', 50, 'Botella', 19.20, 24.00, 'Farmax', '100 ml', 'Habilitado', '7771234567826_50.png', 10),
(71, '7771234567926', 'Axe', 134, 'Lata', 17.00, 20.00, 'Axe', '152 ml', 'Habilitado', '7771234567926_47.png', 28),
(72, '7771234567927', 'Sedal Acondicionador Rizos DEfinidos', 368, 'Botella', 20.40, 26.10, 'Sedal Co-Creations', '300 ml', 'Habilitado', '7771234567927_21.jpg', 10),
(73, '7771234567990', 'Aciclovir', 200, 'Caja', 22.00, 27.00, 'ifa', '400 mg.', 'Habilitado', '7771234567990_52.jpg', 22),
(74, '7771234567991', 'Alcohol Etílico', 362, 'Botella', 13.00, 98.00, 'Porta', '1 lt.', 'Habilitado', '7771234567991_80.jpg', 14),
(75, '7771234567792', 'Cotrimazol', 156, 'Caja', 32.00, 43.00, 'LaboratorioChile', '25 gr', 'Habilitado', '', 22),
(76, '7771234567693', 'Loceryl', 169, 'Caja', 43.00, 50.00, 'Galderma', '5 porciento', 'Habilitado', '7771234567693_5.jpg', 22),
(77, '7771234568894', 'Nistanina', 243, 'Caja', 60.00, 65.00, 'ifa', '60 ml.', 'Habilitado', '7771234568894_91.jpg', 22),
(78, '7771234565895', 'Guantes de Latex', 500, 'Caja', 9.00, 13.00, 'Cuatrogasa', '100 unidades', 'Habilitado', '7771234565895_58.jpg', 14),
(79, '7771234567596', 'Barbijo', 321, 'Caja', 10.00, 12.00, 'Albatross', '50 unidades', 'Habilitado', '7771234567596_40.jpg', 14),
(80, '7771234568800', 'Glucosamin', 145, 'Caja', 52.20, 60.50, 'VITA', '20 ml.', 'Habilitado', '7771234568800_52.jpg', 17),
(81, '7771234563898', 'Vitamina C', 260, 'Caja', 0.20, 0.30, 'Generico', '30 Capsulas 20 mg.', 'Habilitado', '7771234563898_83.jpg', 17),
(82, '7771234567599', 'Dextroton', 167, 'Galon', 46.70, 51.30, 'Generico', '500 gr', 'Habilitado', '7771234567599_46.jpg', 17),
(83, '7771234570000', 'Omega 3', 376, 'Caja', 55.00, 65.00, 'SAE', '30 capsulas 1000 mg', 'Habilitado', '7771234570000_42.jpg', 17),
(84, '7771234570001', 'Cepillo de dientes', 100, 'Paquete', 15.00, 18.00, 'Foramen', 'Dureza Media', 'Habilitado', '7771234570001_3.jpg', 15),
(85, '7771234570002', 'Pasta de Dental CloseUp', 120, 'Caja', 22.00, 27.40, 'CloseUp', '90 gr.', 'Habilitado', '7771234570002_64.jpg', 15),
(86, '7771234570003', 'Pasta Dental Colgate Original', 140, 'Caja', 19.20, 23.50, 'Colgate', '100 gr', 'Habilitado', '7771234570003_38.jpg', 15),
(87, '7771234570004', 'Prueba de Embarazo', 220, 'Caja', 15.00, 19.00, 'Clearblue', 'Digital', 'Habilitado', '7771234570004_3.png', 23),
(88, '7771234570005', 'Test de Embarazo', 180, 'Caja', 12.00, 16.00, 'LaPrepie', '1 test', 'Habilitado', '7771234570005_53.png', 23),
(89, '7771234557826', 'Typirec', 1900, 'Unidad', 1.70, 2.06, 'LAFAR', 'Cápsula blanda', 'Habilitado', '7771234557826_70.jpg', 16),
(90, '7771234167826', 'Flavicold Noche', 468, 'Sobre', 5.80, 7.70, 'Cofar', '15 mg', 'Habilitado', '7771234167826_26.jpg', 16),
(91, '7771234367821', 'Resfrianex Día y Noche', 375, 'Unidad', 5.20, 8.30, 'Bago', 'Blister x 3 cápsulas', 'Habilitado', '7771234367821_9.png', 16),
(92, '7771234367822', 'Resfrianex Sobre Día', 248, 'Sobre', 4.10, 6.50, 'Bago', '15 mg.', 'Habilitado', '7771234367822_65.png', 16),
(93, '7771234367823', 'Resfrianex Sobre Noche', 269, 'Sobre', 5.00, 6.50, 'Bago', '15 gr.', 'Habilitado', '7771234367823_90.png', 16),
(94, '7771234367824', 'Antigripal L. CH', 246, 'Unidad', 9.10, 12.90, 'Laboratorio Chile', 'Blister x 4 cápsulas', 'Habilitado', '7771234367824_68.jpg', 16),
(95, '7771234367825', 'Resfriolito', 357, 'Unidad', 0.60, 0.75, 'Alcos', 'Blister x 4 tabletas', 'Habilitado', '7771234367825_46.jpg', 16),
(96, '7771234367826', 'Alergin', 578, 'Unidad', 1.20, 3.46, 'Alcos', '4 mg. x tableta', 'Habilitado', '7771234367826_99.jpg', 16),
(97, '7771234367827', 'Mamadera Anti Colico', 150, 'Unidad', 60.30, 68.20, 'Philips', '125 ml.', 'Habilitado', '7771234367827_3.jpg', 27),
(98, '7771234367828', 'Nuby Aspirador Nasal', 310, 'Unidad', 32.42, 41.60, 'Nuby', 'Pieza', 'Habilitado', '7771234367828_67.jpg', 27),
(99, '7771234367829', 'Cepillo Limpieza Para Mamadera', 286, 'Unidad', 72.10, 75.60, 'Dr Browns', 'X Unidad', 'Habilitado', '7771234367829_68.jpg', 27),
(100, '7771234367830', 'Pigeon Tetina Peristáltica Boca Standard', 149, 'Paquete', 51.10, 63.00, 'Pigeon', 'X 2 piezas', 'Habilitado', '7771234367830_7.jpg', 27),
(101, '7771234367831', 'Colonia de Bebés Naturals', 376, 'Botella', 21.50, 23.00, 'Arrurru', '120 ml.', 'Habilitado', '7771234367831_12.jpg', 27),
(102, '7771234367832', 'Vaso Con Bombilla Flexible', 481, 'Unidad', 105.20, 110.70, 'Avent', '200 ml.', 'Habilitado', '7771234367832_28.jpg', 27),
(103, '7771234367843', 'Acondicionador Para Niños Gotas De Brillo', 482, 'Botella', 39.63, 45.30, 'JohnsonS', '500 ml.', 'Habilitado', '7771234367843_13.jpg', 26),
(104, '7771234367844', 'Balsamo Acondicionador Baby Care X 610Ml', 230, 'Botella', 48.10, 53.70, 'Simonds', '610 ml.', 'Habilitado', '7771234367844_14.jpg', 26),
(105, '7771234367845', 'Baby Acondicionador No Más Lagrimas X 200Ml', 190, 'Botella', 25.22, 33.90, 'Johnson', '200 ml.', 'Habilitado', '7771234367845_8.jpg', 26),
(106, '7771234367846', 'Baby Shampoo Gotas De Brillo', 285, 'Botella', 30.40, 32.43, 'Johnson', '750 ml.', 'Habilitado', '7771234367846_71.jpg', 26),
(107, '7771234367847', 'Baño Liquido Antes De Dormir', 471, 'Botella', 38.10, 43.95, 'Johnson', '400 ml.', 'Habilitado', '7771234367847_93.jpg', 26),
(108, '7771234367848', 'Shampoo Manzanilla', 693, 'Botella', 41.00, 52.60, 'Johnson', '400 ml.', 'Habilitado', '7771234367848_71.jpg', 26),
(109, '7771234367849', 'Kids Shampoo Fresa Cremosa', 675, 'Botella', 28.00, 30.00, 'Loreal', '265Ml', 'Habilitado', '7771234367849_14.jpg', 26),
(110, '7771234367850', 'Kids Shampoo Manzanilla', 412, 'Botella', 28.00, 30.00, 'Loreal', '265Ml', 'Habilitado', '7771234367850_71.jpg', 26),
(111, '7771234367851', 'Shampoo 2 En 1 Pineappel', 532, 'Botella', 50.10, 55.47, 'Simonds', '400Ml', 'Habilitado', '7771234367851_60.jpg', 26),
(112, '7771234367852', 'Nescafe Cappuccino X 120G', 43, 'Caja', 31.10, 36.40, 'Nescafe', '6 sobres X 20gr', 'Habilitado', '7771234367852_7.jpg', 21),
(113, '7771234367853', 'Windsor Mate Manzanilla X 20 Unidades', 159, 'Caja', 5.80, 7.90, 'Windsor', 'Caja X20 sobres X', 'Habilitado', '7771234367853_60.jpg', 21),
(114, '7771234367854', 'Nescafe Cafe Mokaccino X 150G', 101, 'Caja', 32.34, 39.70, 'Nescafe', 'Caja x 6 sobres x 25 g.', 'Habilitado', '7771234367854_85.jpg', 21),
(115, '7771234367855', 'Nescafé Tradición X 200G', 39, 'Otro', 48.99, 55.40, 'Nescafe', '200 gr.', 'Habilitado', '7771234367855_12.jpg', 21),
(116, '7771234367856', 'Chocolike Instantáneo', 137, 'Bolsa', 28.10, 31.00, 'Madisa', 'Bolsa X 1 Kg.', 'Habilitado', '7771234367856_55.jpg', 21),
(117, '7771234367857', 'Biogurt Probiotico Durazno', 249, 'Botella', 14.20, 18.60, 'Pil', '1 lt.', 'Habilitado', '7771234367857_27.jpg', 20),
(118, '7771234367858', 'Chiqui Choc Leche Saborizada', 235, 'Bolsa', 2.00, 2.20, 'Pil', 'Bolsa x 140 ml.', 'Habilitado', '7771234367858_67.jpg', 20),
(119, '7771234367859', 'Chiqui Frutilla Leche Saborizada', 200, 'Bolsa', 2.00, 2.20, 'Pil', 'Bolsa x 140 ml.', 'Habilitado', '7771234367859_4.jpg', 20),
(120, '7771234367860', 'Margarina Regia Mantequilla', 90, 'Otro', 18.22, 21.75, 'Alicorp', 'Embase X 425G', 'Habilitado', '7771234367860_16.jpg', 20),
(121, '7771234367861', 'Alpina Baby Ciruela X 113G', 387, 'Otro', 450.00, 500.00, 'Alpina Baby', 'Frasco x 113 gr.', 'Habilitado', '7771234367861_57.jpg', 25),
(122, '7771234367862', 'Alpina Baby Durazno', 189, 'Otro', 18.00, 22.00, 'Alpina Baby', 'Frasco x 113 gr.', 'Habilitado', '7771234367862_61.jpg', 25),
(123, '7771234367863', 'Alpina Baby Manzana', 150, 'Otro', 19.00, 22.00, 'Alpina Baby', 'Frasco x 113 gr.', 'Habilitado', '7771234367863_69.jpg', 25),
(124, '7771234367864', 'Bebelac Gold 1 Formula Lactea', 120, 'Lata', 150.00, 180.00, 'Bebelac Gold', '400 gr.', 'Habilitado', '7771234367864_95.jpg', 25),
(125, '7771234367865', 'Bebelac Gold 1 Formula Lactea', 125, 'Lata', 180.00, 220.00, 'Bebelac Gold', '900 gr.', 'Habilitado', '7771234367865_96.jpg', 25),
(126, '7771234367866', 'Bebelac Gold 2 Formula Lactea', 100, 'Lata', 170.00, 190.00, 'Bebelac Gold', '400 gr.', 'Habilitado', '7771234367866_58.jpg', 25),
(127, '7771234367868', 'Bebelac Gold 2 Formula Lactea', 110, 'Lata', 175.00, 200.00, 'Bebelac Gold', '900 gr.', 'Habilitado', '7771234367868_49.jpg', 25),
(128, '7771234367870', 'Bebelac Gold 3 Formula Lactea', 100, 'Lata', 200.00, 265.00, 'Bebelac Gold', '1.2Kg', 'Habilitado', '7771234367870_91.jpg', 25),
(129, '7771234367871', 'Cerelac 5 Cereales Y Leche Nuevo', 480, 'Lata', 65.00, 70.00, 'Cerelac', '400 gr.', 'Habilitado', '7771234367871_59.jpg', 25),
(130, '7771234367872', 'Heinz Colado De Banana', 159, 'Otro', 25.00, 33.00, 'Heinz', 'Frasco x 113G', 'Habilitado', '7771234367872_95.jpg', 25),
(131, '7771234367873', 'Nan 1 Optipro', 120, 'Lata', 85.99, 90.00, 'Nan', '1.1Kg', 'Habilitado', '7771234367873_10.jpg', 25),
(132, '7771234367874', 'Heinz Creciditos Zanahoria Y Naranja', 190, 'Otro', 19.50, 22.00, 'Heinz', 'Frasco x 113G', 'Habilitado', '7771234367874_46.jpg', 25),
(133, '7771234367875', 'Batón Chocolate Con Leche', 270, 'Unidad', 3.00, 3.40, 'Batón', '16 gr,', 'Habilitado', '7771234367875_78.jpg', 18),
(134, '7771234367876', 'Nestle Kit Kat Chocolate', 3754, 'Unidad', 8.90, 10.10, 'Nestle', '41.50 gr.', 'Habilitado', '7771234367876_19.jpg', 18),
(135, '7771234367877', 'Nestle Prestigio Chocolate', 2597, 'Unidad', 3.00, 3.50, 'Nestle', '33 gr.', 'Habilitado', '7771234367877_82.jpg', 18),
(136, '7771234367878', 'Diversión Galletas Surtidas', 1476, 'Bolsa', 10.90, 14.60, 'Arcor', '400 gr', 'Habilitado', '7771234367878_11.jpg', 18),
(137, '7771234367879', 'Cofler Block Chocolate Leche Con Maní', 1258, 'Unidad', 5.33, 6.90, 'Cofler', '38 gr.', 'Habilitado', '7771234367879_98.jpg', 18),
(138, '7771234367880', 'Pack Serranitas Galletas De Agua', 568, 'Paquete', 17.10, 19.22, 'Serranitas', '105 gr.', 'Habilitado', '7771234367880_52.jpg', 18),
(139, '7771234367881', 'Toallas Hum X 100 Unidades Pocoyo Hipoaler', 598, 'Paquete', 32.00, 38.00, 'Doctor Baby', '100 unidades', 'Habilitado', '7771234367881_64.jpg', 24),
(140, '7771234367882', 'Toallas Humedas Doctor Baby Pocoyo X 100 Unidades', 478, 'Paquete', 33.00, 40.00, 'Doctor Baby', '100 unidades', 'Habilitado', '7771234367882_27.jpg', 24),
(141, '7771234367883', 'Pequeñín Original Toallas Humedas Amarillo', 732, 'Paquete', 38.00, 42.00, 'Pequeñín', '100 unidades', 'Habilitado', '7771234367883_39.jpg', 24),
(142, '7771234367884', 'Pigeon Cotonetes', 498, 'Paquete', 22.00, 29.50, 'Pigeon', '100 Unidades', 'Habilitado', '7771234367884_11.jpg', 24),
(143, '7771234367885', 'Huggies Natural Care Primeros 100 Días', 714, 'Paquete', 48.45, 55.00, 'Huggies', '30 Unidades Talla P', 'Habilitado', '7771234367885_31.jpg', 24),
(144, '7771234367886', 'Alpino Bombon De Chocolate Con Leche', 432, 'Paquete', 55.65, 60.15, 'Nestle', '195 gr.', 'Habilitado', '7771234367886_81.jpg', 19),
(145, '7771234367887', 'Arcor Paneton Con Trocitos De Chocolate', 253, 'Paquete', 39.00, 40.70, 'Arcor', '500 gr.', 'Habilitado', '7771234367887_49.jpg', 19),
(146, '7771234367888', 'Bauducco Paneton Con Frutas', 187, 'Paquete', 50.00, 55.00, 'Bauducco', '400 Gr.', 'Habilitado', '7771234367888_77.jpg', 19),
(147, '7771234367889', 'Bauducco Paneton  Chocolate', 290, 'Paquete', 52.00, 59.00, 'Bauducco', '400 Gr.', 'Habilitado', '7771234367889_44.jpg', 19),
(148, '7771234367890', 'Bimbo Tortillas Rapiditas Integrales', 222, 'Paquete', 15.10, 18.90, 'Bimbo', '310 gr.', 'Habilitado', '7771234367890_8.jpg', 19),
(149, '7771234367891', 'Cuboro Pastelito Con Trocitos De Piña', 376, 'Bolsa', 12.75, 15.00, 'Cuboro', '100 gr.', 'Habilitado', '7771234367891_59.jpg', 19),
(150, '7771234367893', 'Nax Snax Cunapes Abizcochados', 321, 'Bolsa', 17.90, 22.00, 'Nax Snax', '100 gr.', 'Habilitado', '7771234367893_41.jpg', 19),
(151, '7771234367793', 'Hidrolageno Hpro Colageno Pack Regalo', 753, 'Caja', 220.00, 275.00, 'Hpro', '30 Sobres', 'Habilitado', '7771234367793_55.jpg', 13),
(152, '7771234367794', 'Combo Colgate Triple Acción Menta y Enjuague Bucal Ice', 652, 'Paquete', 76.00, 90.00, 'Colgate', '2 productos', 'Habilitado', '7771234367794_13.jpg', 13),
(153, '7771234367795', 'Crema Portugal Bebe Sinescal Oxido De Zinc 40 prct', 783, 'Botella', 29.00, 32.00, 'Portugal', '120 gr.', 'Habilitado', '7771234367795_34.jpg', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(7) NOT NULL,
  `usuario_nombre` varchar(50) NOT NULL,
  `usuario_apellido` varchar(50) NOT NULL,
  `usuario_email` varchar(50) NOT NULL,
  `usuario_usuario` varchar(30) NOT NULL,
  `usuario_clave` varchar(535) NOT NULL,
  `usuario_foto` varchar(200) NOT NULL,
  `caja_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_usuario`, `usuario_clave`, `usuario_foto`, `caja_id`) VALUES
(1, 'Administrador', 'Principal', '', 'Administrador', '$2y$10$Jgm6xFb5Onz/BMdIkNK2Tur8yg/NYEMb/tdnhoV7kB1BwIG4R05D2', 'Administrador_33.png', 1),
(3, 'Andres', 'Urquidi', 'andres.urquidi@ucb.edu.bo', 'AndyUrqui', '$2y$10$0tTu9jcXIc.kAq2NNt9bHOKQZUg4dYnNr0Bf2ccedJEGjPdD23oPC', 'Andres_11.png', 12),
(4, 'Juan Pablo', 'Herbas', 'juan.herbas@gmail.com', 'JuanHerbasLOL', '$2y$10$iqiFHfDp6.cGr.RPfWObZusj8fhOGd/zNZ3fUSAqXZ5g6fbDOJYu6', 'Juan_Pablo_52.jpg', 16),
(5, 'Jose', 'Manzaneda', 'jose.manzaneda@gmail.com', 'JoseManzaneda', '$2y$10$WkUMTMKOvO9FBFDhMQ/zzuXhN9so9xeJXDuvruLQJDTPIqcvJlaC.', 'Jose_63.png', 10),
(6, 'Leonee', 'Londoño', 'leonee.londono@gmail.com', 'LeoLondono', '$2y$10$EhehX63OkOJzQyqH/qUNsuzAU53Xj3P3bkr5vYtiRDj3JOHwe26W2', 'Leonee_86.jpg', 1),
(7, 'Alberto', 'Martinez', 'martinez.alberto@gmail.com', 'AlbertoMartinez', '$2y$10$.Iq7pdLtNiK2FdO7/CzMnejaDZlttMI0T8WRwwDY86tRaPJ3zBSOy', 'Alberto_86.png', 9),
(8, 'Natalia', 'Jallaza', 'natalia.jallaza@gmail.com', 'NatJallaza', '$2y$10$RZz/xG18k94VycLsQHfttObo2l7gqFEl9Ab0mCJGHRuKnXUpb8d36', 'Natalia_9.png', 8),
(9, 'Carolina', 'Zeballos', 'carolina.zeballos@gmail.com', 'CaroZeballos', '$2y$10$kyyB4/7UCH9YxRPAIAU5oe/2qEs59szArRv.WTNTwwK4GUw70eUnS', 'Carolina_84.png', 5),
(10, 'Cristian', 'Urquidi', 'cristianurquidi@gmail.com', 'CrisUrquidi', '$2y$10$msp/HG/6EKLfSBKSTZMEluixky4zt3XgsYl6A0SnPtnrDcT/vuHUq', 'Cristian_64.png', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `venta_id` int(30) NOT NULL,
  `venta_codigo` varchar(200) NOT NULL,
  `venta_fecha` date NOT NULL,
  `venta_hora` varchar(17) NOT NULL,
  `venta_total` decimal(30,2) NOT NULL,
  `venta_pagado` decimal(30,2) NOT NULL,
  `venta_cambio` decimal(30,2) NOT NULL,
  `usuario_id` int(7) NOT NULL,
  `cliente_id` int(10) NOT NULL,
  `caja_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `venta_detalle_id` int(100) NOT NULL,
  `venta_detalle_cantidad` int(10) NOT NULL,
  `venta_detalle_precio_compra` decimal(30,2) NOT NULL,
  `venta_detalle_precio_venta` decimal(30,2) NOT NULL,
  `venta_detalle_total` decimal(30,2) NOT NULL,
  `venta_detalle_descripcion` varchar(200) NOT NULL,
  `venta_codigo` varchar(200) NOT NULL,
  `producto_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Estructura de tabla intentos_fallidos 
CREATE TABLE `intentos_fallidos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `usuario_id` INT NOT NULL,
  `codigo_verificacion` VARCHAR(6) DEFAULT NULL,
  `intentos` INT DEFAULT 0,
  `fecha_hora` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `estado` ENUM('pendiente', 'verificado', 'expirado') DEFAULT 'pendiente',
  FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`usuario_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`caja_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `codigo_pedido` (`codigo_pedido`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`pedido_id`),
  ADD UNIQUE KEY `codigo_pedido` (`codigo_pedido`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `caja_id` (`caja_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venta_id`),
  ADD UNIQUE KEY `venta_codigo` (`venta_codigo`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `caja_id` (`caja_id`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`venta_detalle_id`),
  ADD KEY `venta_id` (`venta_codigo`),
  ADD KEY `producto_id` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `caja_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoria_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `venta_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `venta_detalle_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedido` (`codigo_pedido`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`);

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `venta_detalle_ibfk_3` FOREIGN KEY (`venta_codigo`) REFERENCES `venta` (`venta_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
