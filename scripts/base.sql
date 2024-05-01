/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : gym

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 01/05/2024 17:48:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_cliente_sistema
-- ----------------------------
DROP TABLE IF EXISTS `base_cliente_sistema`;
CREATE TABLE `base_cliente_sistema`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre_o_razon_social` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion_completa` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ruc`(`ruc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_cliente_sistema
-- ----------------------------
INSERT INTO `base_cliente_sistema` VALUES (1, '10478672882', 'demo', 'Lima', 'usuario', '98765321', '', '2020-10-28 00:00:00', 1);

-- ----------------------------
-- Table structure for base_configuracion
-- ----------------------------
DROP TABLE IF EXISTS `base_configuracion`;
CREATE TABLE `base_configuracion`  (
  `id` int(11) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_servicio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ruc` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `envio` tinyint(1) NOT NULL,
  `asociado` int(11) NOT NULL,
  `send_email` int(11) NOT NULL,
  `url_api` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `igv` decimal(10, 2) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_configuracion
-- ----------------------------
INSERT INTO `base_configuracion` VALUES (1, 'https://e-beta.sunat.gob.pe/ol-ti-itcpfegem-beta/billService?wsdl', 'https://<localhost>/', '20478672883', 0, 0, 1, 'https://<localhost>/', 'SISTEMA', '1.00.01', 'public/img/recursos/6f2319c87aef435a6271966f3d809e7c.jpg', 'Todos los derechos reservados', 18.00, 1, '2024-04-30 12:48:33');

-- ----------------------------
-- Table structure for base_estado
-- ----------------------------
DROP TABLE IF EXISTS `base_estado`;
CREATE TABLE `base_estado`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `visibilidad` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_estado
-- ----------------------------
INSERT INTO `base_estado` VALUES (1, 'Activado', 'success', 1);
INSERT INTO `base_estado` VALUES (2, 'Desactivado', 'default', 1);
INSERT INTO `base_estado` VALUES (3, 'Anulado', 'danger', 0);
INSERT INTO `base_estado` VALUES (4, 'Incompleto', 'warning', 0);
INSERT INTO `base_estado` VALUES (5, 'Eliminado', 'danger', 0);

-- ----------------------------
-- Table structure for base_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu`  (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icono` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `padre` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_menu
-- ----------------------------
INSERT INTO `base_menu` VALUES (-101, 'Dashboard', 'si si-pie-chart', 'proceso/dashboard', -1, 1);
INSERT INTO `base_menu` VALUES (-1, 'Inicio', 'si si-bar-chart', '', 0, 1);
INSERT INTO `base_menu` VALUES (1, 'Sistema', 'si si-settings', '', 0, 1);
INSERT INTO `base_menu` VALUES (2, 'Inventario', 'si si-grid\r\n', '', 0, 1);
INSERT INTO `base_menu` VALUES (3, 'Transacciones', 'si si-shuffle', '', 0, 1);
INSERT INTO `base_menu` VALUES (101, 'Configuración', 'fa fa-gears', 'sistema/configuracion', 1, 1);
INSERT INTO `base_menu` VALUES (103, 'Clientes del sistema', 'si si-briefcase', 'sistema/clientes', 1, 1);
INSERT INTO `base_menu` VALUES (104, 'Usuarios', 'si si-users', 'sistema/usuarios', 1, 1);
INSERT INTO `base_menu` VALUES (201, 'Clientes', 'si si-handbag', 'proceso/clientes', 2, 1);
INSERT INTO `base_menu` VALUES (202, 'Proveedores', 'si si-share\r\n', 'proceso/proveedores', 2, 1);
INSERT INTO `base_menu` VALUES (203, 'Productos', 'si si-tag\r\n', 'proceso/productos', 2, 1);
INSERT INTO `base_menu` VALUES (301, 'Ingresos', 'si si-login', 'transaccion/ingresos', 3, 1);
INSERT INTO `base_menu` VALUES (303, 'Ventas', 'si si-basket\r\n', 'transaccion/ventas', 3, 1);
INSERT INTO `base_menu` VALUES (304, 'Kardex', 'si si-bar-chart', 'transaccion/kardex', 3, 1);
INSERT INTO `base_menu` VALUES (305, 'Pagos', 'fa fa-usd', 'transaccion/pagos', 3, 1);

-- ----------------------------
-- Table structure for base_menu_perfil
-- ----------------------------
DROP TABLE IF EXISTS `base_menu_perfil`;
CREATE TABLE `base_menu_perfil`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` int(11) NULL DEFAULT NULL,
  `menu` int(11) NULL DEFAULT NULL,
  `visible` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_perfil_menu`(`menu`) USING BTREE,
  INDEX `menu_perfil_perfil`(`perfil`) USING BTREE,
  CONSTRAINT `menu_perfil_menu` FOREIGN KEY (`menu`) REFERENCES `base_menu` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menu_perfil_perfil` FOREIGN KEY (`perfil`) REFERENCES `base_perfil` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_menu_perfil
-- ----------------------------
INSERT INTO `base_menu_perfil` VALUES (1, 1, 101, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (2, 1, 103, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (3, 1, 104, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (5, 1, 201, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (6, 1, 202, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (8, 1, -101, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (9, 1, 301, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (11, 1, 303, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (12, 1, 304, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (13, 1, 203, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (14, 1, 305, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (34, 2, 201, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (35, 2, 202, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (36, 2, -101, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (37, 2, 301, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (38, 2, 303, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (39, 2, 304, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (40, 2, 203, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (41, 2, 305, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (42, 3, 301, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (43, 3, 303, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (44, 4, 301, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (45, 4, 303, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (46, 4, 305, 1, 1);

-- ----------------------------
-- Table structure for base_meses
-- ----------------------------
DROP TABLE IF EXISTS `base_meses`;
CREATE TABLE `base_meses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_meses
-- ----------------------------
INSERT INTO `base_meses` VALUES (1, 'Enero');
INSERT INTO `base_meses` VALUES (2, 'Febrero');
INSERT INTO `base_meses` VALUES (3, 'Marzo');
INSERT INTO `base_meses` VALUES (4, 'Abril');
INSERT INTO `base_meses` VALUES (5, 'Mayo');
INSERT INTO `base_meses` VALUES (6, 'Junio');
INSERT INTO `base_meses` VALUES (7, 'Julio');
INSERT INTO `base_meses` VALUES (8, 'Agosto');
INSERT INTO `base_meses` VALUES (9, 'Setiembre');
INSERT INTO `base_meses` VALUES (10, 'Octubre');
INSERT INTO `base_meses` VALUES (11, 'Noviembre');
INSERT INTO `base_meses` VALUES (12, 'Diciembre');

-- ----------------------------
-- Table structure for base_perfil
-- ----------------------------
DROP TABLE IF EXISTS `base_perfil`;
CREATE TABLE `base_perfil`  (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_perfil
-- ----------------------------
INSERT INTO `base_perfil` VALUES (1, 'Superadministrador', 1);
INSERT INTO `base_perfil` VALUES (2, 'Administrador', 1);
INSERT INTO `base_perfil` VALUES (3, 'Vendedor', 1);
INSERT INTO `base_perfil` VALUES (4, 'Cobrador', 1);

-- ----------------------------
-- Table structure for base_usuario
-- ----------------------------
DROP TABLE IF EXISTS `base_usuario`;
CREATE TABLE `base_usuario`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_sistema` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dni` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` int(10) NOT NULL,
  `perfil` int(10) NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `intentos` int(11) NULL DEFAULT 0,
  `ultimo_intento` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `usuario_perfil`(`perfil`) USING BTREE,
  INDEX `usuario_cliente_sistema`(`cliente_sistema`) USING BTREE,
  CONSTRAINT `usuario_cliente_sistema` FOREIGN KEY (`cliente_sistema`) REFERENCES `base_cliente_sistema` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `usuario_perfil` FOREIGN KEY (`perfil`) REFERENCES `base_perfil` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_usuario
-- ----------------------------
INSERT INTO `base_usuario` VALUES (1, 1, 'superadmin', '$2y$10$5PKqj1dPuC26FwzFh0p5gur9UzN9/vZPsvR/WW/D/0JaAVCWT7d5y', 'Superadmin', '', '12345678', 'direccion', '999999999', 'gmllasacas@gmail.com', 1, 1, '2019-02-27 14:18:43', 3, '2024-04-30 22:49:33');
INSERT INTO `base_usuario` VALUES (170, NULL, 'test', '$2y$10$kgcZMEg0zGe3FFJFolfcPeceu47mNOsv6/e8lKQ6vM0cqRQ3DOKXi', 'test', 'test', '34324324', '', '', 'test@test', 1, 2, '2024-04-30 23:53:10', 0, NULL);

-- ----------------------------
-- Table structure for proceso_categoria_producto
-- ----------------------------
DROP TABLE IF EXISTS `proceso_categoria_producto`;
CREATE TABLE `proceso_categoria_producto`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_categoria_producto
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_cliente
-- ----------------------------
DROP TABLE IF EXISTS `proceso_cliente`;
CREATE TABLE `proceso_cliente`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento` int(11) NOT NULL,
  `documento` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre_o_razon_social` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion_completa` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ruc`(`documento`) USING BTREE,
  INDEX `cliente_tipo_documento`(`tipo_documento`) USING BTREE,
  CONSTRAINT `cliente_tipo_documento` FOREIGN KEY (`tipo_documento`) REFERENCES `proceso_tipo_documento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_cliente
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_control
-- ----------------------------
DROP TABLE IF EXISTS `proceso_control`;
CREATE TABLE `proceso_control`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodo` date NULL DEFAULT NULL,
  `rotacion` decimal(10, 4) NULL DEFAULT NULL,
  `duracion` decimal(10, 4) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_control
-- ----------------------------
INSERT INTO `proceso_control` VALUES (1, '2019-01-01', 0.0000, 0.0000, '2019-08-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (2, '2019-02-01', 0.0000, 0.0000, '2019-08-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (3, '2019-03-01', 0.0000, 0.0000, '2019-08-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (4, '2019-04-01', 0.0000, 0.0000, '2019-08-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (5, '2019-05-01', 0.0000, 0.0000, '2019-08-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (6, '2019-06-01', 0.0000, 0.0000, '2019-08-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (7, '2019-07-01', 0.0000, 0.0000, '2019-08-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (8, '2019-08-01', 0.0000, 0.0000, '2019-08-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (9, '2019-09-01', 0.0000, 0.0000, '2019-09-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (10, '2019-10-01', 1.2865, 0.9727, '2019-10-31 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (11, '2019-11-01', 1.3014, 0.8621, '2019-11-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (12, '2019-12-01', 1.3210, 0.7450, '2019-12-31 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (13, '2020-01-01', 0.0000, 0.0000, '2020-01-31 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (14, '2020-02-01', 0.0000, 0.0000, '2020-02-29 23:59:00', 1);
INSERT INTO `proceso_control` VALUES (15, '2020-03-01', 0.0000, 0.0000, '2020-03-31 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (16, '2020-04-01', 0.0000, 0.0000, '2020-04-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (17, '2020-05-01', 0.0000, 0.0000, '2020-05-31 23:59:00', 1);
INSERT INTO `proceso_control` VALUES (18, '2020-06-01', 0.0000, 0.0000, '2020-06-30 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (19, '2020-07-01', 0.0000, 0.0000, '2020-07-31 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (20, '2020-08-01', 0.0000, 0.0000, '2020-08-31 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (21, '2020-09-01', 0.0000, 0.0000, '2020-08-31 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (22, '2020-10-01', 1.3919, 0.8412, '2020-08-31 23:58:00', 1);
INSERT INTO `proceso_control` VALUES (23, '2020-11-01', 1.2100, 0.7190, '2020-11-19 20:05:47', 1);
INSERT INTO `proceso_control` VALUES (24, '2020-12-01', 0.1750, 0.6515, '2020-12-19 20:05:47', 1);

-- ----------------------------
-- Table structure for proceso_credito
-- ----------------------------
DROP TABLE IF EXISTS `proceso_credito`;
CREATE TABLE `proceso_credito`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_credito` int(11) NOT NULL,
  `referencia` int(11) NULL DEFAULT NULL,
  `cliente` int(11) NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `credito` decimal(10, 2) NOT NULL,
  `fecha_registro` datetime(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `credito_tipo_credito`(`tipo_credito`) USING BTREE,
  INDEX `credito_cliente`(`cliente`) USING BTREE,
  CONSTRAINT `credito_cliente` FOREIGN KEY (`cliente`) REFERENCES `proceso_cliente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `credito_tipo_credito` FOREIGN KEY (`tipo_credito`) REFERENCES `proceso_tipo_credito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_credito
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_indicador
-- ----------------------------
DROP TABLE IF EXISTS `proceso_indicador`;
CREATE TABLE `proceso_indicador`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_indicador
-- ----------------------------
INSERT INTO `proceso_indicador` VALUES (1, 'Rotación de inventario', 1);
INSERT INTO `proceso_indicador` VALUES (2, 'Duración de inventario', 1);

-- ----------------------------
-- Table structure for proceso_ingreso
-- ----------------------------
DROP TABLE IF EXISTS `proceso_ingreso`;
CREATE TABLE `proceso_ingreso`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` int(11) NULL DEFAULT NULL,
  `tipo_comprobante` int(11) NULL DEFAULT NULL,
  `comprobante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `datos_adicionales` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` int(11) NULL DEFAULT NULL,
  `fecha_registro` datetime(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ingreso_proveedor`(`proveedor`) USING BTREE,
  INDEX `ingreso_usuario`(`usuario`) USING BTREE,
  CONSTRAINT `ingreso_proveedor` FOREIGN KEY (`proveedor`) REFERENCES `proceso_proveedor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ingreso_usuario` FOREIGN KEY (`usuario`) REFERENCES `base_usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_ingreso
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_ingreso_anulacion
-- ----------------------------
DROP TABLE IF EXISTS `proceso_ingreso_anulacion`;
CREATE TABLE `proceso_ingreso_anulacion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingreso` int(11) NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `proceso_ingreso_anul_ingreso`(`ingreso`) USING BTREE,
  CONSTRAINT `proceso_ingreso_anul_ingreso` FOREIGN KEY (`ingreso`) REFERENCES `proceso_ingreso` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_ingreso_anulacion
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_ingreso_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_ingreso_detalle`;
CREATE TABLE `proceso_ingreso_detalle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingreso` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ingreso_detalle_ingreso`(`ingreso`) USING BTREE,
  INDEX `ingreso_detalle_producto`(`producto`) USING BTREE,
  CONSTRAINT `ingreso_detalle_ingreso` FOREIGN KEY (`ingreso`) REFERENCES `proceso_ingreso` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ingreso_detalle_producto` FOREIGN KEY (`producto`) REFERENCES `proceso_producto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_ingreso_detalle
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_kardex
-- ----------------------------
DROP TABLE IF EXISTS `proceso_kardex`;
CREATE TABLE `proceso_kardex`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_kardex` int(11) NOT NULL,
  `referencia` int(11) NOT NULL,
  `producto` int(11) NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `precio` decimal(10, 2) NULL DEFAULT NULL,
  `subtotal` decimal(10, 2) NULL DEFAULT NULL,
  `saldo` int(11) NULL DEFAULT NULL,
  `fecha_registro` datetime(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `proceso_kardex`(`producto`) USING BTREE,
  INDEX `producto_tipo_kardex`(`tipo_kardex`) USING BTREE,
  CONSTRAINT `kardex_producto` FOREIGN KEY (`producto`) REFERENCES `proceso_producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `kardex_tipo_kardex` FOREIGN KEY (`tipo_kardex`) REFERENCES `proceso_tipo_kardex` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_kardex
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_pago
-- ----------------------------
DROP TABLE IF EXISTS `proceso_pago`;
CREATE TABLE `proceso_pago`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pago` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `pago` decimal(10, 2) NOT NULL,
  `observaciones` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha_registro` datetime(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pago_tipo_pago`(`tipo_pago`) USING BTREE,
  CONSTRAINT `pago_tipo_pago` FOREIGN KEY (`tipo_pago`) REFERENCES `proceso_tipo_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_pago
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_pago_anulacion
-- ----------------------------
DROP TABLE IF EXISTS `proceso_pago_anulacion`;
CREATE TABLE `proceso_pago_anulacion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pago` int(11) NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pago_anulacion_pago`(`pago`) USING BTREE,
  CONSTRAINT `pago_anulacion_pago` FOREIGN KEY (`pago`) REFERENCES `proceso_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_pago_anulacion
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_producto
-- ----------------------------
DROP TABLE IF EXISTS `proceso_producto`;
CREATE TABLE `proceso_producto`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` int(11) NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `producto_tipo`(`tipo`) USING BTREE,
  CONSTRAINT `producto_tipo` FOREIGN KEY (`tipo`) REFERENCES `proceso_categoria_producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_producto
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proceso_proveedor`;
CREATE TABLE `proceso_proveedor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre_o_razon_social` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion_completa` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ruc`(`ruc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_proveedor
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_tipo_comprobante
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_comprobante`;
CREATE TABLE `proceso_tipo_comprobante`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_comprobante
-- ----------------------------
INSERT INTO `proceso_tipo_comprobante` VALUES (1, 'BOLETA', 1);
INSERT INTO `proceso_tipo_comprobante` VALUES (2, 'FACTURA', 1);
INSERT INTO `proceso_tipo_comprobante` VALUES (3, 'NOTA DE CRÉDITO', 1);
INSERT INTO `proceso_tipo_comprobante` VALUES (4, 'GUÍA DE REMISÍÓN', 1);
INSERT INTO `proceso_tipo_comprobante` VALUES (5, 'NOTA DE VENTA', 1);

-- ----------------------------
-- Table structure for proceso_tipo_credito
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_credito`;
CREATE TABLE `proceso_tipo_credito`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_credito
-- ----------------------------
INSERT INTO `proceso_tipo_credito` VALUES (1, 'Crédito', 1);
INSERT INTO `proceso_tipo_credito` VALUES (2, 'Pago', 1);
INSERT INTO `proceso_tipo_credito` VALUES (3, 'Crédito inicial', 1);
INSERT INTO `proceso_tipo_credito` VALUES (4, 'Pago anulado', 1);
INSERT INTO `proceso_tipo_credito` VALUES (5, 'Venta anulada', 1);

-- ----------------------------
-- Table structure for proceso_tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_documento`;
CREATE TABLE `proceso_tipo_documento`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_documento
-- ----------------------------
INSERT INTO `proceso_tipo_documento` VALUES (1, 'DNI', 1);
INSERT INTO `proceso_tipo_documento` VALUES (5, 'RUC', 1);

-- ----------------------------
-- Table structure for proceso_tipo_kardex
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_kardex`;
CREATE TABLE `proceso_tipo_kardex`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_kardex
-- ----------------------------
INSERT INTO `proceso_tipo_kardex` VALUES (1, 'Ingreso', 1);
INSERT INTO `proceso_tipo_kardex` VALUES (2, 'Venta', 1);
INSERT INTO `proceso_tipo_kardex` VALUES (3, 'Ingreso anulado', 1);
INSERT INTO `proceso_tipo_kardex` VALUES (4, 'Venta anulada', 1);

-- ----------------------------
-- Table structure for proceso_tipo_pago
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_pago`;
CREATE TABLE `proceso_tipo_pago`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_pago
-- ----------------------------
INSERT INTO `proceso_tipo_pago` VALUES (1, 'Efectivo', 1);
INSERT INTO `proceso_tipo_pago` VALUES (2, 'Depósito', 1);

-- ----------------------------
-- Table structure for proceso_tipo_venta_pago
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_venta_pago`;
CREATE TABLE `proceso_tipo_venta_pago`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_venta_pago
-- ----------------------------
INSERT INTO `proceso_tipo_venta_pago` VALUES (1, 'Crédito', 1);
INSERT INTO `proceso_tipo_venta_pago` VALUES (2, 'Contado', 1);

-- ----------------------------
-- Table structure for proceso_venta
-- ----------------------------
DROP TABLE IF EXISTS `proceso_venta`;
CREATE TABLE `proceso_venta`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` int(11) NULL DEFAULT NULL,
  `tipo_comprobante` int(11) NULL DEFAULT NULL,
  `comprobante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `datos_adicionales` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `igv` decimal(10, 2) NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `subtotalc` decimal(10, 2) NOT NULL,
  `igvc` decimal(10, 2) NOT NULL,
  `totalc` decimal(10, 2) NOT NULL,
  `usuario` int(11) NULL DEFAULT NULL,
  `tipo_venta_pago` int(11) NOT NULL,
  `fecha_registro` datetime(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `venta_cliente`(`cliente`) USING BTREE,
  INDEX `venta_tipo_comprobante`(`tipo_comprobante`) USING BTREE,
  INDEX `venta_tipo_venta_pago`(`tipo_venta_pago`) USING BTREE,
  CONSTRAINT `venta_cliente` FOREIGN KEY (`cliente`) REFERENCES `proceso_cliente` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `venta_tipo_comprobante` FOREIGN KEY (`tipo_comprobante`) REFERENCES `proceso_tipo_comprobante` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `venta_tipo_venta_pago` FOREIGN KEY (`tipo_venta_pago`) REFERENCES `proceso_tipo_venta_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_venta
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_venta_anulacion
-- ----------------------------
DROP TABLE IF EXISTS `proceso_venta_anulacion`;
CREATE TABLE `proceso_venta_anulacion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta` int(11) NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `venta_anulacion_venta`(`venta`) USING BTREE,
  CONSTRAINT `venta_anulacion_venta` FOREIGN KEY (`venta`) REFERENCES `proceso_venta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_venta_anulacion
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_venta_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_venta_detalle`;
CREATE TABLE `proceso_venta_detalle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta` int(11) NULL DEFAULT NULL,
  `producto` int(11) NULL DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `precioc` decimal(10, 2) NOT NULL,
  `subtotalc` decimal(10, 2) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `venta_detalle_venta`(`venta`) USING BTREE,
  INDEX `venta_detalle_producto`(`producto`) USING BTREE,
  CONSTRAINT `venta_detalle_producto` FOREIGN KEY (`producto`) REFERENCES `proceso_producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `venta_detalle_venta` FOREIGN KEY (`venta`) REFERENCES `proceso_venta` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_venta_detalle
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
