
-- Estructura de tabla para la tabla `caja`
CREATE TABLE `caja` (
  `caja_id` int(5) NOT NULL,
  `caja_numero` int(5) NOT NULL,
  `caja_nombre` varchar(100) NOT NULL,
  `caja_efectivo` decimal(30,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- Estructura de tabla para la tabla `categoria`
CREATE TABLE `categoria` (
  `categoria_id` int(7) NOT NULL,
  `categoria_nombre` varchar(50) NOT NULL,
  `categoria_ubicacion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- Volcado de datos para la tabla `categoria`
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
-- Estructura de tabla para la tabla `cliente`
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
  `cliente_email` varchar(50) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- Estructura de tabla para la tabla `detalle_pedido`
CREATE TABLE `detalle_pedido` (
  `detalle_id` int(11) NOT NULL,
  `codigo_pedido` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `producto_nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
-- Volcado de datos para la tabla `detalle_pedido`
INSERT INTO `detalle_pedido` (`detalle_id`, `codigo_pedido`, `cantidad`, `producto_nombre`, `precio`, `fecha`) VALUES
(40, 'PED20250425212857', 2, 'Coca Cola', 3.00, '2025-04-25 15:28:57'),
(41, 'PED20250425212857', 3, 'Ibuprofeno', 10.00, '2025-04-25 15:28:57');
-- Estructura de tabla para la tabla `empresa`
CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `empresa_nombre` varchar(90) NOT NULL,
  `empresa_telefono` varchar(20) NOT NULL,
  `empresa_email` varchar(50) NOT NULL,
  `empresa_direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- Volcado de datos para la tabla `empresa`
INSERT INTO `empresa` (`empresa_id`, `empresa_nombre`, `empresa_telefono`, `empresa_email`, `empresa_direccion`) VALUES
(2, 'Farmacia FarmaVida', '69240763', 'farmaciavidasana101@gmail.com', 'Calle N 5, Pampahasi Bajo, La Paz, Bolivia');
-- Estructura de tabla para la tabla `intentos_fallidos`
CREATE TABLE `intentos_fallidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `codigo_verificacion` varchar(6) DEFAULT NULL,
  `intentos` int(11) DEFAULT 0,
  `fecha_hora` datetime DEFAULT current_timestamp(),
  `estado` enum('pendiente','verificado','expirado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- Volcado de datos para la tabla `intentos_fallidos`
INSERT INTO `intentos_fallidos` (`id`, `usuario_id`, `codigo_verificacion`, `intentos`, `fecha_hora`, `estado`) VALUES
(8, 3, '133253', 3, '2025-04-25 15:32:11', 'pendiente');
-- Estructura de tabla para la tabla `pedido`
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
-- Volcado de datos para la tabla `pedido`
INSERT INTO `pedido` (`pedido_id`, `codigo_pedido`, `fecha`, `nombre_cliente`, `correo_cliente`, `celular_cliente`, `estado`, `metodo_pago`, `razon_social`, `nit_cliente`) VALUES
(20, 'PED20250425212857', '2025-04-25 15:28:57', 'Andres Alfaro', 'ejemplo@gmail.com', '123456', 'pendiente', 'qrPago', NULL, 'Prueba');
-- Estructura de tabla para la tabla `producto`
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
-- Volcado de datos para la tabla `producto`
INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_nombre`, `producto_stock_total`, `producto_tipo_unidad`, `producto_precio_compra`, `producto_precio_venta`, `producto_marca`, `producto_modelo`, `producto_estado`, `producto_foto`, `categoria_id`) VALUES
(33, '123456789', 'Ibuprofeno', 1, 'Unidad', 5.00, 10.00, 'BAGO', '', 'Habilitado', '', 7),
(34, '7771234567890', 'Digestan Compuesto', 699, 'Sobre', 2.80, 4.84, 'VITA', '5.75 g.', 'Habilitado', '', 8),
(35, '7771234567891', 'Actron', 2994, 'Caja', 3.50, 4.90, 'Actron', '600 mg.', 'Habilitado', '7771234567891_91.png', 7),
(36, '7771234567892', 'Mentisan', 38, 'Lata', 12.00, 16.65, 'INTI', '25 G', 'Habilitado', '7771234567892_16.png', 8),
(37, '7771234567893', 'Omeprazol', 1000, 'Caja', 0.50, 1.00, 'La Sante', '20 mg.', 'Habilitado', '7771234567893_31.png', 7),
(38, '7771234567894', 'Resfrianex Comprimidos', 500, 'Caja', 1.50, 2.61, 'Bagó', 'Comprimidos', 'Habilitado', '7771234567894_23.png', 7),
(39, '7771234567895', 'Nexcare Micropore', 24, 'Caja', 25.00, 34.00, '3M', 'Color piel, 5 cm. x 9.1 m.', 'Habilitado', '7771234567895_18.png', 8),
(40, '7771234567896', 'Nan 2 Optipro', 149, 'Lata', 85.43, 95.00, 'Nestle', '1,1 Kg.', 'Habilitado', '7771234567896_2.png', 7),
(41, '7771234567897', 'L-Arginine 500', 99, 'Botella', 180.00, 195.00, 'GNC', '90 Cápsulas', 'Habilitado', '7771234567897_27.png', 7),
(42, '7771234567898', 'Coca Cola', 257, 'Botella', 2.50, 3.00, 'The Coca-Cola Company', '300 ml', 'Habilitado', '7771234567898_29.png', 11),
(43, '7771234567899', 'Aspirinetas', 45, 'Caja', 60.00, 65.75, 'Bayer', '100 mg.', 'Habilitado', '7771234567899_69.png', 7),
(44, '7771234567800', 'Curadil', 169, 'Caja', 27.30, 33.90, 'Alcos', '250 ml.', 'Habilitado', '7771234567800_49.png', 7),
(45, '7771234567801', 'Huggies Natural Care XXG', 75, 'Paquete', 100.00, 120.00, 'Huggies', 'Pañales hasta 20 kg. X 58U', 'Habilitado', '7771234567801_61.png', 7),
(46, '7771234567802', 'Pepsi', 77, 'Botella', 11.50, 13.00, 'PepsiCo, Inc.', '3 lt', 'Habilitado', '7771234567802_0.jpg', 8),
(47, '7771234567803', 'Dolorsan', 61, 'Lata', 7.80, 9.27, 'ifc', 'Unguento', 'Habilitado', '7771234567803_21.jpg', 9),
(48, '7771234567804', 'Tialgin Paracetamol', 44, 'Caja', 2.99, 4.00, 'Tecnofarma', '1 g.', 'Habilitado', '7771234567804_89.jpg', 9),
(49, '7771234567805', 'Migranol', 139, 'Tira', 6.00, 7.15, 'Bagó', 'Comprimidos', 'Habilitado', '7771234567805_24.png', 9),
(50, '7771234567806', 'Bio Electro', 87, 'Caja', 2.50, 3.20, 'Genomma Lab', 'PCM 250, AS 250, CAF 65 (mg))', 'Habilitado', '7771234567806_97.jpg', 9),
(51, '7771234567807', 'Anaflex Mujer', 199, 'Caja', 3.56, 3.83, 'Bagó', 'PCM 500, DIC 50, CAF 30 (mg)', 'Habilitado', '7771234567807_63.png', 9),
(52, '7771234567808', 'Diclofenac Gel', 137, 'Caja', 22.00, 25.00, 'Bagó', 'Diclofenaco sódico 100g.', 'Habilitado', '7771234567808_94.png', 9),
(53, '7771234567809', 'Novadol Gel', 249, 'Caja', 74.60, 80.40, 'Breskot Pharma', 'DIC 2,SM 10.5 ,MTL 5.5 (pje)', 'Habilitado', '7771234567809_69.jpg', 9),
(54, '7771234567810', 'Parche Térmico León', 258, 'Sobre', 15.30, 24.95, 'Hansaplast', 'Parche 12 x 18 (cm.)', 'Habilitado', '7771234567810_47.jpg', 9),
(55, '7771234567811', 'Flogiatrin Pomada', 117, 'Otro', 84.24, 89.79, 'Megalabs', '100 gr', 'Habilitado', '7771234567811_2.jpg', 9),
(56, '7771234567812', 'Agua Vital', 340, 'Botella', 6.20, 7.50, 'The Coca-Cola Company', '2 lt.', 'Habilitado', '7771234567812_77.jpg', 12),
(57, '7771234567813', 'Agua Vital', 455, 'Botella', 3.50, 4.00, 'The Coca-Cola Company', '600 ml.', 'Habilitado', '7771234567813_93.png', 12),
(58, '7771234567814', 'Del Valle Fresh', 229, 'Botella', 10.00, 11.50, 'The Coca-Cola Company', '2.5 lt.', 'Habilitado', '7771234567814_86.jpg', 12),
(59, '7771234567815', 'Fanta Pomelo', 108, 'Botella', 7.50, 9.00, 'The Coca-Cola Company', '2.25 lt.', 'Habilitado', '7771234567815_51.png', 11),
(60, '7771234567816', 'Fanta Guaraná', 156, 'Botella', 10.00, 12.00, 'The Coca-Cola Company', '3 lt.', 'Habilitado', '7771234567816_37.jpg', 11),
(61, '7771234567817', 'Novadol Cápsulas', 130, 'Caja', 3.50, 5.19, 'Breskot Pharma', 'PCM 500, DIC 50 (mg.)', 'Habilitado', '7771234567817_44.png', 9),
(62, '7771234567818', 'Coca-Cola Oreo Zero', 77, 'Botella', 4.80, 6.50, 'The Coca-Cola Company', '500 ml.', 'Habilitado', '7771234567818_27.png', 11),
(63, '7771234567819', 'Ballerina Shampoo Brillo Luminoso', 59, 'Botella', 22.00, 23.60, 'Ballerina', '410 ml', 'Habilitado', '7771234567819_79.png', 10),
(64, '7771234567820', 'Algabo Baby Shampoo Manzanilla', 167, 'Botella', 26.70, 30.30, 'Algabo', '444ml', 'Habilitado', '7771234567820_92.png', 10),
(65, '7771234567821', 'Algabo Baby Shampoo Extra Suave', 289, 'Botella', 26.00, 29.30, 'Algabo', '200 ml.', 'Habilitado', '7771234567821_89.png', 10),
(66, '7771234567822', 'Agua Vital', 348, 'Botella', 6.00, 7.50, 'The Coca-Cola Company', '990 ml', 'Habilitado', '7771234567822_93.png', 12),
(67, '7771234567823', 'Ades Tropical', 109, 'Caja', 9.00, 13.00, 'The Coca-Cola Company', '1 lt.', 'Habilitado', '7771234567823_49.png', 12),
(68, '7771234567824', 'Acondicionador Elvive Oleo Coco', 97, 'Botella', 39.10, 42.30, 'Elvive', '370 ml.', 'Habilitado', '7771234567824_87.png', 10),
(69, '7771234567825', 'Acondicionador Elvive Dream', 174, 'Botella', 46.50, 48.40, 'Elvive', '370 ml.', 'Habilitado', '7771234567825_20.png', 10),
(70, '7771234567826', 'Aceite Capilar Farmax Lavanda', 43, 'Botella', 19.20, 24.00, 'Farmax', '100 ml', 'Habilitado', '7771234567826_50.png', 10),
(71, '7771234567926', 'Axe', 128, 'Lata', 17.00, 20.00, 'Axe', '152 ml', 'Habilitado', '7771234567926_47.png', 28),
(72, '7771234567927', 'Sedal Acondicionador Rizos DEfinidos', 368, 'Botella', 20.40, 26.10, 'Sedal Co-Creations', '300 ml', 'Habilitado', '7771234567927_21.jpg', 10),
(73, '7771234567990', 'Aciclovir', 200, 'Caja', 22.00, 27.00, 'ifa', '400 mg.', 'Habilitado', '7771234567990_52.jpg', 22),
(74, '7771234567991', 'Alcohol Etílico', 360, 'Botella', 13.00, 98.00, 'Porta', '1 lt.', 'Habilitado', '7771234567991_80.jpg', 14),
(75, '7771234567792', 'Cotrimazol', 155, 'Caja', 32.00, 43.00, 'LaboratorioChile', '25 gr', 'Habilitado', '', 22),
(76, '7771234567693', 'Loceryl', 167, 'Caja', 43.00, 50.00, 'Galderma', '5 porciento', 'Habilitado', '7771234567693_5.jpg', 22),
(77, '7771234568894', 'Nistanina', 240, 'Caja', 60.00, 65.00, 'ifa', '60 ml.', 'Habilitado', '7771234568894_91.jpg', 22),
(78, '7771234565895', 'Guantes de Latex', 488, 'Caja', 9.00, 13.00, 'Cuatrogasa', '100 unidades', 'Habilitado', '7771234565895_58.jpg', 14),
(79, '7771234567596', 'Barbijo', 314, 'Caja', 10.00, 12.00, 'Albatross', '50 unidades', 'Habilitado', '7771234567596_40.jpg', 14),
(80, '7771234568800', 'Glucosamin', 142, 'Caja', 52.20, 60.50, 'VITA', '20 ml.', 'Habilitado', '7771234568800_52.jpg', 17),
(81, '7771234563898', 'Vitamina C', 229, 'Caja', 0.20, 0.30, 'Generico', '30 Capsulas 20 mg.', 'Habilitado', '7771234563898_83.jpg', 17),
(82, '7771234567599', 'Dextroton', 165, 'Galon', 46.70, 51.30, 'Generico', '500 gr', 'Habilitado', '7771234567599_46.jpg', 17),
(83, '7771234570000', 'Omega 3', 372, 'Caja', 55.00, 65.00, 'SAE', '30 capsulas 1000 mg', 'Habilitado', '7771234570000_42.jpg', 17),
(84, '7771234570001', 'Cepillo de dientes', 99, 'Paquete', 15.00, 18.00, 'Foramen', 'Dureza Media', 'Habilitado', '7771234570001_3.jpg', 15),
(85, '7771234570002', 'Pasta de Dental CloseUp', 120, 'Caja', 22.00, 27.40, 'CloseUp', '90 gr.', 'Habilitado', '7771234570002_64.jpg', 15),
(86, '7771234570003', 'Pasta Dental Colgate Original', 137, 'Caja', 19.20, 23.50, 'Colgate', '100 gr', 'Habilitado', '7771234570003_38.jpg', 15),
(87, '7771234570004', 'Prueba de Embarazo', 219, 'Caja', 15.00, 19.00, 'Clearblue', 'Digital', 'Habilitado', '7771234570004_3.png', 23),
(88, '7771234570005', 'Test de Embarazo', 179, 'Caja', 12.00, 16.00, 'LaPrepie', '1 test', 'Habilitado', '7771234570005_53.png', 23),
(89, '7771234557826', 'Typirec', 1885, 'Unidad', 1.70, 2.06, 'LAFAR', 'Cápsula blanda', 'Habilitado', '7771234557826_70.jpg', 16),
(90, '7771234167826', 'Flavicold Noche', 463, 'Sobre', 5.80, 7.70, 'Cofar', '15 mg', 'Habilitado', '7771234167826_26.jpg', 16),
(91, '7771234367821', 'Resfrianex Día y Noche', 374, 'Unidad', 5.20, 8.30, 'Bago', 'Blister x 3 cápsulas', 'Habilitado', '7771234367821_9.png', 16),
(92, '7771234367822', 'Resfrianex Sobre Día', 247, 'Sobre', 4.10, 6.50, 'Bago', '15 mg.', 'Habilitado', '7771234367822_65.png', 16),
(93, '7771234367823', 'Resfrianex Sobre Noche', 268, 'Sobre', 5.00, 6.50, 'Bago', '15 gr.', 'Habilitado', '7771234367823_90.png', 16),
(94, '7771234367824', 'Antigripal L. CH', 245, 'Unidad', 9.10, 12.90, 'Laboratorio Chile', 'Blister x 4 cápsulas', 'Habilitado', '7771234367824_68.jpg', 16),
(95, '7771234367825', 'Resfriolito', 356, 'Unidad', 0.60, 0.75, 'Alcos', 'Blister x 4 tabletas', 'Habilitado', '7771234367825_46.jpg', 16),
(96, '7771234367826', 'Alergin', 563, 'Unidad', 1.20, 3.46, 'Alcos', '4 mg. x tableta', 'Habilitado', '7771234367826_99.jpg', 16),
(97, '7771234367827', 'Mamadera Anti Colico', 148, 'Unidad', 60.30, 68.20, 'Philips', '125 ml.', 'Habilitado', '7771234367827_3.jpg', 27),
(98, '7771234367828', 'Nuby Aspirador Nasal', 309, 'Unidad', 32.42, 41.60, 'Nuby', 'Pieza', 'Habilitado', '7771234367828_67.jpg', 27),
(99, '7771234367829', 'Cepillo Limpieza Para Mamadera', 285, 'Unidad', 72.10, 75.60, 'Dr Browns', 'X Unidad', 'Habilitado', '7771234367829_68.jpg', 27),
(100, '7771234367830', 'Pigeon Tetina Peristáltica Boca Standard', 148, 'Paquete', 51.10, 63.00, 'Pigeon', 'X 2 piezas', 'Habilitado', '7771234367830_7.jpg', 27),
(101, '7771234367831', 'Colonia de Bebés Naturals', 373, 'Botella', 21.50, 23.00, 'Arrurru', '120 ml.', 'Habilitado', '7771234367831_12.jpg', 27),
(102, '7771234367832', 'Vaso Con Bombilla Flexible', 480, 'Unidad', 105.20, 110.70, 'Avent', '200 ml.', 'Habilitado', '7771234367832_28.jpg', 27),
(103, '7771234367843', 'Acondicionador Para Niños Gotas De Brillo', 482, 'Botella', 39.63, 45.30, 'JohnsonS', '500 ml.', 'Habilitado', '7771234367843_13.jpg', 26),
(104, '7771234367844', 'Balsamo Acondicionador Baby Care X 610Ml', 229, 'Botella', 48.10, 53.70, 'Simonds', '610 ml.', 'Habilitado', '7771234367844_14.jpg', 26),
(105, '7771234367845', 'Baby Acondicionador No Más Lagrimas X 200Ml', 190, 'Botella', 25.22, 33.90, 'Johnson', '200 ml.', 'Habilitado', '7771234367845_8.jpg', 26),
(106, '7771234367846', 'Baby Shampoo Gotas De Brillo', 282, 'Botella', 30.40, 32.43, 'Johnson', '750 ml.', 'Habilitado', '7771234367846_71.jpg', 26),
(107, '7771234367847', 'Baño Liquido Antes De Dormir', 469, 'Botella', 38.10, 43.95, 'Johnson', '400 ml.', 'Habilitado', '7771234367847_93.jpg', 26),
(108, '7771234367848', 'Shampoo Manzanilla', 690, 'Botella', 41.00, 52.60, 'Johnson', '400 ml.', 'Habilitado', '7771234367848_71.jpg', 26),
(109, '7771234367849', 'Kids Shampoo Fresa Cremosa', 674, 'Botella', 28.00, 30.00, 'Loreal', '265Ml', 'Habilitado', '7771234367849_14.jpg', 26),
(110, '7771234367850', 'Kids Shampoo Manzanilla', 411, 'Botella', 28.00, 30.00, 'Loreal', '265Ml', 'Habilitado', '7771234367850_71.jpg', 26),
(111, '7771234367851', 'Shampoo 2 En 1 Pineappel', 532, 'Botella', 50.10, 55.47, 'Simonds', '400Ml', 'Habilitado', '7771234367851_60.jpg', 26),
(112, '7771234367852', 'Nescafe Cappuccino X 120G', 42, 'Caja', 31.10, 36.40, 'Nescafe', '6 sobres X 20gr', 'Habilitado', '7771234367852_7.jpg', 21),
(113, '7771234367853', 'Windsor Mate Manzanilla X 20 Unidades', 154, 'Caja', 5.80, 7.90, 'Windsor', 'Caja X20 sobres X', 'Habilitado', '7771234367853_60.jpg', 21),
(114, '7771234367854', 'Nescafe Cafe Mokaccino X 150G', 101, 'Caja', 32.34, 39.70, 'Nescafe', 'Caja x 6 sobres x 25 g.', 'Habilitado', '7771234367854_85.jpg', 21),
(115, '7771234367855', 'Nescafé Tradición X 200G', 37, 'Otro', 48.99, 55.40, 'Nescafe', '200 gr.', 'Habilitado', '7771234367855_12.jpg', 21),
(116, '7771234367856', 'Chocolike Instantáneo', 135, 'Bolsa', 28.10, 31.00, 'Madisa', 'Bolsa X 1 Kg.', 'Habilitado', '7771234367856_55.jpg', 21),
(117, '7771234367857', 'Biogurt Probiotico Durazno', 246, 'Botella', 14.20, 18.60, 'Pil', '1 lt.', 'Habilitado', '7771234367857_27.jpg', 20),
(118, '7771234367858', 'Chiqui Choc Leche Saborizada', 187, 'Bolsa', 2.00, 2.20, 'Pil', 'Bolsa x 140 ml.', 'Habilitado', '7771234367858_67.jpg', 20),
(119, '7771234367859', 'Chiqui Frutilla Leche Saborizada', 188, 'Bolsa', 2.00, 2.20, 'Pil', 'Bolsa x 140 ml.', 'Habilitado', '7771234367859_4.jpg', 20),
(120, '7771234367860', 'Margarina Regia Mantequilla', 87, 'Otro', 18.22, 21.75, 'Alicorp', 'Embase X 425G', 'Habilitado', '7771234367860_16.jpg', 20),
(121, '7771234367861', 'Alpina Baby Ciruela X 113G', 386, 'Otro', 450.00, 500.00, 'Alpina Baby', 'Frasco x 113 gr.', 'Habilitado', '7771234367861_57.jpg', 25),
(122, '7771234367862', 'Alpina Baby Durazno', 185, 'Otro', 18.00, 22.00, 'Alpina Baby', 'Frasco x 113 gr.', 'Habilitado', '7771234367862_61.jpg', 25),
(123, '7771234367863', 'Alpina Baby Manzana', 149, 'Otro', 19.00, 22.00, 'Alpina Baby', 'Frasco x 113 gr.', 'Habilitado', '7771234367863_69.jpg', 25),
(124, '7771234367864', 'Bebelac Gold 1 Formula Lactea', 120, 'Lata', 150.00, 180.00, 'Bebelac Gold', '400 gr.', 'Habilitado', '7771234367864_95.jpg', 25),
(125, '7771234367865', 'Bebelac Gold 1 Formula Lactea', 125, 'Lata', 180.00, 220.00, 'Bebelac Gold', '900 gr.', 'Habilitado', '7771234367865_96.jpg', 25),
(126, '7771234367866', 'Bebelac Gold 2 Formula Lactea', 100, 'Lata', 170.00, 190.00, 'Bebelac Gold', '400 gr.', 'Habilitado', '7771234367866_58.jpg', 25),
(127, '7771234367868', 'Bebelac Gold 2 Formula Lactea', 110, 'Lata', 175.00, 200.00, 'Bebelac Gold', '900 gr.', 'Habilitado', '7771234367868_49.jpg', 25),
(128, '7771234367870', 'Bebelac Gold 3 Formula Lactea', 98, 'Lata', 200.00, 265.00, 'Bebelac Gold', '1.2Kg', 'Habilitado', '7771234367870_91.jpg', 25),
(129, '7771234367871', 'Cerelac 5 Cereales Y Leche Nuevo', 477, 'Lata', 65.00, 70.00, 'Cerelac', '400 gr.', 'Habilitado', '7771234367871_59.jpg', 25),
(130, '7771234367872', 'Heinz Colado De Banana', 156, 'Otro', 25.00, 33.00, 'Heinz', 'Frasco x 113G', 'Habilitado', '7771234367872_95.jpg', 25),
(131, '7771234367873', 'Nan 1 Optipro', 119, 'Lata', 85.99, 90.00, 'Nan', '1.1Kg', 'Habilitado', '7771234367873_10.jpg', 25),
(132, '7771234367874', 'Heinz Creciditos Zanahoria Y Naranja', 189, 'Otro', 19.50, 22.00, 'Heinz', 'Frasco x 113G', 'Habilitado', '7771234367874_46.jpg', 25),
(133, '7771234367875', 'Batón Chocolate Con Leche', 270, 'Unidad', 3.00, 3.40, 'Batón', '16 gr,', 'Habilitado', '7771234367875_78.jpg', 18),
(134, '7771234367876', 'Nestle Kit Kat Chocolate', 3749, 'Unidad', 8.90, 10.10, 'Nestle', '41.50 gr.', 'Habilitado', '7771234367876_19.jpg', 18),
(135, '7771234367877', 'Nestle Prestigio Chocolate', 2596, 'Unidad', 3.00, 3.50, 'Nestle', '33 gr.', 'Habilitado', '7771234367877_82.jpg', 18),
(136, '7771234367878', 'Diversión Galletas Surtidas', 1474, 'Bolsa', 10.90, 14.60, 'Arcor', '400 gr', 'Habilitado', '7771234367878_11.jpg', 18),
(137, '7771234367879', 'Cofler Block Chocolate Leche Con Maní', 1252, 'Unidad', 5.33, 6.90, 'Cofler', '38 gr.', 'Habilitado', '7771234367879_98.jpg', 18),
(138, '7771234367880', 'Pack Serranitas Galletas De Agua', 565, 'Paquete', 17.10, 19.22, 'Serranitas', '105 gr.', 'Habilitado', '7771234367880_52.jpg', 18),
(139, '7771234367881', 'Toallas Hum X 100 Unidades Pocoyo Hipoaler', 597, 'Paquete', 32.00, 38.00, 'Doctor Baby', '100 unidades', 'Habilitado', '7771234367881_64.jpg', 24),
(140, '7771234367882', 'Toallas Humedas Doctor Baby Pocoyo X 100 Unidades', 477, 'Paquete', 33.00, 40.00, 'Doctor Baby', '100 unidades', 'Habilitado', '7771234367882_27.jpg', 24),
(141, '7771234367883', 'Pequeñín Original Toallas Humedas Amarillo', 729, 'Paquete', 38.00, 42.00, 'Pequeñín', '100 unidades', 'Habilitado', '7771234367883_39.jpg', 24),
(142, '7771234367884', 'Pigeon Cotonetes', 497, 'Paquete', 22.00, 29.50, 'Pigeon', '100 Unidades', 'Habilitado', '7771234367884_11.jpg', 24),
(143, '7771234367885', 'Huggies Natural Care Primeros 100 Días', 710, 'Paquete', 48.45, 55.00, 'Huggies', '30 Unidades Talla P', 'Habilitado', '7771234367885_31.jpg', 24),
(144, '7771234367886', 'Alpino Bombon De Chocolate Con Leche', 432, 'Paquete', 55.65, 60.15, 'Nestle', '195 gr.', 'Habilitado', '7771234367886_81.jpg', 19),
(145, '7771234367887', 'Arcor Paneton Con Trocitos De Chocolate', 251, 'Paquete', 39.00, 40.70, 'Arcor', '500 gr.', 'Habilitado', '7771234367887_49.jpg', 19),
(146, '7771234367888', 'Bauducco Paneton Con Frutas', 187, 'Paquete', 50.00, 55.00, 'Bauducco', '400 Gr.', 'Habilitado', '7771234367888_77.jpg', 19),
(147, '7771234367889', 'Bauducco Paneton  Chocolate', 290, 'Paquete', 52.00, 59.00, 'Bauducco', '400 Gr.', 'Habilitado', '7771234367889_44.jpg', 19),
(148, '7771234367890', 'Bimbo Tortillas Rapiditas Integrales', 222, 'Paquete', 15.10, 18.90, 'Bimbo', '310 gr.', 'Habilitado', '7771234367890_8.jpg', 19),
(149, '7771234367891', 'Cuboro Pastelito Con Trocitos De Piña', 373, 'Bolsa', 12.75, 15.00, 'Cuboro', '100 gr.', 'Habilitado', '7771234367891_59.jpg', 19),
(150, '7771234367893', 'Nax Snax Cunapes Abizcochados', 321, 'Bolsa', 17.90, 22.00, 'Nax Snax', '100 gr.', 'Habilitado', '7771234367893_41.jpg', 19),
(151, '7771234367793', 'Hidrolageno Hpro Colageno Pack Regalo', 751, 'Caja', 220.00, 275.00, 'Hpro', '30 Sobres', 'Habilitado', '7771234367793_55.jpg', 13),
(152, '7771234367794', 'Combo Colgate Triple Acción Menta y Enjuague Bucal Ice', 651, 'Paquete', 76.00, 90.00, 'Colgate', '2 productos', 'Habilitado', '7771234367794_13.jpg', 13),
(153, '7771234367795', 'Crema Portugal Bebe Sinescal Oxido De Zinc 40 prct', 782, 'Botella', 29.00, 32.00, 'Portugal', '120 gr.', 'Habilitado', '7771234367795_34.jpg', 13);
-- Estructura de tabla para la tabla `usuario`
CREATE TABLE `usuario` (
  `usuario_id` int(7) NOT NULL,
  `usuario_nombre` varchar(50) NOT NULL,
  `usuario_apellido` varchar(50) NOT NULL,
  `usuario_email` varchar(50) NOT NULL,
  `usuario_usuario` varchar(30) NOT NULL,
  `usuario_clave` varchar(535) NOT NULL,
  `usuario_foto` varchar(200) NOT NULL,
  `caja_id` int(5) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
-- Volcado de datos para la tabla `usuario`
INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_usuario`, `usuario_clave`, `usuario_foto`, `caja_id`, `fecha_registro`) VALUES
(1, 'Administrador', 'Principal', '', 'Administrador', '$2y$10$Jgm6xFb5Onz/BMdIkNK2Tur8yg/NYEMb/tdnhoV7kB1BwIG4R05D2', 'Administrador_33.png', 1, '2024-11-15 16:58:11'),
(3, 'Andres', 'Urquidi', 'andres.urquidi@ucb.edu.bo', 'AndyUrqui', '$2y$10$VDIt43aZin44mAfkDV83TOE/DQAItZgVRlIPZc40i6PgkzPmJFFji', 'Andres_11.png', 12, '2024-11-15 16:58:11');
-- Estructura de tabla para la tabla `venta`
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
-- Estructura de tabla para la tabla `venta_detalle`
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
-- Índices para tablas volcadas
-- Indices de la tabla `caja`
ALTER TABLE `caja`
  ADD PRIMARY KEY (`caja_id`);
-- Indices de la tabla `categoria`
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`);
-- Indices de la tabla `cliente`
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);
-- Indices de la tabla `detalle_pedido`
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `codigo_pedido` (`codigo_pedido`);
-- Indices de la tabla `empresa`
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_id`);
-- Indices de la tabla `intentos_fallidos`
ALTER TABLE `intentos_fallidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);
-- Indices de la tabla `pedido`
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`pedido_id`),
  ADD UNIQUE KEY `codigo_pedido` (`codigo_pedido`);
-- Indices de la tabla `producto`
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`);
-- Indices de la tabla `usuario`
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `caja_id` (`caja_id`);
-- Indices de la tabla `venta`
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venta_id`),
  ADD UNIQUE KEY `venta_codigo` (`venta_codigo`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `caja_id` (`caja_id`);
-- Indices de la tabla `venta_detalle`
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`venta_detalle_id`),
  ADD KEY `venta_id` (`venta_codigo`),
  ADD KEY `producto_id` (`producto_id`);
-- AUTO_INCREMENT de las tablas volcadas
-- AUTO_INCREMENT de la tabla `caja`
ALTER TABLE `caja`
  MODIFY `caja_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
-- AUTO_INCREMENT de la tabla `categoria`
ALTER TABLE `categoria`
  MODIFY `categoria_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
-- AUTO_INCREMENT de la tabla `cliente`
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;
-- AUTO_INCREMENT de la tabla `detalle_pedido`
ALTER TABLE `detalle_pedido`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
-- AUTO_INCREMENT de la tabla `empresa`
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
-- AUTO_INCREMENT de la tabla `intentos_fallidos`
ALTER TABLE `intentos_fallidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
-- AUTO_INCREMENT de la tabla `pedido`
ALTER TABLE `pedido`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
-- AUTO_INCREMENT de la tabla `producto`
ALTER TABLE `producto`
  MODIFY `producto_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;
-- AUTO_INCREMENT de la tabla `usuario`
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
-- AUTO_INCREMENT de la tabla `venta`
ALTER TABLE `venta`
  MODIFY `venta_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
-- AUTO_INCREMENT de la tabla `venta_detalle`
ALTER TABLE `venta_detalle`
  MODIFY `venta_detalle_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;
-- Restricciones para tablas volcadas
-- Filtros para la tabla `detalle_pedido`
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedido` (`codigo_pedido`);
-- Filtros para la tabla `intentos_fallidos`
ALTER TABLE `intentos_fallidos`
  ADD CONSTRAINT `intentos_fallidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE;
-- Filtros para la tabla `producto`
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`);
-- Filtros para la tabla `venta`
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`);
-- Filtros para la tabla `venta_detalle`
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `venta_detalle_ibfk_3` FOREIGN KEY (`venta_codigo`) REFERENCES `venta` (`venta_codigo`);
