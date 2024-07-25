/*
 Navicat Premium Data Transfer

 Source Server         : laragon_6
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3308
 Source Schema         : tahua

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 10/07/2024 09:13:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_cliente_sistema
-- ----------------------------
DROP TABLE IF EXISTS `base_cliente_sistema`;
CREATE TABLE `base_cliente_sistema`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre_o_razon_social` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion_completa` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `contacto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ruc`(`ruc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_cliente_sistema
-- ----------------------------
INSERT INTO `base_cliente_sistema` VALUES (1, '10478672882', 'demo', 'Lima', 'usuario', '98765321', '', '2020-10-28 00:00:00', 1);
INSERT INTO `base_cliente_sistema` VALUES (64, '12312312312', 'test2', '', 'test', '34324324234', 'test@test', '2024-05-02 10:41:08', 1);
INSERT INTO `base_cliente_sistema` VALUES (66, '34534534534', 'trtr', '', '', '32423342', '', '2024-05-02 10:42:52', 1);
INSERT INTO `base_cliente_sistema` VALUES (67, '34534534535', 'trtr', '', '', '32423342', '', '2024-05-02 10:45:33', 1);
INSERT INTO `base_cliente_sistema` VALUES (68, '32452342344', 'test4t', '', '', '32434', '', '2024-05-02 10:53:09', 1);
INSERT INTO `base_cliente_sistema` VALUES (69, '32452342355', 'test4t', '', '', '32434', '', '2024-05-02 10:54:11', 1);
INSERT INTO `base_cliente_sistema` VALUES (70, '32452342337', 'test4t', '', '', '32434', '', '2024-05-02 11:04:56', 1);
INSERT INTO `base_cliente_sistema` VALUES (71, '12312314534', 'Nombre / Razón social actualizada', 'Dirección nueva', 'Nombres de contacto actu', '25235235', 'test@test', '2024-05-02 11:15:05', 1);
INSERT INTO `base_cliente_sistema` VALUES (72, '45457457457', 'test4 editado', 'nueva direccion', '', '32532555555', 'test@test', '2024-05-02 17:46:14', 1);

-- ----------------------------
-- Table structure for base_configuracion
-- ----------------------------
DROP TABLE IF EXISTS `base_configuracion`;
CREATE TABLE `base_configuracion`  (
  `id` int(0) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `url_servicio` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ruc` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `envio` tinyint(1) NOT NULL,
  `asociado` int(0) NOT NULL,
  `send_email` int(0) NOT NULL,
  `url_api` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dashboard` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `igv` decimal(10, 2) NOT NULL,
  `estado` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_configuracion
-- ----------------------------
INSERT INTO `base_configuracion` VALUES (1, 'https://e-beta.sunat.gob.pe/ol-ti-itcpfegem-beta/billService?wsdl', 'https://<localhost>/', '20478672883', 0, 0, 1, 'https://<localhost>/', 'SISTEMA', '1.00.01', '', '', 'Todos los derechos reservados', 18.00, 1, '2024-06-17 16:28:03');

-- ----------------------------
-- Table structure for base_estado
-- ----------------------------
DROP TABLE IF EXISTS `base_estado`;
CREATE TABLE `base_estado`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `visibilidad` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_estado
-- ----------------------------
INSERT INTO `base_estado` VALUES (1, 'Activo', 'success', 1);
INSERT INTO `base_estado` VALUES (2, 'Inactivo', 'default', 1);
INSERT INTO `base_estado` VALUES (3, 'Anulado', 'danger', 0);
INSERT INTO `base_estado` VALUES (4, 'Incompleto', 'warning', 0);
INSERT INTO `base_estado` VALUES (5, 'Eliminado', 'danger', 0);

-- ----------------------------
-- Table structure for base_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu`  (
  `id` int(0) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `icono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `padre` int(0) NOT NULL,
  `estado` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_menu
-- ----------------------------
INSERT INTO `base_menu` VALUES (-101, 'Dashboard', 'si si-pie-chart', 'proceso/dashboard', -1, 1);
INSERT INTO `base_menu` VALUES (-1, 'Inicio', 'si si-bar-chart', '', 0, 1);
INSERT INTO `base_menu` VALUES (1, 'Sistema', 'si si-settings', '', 0, 1);
INSERT INTO `base_menu` VALUES (2, 'Inventario', 'si si-grid', '', 0, 1);
INSERT INTO `base_menu` VALUES (3, 'Transacciones', 'si si-shuffle', '', 0, 1);
INSERT INTO `base_menu` VALUES (4, 'Reportes', 'si si-bar-chart', '', 0, 1);
INSERT INTO `base_menu` VALUES (101, 'Configuración', 'fa fa-gears', 'sistema/configuracion', 1, 1);
INSERT INTO `base_menu` VALUES (103, 'Clientes del sistema', 'si si-briefcase', 'sistema/clientes', 1, 1);
INSERT INTO `base_menu` VALUES (104, 'Usuarios', 'si si-users', 'sistema/usuarios', 1, 1);
INSERT INTO `base_menu` VALUES (105, 'Auditoría', 'fa fa-eye', 'sistema/auditoria', 1, 1);
INSERT INTO `base_menu` VALUES (201, 'Clientes', 'si si-handbag', 'proceso/clientes', 2, 1);
INSERT INTO `base_menu` VALUES (202, 'Proveedores', 'si si-share', 'proceso/proveedores', 2, 1);
INSERT INTO `base_menu` VALUES (203, 'Productos y Servicios', 'si si-tag', 'proceso/productos', 2, 1);
INSERT INTO `base_menu` VALUES (301, 'Ingresos', 'si si-login', 'transaccion/ingresos', 3, 1);
INSERT INTO `base_menu` VALUES (303, 'Ventas', 'si si-basket', 'transaccion/ventas', 3, 1);
INSERT INTO `base_menu` VALUES (304, 'Kardex', 'si si-bar-chart', 'transaccion/kardex', 3, 1);
INSERT INTO `base_menu` VALUES (305, 'Pagos de clientes', 'fa fa-usd', 'transaccion/pagosCliente', 3, 1);
INSERT INTO `base_menu` VALUES (306, 'Pagos a proveedores', 'si si-wallet', 'transaccion/pagosProveedor', 3, 1);
INSERT INTO `base_menu` VALUES (307, 'Caja', 'si si-drawer', 'transaccion/caja', 3, 1);
INSERT INTO `base_menu` VALUES (401, 'Clientes', 'si si-users', 'reportes/clientes', 4, 1);
INSERT INTO `base_menu` VALUES (402, 'Transacciones', 'si si-shuffle', 'reportes/transacciones', 4, 1);

-- ----------------------------
-- Table structure for base_menu_perfil
-- ----------------------------
DROP TABLE IF EXISTS `base_menu_perfil`;
CREATE TABLE `base_menu_perfil`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `perfil` int(0) NULL DEFAULT NULL,
  `menu` int(0) NULL DEFAULT NULL,
  `visible` int(0) NOT NULL,
  `estado` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_perfil_menu`(`menu`) USING BTREE,
  INDEX `menu_perfil_perfil`(`perfil`) USING BTREE,
  CONSTRAINT `menu_perfil_menu` FOREIGN KEY (`menu`) REFERENCES `base_menu` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menu_perfil_perfil` FOREIGN KEY (`perfil`) REFERENCES `base_perfil` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_menu_perfil
-- ----------------------------
INSERT INTO `base_menu_perfil` VALUES (1, 2, 201, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (2, 2, 202, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (3, 2, -101, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (4, 2, 301, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (5, 2, 303, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (6, 2, 304, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (7, 2, 203, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (8, 2, 305, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (9, 3, 301, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (10, 3, 303, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (11, 4, 301, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (12, 4, 303, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (13, 4, 305, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (14, 1, 105, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (48, 2, 307, 1, 1);

-- ----------------------------
-- Table structure for base_meses
-- ----------------------------
DROP TABLE IF EXISTS `base_meses`;
CREATE TABLE `base_meses`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `mes` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(0) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_perfil
-- ----------------------------
INSERT INTO `base_perfil` VALUES (1, 'Superadministrador', 1);
INSERT INTO `base_perfil` VALUES (2, 'Administrador', 1);
INSERT INTO `base_perfil` VALUES (3, 'Vendedor', 1);
INSERT INTO `base_perfil` VALUES (4, 'Cobrador', 1);

-- ----------------------------
-- Table structure for base_sucursal
-- ----------------------------
DROP TABLE IF EXISTS `base_sucursal`;
CREATE TABLE `base_sucursal`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `sucursal` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_sucursal
-- ----------------------------
INSERT INTO `base_sucursal` VALUES (1, 'Golden Plaza', 'Av. Centenario 290 - Golden Plaza Huaraz\r\n', 1);
INSERT INTO `base_sucursal` VALUES (2, 'SUNAT', 'Jr. Simón Bolívar 667 - Huaraz', 1);
INSERT INTO `base_sucursal` VALUES (3, 'Restaurant', NULL, 1);

-- ----------------------------
-- Table structure for base_usuario
-- ----------------------------
DROP TABLE IF EXISTS `base_usuario`;
CREATE TABLE `base_usuario`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `cliente_sistema` int(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dni` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int(0) NOT NULL,
  `perfil` int(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `intentos` int(0) NULL DEFAULT 0,
  `ultimo_intento` datetime(0) NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `usuario_perfil`(`perfil`) USING BTREE,
  INDEX `usuario_cliente_sistema`(`cliente_sistema`) USING BTREE,
  CONSTRAINT `usuario_cliente_sistema` FOREIGN KEY (`cliente_sistema`) REFERENCES `base_cliente_sistema` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `usuario_perfil` FOREIGN KEY (`perfil`) REFERENCES `base_perfil` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_usuario
-- ----------------------------
INSERT INTO `base_usuario` VALUES (1, 1, 'superadmin', '$2y$10$SSXdJa7U54TMwV4U7mP3duu77wTOt/cik.phIIZq7c77diRtHPC6.', 'Superadmin', '', '12345678', 'direccion', '999999999', 'gmllasacas@gmail.com', 1, 1, '2019-02-27 14:18:43', 0, '2024-07-09 20:58:54', NULL);
INSERT INTO `base_usuario` VALUES (2, 1, 'test', '$2y$10$SSXdJa7U54TMwV4U7mP3duu77wTOt/cik.phIIZq7c77diRtHPC6.', 'test', 'test', '34324324', '', '', 'test@test', 1, 2, '2024-04-30 23:53:10', 0, '2024-07-09 13:08:49', NULL);

-- ----------------------------
-- Table structure for base_usuario_sucursal
-- ----------------------------
DROP TABLE IF EXISTS `base_usuario_sucursal`;
CREATE TABLE `base_usuario_sucursal`  (
  `id` int(0) NOT NULL,
  `usuario` int(0) NULL DEFAULT NULL,
  `sucursal` int(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_usuario_sucursal
-- ----------------------------
INSERT INTO `base_usuario_sucursal` VALUES (1, 2, 1, '2024-07-07 16:59:58', 1);

-- ----------------------------
-- Table structure for proceso_auditoria
-- ----------------------------
DROP TABLE IF EXISTS `proceso_auditoria`;
CREATE TABLE `proceso_auditoria`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `usuario` int(0) NULL DEFAULT NULL,
  `accion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `sucursal` int(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auditoria_usuario_fk`(`usuario`) USING BTREE,
  INDEX `auditoria_sucursal_fk`(`sucursal`) USING BTREE,
  INDEX `auditoria_estado_fk`(`estado`) USING BTREE,
  CONSTRAINT `auditoria_estado_fk` FOREIGN KEY (`estado`) REFERENCES `base_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auditoria_sucursal_fk` FOREIGN KEY (`sucursal`) REFERENCES `base_sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auditoria_usuario_fk` FOREIGN KEY (`usuario`) REFERENCES `base_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_auditoria
-- ----------------------------
INSERT INTO `proceso_auditoria` VALUES (14, 1, 'Terminó sesión', '[]', NULL, '2024-05-02 17:45:49', 1);
INSERT INTO `proceso_auditoria` VALUES (15, 1, 'Inició sesión', '[]', NULL, '2024-05-02 17:45:54', 1);
INSERT INTO `proceso_auditoria` VALUES (16, 1, 'Creó un registro de \'cliente_sistema\' con ID: 72', '{\"estado\":\"1\",\"ruc\":\"45457457457\",\"nombre_o_razon_social\":\"test4\",\"direccion_completa\":\"\",\"contacto\":\"\",\"telefono\":\"32532555555\",\"correo\":\"\",\"fecha\":\"2024-05-02 17:46:14\",\"id\":72}', NULL, '2024-05-02 17:46:14', 1);
INSERT INTO `proceso_auditoria` VALUES (17, 1, 'Actualizó un registro de \'cliente_sistema\' con ID: 72', '{\"estado\":\"1\",\"nombre_o_razon_social\":\"test4 editado\",\"direccion_completa\":\"nueva direccion\",\"contacto\":\"\",\"telefono\":\"32532555555\",\"correo\":\"test@test\",\"id\":\"72\"}', NULL, '2024-05-02 17:46:37', 1);
INSERT INTO `proceso_auditoria` VALUES (18, 1, 'Actualizó un registro de \'cliente_sistema\' con ID: 72', '{\"estado\":\"2\",\"id\":\"72\"}', NULL, '2024-05-02 17:59:46', 1);
INSERT INTO `proceso_auditoria` VALUES (19, 1, 'Terminó sesión', '[]', NULL, '2024-05-02 20:20:07', 1);
INSERT INTO `proceso_auditoria` VALUES (20, 2, 'Inició sesión', '[]', NULL, '2024-05-02 20:23:11', 1);
INSERT INTO `proceso_auditoria` VALUES (21, 2, 'Terminó sesión', '[]', NULL, '2024-05-02 20:23:17', 1);
INSERT INTO `proceso_auditoria` VALUES (22, 1, 'Inició sesión', '[]', NULL, '2024-05-02 20:23:22', 1);
INSERT INTO `proceso_auditoria` VALUES (23, 1, 'Actualizó un registro de \'cliente_sistema\' con ID: 72', '{\"estado\":\"1\",\"id\":\"72\"}', NULL, '2024-05-02 20:24:20', 1);
INSERT INTO `proceso_auditoria` VALUES (24, 1, 'Terminó sesión', '[]', NULL, '2024-05-02 20:27:39', 1);
INSERT INTO `proceso_auditoria` VALUES (25, 1, 'Inició sesión', '[]', NULL, '2024-05-02 20:27:58', 1);
INSERT INTO `proceso_auditoria` VALUES (26, 1, 'Actualizó un registro de \'configuracion\' con ID: 1', '{\"ruc\":\"20478672883\",\"asociado\":\"0\",\"send_email\":\"0\",\"url\":\"https:\\/\\/e-beta.sunat.gob.pe\\/ol-ti-itcpfegem-beta\\/billService?wsdl\",\"url_servicio\":\"https:\\/\\/<localhost>\\/\",\"url_api\":\"https:\\/\\/<localhost>\\/\",\"igv\":\"18.00\",\"titulo\":\"SISTEMA\",\"copyright\":\"Todos los derechos reservados\",\"fecha\":\"2024-05-02 20:29:31\",\"id\":\"1\"}', NULL, '2024-05-02 20:29:31', 1);
INSERT INTO `proceso_auditoria` VALUES (27, 1, 'Actualizó un registro de \'configuracion\' con ID: 1', '{\"ruc\":\"20478672883\",\"asociado\":\"0\",\"send_email\":\"0\",\"url\":\"https:\\/\\/e-beta.sunat.gob.pe\\/ol-ti-itcpfegem-beta\\/billService?wsdl\",\"url_servicio\":\"https:\\/\\/<localhost>\\/\",\"url_api\":\"https:\\/\\/<localhost>\\/\",\"igv\":\"18.00\",\"titulo\":\"SISTEMA\",\"copyright\":\"Todos los derechos reservados\",\"logo\":\"public\\/img\\/recursos\\/c6b73d93092d06d1f7c2de96551ea10f.jpg\",\"fecha\":\"2024-05-02 20:32:33\",\"id\":\"1\"}', NULL, '2024-05-02 20:32:33', 1);
INSERT INTO `proceso_auditoria` VALUES (28, 1, 'Actualizó un registro de \'configuracion\' con ID: 1', '{\"ruc\":\"20478672883\",\"asociado\":\"0\",\"send_email\":\"0\",\"url\":\"https:\\/\\/e-beta.sunat.gob.pe\\/ol-ti-itcpfegem-beta\\/billService?wsdl\",\"url_servicio\":\"https:\\/\\/<localhost>\\/\",\"url_api\":\"https:\\/\\/<localhost>\\/\",\"igv\":\"18.00\",\"titulo\":\"SISTEMA\",\"copyright\":\"Todos los derechos reservados\",\"logo\":\"public\\/uploads\\/44e842d9dcdcca66478cfdb8eb7474ec.png\",\"fecha\":\"2024-05-02 21:08:43\",\"id\":\"1\"}', NULL, '2024-05-02 21:08:43', 1);
INSERT INTO `proceso_auditoria` VALUES (29, 1, 'Inició sesión', '[]', NULL, '2024-05-02 21:47:03', 1);
INSERT INTO `proceso_auditoria` VALUES (30, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-05-02 21:55:24', 1);
INSERT INTO `proceso_auditoria` VALUES (31, 1, 'Inició sesión', '[]', NULL, '2024-05-02 21:55:28', 1);
INSERT INTO `proceso_auditoria` VALUES (32, 1, 'Inició sesión', '[]', NULL, '2024-05-02 21:56:19', 1);
INSERT INTO `proceso_auditoria` VALUES (33, 1, 'Inició sesión', '[]', NULL, '2024-05-02 22:03:28', 1);
INSERT INTO `proceso_auditoria` VALUES (34, 1, 'Inició sesión', '[]', NULL, '2024-05-02 22:08:26', 1);
INSERT INTO `proceso_auditoria` VALUES (35, 1, 'Actualizó un registro de \'configuracion\' con ID: 1', '{\"ruc\":\"20478672883\",\"asociado\":\"0\",\"send_email\":\"0\",\"url\":\"https:\\/\\/e-beta.sunat.gob.pe\\/ol-ti-itcpfegem-beta\\/billService?wsdl\",\"url_servicio\":\"https:\\/\\/<localhost>\\/\",\"url_api\":\"https:\\/\\/<localhost>\\/\",\"igv\":\"18.00\",\"titulo\":\"SISTEMA\",\"copyright\":\"Todos los derechos reservados\",\"dashboard\":\"public\\/uploads\\/d9ef5794b86ea9ea1d47e2843f6b15eb.jpg\",\"fecha\":\"2024-05-03 10:17:07\",\"id\":\"1\"}', NULL, '2024-05-03 10:17:07', 1);
INSERT INTO `proceso_auditoria` VALUES (36, 1, 'Terminó sesión', '[]', NULL, '2024-05-03 10:21:15', 1);
INSERT INTO `proceso_auditoria` VALUES (37, NULL, 'Actualizó un registro de \'usuario\' con ID: ', '{\"token\":\"ea42de79f010a6066dd6494424048b8aaca6a64ba79d01a92644aeb5587342fd2e736f09754ca45a7e3aa9cd2f501cb6724c5a46701aeda851fe0a0ef62299aas6jgvUW1bGgnzWGjLXEwJ2TZzsHSNk+W\\/r++xF1axlerQSDdvnsfexsMiEIVJpYt\",\"id\":null}', NULL, '2024-05-07 16:45:57', 1);
INSERT INTO `proceso_auditoria` VALUES (38, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"f0657e2ec3098364e0b112eb57a43e398329e7398ae731d8c7d804ab0d495e53a42dec0bdcbf49b143eb5f0d47fb21a28832092ee28363873364f4fcef47679fOazY\\/caIJidvhk407YHLyQytIbMnYxsagWa6efeSf5m1NhukcFt6y4sQvaOUcvxf\",\"id\":\"1\"}', NULL, '2024-05-07 16:46:47', 1);
INSERT INTO `proceso_auditoria` VALUES (39, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"3e83d02d3abfdafed4bfe1ca036ae5be93093e58c3473ebec39b09420e06781f6c997968751ce6533de124e4f620c2a5d1d04f68084942d132dd1447e747b820tCBDJoff9M4JmWq8wyG4Y6AMujsAhJNyQ87Cl7ivBAI3NqMwRgpwDVW1pE5NYrQq\",\"id\":\"1\"}', NULL, '2024-05-07 16:50:59', 1);
INSERT INTO `proceso_auditoria` VALUES (40, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"eab67ea93ae6f863767b91d9dcc29a7d1915471f1f694de09424ca0b811f4458e9965e841d48744897b585b66f06bbe87297566c937ab2a1136f491ece0f99d933vb2NLPlU+9+PcrEGHqkcorGrG87b0n\\/xKzoXR32neUKBaRprciAzbnaMReYppG\",\"id\":\"1\"}', NULL, '2024-05-07 16:55:31', 1);
INSERT INTO `proceso_auditoria` VALUES (41, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"f588ca8f5803e2f7b9fd162a7533e6dee70789a01e5d81cd20ffdcc5b36de4c2c366026273e9bf080e1d872fab043685c6ea07c302de58b0b808e40307f3e5f7MiXlhaWGHkXVyOXBk1gQE47o9d\\/0eLQKiWy2CCSyXstwWuzoTnGbkxs8swQk6\\/Kn\",\"id\":\"1\"}', NULL, '2024-05-07 18:41:37', 1);
INSERT INTO `proceso_auditoria` VALUES (42, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"99ddf71e4c69236c407e4c3d85d4cda6c85a31478ffe34dcfae00d9f39c6a866e47d884f59d362fae8b7f22e1fbab2128e00be46f752a0a28228fe530a5479c9zuOlLfyIPjWRFpWyUo7G04YZvVWFr0vKam74mCoqZ\\/\\/FwV4jhiRa4pvv6KdaePN6\",\"id\":\"1\"}', NULL, '2024-05-07 18:43:25', 1);
INSERT INTO `proceso_auditoria` VALUES (43, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"2bcadeb62817560c242504a8c88edbb0fbc4c16d9a4fadd3bfae28bbe21e6829a85c043380cbe215202bc823aa4f2af52d8098e63737a22a15a67a36cb43f9213PpC+Ta3FYl2o1wfSpmJkb+nPPjcuNVDCRmdpNQrQOd0WVtohy4d\\/XbDue8xUsJw\",\"id\":\"1\"}', NULL, '2024-05-07 18:46:17', 1);
INSERT INTO `proceso_auditoria` VALUES (44, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"a1b16512903de3df25154467941d37827cbb78239b74abc8c604cc106ddcb0ec87e86d523735f10d1c59638717f75964fcdf17c734e78ba6145e27d931e1e230CGt5b\\/6a56K9eZag\\/Z3ViCIDoCpI9fpGB5x0tszr0OMxWv0Ob0StVBf\\/oUoaDFvg\",\"id\":\"1\"}', NULL, '2024-05-07 19:00:14', 1);
INSERT INTO `proceso_auditoria` VALUES (45, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"e5d8fec91084a2b7b66bd158dd39fb84016b3c25a3a72373e56d7f3e099a54b95224fd94c0a14d16e1b2c5d0200fea6c543075393e23135779bc68cbc0e5582fIaj246yDjc2MhrATvs6ZgkNzqUmM8m7qp64c2ml89O8hNtvb9dGCx9BIO6PvTT1s\",\"id\":\"1\"}', NULL, '2024-05-08 08:12:25', 1);
INSERT INTO `proceso_auditoria` VALUES (46, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"d6692925439c4c20b4daaea8cb55632169b8efebfbf99fc273f2cc14fb85f1d84acc84c4ffe4aa495a1f09f974b644eaec0f6fc983543caecfc90eeecd9f17205lAKiOkkiE70qS42PHtoU9VvHFzH3V3PKT98xiW5ZPfyPcDP0HQ1+xKHn5yOXbCO\",\"id\":\"1\"}', NULL, '2024-05-08 08:18:30', 1);
INSERT INTO `proceso_auditoria` VALUES (47, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"15d35a4478d78e17bccc4b94c697e00a28abe9f8e14bddcc8ffd72ef67cca43d77dce5626a1b75bd57908b36a269217d724d4f0160975a9748fb6834e3680f50nTiix6otGkmAfmi+MfyrrsXZ6rc6qUIUOO8\\/CIpdfhWNYLEEgOEkNzW9srqAqc2r\",\"id\":\"1\"}', NULL, '2024-05-08 08:23:03', 1);
INSERT INTO `proceso_auditoria` VALUES (48, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"471b382b9c8dc1fdbac8b95399f22e43b9451e1fc02184ba67defb2d4b4a2e9a2899f14d6180947b2bd6bab7ee0ded523dbe7852e69d8e079a246ce6a80a9d43TWWmGxNfgzz\\/P7s+WVznGIQHMfKdDqnaEbhc4t9S9FJxjAelqFJ9TZz3fotSB\\/5E\",\"id\":\"1\"}', NULL, '2024-05-08 08:35:24', 1);
INSERT INTO `proceso_auditoria` VALUES (49, 1, 'Inició sesión', '[]', NULL, '2024-05-08 08:46:17', 1);
INSERT INTO `proceso_auditoria` VALUES (50, 1, 'Inició sesión', '[]', NULL, '2024-05-08 09:16:44', 1);
INSERT INTO `proceso_auditoria` VALUES (51, 1, 'Inició sesión', '[]', NULL, '2024-05-08 09:17:41', 1);
INSERT INTO `proceso_auditoria` VALUES (52, 1, 'Terminó sesión', '[]', NULL, '2024-05-08 09:19:23', 1);
INSERT INTO `proceso_auditoria` VALUES (53, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"42cd5d67ac5ccf09880962942c7ad7ffa764a2fb49883b36270750f66845411c6a0ba1a69b498645878f8d6cbe20bc604a2014cb0dea90dc8d9eba24239c41c107nUJKgKS1waSPgltro4L3iv\\/T\\/Crjzl52\\/EdkemvbjHkGizD1PG+fIgYWYDYa4t\",\"id\":\"1\"}', NULL, '2024-05-08 09:19:45', 1);
INSERT INTO `proceso_auditoria` VALUES (54, 1, 'Inició sesión', '[]', NULL, '2024-05-08 10:06:19', 1);
INSERT INTO `proceso_auditoria` VALUES (55, 1, 'Inició sesión', '[]', NULL, '2024-05-08 10:12:49', 1);
INSERT INTO `proceso_auditoria` VALUES (56, 1, 'Creó un registro de \'cliente\' con ID: 1', '{\"estado\":\"1\",\"tipo_documento\":\"1\",\"documento\":\"12313123\",\"nombre_o_razon_social\":\"test\",\"direccion_completa\":\"tes\",\"contacto\":\"test\",\"telefono\":\"324234\",\"correo\":\"test@ttest\",\"fecha\":\"2024-05-08 10:22:29\",\"id\":1}', NULL, '2024-05-08 10:22:29', 1);
INSERT INTO `proceso_auditoria` VALUES (57, 1, 'Creó un registro de \'credito\' con ID: 1', '{\"tipo_credito\":\"3\",\"referencia\":null,\"cliente\":\"1\",\"total\":\"0\",\"credito\":\"0\",\"fecha_registro\":\"2024-05-08 10:22:29\",\"fecha\":\"2024-05-08 10:22:29\",\"id\":1}', NULL, '2024-05-08 10:22:29', 1);
INSERT INTO `proceso_auditoria` VALUES (58, 1, 'Creó un registro de \'cliente\' con ID: 2', '{\"estado\":\"1\",\"tipo_documento\":\"1\",\"documento\":\"12312315\",\"nombre_o_razon_social\":\"marco llasaca\",\"direccion_completa\":\"43252345\",\"contacto\":\"54353\",\"telefono\":\"345345\",\"correo\":\"test@test\",\"fecha\":\"2024-05-08 10:32:15\",\"id\":2}', NULL, '2024-05-08 10:32:15', 1);
INSERT INTO `proceso_auditoria` VALUES (59, 1, 'Creó un registro de \'credito\' con ID: 2', '{\"tipo_credito\":\"3\",\"referencia\":null,\"cliente\":\"2\",\"total\":\"0\",\"credito\":\"0\",\"fecha_registro\":\"2024-05-08 10:32:15\",\"fecha\":\"2024-05-08 10:32:15\",\"id\":2}', NULL, '2024-05-08 10:32:15', 1);
INSERT INTO `proceso_auditoria` VALUES (60, 1, 'Actualizó un registro de \'cliente\' con ID: 1', '{\"estado\":\"1\",\"tipo_documento\":\"1\",\"documento\":\"12313123\",\"nombre_o_razon_social\":\"diego alegre\",\"direccion_completa\":\"tes\",\"contacto\":\"test\",\"telefono\":\"324234\",\"correo\":\"test@ttest\",\"id\":\"1\"}', NULL, '2024-05-08 10:32:22', 1);
INSERT INTO `proceso_auditoria` VALUES (61, 1, 'Terminó sesión', '[]', NULL, '2024-05-08 10:43:55', 1);
INSERT INTO `proceso_auditoria` VALUES (62, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"b6e4775d1200e8fbd7b88ef54ed62bc8ea6e1dc9f9c5eb2019bcff6a0e68e94127a66a429f860f38297e081934648c65165fb689b8094dbbdf03160adc147ee0mtKuQRa3Y4qTFASie\\/ovlxpJ+wWoOA8qPgwnYM9JuWpXubU0wjKYsST3alA4EUuM\",\"id\":\"1\"}', NULL, '2024-05-08 10:43:58', 1);
INSERT INTO `proceso_auditoria` VALUES (63, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"813191290ea5633bfa52f1baf37aa7fcce7659a746d76db930f316362fd813bf700295d7f00a9d39e4eff314019893e7af66772761cf938cc16646aa8e7b0ad1wIl+rjVkAfkgOzzmiGG04r6P\\/ze4X2NaK4GYqnNFA1ZwhHFaq+2G\\/cNTCUR+OQH1\",\"id\":\"1\"}', NULL, '2024-05-08 10:47:11', 1);
INSERT INTO `proceso_auditoria` VALUES (64, 1, 'Inició sesión', '[]', NULL, '2024-05-08 10:53:31', 1);
INSERT INTO `proceso_auditoria` VALUES (65, 1, 'Creó un registro de \'producto\' con ID: 3', '{\"codigo\":\"0003\",\"descripcion\":\"Membresia ORO\",\"precio\":\"200\",\"estado\":\"1\",\"tipo\":\"1\",\"fecha\":\"2024-05-08 10:57:54\",\"id\":3}', NULL, '2024-05-08 10:57:54', 1);
INSERT INTO `proceso_auditoria` VALUES (66, 1, 'Creó un registro de \'proveedor\' con ID: 1', '{\"estado\":\"1\",\"ruc\":\"12312312312\",\"nombre_o_razon_social\":\"test\",\"direccion_completa\":\"\",\"contacto\":\"\",\"telefono\":\"\",\"correo\":\"\",\"fecha\":\"2024-05-08 10:58:30\",\"id\":1}', NULL, '2024-05-08 10:58:30', 1);
INSERT INTO `proceso_auditoria` VALUES (67, 1, 'Creó un registro de \'ingreso\' con ID: 1', '{\"proveedor\":\"1\",\"tipo_comprobante\":\"1\",\"comprobante\":\"1111\",\"fecha_registro\":\"2024-05-08 10:58:35\",\"datos_adicionales\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-05-08 10:58:48\",\"id\":1}', NULL, '2024-05-08 10:58:48', 1);
INSERT INTO `proceso_auditoria` VALUES (68, 1, 'Creó un registro de \'kardex\' con ID: 1', '{\"tipo_kardex\":1,\"referencia\":\"1\",\"producto\":\"3\",\"cantidad\":\"10\",\"precio\":\"200.00\",\"subtotal\":\"166.67\",\"saldo\":10,\"fecha_registro\":\"2024-05-08 10:58:35\",\"fecha\":\"2024-05-08 10:58:48\",\"id\":1}', NULL, '2024-05-08 10:58:48', 1);
INSERT INTO `proceso_auditoria` VALUES (69, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 1', '{\"ingreso\":\"1\",\"producto\":\"3\",\"cantidad\":\"10\",\"precio\":\"200.00\",\"subtotal\":\"166.67\",\"fecha\":\"2024-05-08 10:58:35\",\"id\":1}', NULL, '2024-05-08 10:58:48', 1);
INSERT INTO `proceso_auditoria` VALUES (70, 1, 'Terminó sesión', '[]', NULL, '2024-05-08 12:41:09', 1);
INSERT INTO `proceso_auditoria` VALUES (71, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"4aa83ddd4e5caca0395ab3ff91c64f604a4c7f84e79bbdd71b42d00e5360b80056789c5c79291a15614eb615e619c111f057db07c482f28b5a27ace4b5bdda95qYT6ro196II8aUWEQYiZO+DV5QVm35JThap4tI1bHg+0MWjWS8J8EqUB2dQYh0ha\",\"id\":\"1\"}', NULL, '2024-05-08 12:41:13', 1);
INSERT INTO `proceso_auditoria` VALUES (72, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"b7c3e6f7733df85a89a15c55b7703d11af79c62a90c61dc92de5b914a195e80d5262a5774d0970dac72d746941a863a29cfdfeea1dea008ae89862aef314629c55LbA+D1ZebYeuJxn9LW3quozSmdS9xgRbtxfK50mpG6EiQdgp9\\/uz2xPCZUypn3\",\"id\":\"1\"}', NULL, '2024-05-08 12:56:21', 1);
INSERT INTO `proceso_auditoria` VALUES (73, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"0200a6bb6e91a953cf2ba3880690776d0a9bed41e20cc2474c48f8094b737e66c2c90f9a39553b858bbd190501a97099f6fd8792ff6a8680fb349b0660298d01Swupn\\/21AlUvzn8D2Ht4MB9Tq8Ion\\/8CdAs+9V9mRy1DS09fDb8tFL0z1PUsUR3o\",\"id\":\"1\"}', NULL, '2024-05-08 12:58:28', 1);
INSERT INTO `proceso_auditoria` VALUES (74, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"7cbf5f1e639806a58b51b0caf863e85370cf4545c99f96b0d0cafe36146480734440aea9225d0c6f99bafe806b9513ec5d070dc5fd4959a1aa6ee34a1b50f798i4KN+Fpdm27cUmNNQvcYJgMgjhM5iXCVQuVUrEOrcoXJjLhsbZw963cKhk9Vpsxz\",\"id\":\"1\"}', NULL, '2024-05-08 12:59:42', 1);
INSERT INTO `proceso_auditoria` VALUES (75, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"ef0268fbf8ea4ac45ee4284ad8782aee73a78d80c9612efbe87ec2b1e778b90db264abc25cb310f681741a38290fb2727c9a63259999d95bd5e7a32de2fe3dec48JxTUu5HxboA36t4nud7N3nJ8uZcVPJTLUTWdsjSOBvVouW7vVDEIfkuCmlTZgP\",\"id\":\"1\"}', NULL, '2024-05-08 13:02:00', 1);
INSERT INTO `proceso_auditoria` VALUES (76, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"5a9845866c7b0b563a48a4cce33137b517c6060a414a70ff97d38e7efbf194a6673af63de5cdaeb897f2c2961aefd54653d4e5f719717481105ef7b8abfe79cbVKWHxzAM4fKVSCDCWyZHc77+p\\/YJBszieshH0A1LnOVp0OUHFQrGIdj5wNbhhyJI\",\"id\":\"1\"}', NULL, '2024-05-08 13:33:24', 1);
INSERT INTO `proceso_auditoria` VALUES (77, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"7f47772db6c08ee7e7fe9c26fd0d135b1faf178d0f3954dd7e98e30ef5b797f2fdbf9f7d88efd2e35280b2b9fefd2a072624d6142b687322ce8ec64ac7d0480bORp\\/j1FQZckvvHZYnt7\\/V1B8Z6NQdwgHegaqyViic2+vKeBlL0j7vvo2T4elfMmy\",\"id\":\"1\"}', NULL, '2024-05-08 13:33:38', 1);
INSERT INTO `proceso_auditoria` VALUES (78, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"5384240fa40fd97f21ca6e2d84cd3603f96fc09e156fb1c570038df1830904ae29585e1d9e4ed2cb1b96c62b70bc680b7149ebbda1d7e40b665b71e595c108a3geZrc8nxRMytYAEjacTR5NJm7cCNSa1yYRa9wnodBxVFTNNtSRs2vCEKSqEI+cNR\",\"id\":\"1\"}', NULL, '2024-05-08 14:13:34', 1);
INSERT INTO `proceso_auditoria` VALUES (79, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"745be2114cfd94796c689678b9b0d17b51199dbb90c7a32a18ef9aa55953199928c83078c1584e1f0c4098e087b1050d219882267b8ff4fafbab816a6d34dcfeQRGq49Rjo5YBRZFtlqC+\\/x+IrqutXlRKTsFdJXez3gVruOusInUYjE9fa9QiS4S0\",\"id\":\"1\"}', NULL, '2024-05-08 14:16:12', 1);
INSERT INTO `proceso_auditoria` VALUES (80, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"b00f9ed06800d46c8a0e586d995a229e086c25149a0153d493d8e15368e791bed2ed97a5857ad95f135b269b74386be1b668d0de2690de1b0e2868f793bc2b43\\/HLKdoqgM+WiQflO849FCB3mt+UVopxX2yAuNfFTVb70ZzpoCJ868D5tXUJvnZG5\",\"id\":\"1\"}', NULL, '2024-05-08 14:19:48', 1);
INSERT INTO `proceso_auditoria` VALUES (81, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"f970acdf55c6d58518fadb59663ddd96077cdf4c54b4a710a2b977fa9e192fafd53bba5334d264864c52d5e4f6a7e06385bbeafc59e240dc13c4ea43c0e1d86ekXxtqhepemBBrBgq5MoAFuASrilMd5BT6vLiQjEO\\/Ek6z2oCDE7HtY0wkdODF+AJ\",\"id\":\"1\"}', NULL, '2024-05-08 14:21:39', 1);
INSERT INTO `proceso_auditoria` VALUES (82, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"daffe11c17f899b5e58e9663bd9fb28db7782075990b8ee8049a62a1f210ccfe1f1d89c96879c8ae8f7ddb2a576aca28790ae55cdb47b5e014bce450b96fe37aknwINHRXwCnsFbj83phFCqDE2BqIVdcjZgbchpLPeWugcIzbGRdNZoYYsmudrf+9\",\"id\":\"1\"}', NULL, '2024-05-08 14:23:41', 1);
INSERT INTO `proceso_auditoria` VALUES (83, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"4de8f7b43d814007c571d7531e1966f342e6e0bd061ce4760864c6cdae2ba15f1bf0fa622eeeff91c55f08ed2c99cb4336d4345115e67fc4c9ef64338578da5deoSYns8hU1Zawtd+uERUFlOyzlizoeL\\/hRfYNFOF\\/++kZL\\/3Azxye59UDqpa5SrY\",\"id\":\"1\"}', NULL, '2024-05-08 14:46:06', 1);
INSERT INTO `proceso_auditoria` VALUES (84, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"923b37bb7c3c09ba670673674abda036ca9c57b4a5e191c16e8c7b6fd23db0bad449f674933d6fd15a4084ffb0194125453285f1e096fd804e20f947b815ad16QxeBfRu28LK\\/lrw7yxSU\\/\\/HH7KTeuwJHgpCQ7kgy+XnGfUzI6IaSqj+H8iWKQH8S\",\"id\":\"1\"}', NULL, '2024-05-08 15:23:26', 1);
INSERT INTO `proceso_auditoria` VALUES (85, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"3025e67633db6eabe9e958ccc9a5059121789e6aff01981cfa8643d4d5066c0e48aff3916b69666babe5a3c4549b1572793476728e94e54ab8a4b69636cbc997LlWRoDKqL3ZVrlbME8xIEENOZTPcJHJ5gX\\/KQpQrzzNB6cD9bs44ToRN1zQZR0OP\",\"id\":\"1\"}', NULL, '2024-05-08 15:39:25', 1);
INSERT INTO `proceso_auditoria` VALUES (86, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"ccc6271277b6eb615e625d9c1b6719fe2e04119ba732e8388e2239100eb7f89ab882c8b7d651aabbcbca585cfe97e3a9054e0c5887a4f7f3e91f73bb79f59336umOsUdBnbtQjA9kXBF5zQ4USF+IO6J\\/5u4fvJYqrEeZ+97h5QxkOV08lLev+lXJY\",\"id\":\"1\"}', NULL, '2024-05-09 06:30:19', 1);
INSERT INTO `proceso_auditoria` VALUES (87, 1, 'Inició sesión', '[]', NULL, '2024-05-09 06:44:29', 1);
INSERT INTO `proceso_auditoria` VALUES (88, 1, 'Terminó sesión', '[]', NULL, '2024-05-09 06:59:51', 1);
INSERT INTO `proceso_auditoria` VALUES (89, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"affe7db6e6d9224f2fb08899efe2bbb60cd98eff298474ca70fec1673c7d19800df103c83e923eaf8f71670dafd59306c11ab0c8ea4618c1f044ba60583790e3wCzNQaeFa0EjdaD0IP64TI3e8Qb1XkdPvRDxO4q7JX7Rdv0QZS1Fb\\/gaLi2BF+lH\",\"id\":\"1\"}', NULL, '2024-05-09 07:54:10', 1);
INSERT INTO `proceso_auditoria` VALUES (90, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"568069a9d0ed3b3f2aab22e6b0224c0e7f53462e35e4e1fead345322444cea74821d6fa6974eb863ce8cd81afc1a7087b766400b2c543d1005a41fb2d1d857c1jdVRhhIe+Y45cvmSf\\/AEZxA7JxnecxKnbIOKkRbl9yXdNYekiYucIRN4MIMvTPxr\",\"id\":\"1\"}', NULL, '2024-05-09 08:10:13', 1);
INSERT INTO `proceso_auditoria` VALUES (91, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"password\":\"$2y$10$aXNkQ5.lrsUQBuCmiGgOreFoNzJYQB7Ir1EfDy\\/kJ5y3XpUUGqkky\",\"id\":\"1\"}', NULL, '2024-05-09 10:35:16', 1);
INSERT INTO `proceso_auditoria` VALUES (92, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-05-09 10:51:49', 1);
INSERT INTO `proceso_auditoria` VALUES (93, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"a19ce25bc877dde767be6d07629703166888b34dfc3ba1b0fc05055ee93d5b55929b3e0e746e93518973a7e425ffd1ee7ad5a05b1df05d1ca4c6890b595385cfv2EsDfEtwImgyIejdGJLEwGVC4aS3KDVIWEjBAR41Sx8VNh1\\/tt4HtPWUic4LXFD\",\"id\":\"1\"}', NULL, '2024-05-09 10:51:55', 1);
INSERT INTO `proceso_auditoria` VALUES (94, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"password\":\"$2y$10$m61aY7maYa3gfidmLrpGtO2XQ1dX9\\/dA0Hf82rTeyg7A4iy23XzP.\",\"id\":\"1\"}', NULL, '2024-05-09 10:52:54', 1);
INSERT INTO `proceso_auditoria` VALUES (95, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"password\":\"$2y$10$DYe6JiKgSKKlG7X2PEUBjOxqPSfS4Aq9Xo774x6L.a71Qv2ni09GG\",\"id\":\"1\"}', NULL, '2024-05-09 10:56:45', 1);
INSERT INTO `proceso_auditoria` VALUES (96, 1, 'Inició sesión', '[]', NULL, '2024-05-09 10:57:14', 1);
INSERT INTO `proceso_auditoria` VALUES (97, 1, 'Terminó sesión', '[]', NULL, '2024-05-09 11:31:58', 1);
INSERT INTO `proceso_auditoria` VALUES (98, 1, 'Inició sesión', '[]', NULL, '2024-05-09 11:32:03', 1);
INSERT INTO `proceso_auditoria` VALUES (99, 1, 'Terminó sesión', '[]', NULL, '2024-05-09 12:28:09', 1);
INSERT INTO `proceso_auditoria` VALUES (100, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"00505ac6215316cb70663a7f1babcc0975dc1ad1de8f11525cf531e83432550aa6333fbac4ec372bc9a8a57eb33e989ca1bcd7a3701ec2f1b5fca3d54f91d86aDtotxaXZcHdzgNYTR1MsCDyhPJRT+QDXxseSkxQLMRQ6HOvPH24rdyJfa94gLjgc\",\"id\":\"1\"}', NULL, '2024-05-09 12:28:19', 1);
INSERT INTO `proceso_auditoria` VALUES (101, NULL, 'Solicitó la recuperación de contraseña', '[]', NULL, '2024-05-09 12:28:19', 1);
INSERT INTO `proceso_auditoria` VALUES (102, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":null,\"password\":\"$2y$10$qVDjpPhzpY83PzOb\\/johE.h\\/w\\/Nb26hyepXd6qZSji9vGX3FlHwEm\",\"id\":\"1\"}', NULL, '2024-05-09 12:29:34', 1);
INSERT INTO `proceso_auditoria` VALUES (103, NULL, 'Creó una nueva contraseña', '[]', NULL, '2024-05-09 12:29:34', 1);
INSERT INTO `proceso_auditoria` VALUES (104, 1, 'Inició sesión', '[]', NULL, '2024-05-09 12:29:50', 1);
INSERT INTO `proceso_auditoria` VALUES (105, 1, 'Creó un registro de \'cliente\' con ID: 3', '{\"estado\":\"1\",\"departamento\":\"\",\"tipo_documento\":\"1\",\"documento\":\"45454545\",\"nombre_o_razon_social\":\"test Nombres\",\"provincia\":\"12\",\"distrito\":\"117\",\"direccion_completa\":\"test Direcci\\u00f3n\",\"telefono\":\"234234\",\"correo\":\"test@test\",\"fecha_nacimiento\":\"2002-01-31\",\"notas\":\"notas test\",\"contacto\":\"emergencia test\",\"contacto_telefono\":\"999999999\",\"fecha\":\"2024-05-09 20:03:26\",\"id\":3}', NULL, '2024-05-09 20:03:26', 1);
INSERT INTO `proceso_auditoria` VALUES (106, 1, 'Creó un registro de \'producto\' con ID: 4', '{\"codigo\":\"\",\"tipo\":\"2\",\"descripcion\":\"Membresia 2\",\"precio\":\"450\",\"duracion\":\"1\",\"duracion_unidad\":\"months\",\"fecha\":\"2024-05-11 08:25:20\",\"id\":4}', NULL, '2024-05-11 08:25:20', 1);
INSERT INTO `proceso_auditoria` VALUES (107, 1, 'Actualizó un registro de \'ingreso\' con ID: 1', '{\"estado\":3,\"id\":\"1\"}', NULL, '2024-05-11 08:28:22', 1);
INSERT INTO `proceso_auditoria` VALUES (108, 1, 'Creó un registro de \'ingreso_anulacion\' con ID: 1', '{\"ingreso\":\"1\",\"motivo\":\"Test\",\"usuario\":\"1\",\"fecha\":\"2024-05-11 08:28:22\",\"id\":1}', NULL, '2024-05-11 08:28:22', 1);
INSERT INTO `proceso_auditoria` VALUES (109, 1, 'Creó un registro de \'kardex\' con ID: 2', '{\"tipo_kardex\":3,\"referencia\":\"1\",\"producto\":\"3\",\"cantidad\":\"10\",\"precio\":\"200.00\",\"subtotal\":\"166.67\",\"saldo\":0,\"fecha_registro\":\"2024-05-11 08:28:22\",\"fecha\":\"2024-05-11 08:28:22\",\"id\":2}', NULL, '2024-05-11 08:28:22', 1);
INSERT INTO `proceso_auditoria` VALUES (110, 1, 'Creó un registro de \'producto\' con ID: 5', '{\"codigo\":\"\",\"tipo\":\"2\",\"descripcion\":\"Membresia 3\",\"precio\":\"600\",\"duracion\":\"5\",\"duracion_unidad\":\"1\",\"fecha\":\"2024-05-11 09:31:10\",\"id\":5}', NULL, '2024-05-11 09:31:10', 1);
INSERT INTO `proceso_auditoria` VALUES (111, 1, 'Creó un registro de \'ingreso\' con ID: 2', '{\"proveedor\":\"1\",\"tipo_comprobante\":null,\"comprobante\":\"\",\"fecha_registro\":\"2024-05-11 19:34:57\",\"datos_adicionales\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-05-11 19:35:35\",\"id\":2}', NULL, '2024-05-11 19:35:35', 1);
INSERT INTO `proceso_auditoria` VALUES (112, 1, 'Creó un registro de \'kardex\' con ID: 3', '{\"tipo_kardex\":1,\"referencia\":\"2\",\"producto\":\"1\",\"cantidad\":\"12\",\"precio\":\"2.00\",\"subtotal\":\"2.00\",\"saldo\":12,\"fecha_registro\":\"2024-05-11 19:34:57\",\"fecha\":\"2024-05-11 19:35:35\",\"id\":3}', NULL, '2024-05-11 19:35:35', 1);
INSERT INTO `proceso_auditoria` VALUES (113, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 2', '{\"ingreso\":\"2\",\"producto\":\"1\",\"cantidad\":\"12\",\"precio\":\"2.00\",\"subtotal\":\"2.00\",\"fecha\":\"2024-05-11 19:34:57\",\"id\":2}', NULL, '2024-05-11 19:35:35', 1);
INSERT INTO `proceso_auditoria` VALUES (114, 1, 'Creó un registro de \'ingreso\' con ID: 3', '{\"proveedor\":\"1\",\"tipo_comprobante\":null,\"comprobante\":\"\",\"fecha_registro\":\"2024-05-11 22:53:48\",\"datos_adicionales\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-05-11 22:54:12\",\"id\":3}', NULL, '2024-05-11 22:54:12', 1);
INSERT INTO `proceso_auditoria` VALUES (115, 1, 'Creó un registro de \'kardex\' con ID: 4', '{\"tipo_kardex\":1,\"referencia\":\"3\",\"producto\":\"1\",\"cantidad\":\"24\",\"precio\":\"2.00\",\"subtotal\":\"4.00\",\"saldo\":36,\"fecha_registro\":\"2024-05-11 22:53:48\",\"fecha\":\"2024-05-11 22:54:12\",\"id\":4}', NULL, '2024-05-11 22:54:12', 1);
INSERT INTO `proceso_auditoria` VALUES (116, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 3', '{\"ingreso\":\"3\",\"producto\":\"1\",\"cantidad\":\"24\",\"precio\":\"2.00\",\"subtotal\":\"4.00\",\"fecha\":\"2024-05-11 22:53:48\",\"id\":3}', NULL, '2024-05-11 22:54:12', 1);
INSERT INTO `proceso_auditoria` VALUES (117, 1, 'Creó un registro de \'ingreso\' con ID: 4', '{\"proveedor\":\"1\",\"tipo_comprobante\":null,\"comprobante\":\"\",\"fecha_registro\":\"2024-05-11 22:55:48\",\"datos_adicionales\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-05-11 23:00:38\",\"id\":4}', NULL, '2024-05-11 23:00:38', 1);
INSERT INTO `proceso_auditoria` VALUES (118, 1, 'Creó un registro de \'ingreso\' con ID: 5', '{\"proveedor\":\"1\",\"tipo_comprobante\":null,\"comprobante\":\"\",\"fecha_registro\":\"2024-05-11 23:02:16\",\"datos_adicionales\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-05-11 23:02:22\",\"id\":5}', NULL, '2024-05-11 23:02:22', 1);
INSERT INTO `proceso_auditoria` VALUES (119, 1, 'Creó un registro de \'kardex\' con ID: 5', '{\"tipo_kardex\":1,\"referencia\":\"5\",\"producto\":\"2\",\"cantidad\":\"48\",\"precio\":\"3.00\",\"subtotal\":\"12.00\",\"saldo\":-48,\"fecha_registro\":\"2024-05-11 23:02:22\",\"fecha\":\"2024-05-11 23:02:22\",\"unidad\":\"2\",\"id\":5}', NULL, '2024-05-11 23:02:22', 1);
INSERT INTO `proceso_auditoria` VALUES (120, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 4', '{\"ingreso\":\"5\",\"producto\":\"2\",\"cantidad\":\"48\",\"precio\":\"3.00\",\"subtotal\":\"12.00\",\"fecha\":\"2024-05-11 23:02:16\",\"id\":4}', NULL, '2024-05-11 23:02:22', 1);
INSERT INTO `proceso_auditoria` VALUES (121, 1, 'Creó un registro de \'ingreso\' con ID: 6', '{\"proveedor\":\"1\",\"tipo_comprobante\":\"2\",\"comprobante\":\"345\",\"datos_adicionales\":\"Datos adicionales\",\"usuario\":\"1\",\"fecha\":\"2024-05-15 11:13:00\",\"id\":6}', NULL, '2024-05-15 11:13:00', 1);
INSERT INTO `proceso_auditoria` VALUES (122, 1, 'Creó un registro de \'kardex\' con ID: 6', '{\"tipo_kardex\":1,\"referencia\":\"6\",\"producto\":\"2\",\"cantidad\":\"5\",\"precio\":\"3.00\",\"subtotal\":\"1.25\",\"fecha_registro\":\"2024-05-15 11:13:00\",\"fecha\":\"2024-05-15 11:13:00\",\"saldo\":5,\"unidad\":\"2\",\"id\":6}', NULL, '2024-05-15 11:13:00', 1);
INSERT INTO `proceso_auditoria` VALUES (123, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 5', '{\"ingreso\":\"6\",\"producto\":\"2\",\"cantidad\":\"5\",\"precio\":\"3.00\",\"subtotal\":\"1.25\",\"fecha\":\"2024-05-15 11:13:00\",\"id\":5}', NULL, '2024-05-15 11:13:00', 1);
INSERT INTO `proceso_auditoria` VALUES (124, 1, 'Creó un registro de \'ingreso\' con ID: 7', '{\"proveedor\":\"1\",\"tipo_comprobante\":\"3\",\"comprobante\":\"500\",\"datos_adicionales\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-05-15 19:47:18\",\"id\":7}', NULL, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_auditoria` VALUES (125, 1, 'Creó un registro de \'kardex\' con ID: 7', '{\"tipo_kardex\":1,\"referencia\":\"7\",\"producto\":\"2\",\"cantidad\":\"50\",\"precio\":\"3.00\",\"subtotal\":\"150.00\",\"fecha\":\"2024-05-15 19:47:18\",\"saldo\":55,\"unidad\":\"2\",\"id\":7}', NULL, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_auditoria` VALUES (126, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 6', '{\"ingreso\":\"7\",\"producto\":\"2\",\"cantidad\":\"50\",\"unidad\":\"2\",\"precio\":\"3.00\",\"subtotal\":\"150.00\",\"fecha\":\"2024-05-15 19:47:18\",\"id\":6}', NULL, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_auditoria` VALUES (127, 1, 'Creó un registro de \'kardex\' con ID: 8', '{\"tipo_kardex\":1,\"referencia\":\"7\",\"producto\":\"1\",\"cantidad\":\"100\",\"precio\":\"2.00\",\"subtotal\":\"200.00\",\"fecha\":\"2024-05-15 19:47:18\",\"saldo\":136,\"unidad\":\"1\",\"id\":8}', NULL, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_auditoria` VALUES (128, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 7', '{\"ingreso\":\"7\",\"producto\":\"1\",\"cantidad\":\"100\",\"unidad\":\"1\",\"precio\":\"2.00\",\"subtotal\":\"200.00\",\"fecha\":\"2024-05-15 19:47:18\",\"id\":7}', NULL, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_auditoria` VALUES (129, 1, 'Creó un registro de \'kardex\' con ID: 9', '{\"tipo_kardex\":1,\"referencia\":\"7\",\"producto\":\"3\",\"cantidad\":\"36\",\"precio\":\"200.00\",\"subtotal\":\"7200.00\",\"fecha\":\"2024-05-15 19:47:18\",\"saldo\":36,\"unidad\":\"3\",\"id\":9}', NULL, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_auditoria` VALUES (130, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 8', '{\"ingreso\":\"7\",\"producto\":\"3\",\"cantidad\":\"36\",\"unidad\":\"3\",\"precio\":\"200.00\",\"subtotal\":\"7200.00\",\"fecha\":\"2024-05-15 19:47:18\",\"id\":8}', NULL, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_auditoria` VALUES (131, 1, 'Creó un registro de \'pago\' con ID: 1', '{\"cliente\":\"1\",\"pago\":\"100\",\"tipo_pago\":\"1\",\"observaciones\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-05-21 14:35:55\",\"id\":1}', NULL, '2024-05-21 14:35:55', 1);
INSERT INTO `proceso_auditoria` VALUES (132, 1, 'Creó un registro de \'credito\' con ID: 3', '{\"tipo_credito\":\"2\",\"referencia\":\"1\",\"cliente\":\"1\",\"total\":\"100\",\"credito\":-100,\"fecha\":\"2024-05-21 14:35:55\",\"id\":3}', NULL, '2024-05-21 14:35:55', 1);
INSERT INTO `proceso_auditoria` VALUES (133, 1, 'Creó un registro de \'ingreso\' con ID: 8', '{\"proveedor\":\"1\",\"tipo_comprobante\":null,\"comprobante\":\"\",\"datos_adicionales\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-05-23 18:23:13\",\"id\":8}', NULL, '2024-05-23 18:23:13', 1);
INSERT INTO `proceso_auditoria` VALUES (134, 1, 'Creó un registro de \'kardex\' con ID: 10', '{\"tipo_kardex\":1,\"referencia\":\"8\",\"producto\":\"2\",\"cantidad\":\"12\",\"precio\":\"13.00\",\"subtotal\":\"156.00\",\"fecha\":\"2024-05-23 18:23:13\",\"saldo\":67,\"unidad\":\"2\",\"id\":10}', NULL, '2024-05-23 18:23:13', 1);
INSERT INTO `proceso_auditoria` VALUES (135, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 9', '{\"ingreso\":\"8\",\"producto\":\"2\",\"cantidad\":\"12\",\"unidad\":\"2\",\"precio\":\"13.00\",\"subtotal\":\"156.00\",\"fecha\":\"2024-05-23 18:23:13\",\"id\":9}', NULL, '2024-05-23 18:23:13', 1);
INSERT INTO `proceso_auditoria` VALUES (136, 1, 'Creó un registro de \'producto\' con ID: 6', '{\"descripcion\":\"test 4\",\"tipo\":\"1\",\"unidad\":\"1\",\"precio\":\"34\",\"fecha\":\"2024-05-24 11:04:10\",\"id\":6}', NULL, '2024-05-24 11:04:10', 1);
INSERT INTO `proceso_auditoria` VALUES (137, 1, 'Creó un registro de \'ingreso\' con ID: 9', '{\"proveedor\":\"1\",\"tipo_comprobante\":null,\"comprobante\":\"\",\"datos_adicionales\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-05-24 14:08:40\",\"id\":9}', NULL, '2024-05-24 14:08:40', 1);
INSERT INTO `proceso_auditoria` VALUES (138, 1, 'Creó un registro de \'kardex\' con ID: 11', '{\"tipo_kardex\":1,\"referencia\":\"9\",\"producto\":\"6\",\"cantidad\":\"1\",\"precio\":\"34.00\",\"subtotal\":\"34.00\",\"fecha\":\"2024-05-24 14:08:40\",\"saldo\":1,\"id\":11}', NULL, '2024-05-24 14:08:40', 1);
INSERT INTO `proceso_auditoria` VALUES (139, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 10', '{\"ingreso\":\"9\",\"producto\":\"6\",\"cantidad\":\"1\",\"precio\":\"34.00\",\"subtotal\":\"34.00\",\"fecha\":\"2024-05-24 14:08:40\",\"id\":10}', NULL, '2024-05-24 14:08:40', 1);
INSERT INTO `proceso_auditoria` VALUES (140, 1, 'Creó un registro de \'venta\' con ID: 1', '{\"estado\":\"1\",\"cliente\":\"2\",\"tipo_comprobante\":\"2\",\"comprobante\":\"566\",\"tipo_venta_pago\":\"1\",\"datos_adicionales\":\"\",\"subtotal\":\"521.19\",\"igv\":\"93.81\",\"total\":\"615.00\",\"usuario\":\"1\",\"fecha\":\"2024-05-24 16:32:39\",\"id\":1}', NULL, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_auditoria` VALUES (141, 1, 'Creó un registro de \'kardex\' con ID: 12', '{\"tipo_kardex\":2,\"referencia\":\"1\",\"producto\":\"4\",\"cantidad\":\"1\",\"precio\":\"450.00\",\"subtotal\":\"450.00\",\"fecha\":\"2024-05-24 16:32:39\",\"saldo\":0,\"id\":12}', NULL, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_auditoria` VALUES (142, 1, 'Creó un registro de \'venta_detalle\' con ID: 1', '{\"venta\":\"1\",\"producto\":\"4\",\"cantidad\":\"1\",\"precio\":\"450.00\",\"subtotal\":\"450.00\",\"fecha\":\"2024-05-24 16:32:39\",\"id\":1}', NULL, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_auditoria` VALUES (143, 1, 'Creó un registro de \'kardex\' con ID: 13', '{\"tipo_kardex\":2,\"referencia\":\"1\",\"producto\":\"2\",\"cantidad\":\"5\",\"precio\":\"33.00\",\"subtotal\":\"165.00\",\"fecha\":\"2024-05-24 16:32:39\",\"saldo\":62,\"id\":13}', NULL, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_auditoria` VALUES (144, 1, 'Creó un registro de \'venta_detalle\' con ID: 2', '{\"venta\":\"1\",\"producto\":\"2\",\"cantidad\":\"5\",\"precio\":\"33.00\",\"subtotal\":\"165.00\",\"fecha\":\"2024-05-24 16:32:39\",\"id\":2}', NULL, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_auditoria` VALUES (145, 1, 'Creó un registro de \'credito\' con ID: 4', '{\"tipo_credito\":\"1\",\"referencia\":\"1\",\"cliente\":\"2\",\"total\":\"615.00\",\"credito\":615,\"fecha\":\"2024-05-24 16:32:39\",\"id\":4}', NULL, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_auditoria` VALUES (146, 1, 'Creó un registro de \'venta\' con ID: 2', '{\"estado\":\"1\",\"cliente\":\"3\",\"tipo_comprobante\":\"2\",\"comprobante\":\"455\",\"tipo_venta_pago\":\"2\",\"datos_adicionales\":\"\",\"subtotal\":\"381.36\",\"igv\":\"68.64\",\"total\":\"450.00\",\"usuario\":\"1\",\"fecha\":\"2024-05-24 20:36:18\",\"id\":2}', NULL, '2024-05-24 20:36:18', 1);
INSERT INTO `proceso_auditoria` VALUES (147, 1, 'Creó un registro de \'kardex\' con ID: 14', '{\"tipo_kardex\":2,\"referencia\":\"2\",\"producto\":\"4\",\"cantidad\":\"1\",\"precio\":\"450.00\",\"subtotal\":\"450.00\",\"fecha\":\"2024-05-24 20:36:18\",\"saldo\":0,\"id\":14}', NULL, '2024-05-24 20:36:18', 1);
INSERT INTO `proceso_auditoria` VALUES (148, 1, 'Creó un registro de \'venta_detalle\' con ID: 3', '{\"venta\":\"2\",\"producto\":\"4\",\"cantidad\":\"1\",\"precio\":\"450.00\",\"subtotal\":\"450.00\",\"fecha\":\"2024-05-24 20:36:18\",\"id\":3}', NULL, '2024-05-24 20:36:18', 1);
INSERT INTO `proceso_auditoria` VALUES (149, 1, 'Creó un registro de \'venta\' con ID: 3', '{\"estado\":\"1\",\"cliente\":\"3\",\"tipo_comprobante\":\"2\",\"comprobante\":\"455\",\"tipo_venta_pago\":\"2\",\"datos_adicionales\":\"\",\"subtotal\":\"381.36\",\"igv\":\"68.64\",\"total\":\"450.00\",\"usuario\":\"1\",\"fecha\":\"2024-05-24 20:37:42\",\"id\":3}', NULL, '2024-05-24 20:37:42', 1);
INSERT INTO `proceso_auditoria` VALUES (150, 1, 'Creó un registro de \'kardex\' con ID: 15', '{\"tipo_kardex\":2,\"referencia\":\"3\",\"producto\":\"4\",\"cantidad\":\"1\",\"precio\":\"450.00\",\"subtotal\":\"450.00\",\"fecha\":\"2024-05-24 20:37:42\",\"saldo\":0,\"id\":15}', NULL, '2024-05-24 20:37:42', 1);
INSERT INTO `proceso_auditoria` VALUES (151, 1, 'Creó un registro de \'venta_detalle\' con ID: 4', '{\"venta\":\"3\",\"producto\":\"4\",\"cantidad\":\"1\",\"precio\":\"450.00\",\"subtotal\":\"450.00\",\"fecha\":\"2024-05-24 20:37:42\",\"id\":4}', NULL, '2024-05-24 20:37:42', 1);
INSERT INTO `proceso_auditoria` VALUES (152, 1, 'Creó un registro de \'cliente_servicio\' con ID: 0', '{\"venta\":\"3\",\"producto\":\"4\",\"fecha_fin\":1716579462,\"usuario\":\"1\",\"fecha\":\"2024-05-24 20:37:42\",\"id\":0}', NULL, '2024-05-24 20:37:42', 1);
INSERT INTO `proceso_auditoria` VALUES (153, 1, 'Creó un registro de \'pago\' con ID: 2', '{\"tipo_pago\":\"1\",\"cliente\":\"3\",\"pago\":\"450.00\",\"usuario\":\"1\",\"fecha\":\"2024-05-24 20:37:42\",\"id\":2}', NULL, '2024-05-24 20:37:42', 1);
INSERT INTO `proceso_auditoria` VALUES (154, 1, 'Terminó sesión', '[]', NULL, '2024-05-27 10:33:40', 1);
INSERT INTO `proceso_auditoria` VALUES (155, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-05-27 10:34:01', 1);
INSERT INTO `proceso_auditoria` VALUES (156, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-05-27 10:34:04', 1);
INSERT INTO `proceso_auditoria` VALUES (157, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-05-27 10:34:31', 1);
INSERT INTO `proceso_auditoria` VALUES (158, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-05-27 10:34:41', 1);
INSERT INTO `proceso_auditoria` VALUES (159, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-05-27 10:55:59', 1);
INSERT INTO `proceso_auditoria` VALUES (160, 1, 'Inició sesión', '[]', NULL, '2024-05-27 10:56:02', 1);
INSERT INTO `proceso_auditoria` VALUES (161, 1, 'Creó un registro de \'venta\' con ID: 4', '{\"estado\":\"1\",\"cliente\":\"3\",\"tipo_comprobante\":\"2\",\"comprobante\":\"76767\",\"tipo_venta_pago\":\"1\",\"datos_adicionales\":\"\",\"subtotal\":\"381.36\",\"igv\":\"68.64\",\"total\":\"450.00\",\"usuario\":\"1\",\"fecha\":\"2024-05-28 14:53:17\",\"id\":4}', NULL, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_auditoria` VALUES (162, 1, 'Creó un registro de \'kardex\' con ID: 16', '{\"tipo_kardex\":2,\"referencia\":\"4\",\"producto\":\"4\",\"cantidad\":\"1\",\"precio\":\"450.00\",\"subtotal\":\"450.00\",\"fecha\":\"2024-05-28 14:53:17\",\"saldo\":0,\"id\":16}', NULL, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_auditoria` VALUES (163, 1, 'Creó un registro de \'venta_detalle\' con ID: 5', '{\"venta\":\"4\",\"producto\":\"4\",\"cantidad\":\"1\",\"precio\":\"450.00\",\"subtotal\":\"450.00\",\"fecha\":\"2024-05-28 14:53:17\",\"id\":5}', NULL, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_auditoria` VALUES (164, 1, 'Creó un registro de \'cliente_servicio\' con ID: 3', '{\"venta\":\"4\",\"producto\":\"4\",\"fecha_fin\":\"2024-05-28\",\"usuario\":\"1\",\"fecha\":\"2024-05-28 14:53:17\",\"id\":3}', NULL, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_auditoria` VALUES (165, 1, 'Actualizó un registro de \'cliente\' con ID: 3', '{\"membresia\":\"3\",\"id\":\"3\"}', NULL, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_auditoria` VALUES (166, 1, 'Creó un registro de \'credito\' con ID: 5', '{\"tipo_credito\":\"1\",\"referencia\":\"3\",\"cliente\":\"3\",\"total\":\"450.00\",\"credito\":450,\"fecha\":\"2024-05-28 14:53:17\",\"id\":5}', NULL, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_auditoria` VALUES (167, 1, 'Creó un registro de \'venta\' con ID: 5', '{\"estado\":\"1\",\"cliente\":\"2\",\"tipo_comprobante\":\"1\",\"comprobante\":\"233\",\"tipo_venta_pago\":\"2\",\"datos_adicionales\":\"\",\"subtotal\":\"508.47\",\"igv\":\"91.53\",\"total\":\"600.00\",\"usuario\":\"1\",\"fecha\":\"2024-05-29 10:29:51\",\"id\":5}', NULL, '2024-05-29 10:29:51', 1);
INSERT INTO `proceso_auditoria` VALUES (168, 1, 'Creó un registro de \'kardex\' con ID: 17', '{\"tipo_kardex\":2,\"referencia\":\"5\",\"producto\":\"5\",\"cantidad\":\"1\",\"precio\":\"600.00\",\"subtotal\":\"600.00\",\"fecha\":\"2024-05-29 10:29:51\",\"saldo\":0,\"id\":17}', NULL, '2024-05-29 10:29:51', 1);
INSERT INTO `proceso_auditoria` VALUES (169, 1, 'Creó un registro de \'venta_detalle\' con ID: 6', '{\"venta\":\"5\",\"producto\":\"5\",\"cantidad\":\"1\",\"precio\":\"600.00\",\"subtotal\":\"600.00\",\"fecha\":\"2024-05-29 10:29:51\",\"id\":6}', NULL, '2024-05-29 10:29:51', 1);
INSERT INTO `proceso_auditoria` VALUES (170, 1, 'Creó un registro de \'cliente_servicio\' con ID: 4', '{\"venta\":\"5\",\"producto\":\"5\",\"fecha_fin\":\"2024-05-29\",\"usuario\":\"1\",\"fecha\":\"2024-05-29 10:29:51\",\"id\":4}', NULL, '2024-05-29 10:29:51', 1);
INSERT INTO `proceso_auditoria` VALUES (171, 1, 'Actualizó un registro de \'cliente\' con ID: 2', '{\"membresia\":\"4\",\"id\":\"2\"}', NULL, '2024-05-29 10:29:51', 1);
INSERT INTO `proceso_auditoria` VALUES (172, 1, 'Creó un registro de \'pago\' con ID: 3', '{\"tipo_pago\":\"1\",\"cliente\":\"2\",\"pago\":\"600.00\",\"usuario\":\"1\",\"fecha\":\"2024-05-29 10:29:51\",\"id\":3}', NULL, '2024-05-29 10:29:51', 1);
INSERT INTO `proceso_auditoria` VALUES (173, 1, 'Creó un registro de \'venta\' con ID: 6', '{\"estado\":\"1\",\"cliente\":\"2\",\"tipo_comprobante\":\"2\",\"comprobante\":\"656\",\"tipo_venta_pago\":\"2\",\"datos_adicionales\":\"\",\"subtotal\":\"508.47\",\"igv\":\"91.53\",\"total\":\"600.00\",\"usuario\":\"1\",\"fecha\":\"2024-05-29 10:40:38\",\"id\":6}', NULL, '2024-05-29 10:40:38', 1);
INSERT INTO `proceso_auditoria` VALUES (174, 1, 'Creó un registro de \'kardex\' con ID: 18', '{\"tipo_kardex\":2,\"referencia\":\"6\",\"producto\":\"5\",\"cantidad\":\"1\",\"precio\":\"600.00\",\"subtotal\":\"600.00\",\"fecha\":\"2024-05-29 10:40:38\",\"saldo\":0,\"id\":18}', NULL, '2024-05-29 10:40:38', 1);
INSERT INTO `proceso_auditoria` VALUES (175, 1, 'Creó un registro de \'venta_detalle\' con ID: 7', '{\"venta\":\"6\",\"producto\":\"5\",\"cantidad\":\"1\",\"precio\":\"600.00\",\"subtotal\":\"600.00\",\"fecha\":\"2024-05-29 10:40:38\",\"id\":7}', NULL, '2024-05-29 10:40:38', 1);
INSERT INTO `proceso_auditoria` VALUES (176, 1, 'Creó un registro de \'cliente_servicio\' con ID: 5', '{\"venta\":\"6\",\"producto\":\"5\",\"fecha_fin\":\"2024-10-29\",\"usuario\":\"1\",\"fecha\":\"2024-05-29 10:40:38\",\"id\":5}', NULL, '2024-05-29 10:40:38', 1);
INSERT INTO `proceso_auditoria` VALUES (177, 1, 'Actualizó un registro de \'cliente\' con ID: 2', '{\"membresia\":\"5\",\"id\":\"2\"}', NULL, '2024-05-29 10:40:38', 1);
INSERT INTO `proceso_auditoria` VALUES (178, 1, 'Creó un registro de \'pago\' con ID: 4', '{\"tipo_pago\":\"1\",\"cliente\":\"2\",\"pago\":\"600.00\",\"usuario\":\"1\",\"fecha\":\"2024-05-29 10:40:38\",\"id\":4}', NULL, '2024-05-29 10:40:38', 1);
INSERT INTO `proceso_auditoria` VALUES (179, 1, 'Creó un registro de \'cliente\' con ID: 4', '{\"estado\":\"1\",\"departamento\":\"\",\"tipo_documento\":\"1\",\"documento\":\"98785295\",\"nombre_o_razon_social\":\"test 4\",\"provincia\":\"10\",\"distrito\":\"96\",\"direccion_completa\":\"test\",\"telefono\":\"\",\"correo\":\"\",\"fecha_nacimiento\":\"2000-02-02\",\"notas\":\"\",\"contacto\":\"\",\"contacto_telefono\":\"\",\"fecha\":\"2024-05-29 11:28:36\",\"id\":4}', NULL, '2024-05-29 11:28:36', 1);
INSERT INTO `proceso_auditoria` VALUES (180, 1, 'Actualizó un registro de \'cliente\' con ID: 3', '{\"estado\":\"1\",\"departamento\":\"2\",\"tipo_documento\":\"1\",\"documento\":\"45454545\",\"nombre_o_razon_social\":\"Test Nombres\",\"provincia\":\"12\",\"distrito\":\"117\",\"direccion_completa\":\"test Direcci\\u00f3n\",\"telefono\":\"234234\",\"correo\":\"test@test\",\"fecha_nacimiento\":\"2002-01-31\",\"notas\":\"notas test\",\"contacto\":\"emergencia test\",\"contacto_telefono\":\"999999999\",\"id\":\"3\"}', NULL, '2024-05-29 19:51:31', 1);
INSERT INTO `proceso_auditoria` VALUES (181, 1, 'Actualizó un registro de \'cliente\' con ID: 2', '{\"estado\":\"1\",\"departamento\":\"\",\"tipo_documento\":\"1\",\"documento\":\"12312315\",\"nombre_o_razon_social\":\"Marco Llasaca\",\"provincia\":\"10\",\"distrito\":\"96\",\"direccion_completa\":\"43252345\",\"telefono\":\"345345\",\"correo\":\"test@test\",\"fecha_nacimiento\":\"2013-01-30\",\"notas\":\"\",\"contacto\":\"54353\",\"contacto_telefono\":\"\",\"id\":\"2\"}', NULL, '2024-05-29 19:51:50', 1);
INSERT INTO `proceso_auditoria` VALUES (182, 1, 'Actualizó un registro de \'cliente\' con ID: 1', '{\"estado\":\"1\",\"departamento\":\"\",\"tipo_documento\":\"1\",\"documento\":\"12313123\",\"nombre_o_razon_social\":\"Diego Alegre\",\"provincia\":\"11\",\"distrito\":\"101\",\"direccion_completa\":\"test\",\"telefono\":\"324234\",\"correo\":\"test@ttest\",\"fecha_nacimiento\":\"2013-02-01\",\"notas\":\"\",\"contacto\":\"test\",\"contacto_telefono\":\"\",\"id\":\"1\"}', NULL, '2024-05-29 19:52:03', 1);
INSERT INTO `proceso_auditoria` VALUES (183, 1, 'Terminó sesión', '[]', NULL, '2024-05-29 20:03:32', 1);
INSERT INTO `proceso_auditoria` VALUES (184, 1, 'Inició sesión', '[]', NULL, '2024-05-29 20:03:39', 1);
INSERT INTO `proceso_auditoria` VALUES (185, 1, 'Terminó sesión', '[]', NULL, '2024-05-31 11:22:04', 1);
INSERT INTO `proceso_auditoria` VALUES (186, 1, 'Inició sesión', '[]', NULL, '2024-05-31 18:07:36', 1);
INSERT INTO `proceso_auditoria` VALUES (187, 1, 'Creó un registro de \'cliente\' con ID: 5', '{\"estado\":\"1\",\"departamento\":\"\",\"tipo_documento\":\"1\",\"documento\":\"45764566\",\"nombre_o_razon_social\":\"Test 7\",\"direccion_completa\":\"\",\"telefono\":\"\",\"correo\":\"\",\"fecha_nacimiento\":\"\",\"notas\":\"\",\"contacto\":\"\",\"contacto_telefono\":\"\",\"fecha\":\"2024-05-31 22:06:06\",\"id\":5}', NULL, '2024-05-31 22:06:06', 1);
INSERT INTO `proceso_auditoria` VALUES (188, 1, 'Actualizó un registro de \'cliente\' con ID: 5', '{\"estado\":\"1\",\"departamento\":\"0\",\"tipo_documento\":\"1\",\"documento\":\"45764566\",\"nombre_o_razon_social\":\"Test 7\",\"direccion_completa\":\"\",\"telefono\":\"\",\"correo\":\"\",\"fecha_nacimiento\":\"0000-00-00\",\"notas\":\"\",\"contacto\":\"\",\"contacto_telefono\":\"\",\"id\":\"5\"}', NULL, '2024-05-31 22:06:12', 1);
INSERT INTO `proceso_auditoria` VALUES (189, 1, 'Creó un registro de \'cliente\' con ID: 6', '{\"estado\":\"1\",\"departamento\":\"\",\"tipo_documento\":\"1\",\"documento\":\"34553455\",\"nombre_o_razon_social\":\"test 8\",\"direccion_completa\":\"\",\"telefono\":\"\",\"correo\":\"\",\"fecha_nacimiento\":\"2009-05-01\",\"notas\":\"\",\"contacto\":\"\",\"contacto_telefono\":\"\",\"fecha\":\"2024-05-31 22:18:01\",\"id\":6}', NULL, '2024-05-31 22:18:01', 1);
INSERT INTO `proceso_auditoria` VALUES (190, 1, 'Inició sesión', '[]', NULL, '2024-05-31 22:46:55', 1);
INSERT INTO `proceso_auditoria` VALUES (191, 1, 'Inició sesión', '[]', NULL, '2024-06-05 23:54:12', 1);
INSERT INTO `proceso_auditoria` VALUES (192, 1, 'Terminó sesión', '[]', NULL, '2024-06-05 23:59:15', 1);
INSERT INTO `proceso_auditoria` VALUES (193, 1, 'Inició sesión', '[]', NULL, '2024-06-06 09:41:40', 1);
INSERT INTO `proceso_auditoria` VALUES (194, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 10:27:18', 1);
INSERT INTO `proceso_auditoria` VALUES (195, 1, 'Inició sesión', '[]', NULL, '2024-06-06 10:38:43', 1);
INSERT INTO `proceso_auditoria` VALUES (196, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 11:12:17', 1);
INSERT INTO `proceso_auditoria` VALUES (197, 1, 'Inició sesión', '[]', NULL, '2024-06-06 11:41:10', 1);
INSERT INTO `proceso_auditoria` VALUES (198, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 11:43:02', 1);
INSERT INTO `proceso_auditoria` VALUES (199, 1, 'Inició sesión', '[]', NULL, '2024-06-06 11:43:06', 1);
INSERT INTO `proceso_auditoria` VALUES (200, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 11:43:10', 1);
INSERT INTO `proceso_auditoria` VALUES (201, 1, 'Inició sesión', '[]', NULL, '2024-06-06 11:43:14', 1);
INSERT INTO `proceso_auditoria` VALUES (202, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 11:51:41', 1);
INSERT INTO `proceso_auditoria` VALUES (203, 1, 'Inició sesión', '[]', NULL, '2024-06-06 12:02:43', 1);
INSERT INTO `proceso_auditoria` VALUES (204, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 12:03:29', 1);
INSERT INTO `proceso_auditoria` VALUES (205, 1, 'Inició sesión', '[]', NULL, '2024-06-06 12:03:33', 1);
INSERT INTO `proceso_auditoria` VALUES (206, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 13:05:00', 1);
INSERT INTO `proceso_auditoria` VALUES (207, 1, 'Inició sesión', '[]', NULL, '2024-06-06 13:05:06', 1);
INSERT INTO `proceso_auditoria` VALUES (208, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 13:14:00', 1);
INSERT INTO `proceso_auditoria` VALUES (209, 1, 'Inició sesión', '[]', NULL, '2024-06-06 13:14:09', 1);
INSERT INTO `proceso_auditoria` VALUES (210, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 13:19:43', 1);
INSERT INTO `proceso_auditoria` VALUES (211, 1, 'Inició sesión', '[]', NULL, '2024-06-06 13:19:46', 1);
INSERT INTO `proceso_auditoria` VALUES (212, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 14:07:47', 1);
INSERT INTO `proceso_auditoria` VALUES (213, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"5db79f052994cd1f30a3adf0b94a05f91f6c0c647b00d1d012ec466948169fa0cde5b4ef24466619c498c5380053b641512d930e055f6bc9ea8f40c16452e5eaQ9aKLa0gXasXL+WUwXKrXHY3Ml5EnGfZJN2kDaJhkXHuBTeZLxfk626U5KGfHyKY\",\"id\":\"1\"}', NULL, '2024-06-06 14:23:01', 1);
INSERT INTO `proceso_auditoria` VALUES (214, NULL, 'Solicitó la recuperación de contraseña', '[]', NULL, '2024-06-06 14:23:01', 1);
INSERT INTO `proceso_auditoria` VALUES (215, 1, 'Inició sesión', '[]', NULL, '2024-06-06 14:49:10', 1);
INSERT INTO `proceso_auditoria` VALUES (216, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 14:49:14', 1);
INSERT INTO `proceso_auditoria` VALUES (217, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":null,\"password\":\"$2y$10$SSXdJa7U54TMwV4U7mP3duu77wTOt\\/cik.phIIZq7c77diRtHPC6.\",\"id\":\"1\"}', NULL, '2024-06-06 14:49:47', 1);
INSERT INTO `proceso_auditoria` VALUES (218, NULL, 'Creó una nueva contraseña', '[]', NULL, '2024-06-06 14:49:47', 1);
INSERT INTO `proceso_auditoria` VALUES (219, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"16a8dfef9bb8b705421debc2dc4f87499dc8fedafc84a7a35db6e0719d1791f9ff2b825a57e3979fff08b2d0f535812d9a477d818b319b75da5b96d1a5e70af8lsGJ52i6+BfBIPWib5OWFF6QlRC1kdxrQhwSjfo3Ucz2bh2awDSyRvYu1Tur8iwP\",\"id\":\"1\"}', NULL, '2024-06-06 16:39:27', 1);
INSERT INTO `proceso_auditoria` VALUES (220, NULL, 'Solicitó la recuperación de contraseña', '[]', NULL, '2024-06-06 16:39:27', 1);
INSERT INTO `proceso_auditoria` VALUES (221, 1, 'Inició sesión', '[]', NULL, '2024-06-06 16:40:48', 1);
INSERT INTO `proceso_auditoria` VALUES (222, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 16:53:30', 1);
INSERT INTO `proceso_auditoria` VALUES (223, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"4c5ee595547056680f18d45c6a644c6813669988c5a429cbc74bcf4dece0d9110ccdedc3c3f08ef6843e34d40484ae138f98ba6228634d5a0a467c0a8f3dafc4OfzZldxK4KnfmLTbQ3L0krHxpv+FfulM3KvTfj1QDdizOMP\\/eCXR1jgom85JB66U\",\"id\":\"1\"}', NULL, '2024-06-06 16:53:35', 1);
INSERT INTO `proceso_auditoria` VALUES (224, NULL, 'Solicitó la recuperación de contraseña', '[]', NULL, '2024-06-06 16:53:35', 1);
INSERT INTO `proceso_auditoria` VALUES (225, 1, 'Inició sesión', '[]', NULL, '2024-06-06 18:42:55', 1);
INSERT INTO `proceso_auditoria` VALUES (226, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 18:42:58', 1);
INSERT INTO `proceso_auditoria` VALUES (227, 1, 'Inició sesión', '[]', NULL, '2024-06-06 18:43:02', 1);
INSERT INTO `proceso_auditoria` VALUES (228, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 18:43:06', 1);
INSERT INTO `proceso_auditoria` VALUES (229, 1, 'Inició sesión', '[]', NULL, '2024-06-06 18:43:11', 1);
INSERT INTO `proceso_auditoria` VALUES (230, 1, 'Terminó sesión', '[]', NULL, '2024-06-06 18:43:15', 1);
INSERT INTO `proceso_auditoria` VALUES (231, 1, 'Inició sesión', '[]', NULL, '2024-06-10 22:21:24', 1);
INSERT INTO `proceso_auditoria` VALUES (232, 1, 'Terminó sesión', '[]', NULL, '2024-06-10 22:21:29', 1);
INSERT INTO `proceso_auditoria` VALUES (233, 1, 'Inició sesión', '[]', NULL, '2024-06-16 22:29:45', 1);
INSERT INTO `proceso_auditoria` VALUES (234, 1, 'Terminó sesión', '[]', NULL, '2024-06-16 22:29:49', 1);
INSERT INTO `proceso_auditoria` VALUES (235, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"1a9b82ba18b3f45e814f8f652263cc09eeb1c323f3b8f6495daab5fec764ee237adcbcd8cf20ccb9f94367f9de405e0357ac5d2aab9e033b007f25f750ae1b52s8ufXEctWrtW+86k5WRUhRjRE4FJY6pGfpj\\/StTo1MofejcZp3ZnN9uJfP1swLC+\",\"id\":\"1\"}', NULL, '2024-06-16 22:32:26', 1);
INSERT INTO `proceso_auditoria` VALUES (236, NULL, 'Solicitó la recuperación de contraseña', '[]', NULL, '2024-06-16 22:32:26', 1);
INSERT INTO `proceso_auditoria` VALUES (237, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:07:22', 1);
INSERT INTO `proceso_auditoria` VALUES (238, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:07:28', 1);
INSERT INTO `proceso_auditoria` VALUES (239, 1, 'Inició sesión', '[]', NULL, '2024-06-16 23:07:41', 1);
INSERT INTO `proceso_auditoria` VALUES (240, 1, 'Terminó sesión', '[]', NULL, '2024-06-16 23:07:57', 1);
INSERT INTO `proceso_auditoria` VALUES (241, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:08:22', 1);
INSERT INTO `proceso_auditoria` VALUES (242, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:08:27', 1);
INSERT INTO `proceso_auditoria` VALUES (243, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:08:31', 1);
INSERT INTO `proceso_auditoria` VALUES (244, 1, 'Inició sesión', '[]', NULL, '2024-06-16 23:43:29', 1);
INSERT INTO `proceso_auditoria` VALUES (245, 1, 'Terminó sesión', '[]', NULL, '2024-06-16 23:43:34', 1);
INSERT INTO `proceso_auditoria` VALUES (246, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:43:38', 1);
INSERT INTO `proceso_auditoria` VALUES (247, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:43:46', 1);
INSERT INTO `proceso_auditoria` VALUES (248, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:43:52', 1);
INSERT INTO `proceso_auditoria` VALUES (249, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:47:50', 1);
INSERT INTO `proceso_auditoria` VALUES (250, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:48:03', 1);
INSERT INTO `proceso_auditoria` VALUES (251, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:48:33', 1);
INSERT INTO `proceso_auditoria` VALUES (252, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:48:41', 1);
INSERT INTO `proceso_auditoria` VALUES (253, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:48:43', 1);
INSERT INTO `proceso_auditoria` VALUES (254, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:48:44', 1);
INSERT INTO `proceso_auditoria` VALUES (255, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-16 23:48:45', 1);
INSERT INTO `proceso_auditoria` VALUES (256, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:11:13', 1);
INSERT INTO `proceso_auditoria` VALUES (257, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:11:56', 1);
INSERT INTO `proceso_auditoria` VALUES (258, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:12:00', 1);
INSERT INTO `proceso_auditoria` VALUES (259, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:12:06', 1);
INSERT INTO `proceso_auditoria` VALUES (260, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:12:24', 1);
INSERT INTO `proceso_auditoria` VALUES (261, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:12:30', 1);
INSERT INTO `proceso_auditoria` VALUES (262, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:12:43', 1);
INSERT INTO `proceso_auditoria` VALUES (263, 1, 'Inició sesión', '[]', NULL, '2024-06-17 00:12:57', 1);
INSERT INTO `proceso_auditoria` VALUES (264, 1, 'Terminó sesión', '[]', NULL, '2024-06-17 00:13:01', 1);
INSERT INTO `proceso_auditoria` VALUES (265, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:13:10', 1);
INSERT INTO `proceso_auditoria` VALUES (266, 1, 'Inició sesión', '[]', NULL, '2024-06-17 00:13:13', 1);
INSERT INTO `proceso_auditoria` VALUES (267, 1, 'Terminó sesión', '[]', NULL, '2024-06-17 00:13:17', 1);
INSERT INTO `proceso_auditoria` VALUES (268, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:13:21', 1);
INSERT INTO `proceso_auditoria` VALUES (269, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:13:23', 1);
INSERT INTO `proceso_auditoria` VALUES (270, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 00:13:41', 1);
INSERT INTO `proceso_auditoria` VALUES (271, 1, 'Inició sesión', '[]', NULL, '2024-06-17 00:13:53', 1);
INSERT INTO `proceso_auditoria` VALUES (272, 1, 'Inició sesión', '[]', NULL, '2024-06-17 10:23:51', 1);
INSERT INTO `proceso_auditoria` VALUES (273, 1, 'Terminó sesión', '[]', NULL, '2024-06-17 10:29:19', 1);
INSERT INTO `proceso_auditoria` VALUES (274, 1, 'Inició sesión', '[]', NULL, '2024-06-17 10:31:05', 1);
INSERT INTO `proceso_auditoria` VALUES (275, 1, 'Terminó sesión', '[]', NULL, '2024-06-17 10:31:53', 1);
INSERT INTO `proceso_auditoria` VALUES (276, 1, 'Inició sesión', '[]', NULL, '2024-06-17 10:32:21', 1);
INSERT INTO `proceso_auditoria` VALUES (277, 1, 'Inició sesión', '[]', NULL, '2024-06-17 10:43:17', 1);
INSERT INTO `proceso_auditoria` VALUES (278, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-06-17 10:53:50', 1);
INSERT INTO `proceso_auditoria` VALUES (279, 1, 'Inició sesión', '[]', NULL, '2024-06-17 10:53:58', 1);
INSERT INTO `proceso_auditoria` VALUES (280, 1, 'Actualizó un registro de \'configuracion\' con ID: 1', '{\"ruc\":\"20478672883\",\"asociado\":\"0\",\"send_email\":\"1\",\"url\":\"https:\\/\\/e-beta.sunat.gob.pe\\/ol-ti-itcpfegem-beta\\/billService?wsdl\",\"url_servicio\":\"https:\\/\\/<localhost>\\/\",\"url_api\":\"https:\\/\\/<localhost>\\/\",\"igv\":\"18.00\",\"titulo\":\"SISTEMA\",\"copyright\":\"Todos los derechos reservados\",\"fecha\":\"2024-06-17 10:54:15\",\"id\":\"1\"}', NULL, '2024-06-17 10:54:15', 1);
INSERT INTO `proceso_auditoria` VALUES (281, 1, 'Actualizó un registro de \'configuracion\' con ID: 1', '{\"ruc\":\"20478672883\",\"asociado\":\"0\",\"send_email\":\"1\",\"url\":\"https:\\/\\/e-beta.sunat.gob.pe\\/ol-ti-itcpfegem-beta\\/billService?wsdl\",\"url_servicio\":\"https:\\/\\/<localhost>\\/\",\"url_api\":\"https:\\/\\/<localhost>\\/\",\"igv\":\"18.00\",\"titulo\":\"SISTEMA\",\"copyright\":\"Todos los derechos reservados\",\"fecha\":\"2024-06-17 11:07:09\",\"id\":\"1\"}', NULL, '2024-06-17 11:07:09', 1);
INSERT INTO `proceso_auditoria` VALUES (282, 1, 'Terminó sesión', '[]', NULL, '2024-06-17 14:41:56', 1);
INSERT INTO `proceso_auditoria` VALUES (283, 1, 'Inició sesión', '[]', NULL, '2024-06-17 16:27:55', 1);
INSERT INTO `proceso_auditoria` VALUES (284, 1, 'Actualizó un registro de \'configuracion\' con ID: 1', '{\"ruc\":\"20478672883\",\"asociado\":\"0\",\"send_email\":\"1\",\"url\":\"https:\\/\\/e-beta.sunat.gob.pe\\/ol-ti-itcpfegem-beta\\/billService?wsdl\",\"url_servicio\":\"https:\\/\\/<localhost>\\/\",\"url_api\":\"https:\\/\\/<localhost>\\/\",\"igv\":\"18.00\",\"titulo\":\"SISTEMA\",\"copyright\":\"Todos los derechos reservados\",\"fecha\":\"2024-06-17 16:28:03\",\"id\":\"1\"}', NULL, '2024-06-17 16:28:03', 1);
INSERT INTO `proceso_auditoria` VALUES (285, NULL, 'Actualizó un registro de \'usuario\' con ID: 1', '{\"token\":\"ea45ec340ddedc3db57ab0a7eb75d8eddd00f5b6664815ea8d0430700825f7e9e0822f29ac7f642ce69d40fcf66d2cb76a95c6260705e6674fb0e3f347eb1fa9sWiCRS9Ob8mMd0NfYU7VSg4RYK98DJ8moaGakuNIoRZjHw1oqMoy8wylhTfZy4kL\",\"id\":\"1\"}', NULL, '2024-06-17 20:58:24', 1);
INSERT INTO `proceso_auditoria` VALUES (286, NULL, 'Solicitó la recuperación de contraseña', '[]', NULL, '2024-06-17 20:58:24', 1);
INSERT INTO `proceso_auditoria` VALUES (287, 1, 'Inició sesión', '[]', NULL, '2024-06-18 20:16:23', 1);
INSERT INTO `proceso_auditoria` VALUES (288, 1, 'Creó un registro de \'pago\' con ID: 5', '{\"cliente\":\"3\",\"pago\":\"120\",\"tipo_pago\":\"1\",\"observaciones\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-06-19 16:07:54\",\"id\":5}', NULL, '2024-06-19 16:07:54', 1);
INSERT INTO `proceso_auditoria` VALUES (289, 1, 'Creó un registro de \'credito\' con ID: 6', '{\"tipo_credito\":\"2\",\"referencia\":\"5\",\"cliente\":\"3\",\"total\":\"120\",\"credito\":330,\"fecha\":\"2024-06-19 16:07:54\",\"id\":6}', NULL, '2024-06-19 16:07:54', 1);
INSERT INTO `proceso_auditoria` VALUES (290, 1, 'Inició sesión', '[]', NULL, '2024-06-19 20:53:45', 1);
INSERT INTO `proceso_auditoria` VALUES (291, 1, 'Inició sesión', '[]', NULL, '2024-06-19 20:55:03', 1);
INSERT INTO `proceso_auditoria` VALUES (292, 1, 'Inició sesión', '[]', NULL, '2024-06-19 21:00:13', 1);
INSERT INTO `proceso_auditoria` VALUES (293, 1, 'Inició sesión', '[]', NULL, '2024-06-19 21:01:09', 1);
INSERT INTO `proceso_auditoria` VALUES (294, 1, 'Inició sesión', '[]', NULL, '2024-06-19 21:03:10', 1);
INSERT INTO `proceso_auditoria` VALUES (295, 1, 'Inició sesión', '[]', NULL, '2024-06-19 21:03:17', 1);
INSERT INTO `proceso_auditoria` VALUES (296, 1, 'Inició sesión', '[]', NULL, '2024-06-19 21:07:04', 1);
INSERT INTO `proceso_auditoria` VALUES (297, 1, 'Terminó sesión', '[]', NULL, '2024-06-19 21:10:36', 1);
INSERT INTO `proceso_auditoria` VALUES (298, 2, 'Inició sesión', '[]', NULL, '2024-06-19 21:10:57', 1);
INSERT INTO `proceso_auditoria` VALUES (299, 2, 'Terminó sesión', '[]', NULL, '2024-06-19 21:11:23', 1);
INSERT INTO `proceso_auditoria` VALUES (300, 2, 'Inició sesión', '[]', NULL, '2024-06-19 21:11:27', 1);
INSERT INTO `proceso_auditoria` VALUES (301, 2, 'Terminó sesión', '[]', NULL, '2024-06-19 21:12:17', 1);
INSERT INTO `proceso_auditoria` VALUES (302, 1, 'Inició sesión', '[]', NULL, '2024-06-19 21:12:19', 1);
INSERT INTO `proceso_auditoria` VALUES (303, 1, 'Creó un registro de \'proveedor\' con ID: 2', '{\"estado\":\"1\",\"ruc\":\"14154125125\",\"nombre_o_razon_social\":\"Proveedor 2\",\"direccion_completa\":\"\",\"contacto\":\"\",\"telefono\":\"\",\"correo\":\"\",\"fecha\":\"2024-06-20 18:15:43\",\"id\":2}', NULL, '2024-06-20 18:15:43', 1);
INSERT INTO `proceso_auditoria` VALUES (304, 1, 'Actualizó un registro de \'proveedor\' con ID: 1', '{\"estado\":\"1\",\"ruc\":\"12312312312\",\"nombre_o_razon_social\":\"Proveedor 1\",\"direccion_completa\":\"\",\"contacto\":\"\",\"telefono\":\"\",\"correo\":\"\",\"id\":\"1\"}', NULL, '2024-06-20 18:15:50', 1);
INSERT INTO `proceso_auditoria` VALUES (305, 1, 'Creó un registro de \'gasto\' con ID: 5', '{\"tipo_gasto\":\"1\",\"pago\":\"100\",\"observaciones\":\"\",\"referencia\":\"2\",\"usuario\":\"1\",\"fecha\":\"2024-06-20 19:41:44\",\"id\":5}', NULL, '2024-06-20 19:41:44', 1);
INSERT INTO `proceso_auditoria` VALUES (306, 1, 'Actualizó un registro de \'gasto\' con ID: 5', '{\"observaciones\":\"Test\",\"id\":\"5\"}', NULL, '2024-06-20 19:57:32', 1);
INSERT INTO `proceso_auditoria` VALUES (307, 1, 'Actualizó un registro de \'pago\' con ID: 5', '{\"estado\":3,\"id\":\"5\"}', NULL, '2024-06-20 21:21:44', 1);
INSERT INTO `proceso_auditoria` VALUES (308, 1, 'Actualizó un registro de \'pago\' con ID: 5', '{\"estado\":3,\"id\":\"5\"}', NULL, '2024-06-20 21:22:25', 1);
INSERT INTO `proceso_auditoria` VALUES (309, 1, 'Creó un registro de \'gasto_anulacion\' con ID: 1', '{\"referencia\":\"5\",\"motivo\":\"Test de Motivo de anulaci\\u00f3n\",\"usuario\":\"1\",\"fecha\":\"2024-06-20 21:22:25\",\"id\":1}', NULL, '2024-06-20 21:22:25', 1);
INSERT INTO `proceso_auditoria` VALUES (310, 1, 'Actualizó un registro de \'pago\' con ID: 5', '{\"estado\":3,\"id\":\"5\"}', NULL, '2024-06-20 21:28:02', 1);
INSERT INTO `proceso_auditoria` VALUES (311, 1, 'Creó un registro de \'gasto_anulacion\' con ID: 2', '{\"referencia\":\"5\",\"motivo\":\"342423423\",\"usuario\":\"1\",\"fecha\":\"2024-06-20 21:28:02\",\"id\":2}', NULL, '2024-06-20 21:28:02', 1);
INSERT INTO `proceso_auditoria` VALUES (312, 1, 'Actualizó un registro de \'pago\' con ID: 5', '{\"estado\":3,\"id\":\"5\"}', NULL, '2024-06-20 21:28:45', 1);
INSERT INTO `proceso_auditoria` VALUES (313, 1, 'Creó un registro de \'gasto_anulacion\' con ID: 3', '{\"referencia\":\"5\",\"motivo\":\"2342342\",\"usuario\":\"1\",\"fecha\":\"2024-06-20 21:28:45\",\"id\":3}', NULL, '2024-06-20 21:28:45', 1);
INSERT INTO `proceso_auditoria` VALUES (314, 1, 'Actualizó un registro de \'gasto\' con ID: 5', '{\"estado\":3,\"id\":\"5\"}', NULL, '2024-06-20 21:29:40', 1);
INSERT INTO `proceso_auditoria` VALUES (315, 1, 'Creó un registro de \'gasto_anulacion\' con ID: 4', '{\"referencia\":\"5\",\"motivo\":\"Motivo de anulaci\\u00f3n\\r\\n\",\"usuario\":\"1\",\"fecha\":\"2024-06-20 21:29:40\",\"id\":4}', NULL, '2024-06-20 21:29:40', 1);
INSERT INTO `proceso_auditoria` VALUES (316, 1, 'Inició sesión', '[]', NULL, '2024-06-27 19:59:04', 1);
INSERT INTO `proceso_auditoria` VALUES (317, 1, 'Creó un registro de \'gasto\' con ID: 6', '{\"tipo_gasto\":\"1\",\"pago\":\"250\",\"observaciones\":\"\",\"referencia\":\"1\",\"usuario\":\"1\",\"fecha\":\"2024-06-27 20:07:55\",\"id\":6}', NULL, '2024-06-27 20:07:55', 1);
INSERT INTO `proceso_auditoria` VALUES (318, 1, 'Creó un registro de \'ingreso\' con ID: 10', '{\"proveedor\":\"1\",\"tipo_comprobante\":null,\"comprobante\":\"\",\"datos_adicionales\":\"\",\"usuario\":\"1\",\"fecha\":\"2024-06-27 20:08:40\",\"id\":10}', NULL, '2024-06-27 20:08:40', 1);
INSERT INTO `proceso_auditoria` VALUES (319, 1, 'Creó un registro de \'kardex\' con ID: 19', '{\"tipo_kardex\":1,\"referencia\":\"10\",\"producto\":\"1\",\"cantidad\":\"50\",\"precio\":\"10.00\",\"subtotal\":\"500.00\",\"fecha\":\"2024-06-27 20:08:40\",\"saldo\":186,\"id\":19}', NULL, '2024-06-27 20:08:40', 1);
INSERT INTO `proceso_auditoria` VALUES (320, 1, 'Creó un registro de \'ingreso_detalle\' con ID: 11', '{\"ingreso\":\"10\",\"producto\":\"1\",\"cantidad\":\"50\",\"precio\":\"10.00\",\"subtotal\":\"500.00\",\"fecha\":\"2024-06-27 20:08:40\",\"id\":11}', NULL, '2024-06-27 20:08:40', 1);
INSERT INTO `proceso_auditoria` VALUES (321, 1, 'Terminó sesión', '[]', NULL, '2024-07-03 20:11:12', 1);
INSERT INTO `proceso_auditoria` VALUES (322, 1, 'Inició sesión', '[]', NULL, '2024-07-03 20:11:18', 1);
INSERT INTO `proceso_auditoria` VALUES (323, 1, 'Terminó sesión', '[]', NULL, '2024-07-03 21:40:53', 1);
INSERT INTO `proceso_auditoria` VALUES (324, 1, 'Inició sesión', '[]', NULL, '2024-07-03 21:48:03', 1);
INSERT INTO `proceso_auditoria` VALUES (325, 1, 'Terminó sesión', '[]', NULL, '2024-07-03 21:48:35', 1);
INSERT INTO `proceso_auditoria` VALUES (326, 1, 'Inició sesión', '[]', NULL, '2024-07-03 21:48:39', 1);
INSERT INTO `proceso_auditoria` VALUES (327, 1, 'Terminó sesión', '[]', NULL, '2024-07-03 21:48:43', 1);
INSERT INTO `proceso_auditoria` VALUES (328, NULL, 'Intentó iniciar sesión, contraseña incorrecta', '[]', NULL, '2024-07-03 21:48:54', 1);
INSERT INTO `proceso_auditoria` VALUES (329, 1, 'Inició sesión', '[]', NULL, '2024-07-03 21:49:15', 1);
INSERT INTO `proceso_auditoria` VALUES (330, 1, 'Inició sesión', '[]', NULL, '2024-07-05 10:22:20', 1);
INSERT INTO `proceso_auditoria` VALUES (331, 1, 'Terminó sesión', '[]', NULL, '2024-07-07 21:11:44', 1);
INSERT INTO `proceso_auditoria` VALUES (332, 2, 'Inició sesión', '[]', NULL, '2024-07-07 22:01:24', 1);
INSERT INTO `proceso_auditoria` VALUES (333, 2, 'Terminó sesión', '[]', NULL, '2024-07-07 22:02:06', 1);
INSERT INTO `proceso_auditoria` VALUES (334, 2, 'Inició sesión', '[]', NULL, '2024-07-07 22:02:12', 1);
INSERT INTO `proceso_auditoria` VALUES (335, 2, 'Terminó sesión', '[]', NULL, '2024-07-07 22:52:55', 1);
INSERT INTO `proceso_auditoria` VALUES (336, 1, 'Inició sesión', '[]', NULL, '2024-07-07 22:53:00', 1);
INSERT INTO `proceso_auditoria` VALUES (337, 1, 'Terminó sesión', '[]', NULL, '2024-07-07 22:53:06', 1);
INSERT INTO `proceso_auditoria` VALUES (338, 1, 'Inició sesión', '[]', NULL, '2024-07-07 22:53:09', 1);
INSERT INTO `proceso_auditoria` VALUES (339, 1, 'Creó un registro de \'caja\' con ID: 0', '{\"estado\":\"1\",\"fecha\":\"2024-07-08 12:08:22\",\"notas\":\"Se abri\\u00f3 temprano\",\"usuario\":\"1\",\"sucursal\":\"2\",\"fecha_apertura\":\"2024-07-08\",\"id\":0}', NULL, '2024-07-08 12:08:22', 1);
INSERT INTO `proceso_auditoria` VALUES (340, 1, 'Creó un registro de \'caja_detalle\' con ID: 0', '{\"caja\":\"0\",\"referencia\":\"0\",\"monto\":\"100.50\",\"usuario\":\"1\",\"fecha\":\"2024-07-08 12:08:22\",\"id\":0}', NULL, '2024-07-08 12:08:22', 1);
INSERT INTO `proceso_auditoria` VALUES (341, 1, 'Terminó sesión', '[]', NULL, '2024-07-08 20:27:33', 1);
INSERT INTO `proceso_auditoria` VALUES (342, 2, 'Inició sesión', '[]', NULL, '2024-07-08 20:28:16', 1);
INSERT INTO `proceso_auditoria` VALUES (343, 2, 'Terminó sesión', '[]', NULL, '2024-07-08 20:28:29', 1);
INSERT INTO `proceso_auditoria` VALUES (344, 1, 'Inició sesión', '[]', NULL, '2024-07-08 20:28:31', 1);
INSERT INTO `proceso_auditoria` VALUES (345, 1, 'Inició sesión', '[]', NULL, '2024-07-08 20:49:22', 1);
INSERT INTO `proceso_auditoria` VALUES (346, 1, 'Inició sesión', '[]', NULL, '2024-07-08 20:49:28', 1);
INSERT INTO `proceso_auditoria` VALUES (347, 1, 'Terminó sesión', '[]', NULL, '2024-07-08 22:49:51', 1);
INSERT INTO `proceso_auditoria` VALUES (348, 1, 'Inició sesión', '[]', NULL, '2024-07-08 22:49:53', 1);
INSERT INTO `proceso_auditoria` VALUES (349, 1, 'Terminó sesión', '[]', NULL, '2024-07-08 22:57:54', 1);
INSERT INTO `proceso_auditoria` VALUES (350, 1, 'Inició sesión', '[]', NULL, '2024-07-08 22:57:57', 1);
INSERT INTO `proceso_auditoria` VALUES (351, 1, 'Terminó sesión', '[]', NULL, '2024-07-08 23:02:32', 1);
INSERT INTO `proceso_auditoria` VALUES (352, 1, 'Inició sesión', '[]', NULL, '2024-07-08 23:02:35', 1);
INSERT INTO `proceso_auditoria` VALUES (353, 1, 'Terminó sesión', '[]', NULL, '2024-07-08 23:02:39', 1);
INSERT INTO `proceso_auditoria` VALUES (354, 1, 'Inició sesión', '[]', NULL, '2024-07-08 23:02:42', 1);
INSERT INTO `proceso_auditoria` VALUES (355, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 10:03:20', 1);
INSERT INTO `proceso_auditoria` VALUES (356, 1, 'Inició sesión', '[]', NULL, '2024-07-09 10:03:25', 1);
INSERT INTO `proceso_auditoria` VALUES (357, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 10:03:30', 1);
INSERT INTO `proceso_auditoria` VALUES (358, 1, 'Inició sesión', '[]', NULL, '2024-07-09 10:03:34', 1);
INSERT INTO `proceso_auditoria` VALUES (359, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 10:03:37', 1);
INSERT INTO `proceso_auditoria` VALUES (360, 1, 'Inició sesión', '[]', NULL, '2024-07-09 10:03:41', 1);
INSERT INTO `proceso_auditoria` VALUES (361, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 11:06:05', 1);
INSERT INTO `proceso_auditoria` VALUES (362, 1, 'Inició sesión', '[]', NULL, '2024-07-09 11:06:08', 1);
INSERT INTO `proceso_auditoria` VALUES (363, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 11:06:35', 1);
INSERT INTO `proceso_auditoria` VALUES (364, 1, 'Inició sesión', '[]', NULL, '2024-07-09 11:06:37', 1);
INSERT INTO `proceso_auditoria` VALUES (365, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 11:06:44', 1);
INSERT INTO `proceso_auditoria` VALUES (366, 1, 'Inició sesión', '[]', NULL, '2024-07-09 11:06:47', 1);
INSERT INTO `proceso_auditoria` VALUES (367, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 11:06:52', 1);
INSERT INTO `proceso_auditoria` VALUES (368, 1, 'Inició sesión', '[]', NULL, '2024-07-09 11:07:06', 1);
INSERT INTO `proceso_auditoria` VALUES (369, 1, 'Creó un registro de \'caja\' con ID: 2', '{\"sucursal\":\"1\",\"notas\":\"Adicionales de caja\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 11:18:40\",\"fecha_apertura\":null,\"id\":2}', NULL, '2024-07-09 11:18:40', 1);
INSERT INTO `proceso_auditoria` VALUES (370, 1, 'Creó un registro de \'caja_detalle\' con ID: 2', '{\"caja\":\"2\",\"referencia\":null,\"monto\":\"150.80\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 11:18:40\",\"id\":2}', NULL, '2024-07-09 11:18:40', 1);
INSERT INTO `proceso_auditoria` VALUES (371, 1, 'Creó un registro de \'venta\' con ID: 9', '{\"estado\":\"1\",\"tipo_venta_pago\":\"2\",\"cliente\":\"5\",\"tipo_comprobante\":\"2\",\"comprobante\":\"32432432\",\"datos_adicionales\":\"\",\"subtotal\":\"110.17\",\"igv\":\"19.83\",\"total\":\"130.00\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 11:44:55\",\"id\":9}', NULL, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_auditoria` VALUES (372, 1, 'Creó un registro de \'caja_detalle\' con ID: 3', '{\"caja\":\"9\",\"referencia\":null,\"monto\":\"130.00\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 11:44:55\",\"id\":3}', NULL, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_auditoria` VALUES (373, 1, 'Creó un registro de \'kardex\' con ID: 20', '{\"tipo_kardex\":2,\"referencia\":\"9\",\"producto\":\"1\",\"cantidad\":\"26\",\"precio\":\"5.00\",\"subtotal\":\"130.00\",\"fecha\":\"2024-07-09 11:44:55\",\"saldo\":160,\"id\":20}', NULL, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_auditoria` VALUES (374, 1, 'Creó un registro de \'venta_detalle\' con ID: 8', '{\"venta\":\"9\",\"producto\":\"1\",\"cantidad\":\"26\",\"precio\":\"5.00\",\"subtotal\":\"130.00\",\"fecha\":\"2024-07-09 11:44:55\",\"id\":8}', NULL, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_auditoria` VALUES (375, 1, 'Creó un registro de \'pago\' con ID: 6', '{\"tipo_pago\":\"1\",\"cliente\":\"5\",\"pago\":\"130.00\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 11:44:55\",\"id\":6}', NULL, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_auditoria` VALUES (376, 1, 'Creó un registro de \'venta\' con ID: 10', '{\"estado\":\"1\",\"tipo_venta_pago\":\"2\",\"cliente\":\"5\",\"tipo_comprobante\":\"2\",\"comprobante\":\"35353455\",\"datos_adicionales\":\"\",\"subtotal\":\"50.85\",\"igv\":\"9.15\",\"total\":\"60.00\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 11:46:11\",\"id\":10}', NULL, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_auditoria` VALUES (377, 1, 'Creó un registro de \'caja_detalle\' con ID: 4', '{\"caja\":\"2\",\"referencia\":\"10\",\"monto\":\"60.00\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 11:46:11\",\"id\":4}', NULL, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_auditoria` VALUES (378, 1, 'Creó un registro de \'kardex\' con ID: 21', '{\"tipo_kardex\":2,\"referencia\":\"10\",\"producto\":\"1\",\"cantidad\":\"10\",\"precio\":\"6.00\",\"subtotal\":\"60.00\",\"fecha\":\"2024-07-09 11:46:11\",\"saldo\":150,\"id\":21}', NULL, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_auditoria` VALUES (379, 1, 'Creó un registro de \'venta_detalle\' con ID: 9', '{\"venta\":\"10\",\"producto\":\"1\",\"cantidad\":\"10\",\"precio\":\"6.00\",\"subtotal\":\"60.00\",\"fecha\":\"2024-07-09 11:46:11\",\"id\":9}', NULL, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_auditoria` VALUES (380, 1, 'Creó un registro de \'pago\' con ID: 7', '{\"tipo_pago\":\"1\",\"cliente\":\"5\",\"pago\":\"60.00\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 11:46:11\",\"id\":7}', NULL, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_auditoria` VALUES (381, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 13:08:41', 1);
INSERT INTO `proceso_auditoria` VALUES (382, 2, 'Inició sesión', '[]', NULL, '2024-07-09 13:08:49', 1);
INSERT INTO `proceso_auditoria` VALUES (383, 2, 'Terminó sesión', '[]', NULL, '2024-07-09 13:11:50', 1);
INSERT INTO `proceso_auditoria` VALUES (384, 1, 'Inició sesión', '[]', NULL, '2024-07-09 13:11:55', 1);
INSERT INTO `proceso_auditoria` VALUES (385, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 14:21:28', 1);
INSERT INTO `proceso_auditoria` VALUES (386, 1, 'Inició sesión', '[]', NULL, '2024-07-09 14:21:30', 1);
INSERT INTO `proceso_auditoria` VALUES (387, 1, 'Creó un registro de \'caja\' con ID: 3', '{\"cierre\":\"550.80\",\"notas_cierre\":\"\",\"usuario_cierre\":\"1\",\"fecha_cierre\":\"\",\"id\":3}', NULL, '2024-07-09 17:25:14', 1);
INSERT INTO `proceso_auditoria` VALUES (388, 1, 'Creó un registro de \'caja_detalle\' con ID: 5', '{\"caja\":\"3\",\"referencia\":\"3\",\"monto\":-209.99999999999994,\"usuario\":\"1\",\"fecha\":\"2024-07-09 17:25:14\",\"id\":5}', NULL, '2024-07-09 17:25:14', 1);
INSERT INTO `proceso_auditoria` VALUES (389, 1, 'Actualizó un registro de \'caja\' con ID: 2', '{\"cierre\":\"410.80\",\"notas_cierre\":\"\",\"usuario_cierre\":\"1\",\"fecha_cierre\":\"\",\"estado\":\"2\",\"id\":\"2\"}', NULL, '2024-07-09 17:28:36', 1);
INSERT INTO `proceso_auditoria` VALUES (390, 1, 'Creó un registro de \'caja_detalle\' con ID: 6', '{\"caja\":\"2\",\"referencia\":null,\"monto\":70,\"usuario\":\"1\",\"fecha\":\"2024-07-09 17:28:36\",\"id\":6}', NULL, '2024-07-09 17:28:36', 1);
INSERT INTO `proceso_auditoria` VALUES (391, 1, 'Creó un registro de \'caja\' con ID: 4', '{\"apertura\":\"100\",\"sucursal\":\"1\",\"notas\":\"data\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 17:34:43\",\"fecha_apertura\":\"2024-07-09 17:34:34\",\"id\":4}', NULL, '2024-07-09 17:34:43', 1);
INSERT INTO `proceso_auditoria` VALUES (392, 1, 'Creó un registro de \'caja_detalle\' con ID: 7', '{\"caja\":\"4\",\"referencia\":null,\"monto\":\"100\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 17:34:43\",\"id\":7}', NULL, '2024-07-09 17:34:43', 1);
INSERT INTO `proceso_auditoria` VALUES (393, 1, 'Creó un registro de \'venta\' con ID: 11', '{\"estado\":\"1\",\"tipo_venta_pago\":\"2\",\"cliente\":\"4\",\"tipo_comprobante\":\"1\",\"comprobante\":\"123123123\",\"datos_adicionales\":\"\",\"subtotal\":\"16.95\",\"igv\":\"3.05\",\"total\":\"20.00\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 17:35:10\",\"id\":11}', NULL, '2024-07-09 17:35:10', 1);
INSERT INTO `proceso_auditoria` VALUES (394, 1, 'Creó un registro de \'caja_detalle\' con ID: 8', '{\"caja\":\"4\",\"referencia\":\"11\",\"monto\":\"20.00\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 17:35:10\",\"id\":8}', NULL, '2024-07-09 17:35:10', 1);
INSERT INTO `proceso_auditoria` VALUES (395, 1, 'Creó un registro de \'kardex\' con ID: 22', '{\"tipo_kardex\":2,\"referencia\":\"11\",\"producto\":\"1\",\"cantidad\":\"10\",\"precio\":\"2.00\",\"subtotal\":\"20.00\",\"fecha\":\"2024-07-09 17:35:10\",\"saldo\":140,\"id\":22}', NULL, '2024-07-09 17:35:10', 1);
INSERT INTO `proceso_auditoria` VALUES (396, 1, 'Creó un registro de \'venta_detalle\' con ID: 10', '{\"venta\":\"11\",\"producto\":\"1\",\"cantidad\":\"10\",\"precio\":\"2.00\",\"subtotal\":\"20.00\",\"fecha\":\"2024-07-09 17:35:10\",\"id\":10}', NULL, '2024-07-09 17:35:10', 1);
INSERT INTO `proceso_auditoria` VALUES (397, 1, 'Creó un registro de \'pago\' con ID: 8', '{\"tipo_pago\":\"1\",\"cliente\":\"4\",\"pago\":\"20.00\",\"usuario\":\"1\",\"fecha\":\"2024-07-09 17:35:10\",\"id\":8}', NULL, '2024-07-09 17:35:10', 1);
INSERT INTO `proceso_auditoria` VALUES (398, 1, 'Actualizó un registro de \'caja\' con ID: 4', '{\"cierre\":\"110.00\",\"notas_cierre\":\"\",\"usuario_cierre\":\"1\",\"fecha_cierre\":\"2024-07-09 17:36:12\",\"estado\":\"2\",\"id\":\"4\"}', NULL, '2024-07-09 17:36:12', 1);
INSERT INTO `proceso_auditoria` VALUES (399, 1, 'Creó un registro de \'caja_detalle\' con ID: 9', '{\"caja\":\"4\",\"referencia\":null,\"monto\":-10,\"usuario\":\"1\",\"fecha\":\"2024-07-09 17:36:12\",\"id\":9}', NULL, '2024-07-09 17:36:12', 1);
INSERT INTO `proceso_auditoria` VALUES (400, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 17:46:03', 1);
INSERT INTO `proceso_auditoria` VALUES (401, 1, 'Inició sesión', '[]', NULL, '2024-07-09 20:58:54', 1);
INSERT INTO `proceso_auditoria` VALUES (402, 1, 'Terminó sesión', '[]', NULL, '2024-07-09 22:37:48', 1);

-- ----------------------------
-- Table structure for proceso_caja
-- ----------------------------
DROP TABLE IF EXISTS `proceso_caja`;
CREATE TABLE `proceso_caja`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `sucursal` int(0) NULL DEFAULT NULL,
  `apertura` decimal(10, 2) NULL DEFAULT NULL,
  `cierre` decimal(10, 2) NULL DEFAULT NULL,
  `notas` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notas_cierre` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` int(0) NULL DEFAULT NULL,
  `usuario_cierre` int(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `fecha_apertura` datetime(0) NULL DEFAULT NULL,
  `fecha_cierre` datetime(0) NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proceso_caja
-- ----------------------------
INSERT INTO `proceso_caja` VALUES (1, 2, 0.00, NULL, 'Se abrió temprano', NULL, 1, NULL, '2024-07-08 12:08:22', '2024-07-08 00:00:00', NULL, 1);
INSERT INTO `proceso_caja` VALUES (2, 1, 150.80, 410.80, 'Adicionales de caja', '', 1, 1, '2024-07-09 11:18:40', '2024-07-09 11:20:40', '2024-07-09 16:20:40', 2);
INSERT INTO `proceso_caja` VALUES (4, 1, 100.00, 110.00, 'data', '', 1, 1, '2024-07-09 17:34:43', '2024-07-09 17:34:34', '2024-07-09 17:36:12', 2);

-- ----------------------------
-- Table structure for proceso_caja_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_caja_detalle`;
CREATE TABLE `proceso_caja_detalle`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `caja` int(0) NULL DEFAULT NULL,
  `referencia` int(0) NULL DEFAULT NULL,
  `monto` decimal(10, 2) NULL DEFAULT NULL,
  `usuario` int(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proceso_caja_detalle
-- ----------------------------
INSERT INTO `proceso_caja_detalle` VALUES (1, 1, NULL, 100.50, 1, '2024-07-08 12:08:22', 1);
INSERT INTO `proceso_caja_detalle` VALUES (2, 2, NULL, 150.80, 1, '2024-07-09 11:18:40', 1);
INSERT INTO `proceso_caja_detalle` VALUES (3, 2, 9, 130.00, 1, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_caja_detalle` VALUES (4, 2, 10, 60.00, 1, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_caja_detalle` VALUES (6, 2, NULL, 70.00, 1, '2024-07-09 17:28:36', 1);
INSERT INTO `proceso_caja_detalle` VALUES (7, 4, NULL, 100.00, 1, '2024-07-09 17:34:43', 1);
INSERT INTO `proceso_caja_detalle` VALUES (8, 4, 11, 20.00, 1, '2024-07-09 17:35:10', 1);
INSERT INTO `proceso_caja_detalle` VALUES (9, 4, NULL, -10.00, 1, '2024-07-09 17:36:12', 1);

-- ----------------------------
-- Table structure for proceso_cliente
-- ----------------------------
DROP TABLE IF EXISTS `proceso_cliente`;
CREATE TABLE `proceso_cliente`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `tipo_documento` int(0) NOT NULL,
  `documento` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre_o_razon_social` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `departamento` int(0) NULL DEFAULT NULL,
  `provincia` int(0) NULL DEFAULT NULL,
  `distrito` int(0) NULL DEFAULT NULL,
  `direccion_completa` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `notas` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `contacto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `contacto_telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `membresia` int(0) NULL DEFAULT NULL,
  `usuario` int(0) NULL DEFAULT NULL,
  `estado` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ruc`(`documento`) USING BTREE,
  INDEX `cliente_tipo_documento`(`tipo_documento`) USING BTREE,
  CONSTRAINT `cliente_tipo_documento` FOREIGN KEY (`tipo_documento`) REFERENCES `proceso_tipo_documento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_cliente
-- ----------------------------
INSERT INTO `proceso_cliente` VALUES (1, 1, '12313123', 'Diego Alegre', 0, 11, 101, 'test', '324234', 'test@ttest', '2013-02-01', '', 'test', '', NULL, 1, 1, '2024-05-08 10:22:29');
INSERT INTO `proceso_cliente` VALUES (2, 1, '12312315', 'Marco Llasaca', 0, 10, 96, '43252345', '345345', 'test@test', '2013-01-30', '', '54353', '', 5, 1, 1, '2024-05-08 10:32:15');
INSERT INTO `proceso_cliente` VALUES (3, 1, '45454545', 'Test Nombres', 2, 12, 117, 'test Dirección', '234234', 'test@test', '2002-01-31', 'notas test', 'emergencia test', '999999999', 3, 1, 1, '2024-05-09 20:03:26');
INSERT INTO `proceso_cliente` VALUES (4, 1, '98785295', 'test 4', 0, 10, 96, 'test', '', '', '2000-02-02', '', '', '', NULL, 1, 1, '2024-05-29 11:28:36');
INSERT INTO `proceso_cliente` VALUES (5, 1, '45764566', 'Test 7', 0, NULL, NULL, '', '', '', '2000-01-01', '', '', '', NULL, 1, 1, '2024-05-31 22:06:06');
INSERT INTO `proceso_cliente` VALUES (6, 1, '34553455', 'test 8', 0, NULL, NULL, '', '', '', '2009-05-01', '', '', '', NULL, 1, 1, '2024-05-31 22:18:01');

-- ----------------------------
-- Table structure for proceso_cliente_servicio
-- ----------------------------
DROP TABLE IF EXISTS `proceso_cliente_servicio`;
CREATE TABLE `proceso_cliente_servicio`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `venta` int(0) NULL DEFAULT NULL,
  `producto` int(0) NULL DEFAULT NULL,
  `fecha_fin` date NULL DEFAULT NULL,
  `usuario` int(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_cliente_servicio
-- ----------------------------
INSERT INTO `proceso_cliente_servicio` VALUES (1, 3, 4, '2024-06-07', 1, '2024-05-24 20:37:42', 2);
INSERT INTO `proceso_cliente_servicio` VALUES (2, 3, 4, '2024-05-23', 1, '2024-05-23 20:37:42', 2);
INSERT INTO `proceso_cliente_servicio` VALUES (3, 4, 4, '2024-07-30', 1, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_cliente_servicio` VALUES (5, 6, 5, '2024-06-30', 1, '2024-05-29 10:40:38', 1);

-- ----------------------------
-- Table structure for proceso_control
-- ----------------------------
DROP TABLE IF EXISTS `proceso_control`;
CREATE TABLE `proceso_control`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `periodo` date NULL DEFAULT NULL,
  `rotacion` decimal(10, 4) NULL DEFAULT NULL,
  `duracion` decimal(10, 4) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `tipo_credito` int(0) NOT NULL,
  `referencia` int(0) NULL DEFAULT NULL,
  `cliente` int(0) NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `credito` decimal(10, 2) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `credito_tipo_credito`(`tipo_credito`) USING BTREE,
  INDEX `credito_cliente`(`cliente`) USING BTREE,
  CONSTRAINT `credito_cliente` FOREIGN KEY (`cliente`) REFERENCES `proceso_cliente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `credito_tipo_credito` FOREIGN KEY (`tipo_credito`) REFERENCES `proceso_tipo_credito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_credito
-- ----------------------------
INSERT INTO `proceso_credito` VALUES (1, 3, NULL, 1, 0.00, 0.00, '2024-05-08 10:22:29', 1);
INSERT INTO `proceso_credito` VALUES (2, 3, NULL, 2, 0.00, 0.00, '2024-05-08 10:32:15', 1);
INSERT INTO `proceso_credito` VALUES (3, 2, 1, 1, 100.00, -100.00, '2024-05-21 14:35:55', 1);
INSERT INTO `proceso_credito` VALUES (4, 1, 1, 2, 615.00, 615.00, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_credito` VALUES (5, 1, 3, 3, 450.00, 450.00, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_credito` VALUES (6, 2, 5, 3, 120.00, 330.00, '2024-06-19 16:07:54', 1);

-- ----------------------------
-- Table structure for proceso_departamento
-- ----------------------------
DROP TABLE IF EXISTS `proceso_departamento`;
CREATE TABLE `proceso_departamento`  (
  `iddepartamento` int(0) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`iddepartamento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_departamento
-- ----------------------------
INSERT INTO `proceso_departamento` VALUES (1, 'AMAZONAS', 1);
INSERT INTO `proceso_departamento` VALUES (2, 'ANCASH', 1);
INSERT INTO `proceso_departamento` VALUES (3, 'APURIMAC', 1);
INSERT INTO `proceso_departamento` VALUES (4, 'AREQUIPA', 1);
INSERT INTO `proceso_departamento` VALUES (5, 'AYACUCHO', 1);
INSERT INTO `proceso_departamento` VALUES (6, 'CAJAMARCA', 1);
INSERT INTO `proceso_departamento` VALUES (7, 'CUSCO', 1);
INSERT INTO `proceso_departamento` VALUES (8, 'HUANCAVELICA', 1);
INSERT INTO `proceso_departamento` VALUES (9, 'HUANUCO', 1);
INSERT INTO `proceso_departamento` VALUES (10, 'ICA', 1);
INSERT INTO `proceso_departamento` VALUES (11, 'JUNIN', 1);
INSERT INTO `proceso_departamento` VALUES (12, 'LA LIBERTAD', 1);
INSERT INTO `proceso_departamento` VALUES (13, 'LAMBAYEQUE', 1);
INSERT INTO `proceso_departamento` VALUES (14, 'LIMA', 1);
INSERT INTO `proceso_departamento` VALUES (15, 'LORETO', 1);
INSERT INTO `proceso_departamento` VALUES (16, 'MADRE DE DIOS', 1);
INSERT INTO `proceso_departamento` VALUES (17, 'MOQUEGUA', 1);
INSERT INTO `proceso_departamento` VALUES (18, 'PASCO', 1);
INSERT INTO `proceso_departamento` VALUES (19, 'PIURA', 1);
INSERT INTO `proceso_departamento` VALUES (20, 'PUNO', 1);
INSERT INTO `proceso_departamento` VALUES (21, 'SAN MARTIN', 1);
INSERT INTO `proceso_departamento` VALUES (22, 'TACNA', 1);
INSERT INTO `proceso_departamento` VALUES (23, 'TUMBES', 1);
INSERT INTO `proceso_departamento` VALUES (24, 'UCAYALI', 1);

-- ----------------------------
-- Table structure for proceso_distrito
-- ----------------------------
DROP TABLE IF EXISTS `proceso_distrito`;
CREATE TABLE `proceso_distrito`  (
  `iddistrito` int(0) NOT NULL AUTO_INCREMENT,
  `idprovincia` int(0) NOT NULL,
  `distrito` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`iddistrito`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1839 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_distrito
-- ----------------------------
INSERT INTO `proceso_distrito` VALUES (1, 1, 'ARAMANGO', 1);
INSERT INTO `proceso_distrito` VALUES (2, 1, 'COPALLIN', 1);
INSERT INTO `proceso_distrito` VALUES (3, 1, 'EL PARCO', 1);
INSERT INTO `proceso_distrito` VALUES (4, 1, 'IMAZA', 1);
INSERT INTO `proceso_distrito` VALUES (5, 1, 'LA PECA', 1);
INSERT INTO `proceso_distrito` VALUES (6, 2, 'CHISQUILLA', 1);
INSERT INTO `proceso_distrito` VALUES (7, 2, 'CHURUJA', 1);
INSERT INTO `proceso_distrito` VALUES (8, 2, 'COROSHA', 1);
INSERT INTO `proceso_distrito` VALUES (9, 2, 'CUISPES', 1);
INSERT INTO `proceso_distrito` VALUES (10, 2, 'FLORIDA', 1);
INSERT INTO `proceso_distrito` VALUES (11, 2, 'JAZAN', 1);
INSERT INTO `proceso_distrito` VALUES (12, 2, 'JUMBILLA', 1);
INSERT INTO `proceso_distrito` VALUES (13, 2, 'RECTA', 1);
INSERT INTO `proceso_distrito` VALUES (14, 2, 'SAN CARLOS', 1);
INSERT INTO `proceso_distrito` VALUES (15, 2, 'SHIPASBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (16, 2, 'VALERA', 1);
INSERT INTO `proceso_distrito` VALUES (17, 2, 'YAMBRASBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (18, 3, 'ASUNCION', 1);
INSERT INTO `proceso_distrito` VALUES (19, 3, 'BALSAS', 1);
INSERT INTO `proceso_distrito` VALUES (20, 3, 'CHACHAPOYAS', 1);
INSERT INTO `proceso_distrito` VALUES (21, 3, 'CHETO', 1);
INSERT INTO `proceso_distrito` VALUES (22, 3, 'CHILIQUIN', 1);
INSERT INTO `proceso_distrito` VALUES (23, 3, 'CHUQUIBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (24, 3, 'GRANADA', 1);
INSERT INTO `proceso_distrito` VALUES (25, 3, 'HUANCAS', 1);
INSERT INTO `proceso_distrito` VALUES (26, 3, 'LA JALCA', 1);
INSERT INTO `proceso_distrito` VALUES (27, 3, 'LEIMEBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (28, 3, 'LEVANTO', 1);
INSERT INTO `proceso_distrito` VALUES (29, 3, 'MAGDALENA', 1);
INSERT INTO `proceso_distrito` VALUES (30, 3, 'MARISCAL CASTILLA', 1);
INSERT INTO `proceso_distrito` VALUES (31, 3, 'MOLINOPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (32, 3, 'MONTEVIDEO', 1);
INSERT INTO `proceso_distrito` VALUES (33, 3, 'OLLEROS', 1);
INSERT INTO `proceso_distrito` VALUES (34, 3, 'QUINJALCA', 1);
INSERT INTO `proceso_distrito` VALUES (35, 3, 'SAN FRANCISCO DE DAGUAS', 1);
INSERT INTO `proceso_distrito` VALUES (36, 3, 'SAN ISIDRO DE MAINO', 1);
INSERT INTO `proceso_distrito` VALUES (37, 3, 'SOLOCO', 1);
INSERT INTO `proceso_distrito` VALUES (38, 3, 'SONCHE', 1);
INSERT INTO `proceso_distrito` VALUES (39, 4, 'EL CENEPA', 1);
INSERT INTO `proceso_distrito` VALUES (40, 4, 'NIEVA', 1);
INSERT INTO `proceso_distrito` VALUES (41, 4, 'RIO SANTIAGO', 1);
INSERT INTO `proceso_distrito` VALUES (42, 5, 'CAMPORREDONDO', 1);
INSERT INTO `proceso_distrito` VALUES (43, 5, 'COCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (44, 5, 'COLCAMAR', 1);
INSERT INTO `proceso_distrito` VALUES (45, 5, 'CONILA', 1);
INSERT INTO `proceso_distrito` VALUES (46, 5, 'INGUILPATA', 1);
INSERT INTO `proceso_distrito` VALUES (47, 5, 'LAMUD', 1);
INSERT INTO `proceso_distrito` VALUES (48, 5, 'LONGUITA', 1);
INSERT INTO `proceso_distrito` VALUES (49, 5, 'LONYA CHICO', 1);
INSERT INTO `proceso_distrito` VALUES (50, 5, 'LUYA', 1);
INSERT INTO `proceso_distrito` VALUES (51, 5, 'LUYA VIEJO', 1);
INSERT INTO `proceso_distrito` VALUES (52, 5, 'MARIA', 1);
INSERT INTO `proceso_distrito` VALUES (53, 5, 'OCALLI', 1);
INSERT INTO `proceso_distrito` VALUES (54, 5, 'OCUMAL', 1);
INSERT INTO `proceso_distrito` VALUES (55, 5, 'PISUQUIA', 1);
INSERT INTO `proceso_distrito` VALUES (56, 5, 'PROVIDENCIA', 1);
INSERT INTO `proceso_distrito` VALUES (57, 5, 'SAN CRISTOBAL', 1);
INSERT INTO `proceso_distrito` VALUES (58, 5, 'SAN FRANCISCO DEL YESO', 1);
INSERT INTO `proceso_distrito` VALUES (59, 5, 'SAN JERONIMO', 1);
INSERT INTO `proceso_distrito` VALUES (60, 5, 'SAN JUAN DE LOPECANCHA', 1);
INSERT INTO `proceso_distrito` VALUES (61, 5, 'SANTA CATALINA', 1);
INSERT INTO `proceso_distrito` VALUES (62, 5, 'SANTO TOMAS', 1);
INSERT INTO `proceso_distrito` VALUES (63, 5, 'TINGO', 1);
INSERT INTO `proceso_distrito` VALUES (64, 5, 'TRITA', 1);
INSERT INTO `proceso_distrito` VALUES (65, 6, 'CHIRIMOTO', 1);
INSERT INTO `proceso_distrito` VALUES (66, 6, 'COCHAMAL', 1);
INSERT INTO `proceso_distrito` VALUES (67, 6, 'HUAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (68, 6, 'LIMABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (69, 6, 'LONGAR', 1);
INSERT INTO `proceso_distrito` VALUES (70, 6, 'MARISCAL BENAVIDES', 1);
INSERT INTO `proceso_distrito` VALUES (71, 6, 'MILPUC', 1);
INSERT INTO `proceso_distrito` VALUES (72, 6, 'OMIA', 1);
INSERT INTO `proceso_distrito` VALUES (73, 6, 'SAN NICOLAS', 1);
INSERT INTO `proceso_distrito` VALUES (74, 6, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (75, 6, 'TOTORA', 1);
INSERT INTO `proceso_distrito` VALUES (76, 6, 'VISTA ALEGRE', 1);
INSERT INTO `proceso_distrito` VALUES (77, 7, 'BAGUA GRANDE', 1);
INSERT INTO `proceso_distrito` VALUES (78, 7, 'CAJARURO', 1);
INSERT INTO `proceso_distrito` VALUES (79, 7, 'CUMBA', 1);
INSERT INTO `proceso_distrito` VALUES (80, 7, 'EL MILAGRO', 1);
INSERT INTO `proceso_distrito` VALUES (81, 7, 'JAMALCA', 1);
INSERT INTO `proceso_distrito` VALUES (82, 7, 'LONYA GRANDE', 1);
INSERT INTO `proceso_distrito` VALUES (83, 7, 'YAMON', 1);
INSERT INTO `proceso_distrito` VALUES (84, 8, 'AIJA', 1);
INSERT INTO `proceso_distrito` VALUES (85, 8, 'CORIS', 1);
INSERT INTO `proceso_distrito` VALUES (86, 8, 'HUACLLAN', 1);
INSERT INTO `proceso_distrito` VALUES (87, 8, 'LA MERCED', 1);
INSERT INTO `proceso_distrito` VALUES (88, 8, 'SUCCHA', 1);
INSERT INTO `proceso_distrito` VALUES (89, 9, 'ACZO', 1);
INSERT INTO `proceso_distrito` VALUES (90, 9, 'CHACCHO', 1);
INSERT INTO `proceso_distrito` VALUES (91, 9, 'CHINGAS', 1);
INSERT INTO `proceso_distrito` VALUES (92, 9, 'LLAMELLIN', 1);
INSERT INTO `proceso_distrito` VALUES (93, 9, 'MIRGAS', 1);
INSERT INTO `proceso_distrito` VALUES (94, 9, 'SAN JUAN DE RONTOY', 1);
INSERT INTO `proceso_distrito` VALUES (95, 10, 'ACOCHACA', 1);
INSERT INTO `proceso_distrito` VALUES (96, 10, 'CHACAS', 1);
INSERT INTO `proceso_distrito` VALUES (97, 11, 'ABELARDO PARDO LEZAMETA', 1);
INSERT INTO `proceso_distrito` VALUES (98, 11, 'ANTONIO RAYMONDI', 1);
INSERT INTO `proceso_distrito` VALUES (99, 11, 'AQUIA', 1);
INSERT INTO `proceso_distrito` VALUES (100, 11, 'CAJACAY', 1);
INSERT INTO `proceso_distrito` VALUES (101, 11, 'CANIS', 1);
INSERT INTO `proceso_distrito` VALUES (102, 11, 'CHIQUIAN', 1);
INSERT INTO `proceso_distrito` VALUES (103, 11, 'COLQUIOC', 1);
INSERT INTO `proceso_distrito` VALUES (104, 11, 'HUALLANCA', 1);
INSERT INTO `proceso_distrito` VALUES (105, 11, 'HUASTA', 1);
INSERT INTO `proceso_distrito` VALUES (106, 11, 'HUAYLLACAYAN', 1);
INSERT INTO `proceso_distrito` VALUES (107, 11, 'LA PRIMAVERA', 1);
INSERT INTO `proceso_distrito` VALUES (108, 11, 'MANGAS', 1);
INSERT INTO `proceso_distrito` VALUES (109, 11, 'PACLLON', 1);
INSERT INTO `proceso_distrito` VALUES (110, 11, 'SAN MIGUEL DE CORPANQUI', 1);
INSERT INTO `proceso_distrito` VALUES (111, 11, 'TICLLOS', 1);
INSERT INTO `proceso_distrito` VALUES (112, 12, 'ACOPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (113, 12, 'AMASHCA', 1);
INSERT INTO `proceso_distrito` VALUES (114, 12, 'ANTA', 1);
INSERT INTO `proceso_distrito` VALUES (115, 12, 'ATAQUERO', 1);
INSERT INTO `proceso_distrito` VALUES (116, 12, 'CARHUAZ', 1);
INSERT INTO `proceso_distrito` VALUES (117, 12, 'MARCARA', 1);
INSERT INTO `proceso_distrito` VALUES (118, 12, 'PARIAHUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (119, 12, 'SAN MIGUEL DE ACO', 1);
INSERT INTO `proceso_distrito` VALUES (120, 12, 'SHILLA', 1);
INSERT INTO `proceso_distrito` VALUES (121, 12, 'TINCO', 1);
INSERT INTO `proceso_distrito` VALUES (122, 12, 'YUNGAR', 1);
INSERT INTO `proceso_distrito` VALUES (123, 13, 'SAN LUIS', 1);
INSERT INTO `proceso_distrito` VALUES (124, 13, 'SAN NICOLAS', 1);
INSERT INTO `proceso_distrito` VALUES (125, 13, 'YAUYA', 1);
INSERT INTO `proceso_distrito` VALUES (126, 14, 'BUENA VISTA ALTA', 1);
INSERT INTO `proceso_distrito` VALUES (127, 14, 'CASMA', 1);
INSERT INTO `proceso_distrito` VALUES (128, 14, 'COMANDANTE NOEL', 1);
INSERT INTO `proceso_distrito` VALUES (129, 14, 'YAUTAN', 1);
INSERT INTO `proceso_distrito` VALUES (130, 15, 'ACO', 1);
INSERT INTO `proceso_distrito` VALUES (131, 15, 'BAMBAS', 1);
INSERT INTO `proceso_distrito` VALUES (132, 15, 'CORONGO', 1);
INSERT INTO `proceso_distrito` VALUES (133, 15, 'CUSCA', 1);
INSERT INTO `proceso_distrito` VALUES (134, 15, 'LA PAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (135, 15, 'YANAC', 1);
INSERT INTO `proceso_distrito` VALUES (136, 15, 'YUPAN', 1);
INSERT INTO `proceso_distrito` VALUES (137, 16, 'COCHABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (138, 16, 'COLCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (139, 16, 'HUANCHAY', 1);
INSERT INTO `proceso_distrito` VALUES (140, 16, 'HUARAZ', 1);
INSERT INTO `proceso_distrito` VALUES (141, 16, 'INDEPENDENCIA', 1);
INSERT INTO `proceso_distrito` VALUES (142, 16, 'JANGAS', 1);
INSERT INTO `proceso_distrito` VALUES (143, 16, 'LA LIBERTAD', 1);
INSERT INTO `proceso_distrito` VALUES (144, 16, 'OLLEROS', 1);
INSERT INTO `proceso_distrito` VALUES (145, 16, 'PAMPAS', 1);
INSERT INTO `proceso_distrito` VALUES (146, 16, 'PARIACOTO', 1);
INSERT INTO `proceso_distrito` VALUES (147, 16, 'PIRA', 1);
INSERT INTO `proceso_distrito` VALUES (148, 16, 'TARICA', 1);
INSERT INTO `proceso_distrito` VALUES (149, 17, 'ANRA', 1);
INSERT INTO `proceso_distrito` VALUES (150, 17, 'CAJAY', 1);
INSERT INTO `proceso_distrito` VALUES (151, 17, 'CHAVIN DE HUANTAR', 1);
INSERT INTO `proceso_distrito` VALUES (152, 17, 'HUACACHI', 1);
INSERT INTO `proceso_distrito` VALUES (153, 17, 'HUACCHIS', 1);
INSERT INTO `proceso_distrito` VALUES (154, 17, 'HUACHIS', 1);
INSERT INTO `proceso_distrito` VALUES (155, 17, 'HUANTAR', 1);
INSERT INTO `proceso_distrito` VALUES (156, 17, 'HUARI', 1);
INSERT INTO `proceso_distrito` VALUES (157, 17, 'MASIN', 1);
INSERT INTO `proceso_distrito` VALUES (158, 17, 'PAUCAS', 1);
INSERT INTO `proceso_distrito` VALUES (159, 17, 'PONTO', 1);
INSERT INTO `proceso_distrito` VALUES (160, 17, 'RAHUAPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (161, 17, 'RAPAYAN', 1);
INSERT INTO `proceso_distrito` VALUES (162, 17, 'SAN MARCOS', 1);
INSERT INTO `proceso_distrito` VALUES (163, 17, 'SAN PEDRO DE CHANA', 1);
INSERT INTO `proceso_distrito` VALUES (164, 17, 'UCO', 1);
INSERT INTO `proceso_distrito` VALUES (165, 18, 'COCHAPETI', 1);
INSERT INTO `proceso_distrito` VALUES (166, 18, 'CULEBRAS', 1);
INSERT INTO `proceso_distrito` VALUES (167, 18, 'HUARMEY', 1);
INSERT INTO `proceso_distrito` VALUES (168, 18, 'HUAYAN', 1);
INSERT INTO `proceso_distrito` VALUES (169, 18, 'MALVAS', 1);
INSERT INTO `proceso_distrito` VALUES (170, 19, 'CARAZ', 1);
INSERT INTO `proceso_distrito` VALUES (171, 19, 'HUALLANCA', 1);
INSERT INTO `proceso_distrito` VALUES (172, 19, 'HUATA', 1);
INSERT INTO `proceso_distrito` VALUES (173, 19, 'HUAYLAS', 1);
INSERT INTO `proceso_distrito` VALUES (174, 19, 'MATO', 1);
INSERT INTO `proceso_distrito` VALUES (175, 19, 'PAMPAROMAS', 1);
INSERT INTO `proceso_distrito` VALUES (176, 19, 'PUEBLO LIBRE', 1);
INSERT INTO `proceso_distrito` VALUES (177, 19, 'SANTA CRUZ', 1);
INSERT INTO `proceso_distrito` VALUES (178, 19, 'SANTO TORIBIO', 1);
INSERT INTO `proceso_distrito` VALUES (179, 19, 'YURACMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (180, 20, 'CASCA', 1);
INSERT INTO `proceso_distrito` VALUES (181, 20, 'ELEAZAR GUZMAN BARRON', 1);
INSERT INTO `proceso_distrito` VALUES (182, 20, 'FIDEL OLIVAS ESCUDERO', 1);
INSERT INTO `proceso_distrito` VALUES (183, 20, 'LLAMA', 1);
INSERT INTO `proceso_distrito` VALUES (184, 20, 'LLUMPA', 1);
INSERT INTO `proceso_distrito` VALUES (185, 20, 'LUCMA', 1);
INSERT INTO `proceso_distrito` VALUES (186, 20, 'MUSGA', 1);
INSERT INTO `proceso_distrito` VALUES (187, 20, 'PISCOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (188, 21, 'ACAS', 1);
INSERT INTO `proceso_distrito` VALUES (189, 21, 'CAJAMARQUILLA', 1);
INSERT INTO `proceso_distrito` VALUES (190, 21, 'CARHUAPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (191, 21, 'COCHAS', 1);
INSERT INTO `proceso_distrito` VALUES (192, 21, 'CONGAS', 1);
INSERT INTO `proceso_distrito` VALUES (193, 21, 'LLIPA', 1);
INSERT INTO `proceso_distrito` VALUES (194, 21, 'OCROS', 1);
INSERT INTO `proceso_distrito` VALUES (195, 21, 'SAN CRISTOBAL DE RAJAN', 1);
INSERT INTO `proceso_distrito` VALUES (196, 21, 'SAN PEDRO', 1);
INSERT INTO `proceso_distrito` VALUES (197, 21, 'SANTIAGO DE CHILCAS', 1);
INSERT INTO `proceso_distrito` VALUES (198, 22, 'BOLOGNESI', 1);
INSERT INTO `proceso_distrito` VALUES (199, 22, 'CABANA', 1);
INSERT INTO `proceso_distrito` VALUES (200, 22, 'CONCHUCOS', 1);
INSERT INTO `proceso_distrito` VALUES (201, 22, 'HUACASCHUQUE', 1);
INSERT INTO `proceso_distrito` VALUES (202, 22, 'HUANDOVAL', 1);
INSERT INTO `proceso_distrito` VALUES (203, 22, 'LACABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (204, 22, 'LLAPO', 1);
INSERT INTO `proceso_distrito` VALUES (205, 22, 'PALLASCA', 1);
INSERT INTO `proceso_distrito` VALUES (206, 22, 'PAMPAS', 1);
INSERT INTO `proceso_distrito` VALUES (207, 22, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (208, 22, 'TAUCA', 1);
INSERT INTO `proceso_distrito` VALUES (209, 23, 'HUAYLLAN', 1);
INSERT INTO `proceso_distrito` VALUES (210, 23, 'PAROBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (211, 23, 'POMABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (212, 23, 'QUINUABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (213, 24, 'CATAC', 1);
INSERT INTO `proceso_distrito` VALUES (214, 24, 'COTAPARACO', 1);
INSERT INTO `proceso_distrito` VALUES (215, 24, 'HUAYLLAPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (216, 24, 'LLACLLIN', 1);
INSERT INTO `proceso_distrito` VALUES (217, 24, 'MARCA', 1);
INSERT INTO `proceso_distrito` VALUES (218, 24, 'PAMPAS CHICO', 1);
INSERT INTO `proceso_distrito` VALUES (219, 24, 'PARARIN', 1);
INSERT INTO `proceso_distrito` VALUES (220, 24, 'RECUAY', 1);
INSERT INTO `proceso_distrito` VALUES (221, 24, 'TAPACOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (222, 24, 'TICAPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (223, 25, 'CACERES DEL PERU', 1);
INSERT INTO `proceso_distrito` VALUES (224, 25, 'CHIMBOTE', 1);
INSERT INTO `proceso_distrito` VALUES (225, 25, 'COISHCO', 1);
INSERT INTO `proceso_distrito` VALUES (226, 25, 'MACATE', 1);
INSERT INTO `proceso_distrito` VALUES (227, 25, 'MORO', 1);
INSERT INTO `proceso_distrito` VALUES (228, 25, 'NEPEÑA', 1);
INSERT INTO `proceso_distrito` VALUES (229, 25, 'NUEVO CHIMBOTE', 1);
INSERT INTO `proceso_distrito` VALUES (230, 25, 'SAMANCO', 1);
INSERT INTO `proceso_distrito` VALUES (231, 25, 'SANTA', 1);
INSERT INTO `proceso_distrito` VALUES (232, 26, 'ACOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (233, 26, 'ALFONSO UGARTE', 1);
INSERT INTO `proceso_distrito` VALUES (234, 26, 'CASHAPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (235, 26, 'CHINGALPO', 1);
INSERT INTO `proceso_distrito` VALUES (236, 26, 'HUAYLLABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (237, 26, 'QUICHES', 1);
INSERT INTO `proceso_distrito` VALUES (238, 26, 'RAGASH', 1);
INSERT INTO `proceso_distrito` VALUES (239, 26, 'SAN JUAN', 1);
INSERT INTO `proceso_distrito` VALUES (240, 26, 'SICSIBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (241, 26, 'SIHUAS', 1);
INSERT INTO `proceso_distrito` VALUES (242, 27, 'CASCAPARA', 1);
INSERT INTO `proceso_distrito` VALUES (243, 27, 'MANCOS', 1);
INSERT INTO `proceso_distrito` VALUES (244, 27, 'MATACOTO', 1);
INSERT INTO `proceso_distrito` VALUES (245, 27, 'QUILLO', 1);
INSERT INTO `proceso_distrito` VALUES (246, 27, 'RANRAHIRCA', 1);
INSERT INTO `proceso_distrito` VALUES (247, 27, 'SHUPLUY', 1);
INSERT INTO `proceso_distrito` VALUES (248, 27, 'YANAMA', 1);
INSERT INTO `proceso_distrito` VALUES (249, 27, 'YUNGAY', 1);
INSERT INTO `proceso_distrito` VALUES (250, 28, 'ABANCAY', 1);
INSERT INTO `proceso_distrito` VALUES (251, 28, 'CHACOCHE', 1);
INSERT INTO `proceso_distrito` VALUES (252, 28, 'CIRCA', 1);
INSERT INTO `proceso_distrito` VALUES (253, 28, 'CURAHUASI', 1);
INSERT INTO `proceso_distrito` VALUES (254, 28, 'HUANIPACA', 1);
INSERT INTO `proceso_distrito` VALUES (255, 28, 'LAMBRAMA', 1);
INSERT INTO `proceso_distrito` VALUES (256, 28, 'PICHIRHUA', 1);
INSERT INTO `proceso_distrito` VALUES (257, 28, 'SAN PEDRO DE CACHORA', 1);
INSERT INTO `proceso_distrito` VALUES (258, 28, 'TAMBURCO', 1);
INSERT INTO `proceso_distrito` VALUES (259, 29, 'ANDAHUAYLAS', 1);
INSERT INTO `proceso_distrito` VALUES (260, 29, 'ANDARAPA', 1);
INSERT INTO `proceso_distrito` VALUES (261, 29, 'CHIARA', 1);
INSERT INTO `proceso_distrito` VALUES (262, 29, 'HUANCARAMA', 1);
INSERT INTO `proceso_distrito` VALUES (263, 29, 'HUANCARAY', 1);
INSERT INTO `proceso_distrito` VALUES (264, 29, 'HUAYANA', 1);
INSERT INTO `proceso_distrito` VALUES (265, 29, 'KAQUIABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (266, 29, 'KISHUARA', 1);
INSERT INTO `proceso_distrito` VALUES (267, 29, 'PACOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (268, 29, 'PACUCHA', 1);
INSERT INTO `proceso_distrito` VALUES (269, 29, 'PAMPACHIRI', 1);
INSERT INTO `proceso_distrito` VALUES (270, 29, 'POMACOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (271, 29, 'SAN ANTONIO DE CACHI', 1);
INSERT INTO `proceso_distrito` VALUES (272, 29, 'SAN JERONIMO', 1);
INSERT INTO `proceso_distrito` VALUES (273, 29, 'SAN MIGUEL DE CHACCRAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (274, 29, 'SANTA MARIA DE CHICMO', 1);
INSERT INTO `proceso_distrito` VALUES (275, 29, 'TALAVERA', 1);
INSERT INTO `proceso_distrito` VALUES (276, 29, 'TUMAY HUARACA', 1);
INSERT INTO `proceso_distrito` VALUES (277, 29, 'TURPO', 1);
INSERT INTO `proceso_distrito` VALUES (278, 30, 'ANTABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (279, 30, 'EL ORO', 1);
INSERT INTO `proceso_distrito` VALUES (280, 30, 'HUAQUIRCA', 1);
INSERT INTO `proceso_distrito` VALUES (281, 30, 'JUAN ESPINOZA MEDRANO', 1);
INSERT INTO `proceso_distrito` VALUES (282, 30, 'OROPESA', 1);
INSERT INTO `proceso_distrito` VALUES (283, 30, 'PACHACONAS', 1);
INSERT INTO `proceso_distrito` VALUES (284, 30, 'SABAINO', 1);
INSERT INTO `proceso_distrito` VALUES (285, 31, 'CAPAYA', 1);
INSERT INTO `proceso_distrito` VALUES (286, 31, 'CARAYBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (287, 31, 'CHALHUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (288, 31, 'CHAPIMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (289, 31, 'COLCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (290, 31, 'COTARUSE', 1);
INSERT INTO `proceso_distrito` VALUES (291, 31, 'HUAYLLO', 1);
INSERT INTO `proceso_distrito` VALUES (292, 31, 'JUSTO APU SAHUARAURA', 1);
INSERT INTO `proceso_distrito` VALUES (293, 31, 'LUCRE', 1);
INSERT INTO `proceso_distrito` VALUES (294, 31, 'POCOHUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (295, 31, 'SAN JUAN DE CHACÑA', 1);
INSERT INTO `proceso_distrito` VALUES (296, 31, 'SAÑAYCA', 1);
INSERT INTO `proceso_distrito` VALUES (297, 31, 'SORAYA', 1);
INSERT INTO `proceso_distrito` VALUES (298, 31, 'TAPAIRIHUA', 1);
INSERT INTO `proceso_distrito` VALUES (299, 31, 'TINTAY', 1);
INSERT INTO `proceso_distrito` VALUES (300, 31, 'TORAYA', 1);
INSERT INTO `proceso_distrito` VALUES (301, 31, 'YANACA', 1);
INSERT INTO `proceso_distrito` VALUES (302, 32, 'ANCO-HUALLO', 1);
INSERT INTO `proceso_distrito` VALUES (303, 32, 'CHINCHEROS', 1);
INSERT INTO `proceso_distrito` VALUES (304, 32, 'COCHARCAS', 1);
INSERT INTO `proceso_distrito` VALUES (305, 32, 'HUACCANA', 1);
INSERT INTO `proceso_distrito` VALUES (306, 32, 'OCOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (307, 32, 'ONGOY', 1);
INSERT INTO `proceso_distrito` VALUES (308, 32, 'RANRACANCHA', 1);
INSERT INTO `proceso_distrito` VALUES (309, 32, 'URANMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (310, 33, 'CHALLHUAHUACHO', 1);
INSERT INTO `proceso_distrito` VALUES (311, 33, 'COTABAMBAS', 1);
INSERT INTO `proceso_distrito` VALUES (312, 33, 'COYLLURQUI', 1);
INSERT INTO `proceso_distrito` VALUES (313, 33, 'HAQUIRA', 1);
INSERT INTO `proceso_distrito` VALUES (314, 33, 'MARA', 1);
INSERT INTO `proceso_distrito` VALUES (315, 33, 'TAMBOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (316, 34, 'CHUQUIBAMBILLA', 1);
INSERT INTO `proceso_distrito` VALUES (317, 34, 'CURASCO', 1);
INSERT INTO `proceso_distrito` VALUES (318, 34, 'CURPAHUASI', 1);
INSERT INTO `proceso_distrito` VALUES (319, 34, 'GAMARRA', 1);
INSERT INTO `proceso_distrito` VALUES (320, 34, 'HUAYLLATI', 1);
INSERT INTO `proceso_distrito` VALUES (321, 34, 'MAMARA', 1);
INSERT INTO `proceso_distrito` VALUES (322, 34, 'MICAELA BASTIDAS', 1);
INSERT INTO `proceso_distrito` VALUES (323, 34, 'PATAYPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (324, 34, 'PROGRESO', 1);
INSERT INTO `proceso_distrito` VALUES (325, 34, 'SAN ANTONIO', 1);
INSERT INTO `proceso_distrito` VALUES (326, 34, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (327, 34, 'TURPAY', 1);
INSERT INTO `proceso_distrito` VALUES (328, 34, 'VILCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (329, 34, 'VIRUNDO', 1);
INSERT INTO `proceso_distrito` VALUES (330, 35, 'ALTO SELVA ALEGRE', 1);
INSERT INTO `proceso_distrito` VALUES (331, 35, 'AREQUIPA', 1);
INSERT INTO `proceso_distrito` VALUES (332, 35, 'CAYMA', 1);
INSERT INTO `proceso_distrito` VALUES (333, 35, 'CERRO COLORADO', 1);
INSERT INTO `proceso_distrito` VALUES (334, 35, 'CHARACATO', 1);
INSERT INTO `proceso_distrito` VALUES (335, 35, 'CHIGUATA', 1);
INSERT INTO `proceso_distrito` VALUES (336, 35, 'JACOBO HUNTER', 1);
INSERT INTO `proceso_distrito` VALUES (337, 35, 'JOSE LUIS BUSTAMANTE Y RIVERO', 1);
INSERT INTO `proceso_distrito` VALUES (338, 35, 'LA JOYA', 1);
INSERT INTO `proceso_distrito` VALUES (339, 35, 'MARIANO MELGAR', 1);
INSERT INTO `proceso_distrito` VALUES (340, 35, 'MIRAFLORES', 1);
INSERT INTO `proceso_distrito` VALUES (341, 35, 'MOLLEBAYA', 1);
INSERT INTO `proceso_distrito` VALUES (342, 35, 'PAUCARPATA', 1);
INSERT INTO `proceso_distrito` VALUES (343, 35, 'POCSI', 1);
INSERT INTO `proceso_distrito` VALUES (344, 35, 'POLOBAYA', 1);
INSERT INTO `proceso_distrito` VALUES (345, 35, 'QUEQUEÑA', 1);
INSERT INTO `proceso_distrito` VALUES (346, 35, 'SABANDIA', 1);
INSERT INTO `proceso_distrito` VALUES (347, 35, 'SACHACA', 1);
INSERT INTO `proceso_distrito` VALUES (348, 35, 'SAN JUAN DE SIGUAS', 1);
INSERT INTO `proceso_distrito` VALUES (349, 35, 'SAN JUAN DE TARUCANI', 1);
INSERT INTO `proceso_distrito` VALUES (350, 35, 'SANTA ISABEL DE SIGUAS', 1);
INSERT INTO `proceso_distrito` VALUES (351, 35, 'SANTA RITA DE SIGUAS', 1);
INSERT INTO `proceso_distrito` VALUES (352, 35, 'SOCABAYA', 1);
INSERT INTO `proceso_distrito` VALUES (353, 35, 'TIABAYA', 1);
INSERT INTO `proceso_distrito` VALUES (354, 35, 'UCHUMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (355, 35, 'VITOR  1/', 1);
INSERT INTO `proceso_distrito` VALUES (356, 35, 'YANAHUARA', 1);
INSERT INTO `proceso_distrito` VALUES (357, 35, 'YARABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (358, 35, 'YURA', 1);
INSERT INTO `proceso_distrito` VALUES (359, 36, 'CAMANA', 1);
INSERT INTO `proceso_distrito` VALUES (360, 36, 'JOSE MARIA QUIMPER', 1);
INSERT INTO `proceso_distrito` VALUES (361, 36, 'MARIANO NICOLAS VALCARCEL', 1);
INSERT INTO `proceso_distrito` VALUES (362, 36, 'MARISCAL CACERES', 1);
INSERT INTO `proceso_distrito` VALUES (363, 36, 'NICOLAS DE PIEROLA', 1);
INSERT INTO `proceso_distrito` VALUES (364, 36, 'OCOÑA', 1);
INSERT INTO `proceso_distrito` VALUES (365, 36, 'QUILCA', 1);
INSERT INTO `proceso_distrito` VALUES (366, 36, 'SAMUEL PASTOR', 1);
INSERT INTO `proceso_distrito` VALUES (367, 37, 'ACARI', 1);
INSERT INTO `proceso_distrito` VALUES (368, 37, 'ATICO', 1);
INSERT INTO `proceso_distrito` VALUES (369, 37, 'ATIQUIPA', 1);
INSERT INTO `proceso_distrito` VALUES (370, 37, 'BELLA UNION', 1);
INSERT INTO `proceso_distrito` VALUES (371, 37, 'CAHUACHO', 1);
INSERT INTO `proceso_distrito` VALUES (372, 37, 'CARAVELI', 1);
INSERT INTO `proceso_distrito` VALUES (373, 37, 'CHALA', 1);
INSERT INTO `proceso_distrito` VALUES (374, 37, 'CHAPARRA', 1);
INSERT INTO `proceso_distrito` VALUES (375, 37, 'HUANUHUANU', 1);
INSERT INTO `proceso_distrito` VALUES (376, 37, 'JAQUI', 1);
INSERT INTO `proceso_distrito` VALUES (377, 37, 'LOMAS', 1);
INSERT INTO `proceso_distrito` VALUES (378, 37, 'QUICACHA', 1);
INSERT INTO `proceso_distrito` VALUES (379, 37, 'YAUCA', 1);
INSERT INTO `proceso_distrito` VALUES (380, 38, 'ANDAGUA', 1);
INSERT INTO `proceso_distrito` VALUES (381, 38, 'APLAO', 1);
INSERT INTO `proceso_distrito` VALUES (382, 38, 'AYO', 1);
INSERT INTO `proceso_distrito` VALUES (383, 38, 'CHACHAS', 1);
INSERT INTO `proceso_distrito` VALUES (384, 38, 'CHILCAYMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (385, 38, 'CHOCO', 1);
INSERT INTO `proceso_distrito` VALUES (386, 38, 'HUANCARQUI', 1);
INSERT INTO `proceso_distrito` VALUES (387, 38, 'MACHAGUAY', 1);
INSERT INTO `proceso_distrito` VALUES (388, 38, 'ORCOPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (389, 38, 'PAMPACOLCA', 1);
INSERT INTO `proceso_distrito` VALUES (390, 38, 'TIPAN', 1);
INSERT INTO `proceso_distrito` VALUES (391, 38, 'UÑON', 1);
INSERT INTO `proceso_distrito` VALUES (392, 38, 'URACA', 1);
INSERT INTO `proceso_distrito` VALUES (393, 38, 'VIRACO', 1);
INSERT INTO `proceso_distrito` VALUES (394, 39, 'ACHOMA', 1);
INSERT INTO `proceso_distrito` VALUES (395, 39, 'CABANACONDE', 1);
INSERT INTO `proceso_distrito` VALUES (396, 39, 'CALLALLI', 1);
INSERT INTO `proceso_distrito` VALUES (397, 39, 'CAYLLOMA', 1);
INSERT INTO `proceso_distrito` VALUES (398, 39, 'CHIVAY', 1);
INSERT INTO `proceso_distrito` VALUES (399, 39, 'COPORAQUE', 1);
INSERT INTO `proceso_distrito` VALUES (400, 39, 'HUAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (401, 39, 'HUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (402, 39, 'ICHUPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (403, 39, 'LARI', 1);
INSERT INTO `proceso_distrito` VALUES (404, 39, 'LLUTA', 1);
INSERT INTO `proceso_distrito` VALUES (405, 39, 'MACA', 1);
INSERT INTO `proceso_distrito` VALUES (406, 39, 'MADRIGAL', 1);
INSERT INTO `proceso_distrito` VALUES (407, 39, 'MAJES', 1);
INSERT INTO `proceso_distrito` VALUES (408, 39, 'SAN ANTONIO DE CHUCA', 1);
INSERT INTO `proceso_distrito` VALUES (409, 39, 'SIBAYO', 1);
INSERT INTO `proceso_distrito` VALUES (410, 39, 'TAPAY', 1);
INSERT INTO `proceso_distrito` VALUES (411, 39, 'TISCO', 1);
INSERT INTO `proceso_distrito` VALUES (412, 39, 'TUTI', 1);
INSERT INTO `proceso_distrito` VALUES (413, 39, 'YANQUE', 1);
INSERT INTO `proceso_distrito` VALUES (414, 40, 'ANDARAY', 1);
INSERT INTO `proceso_distrito` VALUES (415, 40, 'CAYARANI', 1);
INSERT INTO `proceso_distrito` VALUES (416, 40, 'CHICHAS', 1);
INSERT INTO `proceso_distrito` VALUES (417, 40, 'CHUQUIBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (418, 40, 'IRAY', 1);
INSERT INTO `proceso_distrito` VALUES (419, 40, 'RIO GRANDE', 1);
INSERT INTO `proceso_distrito` VALUES (420, 40, 'SALAMANCA', 1);
INSERT INTO `proceso_distrito` VALUES (421, 40, 'YANAQUIHUA', 1);
INSERT INTO `proceso_distrito` VALUES (422, 41, 'COCACHACRA', 1);
INSERT INTO `proceso_distrito` VALUES (423, 41, 'DEAN VALDIVIA', 1);
INSERT INTO `proceso_distrito` VALUES (424, 41, 'ISLAY', 1);
INSERT INTO `proceso_distrito` VALUES (425, 41, 'MEJIA', 1);
INSERT INTO `proceso_distrito` VALUES (426, 41, 'MOLLENDO', 1);
INSERT INTO `proceso_distrito` VALUES (427, 41, 'PUNTA DE BOMBON', 1);
INSERT INTO `proceso_distrito` VALUES (428, 42, 'ALCA', 1);
INSERT INTO `proceso_distrito` VALUES (429, 42, 'CHARCANA', 1);
INSERT INTO `proceso_distrito` VALUES (430, 42, 'COTAHUASI', 1);
INSERT INTO `proceso_distrito` VALUES (431, 42, 'HUAYNACOTAS', 1);
INSERT INTO `proceso_distrito` VALUES (432, 42, 'PAMPAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (433, 42, 'PUYCA', 1);
INSERT INTO `proceso_distrito` VALUES (434, 42, 'QUECHUALLA', 1);
INSERT INTO `proceso_distrito` VALUES (435, 42, 'SAYLA', 1);
INSERT INTO `proceso_distrito` VALUES (436, 42, 'TAURIA', 1);
INSERT INTO `proceso_distrito` VALUES (437, 42, 'TOMEPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (438, 42, 'TORO', 1);
INSERT INTO `proceso_distrito` VALUES (439, 43, 'CANGALLO', 1);
INSERT INTO `proceso_distrito` VALUES (440, 43, 'CHUSCHI', 1);
INSERT INTO `proceso_distrito` VALUES (441, 43, 'LOS MOROCHUCOS', 1);
INSERT INTO `proceso_distrito` VALUES (442, 43, 'MARIA PARADO DE BELLIDO', 1);
INSERT INTO `proceso_distrito` VALUES (443, 43, 'PARAS', 1);
INSERT INTO `proceso_distrito` VALUES (444, 43, 'TOTOS', 1);
INSERT INTO `proceso_distrito` VALUES (445, 44, 'ACOCRO', 1);
INSERT INTO `proceso_distrito` VALUES (446, 44, 'ACOS VINCHOS', 1);
INSERT INTO `proceso_distrito` VALUES (447, 44, 'AYACUCHO', 1);
INSERT INTO `proceso_distrito` VALUES (448, 44, 'CARMEN ALTO', 1);
INSERT INTO `proceso_distrito` VALUES (449, 44, 'CHIARA', 1);
INSERT INTO `proceso_distrito` VALUES (450, 44, 'JESUS NAZARENO', 1);
INSERT INTO `proceso_distrito` VALUES (451, 44, 'OCROS', 1);
INSERT INTO `proceso_distrito` VALUES (452, 44, 'PACAYCASA', 1);
INSERT INTO `proceso_distrito` VALUES (453, 44, 'QUINUA', 1);
INSERT INTO `proceso_distrito` VALUES (454, 44, 'SAN JOSE DE TICLLAS', 1);
INSERT INTO `proceso_distrito` VALUES (455, 44, 'SAN JUAN BAUTISTA', 1);
INSERT INTO `proceso_distrito` VALUES (456, 44, 'SANTIAGO DE PISCHA', 1);
INSERT INTO `proceso_distrito` VALUES (457, 44, 'SOCOS', 1);
INSERT INTO `proceso_distrito` VALUES (458, 44, 'TAMBILLO', 1);
INSERT INTO `proceso_distrito` VALUES (459, 44, 'VINCHOS', 1);
INSERT INTO `proceso_distrito` VALUES (460, 45, 'CARAPO', 1);
INSERT INTO `proceso_distrito` VALUES (461, 45, 'SACSAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (462, 45, 'SANCOS', 1);
INSERT INTO `proceso_distrito` VALUES (463, 45, 'SANTIAGO DE LUCANAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (464, 46, 'AYAHUANCO', 1);
INSERT INTO `proceso_distrito` VALUES (465, 46, 'HUAMANGUILLA', 1);
INSERT INTO `proceso_distrito` VALUES (466, 46, 'HUANTA', 1);
INSERT INTO `proceso_distrito` VALUES (467, 46, 'IGUAIN', 1);
INSERT INTO `proceso_distrito` VALUES (468, 46, 'LLOCHEGUA', 1);
INSERT INTO `proceso_distrito` VALUES (469, 46, 'LURICOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (470, 46, 'SANTILLANA', 1);
INSERT INTO `proceso_distrito` VALUES (471, 46, 'SIVIA', 1);
INSERT INTO `proceso_distrito` VALUES (472, 47, 'ANCO', 1);
INSERT INTO `proceso_distrito` VALUES (473, 47, 'AYNA', 1);
INSERT INTO `proceso_distrito` VALUES (474, 47, 'CHILCAS', 1);
INSERT INTO `proceso_distrito` VALUES (475, 47, 'CHUNGUI', 1);
INSERT INTO `proceso_distrito` VALUES (476, 47, 'LUIS CARRANZA', 1);
INSERT INTO `proceso_distrito` VALUES (477, 47, 'SAN MIGUEL', 1);
INSERT INTO `proceso_distrito` VALUES (478, 47, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (479, 47, 'TAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (480, 48, 'AUCARA', 1);
INSERT INTO `proceso_distrito` VALUES (481, 48, 'CABANA', 1);
INSERT INTO `proceso_distrito` VALUES (482, 48, 'CARMEN SALCEDO', 1);
INSERT INTO `proceso_distrito` VALUES (483, 48, 'CHAVIÑA', 1);
INSERT INTO `proceso_distrito` VALUES (484, 48, 'CHIPAO', 1);
INSERT INTO `proceso_distrito` VALUES (485, 48, 'HUAC-HUAS', 1);
INSERT INTO `proceso_distrito` VALUES (486, 48, 'LARAMATE', 1);
INSERT INTO `proceso_distrito` VALUES (487, 48, 'LEONCIO PRADO', 1);
INSERT INTO `proceso_distrito` VALUES (488, 48, 'LLAUTA', 1);
INSERT INTO `proceso_distrito` VALUES (489, 48, 'LUCANAS', 1);
INSERT INTO `proceso_distrito` VALUES (490, 48, 'OCAÑA', 1);
INSERT INTO `proceso_distrito` VALUES (491, 48, 'OTOCA', 1);
INSERT INTO `proceso_distrito` VALUES (492, 48, 'PUQUIO', 1);
INSERT INTO `proceso_distrito` VALUES (493, 48, 'SAISA', 1);
INSERT INTO `proceso_distrito` VALUES (494, 48, 'SAN CRISTOBAL', 1);
INSERT INTO `proceso_distrito` VALUES (495, 48, 'SAN JUAN', 1);
INSERT INTO `proceso_distrito` VALUES (496, 48, 'SAN PEDRO', 1);
INSERT INTO `proceso_distrito` VALUES (497, 48, 'SAN PEDRO DE PALCO', 1);
INSERT INTO `proceso_distrito` VALUES (498, 48, 'SANCOS', 1);
INSERT INTO `proceso_distrito` VALUES (499, 48, 'SANTA ANA DE HUAYCAHUACHO', 1);
INSERT INTO `proceso_distrito` VALUES (500, 48, 'SANTA LUCIA', 1);
INSERT INTO `proceso_distrito` VALUES (501, 49, 'CHUMPI', 1);
INSERT INTO `proceso_distrito` VALUES (502, 49, 'CORACORA', 1);
INSERT INTO `proceso_distrito` VALUES (503, 49, 'CORONEL CASTAÑEDA', 1);
INSERT INTO `proceso_distrito` VALUES (504, 49, 'PACAPAUSA', 1);
INSERT INTO `proceso_distrito` VALUES (505, 49, 'PULLO', 1);
INSERT INTO `proceso_distrito` VALUES (506, 49, 'PUYUSCA', 1);
INSERT INTO `proceso_distrito` VALUES (507, 49, 'SAN FRANCISCO DE RAVACAYCO', 1);
INSERT INTO `proceso_distrito` VALUES (508, 49, 'UPAHUACHO', 1);
INSERT INTO `proceso_distrito` VALUES (509, 50, 'COLTA', 1);
INSERT INTO `proceso_distrito` VALUES (510, 50, 'CORCULLA', 1);
INSERT INTO `proceso_distrito` VALUES (511, 50, 'LAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (512, 50, 'MARCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (513, 50, 'OYOLO', 1);
INSERT INTO `proceso_distrito` VALUES (514, 50, 'PARARCA', 1);
INSERT INTO `proceso_distrito` VALUES (515, 50, 'PAUSA', 1);
INSERT INTO `proceso_distrito` VALUES (516, 50, 'SAN JAVIER DE ALPABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (517, 50, 'SAN JOSE DE USHUA', 1);
INSERT INTO `proceso_distrito` VALUES (518, 50, 'SARA SARA', 1);
INSERT INTO `proceso_distrito` VALUES (519, 51, 'BELEN', 1);
INSERT INTO `proceso_distrito` VALUES (520, 51, 'CHALCOS', 1);
INSERT INTO `proceso_distrito` VALUES (521, 51, 'CHILCAYOC', 1);
INSERT INTO `proceso_distrito` VALUES (522, 51, 'HUACAÑA', 1);
INSERT INTO `proceso_distrito` VALUES (523, 51, 'MORCOLLA', 1);
INSERT INTO `proceso_distrito` VALUES (524, 51, 'PAICO', 1);
INSERT INTO `proceso_distrito` VALUES (525, 51, 'QUEROBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (526, 51, 'SAN PEDRO DE LARCAY', 1);
INSERT INTO `proceso_distrito` VALUES (527, 51, 'SAN SALVADOR DE QUIJE', 1);
INSERT INTO `proceso_distrito` VALUES (528, 51, 'SANTIAGO DE PAUCARAY', 1);
INSERT INTO `proceso_distrito` VALUES (529, 51, 'SORAS', 1);
INSERT INTO `proceso_distrito` VALUES (530, 52, 'ALCAMENCA', 1);
INSERT INTO `proceso_distrito` VALUES (531, 52, 'APONGO', 1);
INSERT INTO `proceso_distrito` VALUES (532, 52, 'ASQUIPATA', 1);
INSERT INTO `proceso_distrito` VALUES (533, 52, 'CANARIA', 1);
INSERT INTO `proceso_distrito` VALUES (534, 52, 'CAYARA', 1);
INSERT INTO `proceso_distrito` VALUES (535, 52, 'COLCA', 1);
INSERT INTO `proceso_distrito` VALUES (536, 52, 'HUAMANQUIQUIA', 1);
INSERT INTO `proceso_distrito` VALUES (537, 52, 'HUANCAPI', 1);
INSERT INTO `proceso_distrito` VALUES (538, 52, 'HUANCARAYLLA', 1);
INSERT INTO `proceso_distrito` VALUES (539, 52, 'HUAYA', 1);
INSERT INTO `proceso_distrito` VALUES (540, 52, 'SARHUA', 1);
INSERT INTO `proceso_distrito` VALUES (541, 52, 'VILCANCHOS', 1);
INSERT INTO `proceso_distrito` VALUES (542, 53, 'ACCOMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (543, 53, 'CARHUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (544, 53, 'CONCEPCION', 1);
INSERT INTO `proceso_distrito` VALUES (545, 53, 'HUAMBALPA', 1);
INSERT INTO `proceso_distrito` VALUES (546, 53, 'INDEPENDENCIA', 1);
INSERT INTO `proceso_distrito` VALUES (547, 53, 'SAURAMA', 1);
INSERT INTO `proceso_distrito` VALUES (548, 53, 'VILCAS HUAMAN', 1);
INSERT INTO `proceso_distrito` VALUES (549, 53, 'VISCHONGO', 1);
INSERT INTO `proceso_distrito` VALUES (550, 54, 'CACHACHI', 1);
INSERT INTO `proceso_distrito` VALUES (551, 54, 'CAJABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (552, 54, 'CONDEBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (553, 54, 'SITACOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (554, 55, 'ASUNCION', 1);
INSERT INTO `proceso_distrito` VALUES (555, 55, 'CAJAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (556, 55, 'CHETILLA', 1);
INSERT INTO `proceso_distrito` VALUES (557, 55, 'COSPAN', 1);
INSERT INTO `proceso_distrito` VALUES (558, 55, 'ENCAÑADA', 1);
INSERT INTO `proceso_distrito` VALUES (559, 55, 'JESUS', 1);
INSERT INTO `proceso_distrito` VALUES (560, 55, 'LLACANORA', 1);
INSERT INTO `proceso_distrito` VALUES (561, 55, 'LOS BAÑOS DEL INCA', 1);
INSERT INTO `proceso_distrito` VALUES (562, 55, 'MAGDALENA', 1);
INSERT INTO `proceso_distrito` VALUES (563, 55, 'MATARA', 1);
INSERT INTO `proceso_distrito` VALUES (564, 55, 'NAMORA', 1);
INSERT INTO `proceso_distrito` VALUES (565, 55, 'SAN JUAN', 1);
INSERT INTO `proceso_distrito` VALUES (566, 56, 'CELENDIN', 1);
INSERT INTO `proceso_distrito` VALUES (567, 56, 'CHUMUCH', 1);
INSERT INTO `proceso_distrito` VALUES (568, 56, 'CORTEGANA', 1);
INSERT INTO `proceso_distrito` VALUES (569, 56, 'HUASMIN', 1);
INSERT INTO `proceso_distrito` VALUES (570, 56, 'JORGE CHAVEZ', 1);
INSERT INTO `proceso_distrito` VALUES (571, 56, 'JOSE GALVEZ', 1);
INSERT INTO `proceso_distrito` VALUES (572, 56, 'LA LIBERTAD DE PALLAN', 1);
INSERT INTO `proceso_distrito` VALUES (573, 56, 'MIGUEL IGLESIAS', 1);
INSERT INTO `proceso_distrito` VALUES (574, 56, 'OXAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (575, 56, 'SOROCHUCO', 1);
INSERT INTO `proceso_distrito` VALUES (576, 56, 'SUCRE', 1);
INSERT INTO `proceso_distrito` VALUES (577, 56, 'UTCO', 1);
INSERT INTO `proceso_distrito` VALUES (578, 57, 'ANGUIA', 1);
INSERT INTO `proceso_distrito` VALUES (579, 57, 'CHADIN', 1);
INSERT INTO `proceso_distrito` VALUES (580, 57, 'CHALAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (581, 57, 'CHIGUIRIP', 1);
INSERT INTO `proceso_distrito` VALUES (582, 57, 'CHIMBAN', 1);
INSERT INTO `proceso_distrito` VALUES (583, 57, 'CHOROPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (584, 57, 'CHOTA', 1);
INSERT INTO `proceso_distrito` VALUES (585, 57, 'COCHABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (586, 57, 'CONCHAN', 1);
INSERT INTO `proceso_distrito` VALUES (587, 57, 'HUAMBOS', 1);
INSERT INTO `proceso_distrito` VALUES (588, 57, 'LAJAS', 1);
INSERT INTO `proceso_distrito` VALUES (589, 57, 'LLAMA', 1);
INSERT INTO `proceso_distrito` VALUES (590, 57, 'MIRACOSTA', 1);
INSERT INTO `proceso_distrito` VALUES (591, 57, 'PACCHA', 1);
INSERT INTO `proceso_distrito` VALUES (592, 57, 'PION', 1);
INSERT INTO `proceso_distrito` VALUES (593, 57, 'QUEROCOTO', 1);
INSERT INTO `proceso_distrito` VALUES (594, 57, 'SAN JUAN DE LICUPIS', 1);
INSERT INTO `proceso_distrito` VALUES (595, 57, 'TACABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (596, 57, 'TOCMOCHE', 1);
INSERT INTO `proceso_distrito` VALUES (597, 58, 'CHILETE', 1);
INSERT INTO `proceso_distrito` VALUES (598, 58, 'CONTUMAZA', 1);
INSERT INTO `proceso_distrito` VALUES (599, 58, 'CUPISNIQUE', 1);
INSERT INTO `proceso_distrito` VALUES (600, 58, 'GUZMANGO', 1);
INSERT INTO `proceso_distrito` VALUES (601, 58, 'SAN BENITO', 1);
INSERT INTO `proceso_distrito` VALUES (602, 58, 'SANTA CRUZ DE TOLEDO', 1);
INSERT INTO `proceso_distrito` VALUES (603, 58, 'TANTARICA', 1);
INSERT INTO `proceso_distrito` VALUES (604, 58, 'YONAN', 1);
INSERT INTO `proceso_distrito` VALUES (605, 59, 'CALLAYUC', 1);
INSERT INTO `proceso_distrito` VALUES (606, 59, 'CHOROS', 1);
INSERT INTO `proceso_distrito` VALUES (607, 59, 'CUJILLO', 1);
INSERT INTO `proceso_distrito` VALUES (608, 59, 'CUTERVO', 1);
INSERT INTO `proceso_distrito` VALUES (609, 59, 'LA RAMADA', 1);
INSERT INTO `proceso_distrito` VALUES (610, 59, 'PIMPINGOS', 1);
INSERT INTO `proceso_distrito` VALUES (611, 59, 'QUEROCOTILLO', 1);
INSERT INTO `proceso_distrito` VALUES (612, 59, 'SAN ANDRES DE CUTERVO', 1);
INSERT INTO `proceso_distrito` VALUES (613, 59, 'SAN JUAN DE CUTERVO', 1);
INSERT INTO `proceso_distrito` VALUES (614, 59, 'SAN LUIS DE LUCMA', 1);
INSERT INTO `proceso_distrito` VALUES (615, 59, 'SANTA CRUZ', 1);
INSERT INTO `proceso_distrito` VALUES (616, 59, 'SANTO TOMAS', 1);
INSERT INTO `proceso_distrito` VALUES (617, 59, 'SOCOTA', 1);
INSERT INTO `proceso_distrito` VALUES (618, 59, 'STO. DOMINGO DE LA CAPILLA', 1);
INSERT INTO `proceso_distrito` VALUES (619, 59, 'TORIBIO CASANOVA', 1);
INSERT INTO `proceso_distrito` VALUES (620, 60, 'BAMBAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (621, 60, 'CHUGUR', 1);
INSERT INTO `proceso_distrito` VALUES (622, 60, 'HUALGAYOC', 1);
INSERT INTO `proceso_distrito` VALUES (623, 61, 'BELLAVISTA', 1);
INSERT INTO `proceso_distrito` VALUES (624, 61, 'CHONTALI', 1);
INSERT INTO `proceso_distrito` VALUES (625, 61, 'COLASAY', 1);
INSERT INTO `proceso_distrito` VALUES (626, 61, 'HUABAL', 1);
INSERT INTO `proceso_distrito` VALUES (627, 61, 'JAEN', 1);
INSERT INTO `proceso_distrito` VALUES (628, 61, 'LAS PIRIAS', 1);
INSERT INTO `proceso_distrito` VALUES (629, 61, 'POMAHUACA', 1);
INSERT INTO `proceso_distrito` VALUES (630, 61, 'PUCARA', 1);
INSERT INTO `proceso_distrito` VALUES (631, 61, 'SALLIQUE', 1);
INSERT INTO `proceso_distrito` VALUES (632, 61, 'SAN FELIPE', 1);
INSERT INTO `proceso_distrito` VALUES (633, 61, 'SAN JOSE DEL ALTO', 1);
INSERT INTO `proceso_distrito` VALUES (634, 61, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (635, 62, 'CHIRINOS', 1);
INSERT INTO `proceso_distrito` VALUES (636, 62, 'HUARANGO', 1);
INSERT INTO `proceso_distrito` VALUES (637, 62, 'LA COIPA', 1);
INSERT INTO `proceso_distrito` VALUES (638, 62, 'NAMBALLE', 1);
INSERT INTO `proceso_distrito` VALUES (639, 62, 'SAN IGNACIO', 1);
INSERT INTO `proceso_distrito` VALUES (640, 62, 'SAN JOSE DE LOURDES', 1);
INSERT INTO `proceso_distrito` VALUES (641, 62, 'TABACONAS', 1);
INSERT INTO `proceso_distrito` VALUES (642, 63, 'CHANCAY', 1);
INSERT INTO `proceso_distrito` VALUES (643, 63, 'EDUARDO VILLANUEVA', 1);
INSERT INTO `proceso_distrito` VALUES (644, 63, 'GREGORIO PITA', 1);
INSERT INTO `proceso_distrito` VALUES (645, 63, 'ICHOCAN', 1);
INSERT INTO `proceso_distrito` VALUES (646, 63, 'JOSE MANUEL QUIROZ', 1);
INSERT INTO `proceso_distrito` VALUES (647, 63, 'JOSE SABOGAL', 1);
INSERT INTO `proceso_distrito` VALUES (648, 63, 'PEDRO GALVEZ', 1);
INSERT INTO `proceso_distrito` VALUES (649, 64, 'BOLIVAR', 1);
INSERT INTO `proceso_distrito` VALUES (650, 64, 'CALQUIS', 1);
INSERT INTO `proceso_distrito` VALUES (651, 64, 'CATILLUC', 1);
INSERT INTO `proceso_distrito` VALUES (652, 64, 'EL PRADO', 1);
INSERT INTO `proceso_distrito` VALUES (653, 64, 'LA FLORIDA', 1);
INSERT INTO `proceso_distrito` VALUES (654, 64, 'LLAPA', 1);
INSERT INTO `proceso_distrito` VALUES (655, 64, 'NANCHOC', 1);
INSERT INTO `proceso_distrito` VALUES (656, 64, 'NIEPOS', 1);
INSERT INTO `proceso_distrito` VALUES (657, 64, 'SAN GREGORIO', 1);
INSERT INTO `proceso_distrito` VALUES (658, 64, 'SAN MIGUEL', 1);
INSERT INTO `proceso_distrito` VALUES (659, 64, 'SAN SILVESTRE DE COCHAN', 1);
INSERT INTO `proceso_distrito` VALUES (660, 64, 'TONGOD', 1);
INSERT INTO `proceso_distrito` VALUES (661, 64, 'UNION AGUA BLANCA', 1);
INSERT INTO `proceso_distrito` VALUES (662, 65, 'SAN BERNARDINO', 1);
INSERT INTO `proceso_distrito` VALUES (663, 65, 'SAN LUIS', 1);
INSERT INTO `proceso_distrito` VALUES (664, 65, 'SAN PABLO', 1);
INSERT INTO `proceso_distrito` VALUES (665, 65, 'TUMBADEN', 1);
INSERT INTO `proceso_distrito` VALUES (666, 66, 'ANDABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (667, 66, 'CATACHE', 1);
INSERT INTO `proceso_distrito` VALUES (668, 66, 'CHANCAYBAÑOS', 1);
INSERT INTO `proceso_distrito` VALUES (669, 66, 'LA ESPERANZA', 1);
INSERT INTO `proceso_distrito` VALUES (670, 66, 'NINABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (671, 66, 'PULAN', 1);
INSERT INTO `proceso_distrito` VALUES (672, 66, 'SANTA CRUZ', 1);
INSERT INTO `proceso_distrito` VALUES (673, 66, 'SAUCEPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (674, 66, 'SEXI', 1);
INSERT INTO `proceso_distrito` VALUES (675, 66, 'UTICYACU', 1);
INSERT INTO `proceso_distrito` VALUES (676, 66, 'YAUYUCAN', 1);
INSERT INTO `proceso_distrito` VALUES (677, 67, 'ACOMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (678, 67, 'ACOPIA', 1);
INSERT INTO `proceso_distrito` VALUES (679, 67, 'ACOS', 1);
INSERT INTO `proceso_distrito` VALUES (680, 67, 'MOSOC LLACTA', 1);
INSERT INTO `proceso_distrito` VALUES (681, 67, 'POMACANCHI', 1);
INSERT INTO `proceso_distrito` VALUES (682, 67, 'RONDOCAN', 1);
INSERT INTO `proceso_distrito` VALUES (683, 67, 'SANGARARA', 1);
INSERT INTO `proceso_distrito` VALUES (684, 68, 'ANCAHUASI', 1);
INSERT INTO `proceso_distrito` VALUES (685, 68, 'ANTA', 1);
INSERT INTO `proceso_distrito` VALUES (686, 68, 'CACHIMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (687, 68, 'CHINCHAYPUJIO', 1);
INSERT INTO `proceso_distrito` VALUES (688, 68, 'HUAROCONDO', 1);
INSERT INTO `proceso_distrito` VALUES (689, 68, 'LIMATAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (690, 68, 'MOLLEPATA', 1);
INSERT INTO `proceso_distrito` VALUES (691, 68, 'PUCYURA', 1);
INSERT INTO `proceso_distrito` VALUES (692, 68, 'ZURITE', 1);
INSERT INTO `proceso_distrito` VALUES (693, 69, 'CALCA', 1);
INSERT INTO `proceso_distrito` VALUES (694, 69, 'COYA', 1);
INSERT INTO `proceso_distrito` VALUES (695, 69, 'LAMAY', 1);
INSERT INTO `proceso_distrito` VALUES (696, 69, 'LARES', 1);
INSERT INTO `proceso_distrito` VALUES (697, 69, 'PISAC', 1);
INSERT INTO `proceso_distrito` VALUES (698, 69, 'SAN SALVADOR', 1);
INSERT INTO `proceso_distrito` VALUES (699, 69, 'TARAY', 1);
INSERT INTO `proceso_distrito` VALUES (700, 69, 'YANATILE', 1);
INSERT INTO `proceso_distrito` VALUES (701, 70, 'CHECCA', 1);
INSERT INTO `proceso_distrito` VALUES (702, 70, 'KUNTURKANKI', 1);
INSERT INTO `proceso_distrito` VALUES (703, 70, 'LANGUI', 1);
INSERT INTO `proceso_distrito` VALUES (704, 70, 'LAYO', 1);
INSERT INTO `proceso_distrito` VALUES (705, 70, 'PAMPAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (706, 70, 'QUEHUE', 1);
INSERT INTO `proceso_distrito` VALUES (707, 70, 'TUPAC AMARU', 1);
INSERT INTO `proceso_distrito` VALUES (708, 70, 'YANAOCA', 1);
INSERT INTO `proceso_distrito` VALUES (709, 71, 'CHECACUPE', 1);
INSERT INTO `proceso_distrito` VALUES (710, 71, 'COMBAPATA', 1);
INSERT INTO `proceso_distrito` VALUES (711, 71, 'MARANGANI', 1);
INSERT INTO `proceso_distrito` VALUES (712, 71, 'PITUMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (713, 71, 'SAN PABLO', 1);
INSERT INTO `proceso_distrito` VALUES (714, 71, 'SAN PEDRO', 1);
INSERT INTO `proceso_distrito` VALUES (715, 71, 'SICUANI', 1);
INSERT INTO `proceso_distrito` VALUES (716, 71, 'TINTA', 1);
INSERT INTO `proceso_distrito` VALUES (717, 72, 'CAPACMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (718, 72, 'CHAMACA', 1);
INSERT INTO `proceso_distrito` VALUES (719, 72, 'COLQUEMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (720, 72, 'LIVITACA', 1);
INSERT INTO `proceso_distrito` VALUES (721, 72, 'LLUSCO', 1);
INSERT INTO `proceso_distrito` VALUES (722, 72, 'QUIÑOTA', 1);
INSERT INTO `proceso_distrito` VALUES (723, 72, 'SANTO TOMAS', 1);
INSERT INTO `proceso_distrito` VALUES (724, 72, 'VELILLE', 1);
INSERT INTO `proceso_distrito` VALUES (725, 73, 'CCORCA', 1);
INSERT INTO `proceso_distrito` VALUES (726, 73, 'CUSCO', 1);
INSERT INTO `proceso_distrito` VALUES (727, 73, 'POROY', 1);
INSERT INTO `proceso_distrito` VALUES (728, 73, 'SAN JERONIMO', 1);
INSERT INTO `proceso_distrito` VALUES (729, 73, 'SAN SEBASTIAN', 1);
INSERT INTO `proceso_distrito` VALUES (730, 73, 'SANTIAGO', 1);
INSERT INTO `proceso_distrito` VALUES (731, 73, 'SAYLLA', 1);
INSERT INTO `proceso_distrito` VALUES (732, 73, 'WANCHAQ', 1);
INSERT INTO `proceso_distrito` VALUES (733, 74, 'ALTO PICHIGUA', 1);
INSERT INTO `proceso_distrito` VALUES (734, 74, 'CONDOROMA', 1);
INSERT INTO `proceso_distrito` VALUES (735, 74, 'COPORAQUE', 1);
INSERT INTO `proceso_distrito` VALUES (736, 74, 'ESPINAR', 1);
INSERT INTO `proceso_distrito` VALUES (737, 74, 'OCORURO', 1);
INSERT INTO `proceso_distrito` VALUES (738, 74, 'PALLPATA', 1);
INSERT INTO `proceso_distrito` VALUES (739, 74, 'PICHIGUA', 1);
INSERT INTO `proceso_distrito` VALUES (740, 74, 'SUYCKUTAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (741, 75, 'ECHARATE', 1);
INSERT INTO `proceso_distrito` VALUES (742, 75, 'HUAYOPATA', 1);
INSERT INTO `proceso_distrito` VALUES (743, 75, 'MARANURA', 1);
INSERT INTO `proceso_distrito` VALUES (744, 75, 'OCOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (745, 75, 'PICHARI', 1);
INSERT INTO `proceso_distrito` VALUES (746, 75, 'QUELLOUNO', 1);
INSERT INTO `proceso_distrito` VALUES (747, 75, 'QUIMBIRI', 1);
INSERT INTO `proceso_distrito` VALUES (748, 75, 'SANTA ANA', 1);
INSERT INTO `proceso_distrito` VALUES (749, 75, 'SANTA TERESA', 1);
INSERT INTO `proceso_distrito` VALUES (750, 75, 'VILCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (751, 76, 'ACCHA', 1);
INSERT INTO `proceso_distrito` VALUES (752, 76, 'CCAPI', 1);
INSERT INTO `proceso_distrito` VALUES (753, 76, 'COLCHA', 1);
INSERT INTO `proceso_distrito` VALUES (754, 76, 'HUANOQUITE', 1);
INSERT INTO `proceso_distrito` VALUES (755, 76, 'OMACHA', 1);
INSERT INTO `proceso_distrito` VALUES (756, 76, 'PACCARITAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (757, 76, 'PARURO', 1);
INSERT INTO `proceso_distrito` VALUES (758, 76, 'PILLPINTO', 1);
INSERT INTO `proceso_distrito` VALUES (759, 76, 'YAURISQUE', 1);
INSERT INTO `proceso_distrito` VALUES (760, 77, 'CAICAY', 1);
INSERT INTO `proceso_distrito` VALUES (761, 77, 'CHALLABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (762, 77, 'COLQUEPATA', 1);
INSERT INTO `proceso_distrito` VALUES (763, 77, 'HUANCARANI', 1);
INSERT INTO `proceso_distrito` VALUES (764, 77, 'KOSÑIPATA', 1);
INSERT INTO `proceso_distrito` VALUES (765, 77, 'PAUCARTAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (766, 78, 'ANDAHUAYLILLAS', 1);
INSERT INTO `proceso_distrito` VALUES (767, 78, 'CAMANTI', 1);
INSERT INTO `proceso_distrito` VALUES (768, 78, 'CCARHUAYO', 1);
INSERT INTO `proceso_distrito` VALUES (769, 78, 'CCATCA', 1);
INSERT INTO `proceso_distrito` VALUES (770, 78, 'CUSIPATA', 1);
INSERT INTO `proceso_distrito` VALUES (771, 78, 'HUARO', 1);
INSERT INTO `proceso_distrito` VALUES (772, 78, 'LUCRE', 1);
INSERT INTO `proceso_distrito` VALUES (773, 78, 'MARCAPATA', 1);
INSERT INTO `proceso_distrito` VALUES (774, 78, 'OCONGATE', 1);
INSERT INTO `proceso_distrito` VALUES (775, 78, 'OROPESA', 1);
INSERT INTO `proceso_distrito` VALUES (776, 78, 'QUIQUIJANA', 1);
INSERT INTO `proceso_distrito` VALUES (777, 78, 'URCOS', 1);
INSERT INTO `proceso_distrito` VALUES (778, 79, 'CHINCHERO', 1);
INSERT INTO `proceso_distrito` VALUES (779, 79, 'HUAYLLABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (780, 79, 'MACHUPICCHU', 1);
INSERT INTO `proceso_distrito` VALUES (781, 79, 'MARAS', 1);
INSERT INTO `proceso_distrito` VALUES (782, 79, 'OLLANTAYTAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (783, 79, 'URUBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (784, 79, 'YUCAY', 1);
INSERT INTO `proceso_distrito` VALUES (785, 80, 'ACOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (786, 80, 'ANDABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (787, 80, 'ANTA', 1);
INSERT INTO `proceso_distrito` VALUES (788, 80, 'CAJA', 1);
INSERT INTO `proceso_distrito` VALUES (789, 80, 'MARCAS', 1);
INSERT INTO `proceso_distrito` VALUES (790, 80, 'PAUCARA', 1);
INSERT INTO `proceso_distrito` VALUES (791, 80, 'POMACOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (792, 80, 'ROSARIO', 1);
INSERT INTO `proceso_distrito` VALUES (793, 81, 'ANCHONGA', 1);
INSERT INTO `proceso_distrito` VALUES (794, 81, 'CALLANMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (795, 81, 'CCOCHACCASA', 1);
INSERT INTO `proceso_distrito` VALUES (796, 81, 'CHINCHO', 1);
INSERT INTO `proceso_distrito` VALUES (797, 81, 'CONGALLA', 1);
INSERT INTO `proceso_distrito` VALUES (798, 81, 'HUANCA-HUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (799, 81, 'HUAYLLAY GRANDE', 1);
INSERT INTO `proceso_distrito` VALUES (800, 81, 'JULCAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (801, 81, 'LIRCAY', 1);
INSERT INTO `proceso_distrito` VALUES (802, 81, 'SAN ANTONIO DE ANTAPARCO', 1);
INSERT INTO `proceso_distrito` VALUES (803, 81, 'SANTO TOMAS DE PATA', 1);
INSERT INTO `proceso_distrito` VALUES (804, 81, 'SECCLLA', 1);
INSERT INTO `proceso_distrito` VALUES (805, 82, 'ARMA', 1);
INSERT INTO `proceso_distrito` VALUES (806, 82, 'AURAHUA', 1);
INSERT INTO `proceso_distrito` VALUES (807, 82, 'CAPILLAS', 1);
INSERT INTO `proceso_distrito` VALUES (808, 82, 'CASTROVIRREYNA', 1);
INSERT INTO `proceso_distrito` VALUES (809, 82, 'CHUPAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (810, 82, 'COCAS', 1);
INSERT INTO `proceso_distrito` VALUES (811, 82, 'HUACHOS', 1);
INSERT INTO `proceso_distrito` VALUES (812, 82, 'HUAMATAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (813, 82, 'MOLLEPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (814, 82, 'SAN JUAN', 1);
INSERT INTO `proceso_distrito` VALUES (815, 82, 'SANTA ANA', 1);
INSERT INTO `proceso_distrito` VALUES (816, 82, 'TANTARA', 1);
INSERT INTO `proceso_distrito` VALUES (817, 82, 'TICRAPO', 1);
INSERT INTO `proceso_distrito` VALUES (818, 83, 'ANCO', 1);
INSERT INTO `proceso_distrito` VALUES (819, 83, 'CHINCHIHUASI', 1);
INSERT INTO `proceso_distrito` VALUES (820, 83, 'CHURCAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (821, 83, 'EL CARMEN', 1);
INSERT INTO `proceso_distrito` VALUES (822, 83, 'LA MERCED', 1);
INSERT INTO `proceso_distrito` VALUES (823, 83, 'LOCROJA', 1);
INSERT INTO `proceso_distrito` VALUES (824, 83, 'PACHAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (825, 83, 'PAUCARBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (826, 83, 'SAN MIGUEL DE MAYOCC', 1);
INSERT INTO `proceso_distrito` VALUES (827, 83, 'SAN PEDRO DE CORIS', 1);
INSERT INTO `proceso_distrito` VALUES (828, 84, 'ACOBAMBILLA', 1);
INSERT INTO `proceso_distrito` VALUES (829, 84, 'ACORIA', 1);
INSERT INTO `proceso_distrito` VALUES (830, 84, 'ASCENCION', 1);
INSERT INTO `proceso_distrito` VALUES (831, 84, 'CONAYCA', 1);
INSERT INTO `proceso_distrito` VALUES (832, 84, 'CUENCA', 1);
INSERT INTO `proceso_distrito` VALUES (833, 84, 'HUACHOCOLPA', 1);
INSERT INTO `proceso_distrito` VALUES (834, 84, 'HUANCAVELICA', 1);
INSERT INTO `proceso_distrito` VALUES (835, 84, 'HUANDO', 1);
INSERT INTO `proceso_distrito` VALUES (836, 84, 'HUANDO', 1);
INSERT INTO `proceso_distrito` VALUES (837, 84, 'HUAYLLAHUARA', 1);
INSERT INTO `proceso_distrito` VALUES (838, 84, 'IZCUCHACA', 1);
INSERT INTO `proceso_distrito` VALUES (839, 84, 'LARIA', 1);
INSERT INTO `proceso_distrito` VALUES (840, 84, 'MANTA', 1);
INSERT INTO `proceso_distrito` VALUES (841, 84, 'MARISCAL CACERES', 1);
INSERT INTO `proceso_distrito` VALUES (842, 84, 'MOYA', 1);
INSERT INTO `proceso_distrito` VALUES (843, 84, 'NUEVO OCCORO', 1);
INSERT INTO `proceso_distrito` VALUES (844, 84, 'PALCA', 1);
INSERT INTO `proceso_distrito` VALUES (845, 84, 'PILCHACA', 1);
INSERT INTO `proceso_distrito` VALUES (846, 84, 'VILCA', 1);
INSERT INTO `proceso_distrito` VALUES (847, 84, 'YAULI', 1);
INSERT INTO `proceso_distrito` VALUES (848, 85, 'AYAVI', 1);
INSERT INTO `proceso_distrito` VALUES (849, 85, 'CORDOVA', 1);
INSERT INTO `proceso_distrito` VALUES (850, 85, 'HUAYACUNDO ARMA', 1);
INSERT INTO `proceso_distrito` VALUES (851, 85, 'HUAYTARA', 1);
INSERT INTO `proceso_distrito` VALUES (852, 85, 'LARAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (853, 85, 'OCOYO', 1);
INSERT INTO `proceso_distrito` VALUES (854, 85, 'PILPICHACA', 1);
INSERT INTO `proceso_distrito` VALUES (855, 85, 'QUERCO', 1);
INSERT INTO `proceso_distrito` VALUES (856, 85, 'QUITO-ARMA', 1);
INSERT INTO `proceso_distrito` VALUES (857, 85, 'SAN ANTONIO DE CUSICANCHA', 1);
INSERT INTO `proceso_distrito` VALUES (858, 85, 'SAN FSCO. DE SANGAYAICO', 1);
INSERT INTO `proceso_distrito` VALUES (859, 85, 'SAN ISIDRO', 1);
INSERT INTO `proceso_distrito` VALUES (860, 85, 'SANTIAGO DE CHOCORVOS', 1);
INSERT INTO `proceso_distrito` VALUES (861, 85, 'SANTIAGO DE QUIRAHUARA', 1);
INSERT INTO `proceso_distrito` VALUES (862, 85, 'SANTO DOMINGO DE CAPILLAS', 1);
INSERT INTO `proceso_distrito` VALUES (863, 85, 'TAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (864, 86, 'ACOSTAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (865, 86, 'ACRAQUIA', 1);
INSERT INTO `proceso_distrito` VALUES (866, 86, 'AHUAYCHA', 1);
INSERT INTO `proceso_distrito` VALUES (867, 86, 'COLCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (868, 86, 'DANIEL HERNANDEZ', 1);
INSERT INTO `proceso_distrito` VALUES (869, 86, 'HUACHOCOLPA', 1);
INSERT INTO `proceso_distrito` VALUES (870, 86, 'HUARIBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (871, 86, 'PAMPAS', 1);
INSERT INTO `proceso_distrito` VALUES (872, 86, 'PAZOS', 1);
INSERT INTO `proceso_distrito` VALUES (873, 86, 'QUISHUAR', 1);
INSERT INTO `proceso_distrito` VALUES (874, 86, 'SALCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (875, 86, 'SALCAHUASI', 1);
INSERT INTO `proceso_distrito` VALUES (876, 86, 'SAN MARCOS DE ROCCHAC', 1);
INSERT INTO `proceso_distrito` VALUES (877, 86, 'SURCUBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (878, 86, 'TINTAY PUNCU', 1);
INSERT INTO `proceso_distrito` VALUES (879, 86, 'YAHUIMPUQUIO', 1);
INSERT INTO `proceso_distrito` VALUES (880, 87, 'AMBO', 1);
INSERT INTO `proceso_distrito` VALUES (881, 87, 'CAYNA', 1);
INSERT INTO `proceso_distrito` VALUES (882, 87, 'COLPAS', 1);
INSERT INTO `proceso_distrito` VALUES (883, 87, 'CONCHAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (884, 87, 'HUACAR', 1);
INSERT INTO `proceso_distrito` VALUES (885, 87, 'SAN FRANCISCO', 1);
INSERT INTO `proceso_distrito` VALUES (886, 87, 'SAN RAFAEL', 1);
INSERT INTO `proceso_distrito` VALUES (887, 87, 'TOMAYQUICHUA', 1);
INSERT INTO `proceso_distrito` VALUES (888, 88, 'CHUQUIS', 1);
INSERT INTO `proceso_distrito` VALUES (889, 88, 'LA UNION', 1);
INSERT INTO `proceso_distrito` VALUES (890, 88, 'MARIAS', 1);
INSERT INTO `proceso_distrito` VALUES (891, 88, 'PACHAS', 1);
INSERT INTO `proceso_distrito` VALUES (892, 88, 'QUIVILLA', 1);
INSERT INTO `proceso_distrito` VALUES (893, 88, 'RIPAN', 1);
INSERT INTO `proceso_distrito` VALUES (894, 88, 'SHUNQUI', 1);
INSERT INTO `proceso_distrito` VALUES (895, 88, 'SILLAPATA', 1);
INSERT INTO `proceso_distrito` VALUES (896, 88, 'YANAS', 1);
INSERT INTO `proceso_distrito` VALUES (897, 89, 'CANCHABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (898, 89, 'COCHABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (899, 89, 'HUACAYBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (900, 89, 'PINRA', 1);
INSERT INTO `proceso_distrito` VALUES (901, 90, 'ARANCAY', 1);
INSERT INTO `proceso_distrito` VALUES (902, 90, 'CHAVIN DE PARIARCA', 1);
INSERT INTO `proceso_distrito` VALUES (903, 90, 'JACAS GRANDE', 1);
INSERT INTO `proceso_distrito` VALUES (904, 90, 'JIRCAN', 1);
INSERT INTO `proceso_distrito` VALUES (905, 90, 'LLATA', 1);
INSERT INTO `proceso_distrito` VALUES (906, 90, 'MIRAFLORES', 1);
INSERT INTO `proceso_distrito` VALUES (907, 90, 'MONZON', 1);
INSERT INTO `proceso_distrito` VALUES (908, 90, 'PUNCHAO', 1);
INSERT INTO `proceso_distrito` VALUES (909, 90, 'PUÑOS', 1);
INSERT INTO `proceso_distrito` VALUES (910, 90, 'SINGA', 1);
INSERT INTO `proceso_distrito` VALUES (911, 90, 'TANTAMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (912, 91, 'AMARILIS', 1);
INSERT INTO `proceso_distrito` VALUES (913, 91, 'CHINCHAO', 1);
INSERT INTO `proceso_distrito` VALUES (914, 91, 'CHURUBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (915, 91, 'HUANUCO', 1);
INSERT INTO `proceso_distrito` VALUES (916, 91, 'MARGOS', 1);
INSERT INTO `proceso_distrito` VALUES (917, 91, 'PILCOMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (918, 91, 'QUISQUI', 1);
INSERT INTO `proceso_distrito` VALUES (919, 91, 'SAN FRANCISCO DE CAYRAN', 1);
INSERT INTO `proceso_distrito` VALUES (920, 91, 'SAN PEDRO DE CHAULAN', 1);
INSERT INTO `proceso_distrito` VALUES (921, 91, 'SANTA MARIA DEL VALLE', 1);
INSERT INTO `proceso_distrito` VALUES (922, 91, 'YARUMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (923, 92, 'BAÑOS', 1);
INSERT INTO `proceso_distrito` VALUES (924, 92, 'JESUS', 1);
INSERT INTO `proceso_distrito` VALUES (925, 92, 'JIVIA', 1);
INSERT INTO `proceso_distrito` VALUES (926, 92, 'QUEROPALCA', 1);
INSERT INTO `proceso_distrito` VALUES (927, 92, 'RONDOS', 1);
INSERT INTO `proceso_distrito` VALUES (928, 92, 'SAN FRANCISCO DE ASIS', 1);
INSERT INTO `proceso_distrito` VALUES (929, 92, 'SAN MIGUEL DE CAURI', 1);
INSERT INTO `proceso_distrito` VALUES (930, 93, 'DANIEL ALOMIA  ROBLES', 1);
INSERT INTO `proceso_distrito` VALUES (931, 93, 'HERMILIO VALDIZAN', 1);
INSERT INTO `proceso_distrito` VALUES (932, 93, 'JOSE CRESPO Y CASTILLO', 1);
INSERT INTO `proceso_distrito` VALUES (933, 93, 'LUYANDO', 1);
INSERT INTO `proceso_distrito` VALUES (934, 93, 'MARIANO DAMASO BERAUN', 1);
INSERT INTO `proceso_distrito` VALUES (935, 93, 'RUPA-RUPA', 1);
INSERT INTO `proceso_distrito` VALUES (936, 94, 'CHOLON', 1);
INSERT INTO `proceso_distrito` VALUES (937, 94, 'HUACRACHUCO', 1);
INSERT INTO `proceso_distrito` VALUES (938, 94, 'SAN BUENAVENTURA', 1);
INSERT INTO `proceso_distrito` VALUES (939, 95, 'CHAGLLA', 1);
INSERT INTO `proceso_distrito` VALUES (940, 95, 'MOLINO', 1);
INSERT INTO `proceso_distrito` VALUES (941, 95, 'PANAO', 1);
INSERT INTO `proceso_distrito` VALUES (942, 95, 'UMARI', 1);
INSERT INTO `proceso_distrito` VALUES (943, 96, 'CODO DEL POZUZO', 1);
INSERT INTO `proceso_distrito` VALUES (944, 96, 'HONORIA', 1);
INSERT INTO `proceso_distrito` VALUES (945, 96, 'PUERTO INCA', 1);
INSERT INTO `proceso_distrito` VALUES (946, 96, 'TOURNAVISTA', 1);
INSERT INTO `proceso_distrito` VALUES (947, 96, 'YUYAPICHIS', 1);
INSERT INTO `proceso_distrito` VALUES (948, 97, 'APARICIO POMARES', 1);
INSERT INTO `proceso_distrito` VALUES (949, 97, 'CAHUAC', 1);
INSERT INTO `proceso_distrito` VALUES (950, 97, 'CHACABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (951, 97, 'CHAVINILLO', 1);
INSERT INTO `proceso_distrito` VALUES (952, 97, 'CHORAS', 1);
INSERT INTO `proceso_distrito` VALUES (953, 97, 'JACAS CHICO', 1);
INSERT INTO `proceso_distrito` VALUES (954, 97, 'OBAS', 1);
INSERT INTO `proceso_distrito` VALUES (955, 97, 'PAMPAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (956, 98, 'ALTO LARAN', 1);
INSERT INTO `proceso_distrito` VALUES (957, 98, 'CHAVIN', 1);
INSERT INTO `proceso_distrito` VALUES (958, 98, 'CHINCHA ALTA', 1);
INSERT INTO `proceso_distrito` VALUES (959, 98, 'CHINCHA BAJA', 1);
INSERT INTO `proceso_distrito` VALUES (960, 98, 'EL CARMEN', 1);
INSERT INTO `proceso_distrito` VALUES (961, 98, 'GROCIO PRADO', 1);
INSERT INTO `proceso_distrito` VALUES (962, 98, 'PUEBLO NUEVO', 1);
INSERT INTO `proceso_distrito` VALUES (963, 98, 'SAN JUAN DE YANAC', 1);
INSERT INTO `proceso_distrito` VALUES (964, 98, 'SAN PEDRO DE HUACARPANA', 1);
INSERT INTO `proceso_distrito` VALUES (965, 98, 'SUNAMPE', 1);
INSERT INTO `proceso_distrito` VALUES (966, 98, 'TAMBO DE MORA', 1);
INSERT INTO `proceso_distrito` VALUES (967, 99, 'ICA', 1);
INSERT INTO `proceso_distrito` VALUES (968, 99, 'LA TINGUIÑA', 1);
INSERT INTO `proceso_distrito` VALUES (969, 99, 'LOS AQUIJES', 1);
INSERT INTO `proceso_distrito` VALUES (970, 99, 'OCUCAJE', 1);
INSERT INTO `proceso_distrito` VALUES (971, 99, 'PACHACUTEC', 1);
INSERT INTO `proceso_distrito` VALUES (972, 99, 'PARCONA', 1);
INSERT INTO `proceso_distrito` VALUES (973, 99, 'PUEBLO NUEVO', 1);
INSERT INTO `proceso_distrito` VALUES (974, 99, 'SALAS', 1);
INSERT INTO `proceso_distrito` VALUES (975, 99, 'SAN JOSE DE LOS MOLINOS', 1);
INSERT INTO `proceso_distrito` VALUES (976, 99, 'SAN JUAN BAUTISTA', 1);
INSERT INTO `proceso_distrito` VALUES (977, 99, 'SANTIAGO', 1);
INSERT INTO `proceso_distrito` VALUES (978, 99, 'SUBTANJALLA', 1);
INSERT INTO `proceso_distrito` VALUES (979, 99, 'TATE', 1);
INSERT INTO `proceso_distrito` VALUES (980, 99, 'YAUCA DEL ROSARIO', 1);
INSERT INTO `proceso_distrito` VALUES (981, 100, 'CHANGUILLO', 1);
INSERT INTO `proceso_distrito` VALUES (982, 100, 'EL INGENIO', 1);
INSERT INTO `proceso_distrito` VALUES (983, 100, 'MARCONA', 1);
INSERT INTO `proceso_distrito` VALUES (984, 100, 'NAZCA', 1);
INSERT INTO `proceso_distrito` VALUES (985, 100, 'VISTA ALEGRE', 1);
INSERT INTO `proceso_distrito` VALUES (986, 101, 'LLIPATA', 1);
INSERT INTO `proceso_distrito` VALUES (987, 101, 'PALPA', 1);
INSERT INTO `proceso_distrito` VALUES (988, 101, 'RIO GRANDE', 1);
INSERT INTO `proceso_distrito` VALUES (989, 101, 'SANTA CRUZ', 1);
INSERT INTO `proceso_distrito` VALUES (990, 101, 'TIBILLO', 1);
INSERT INTO `proceso_distrito` VALUES (991, 102, 'HUANCANO', 1);
INSERT INTO `proceso_distrito` VALUES (992, 102, 'HUMAY', 1);
INSERT INTO `proceso_distrito` VALUES (993, 102, 'INDEPENDENCIA', 1);
INSERT INTO `proceso_distrito` VALUES (994, 102, 'PARACAS', 1);
INSERT INTO `proceso_distrito` VALUES (995, 102, 'PISCO', 1);
INSERT INTO `proceso_distrito` VALUES (996, 102, 'SAN ANDRES', 1);
INSERT INTO `proceso_distrito` VALUES (997, 102, 'SAN CLEMENTE', 1);
INSERT INTO `proceso_distrito` VALUES (998, 102, 'TUPAC AMARU INCA', 1);
INSERT INTO `proceso_distrito` VALUES (999, 103, 'CHANCHAMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1000, 103, 'PERENE', 1);
INSERT INTO `proceso_distrito` VALUES (1001, 103, 'PICHANAQUI', 1);
INSERT INTO `proceso_distrito` VALUES (1002, 103, 'SAN LUIS DE SHUARO', 1);
INSERT INTO `proceso_distrito` VALUES (1003, 103, 'SAN RAMON', 1);
INSERT INTO `proceso_distrito` VALUES (1004, 103, 'VITOC', 1);
INSERT INTO `proceso_distrito` VALUES (1005, 104, 'AHUAC', 1);
INSERT INTO `proceso_distrito` VALUES (1006, 104, 'CHONGOS BAJO', 1);
INSERT INTO `proceso_distrito` VALUES (1007, 104, 'CHUPACA', 1);
INSERT INTO `proceso_distrito` VALUES (1008, 104, 'HUACHAC', 1);
INSERT INTO `proceso_distrito` VALUES (1009, 104, 'HUAMANCACA CHICO', 1);
INSERT INTO `proceso_distrito` VALUES (1010, 104, 'SAN JUAN DE ISCOS', 1);
INSERT INTO `proceso_distrito` VALUES (1011, 104, 'SAN JUAN DE JARPA', 1);
INSERT INTO `proceso_distrito` VALUES (1012, 104, 'TRES DE DICIEMBRE', 1);
INSERT INTO `proceso_distrito` VALUES (1013, 104, 'YANACANCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1014, 105, 'ACO', 1);
INSERT INTO `proceso_distrito` VALUES (1015, 105, 'ANDAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1016, 105, 'CHAMBARA', 1);
INSERT INTO `proceso_distrito` VALUES (1017, 105, 'COCHAS', 1);
INSERT INTO `proceso_distrito` VALUES (1018, 105, 'COMAS', 1);
INSERT INTO `proceso_distrito` VALUES (1019, 105, 'CONCEPCION', 1);
INSERT INTO `proceso_distrito` VALUES (1020, 105, 'HEROINAS TOLEDO', 1);
INSERT INTO `proceso_distrito` VALUES (1021, 105, 'MANZANARES', 1);
INSERT INTO `proceso_distrito` VALUES (1022, 105, 'MARISCAL CASTILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1023, 105, 'MATAHUASI', 1);
INSERT INTO `proceso_distrito` VALUES (1024, 105, 'MITO', 1);
INSERT INTO `proceso_distrito` VALUES (1025, 105, 'NUEVE DE JULIO', 1);
INSERT INTO `proceso_distrito` VALUES (1026, 105, 'ORCOTUNA', 1);
INSERT INTO `proceso_distrito` VALUES (1027, 105, 'SAN JOSE DE QUERO', 1);
INSERT INTO `proceso_distrito` VALUES (1028, 105, 'SANTA ROSA DE OCOPA', 1);
INSERT INTO `proceso_distrito` VALUES (1029, 106, 'CARHUACALLANGA', 1);
INSERT INTO `proceso_distrito` VALUES (1030, 106, 'CHACAPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1031, 106, 'CHICCHE', 1);
INSERT INTO `proceso_distrito` VALUES (1032, 106, 'CHILCA', 1);
INSERT INTO `proceso_distrito` VALUES (1033, 106, 'CHONGOS ALTO', 1);
INSERT INTO `proceso_distrito` VALUES (1034, 106, 'CHUPURO', 1);
INSERT INTO `proceso_distrito` VALUES (1035, 106, 'COLCA', 1);
INSERT INTO `proceso_distrito` VALUES (1036, 106, 'CULLHUAS', 1);
INSERT INTO `proceso_distrito` VALUES (1037, 106, 'EL TAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (1038, 106, 'HUACRAPUQUIO', 1);
INSERT INTO `proceso_distrito` VALUES (1039, 106, 'HUALHUAS', 1);
INSERT INTO `proceso_distrito` VALUES (1040, 106, 'HUANCAN', 1);
INSERT INTO `proceso_distrito` VALUES (1041, 106, 'HUANCAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1042, 106, 'HUASICANCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1043, 106, 'HUAYUCACHI', 1);
INSERT INTO `proceso_distrito` VALUES (1044, 106, 'INGENIO', 1);
INSERT INTO `proceso_distrito` VALUES (1045, 106, 'PARIAHUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (1046, 106, 'PILCOMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1047, 106, 'PUCARA', 1);
INSERT INTO `proceso_distrito` VALUES (1048, 106, 'QUICHUAY', 1);
INSERT INTO `proceso_distrito` VALUES (1049, 106, 'QUILCAS', 1);
INSERT INTO `proceso_distrito` VALUES (1050, 106, 'SAN AGUSTIN', 1);
INSERT INTO `proceso_distrito` VALUES (1051, 106, 'SAN JERONIMO DE TUNAN', 1);
INSERT INTO `proceso_distrito` VALUES (1052, 106, 'SANTO DOMINGO DE ACOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1053, 106, 'SAÑO', 1);
INSERT INTO `proceso_distrito` VALUES (1054, 106, 'SAPALLANGA', 1);
INSERT INTO `proceso_distrito` VALUES (1055, 106, 'SICAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1056, 106, 'VIQUES', 1);
INSERT INTO `proceso_distrito` VALUES (1057, 107, 'ACOLLA', 1);
INSERT INTO `proceso_distrito` VALUES (1058, 107, 'APATA', 1);
INSERT INTO `proceso_distrito` VALUES (1059, 107, 'ATAURA', 1);
INSERT INTO `proceso_distrito` VALUES (1060, 107, 'CANCHAYLLO', 1);
INSERT INTO `proceso_distrito` VALUES (1061, 107, 'CURICACA', 1);
INSERT INTO `proceso_distrito` VALUES (1062, 107, 'EL MANTARO', 1);
INSERT INTO `proceso_distrito` VALUES (1063, 107, 'HUAMALI', 1);
INSERT INTO `proceso_distrito` VALUES (1064, 107, 'HUARIPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1065, 107, 'HUERTAS', 1);
INSERT INTO `proceso_distrito` VALUES (1066, 107, 'JANJAILLO', 1);
INSERT INTO `proceso_distrito` VALUES (1067, 107, 'JAUJA', 1);
INSERT INTO `proceso_distrito` VALUES (1068, 107, 'JULCAN', 1);
INSERT INTO `proceso_distrito` VALUES (1069, 107, 'LEONOR ORDOÑEZ', 1);
INSERT INTO `proceso_distrito` VALUES (1070, 107, 'LLOCLLAPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1071, 107, 'MARCO', 1);
INSERT INTO `proceso_distrito` VALUES (1072, 107, 'MASMA', 1);
INSERT INTO `proceso_distrito` VALUES (1073, 107, 'MASMA CHICCHE', 1);
INSERT INTO `proceso_distrito` VALUES (1074, 107, 'MOLINOS', 1);
INSERT INTO `proceso_distrito` VALUES (1075, 107, 'MONOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1076, 107, 'MUQUI', 1);
INSERT INTO `proceso_distrito` VALUES (1077, 107, 'MUQUIYAUYO', 1);
INSERT INTO `proceso_distrito` VALUES (1078, 107, 'PACA', 1);
INSERT INTO `proceso_distrito` VALUES (1079, 107, 'PACCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1080, 107, 'PANCAN', 1);
INSERT INTO `proceso_distrito` VALUES (1081, 107, 'PARCO', 1);
INSERT INTO `proceso_distrito` VALUES (1082, 107, 'POMACANCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1083, 107, 'RICRAN', 1);
INSERT INTO `proceso_distrito` VALUES (1084, 107, 'SAN LORENZO', 1);
INSERT INTO `proceso_distrito` VALUES (1085, 107, 'SAN PEDRO DE CHUNAN', 1);
INSERT INTO `proceso_distrito` VALUES (1086, 107, 'SAUSA', 1);
INSERT INTO `proceso_distrito` VALUES (1087, 107, 'SINCOS', 1);
INSERT INTO `proceso_distrito` VALUES (1088, 107, 'TUNAN MARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1089, 107, 'YAULI', 1);
INSERT INTO `proceso_distrito` VALUES (1090, 107, 'YAUYOS', 1);
INSERT INTO `proceso_distrito` VALUES (1091, 108, 'CARHUAMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1092, 108, 'JUNIN', 1);
INSERT INTO `proceso_distrito` VALUES (1093, 108, 'ONDORES', 1);
INSERT INTO `proceso_distrito` VALUES (1094, 108, 'ULCUMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1095, 109, 'COVIRIALI', 1);
INSERT INTO `proceso_distrito` VALUES (1096, 109, 'LLAYLLA', 1);
INSERT INTO `proceso_distrito` VALUES (1097, 109, 'MAZAMARI', 1);
INSERT INTO `proceso_distrito` VALUES (1098, 109, 'PAMPA HERMOSA', 1);
INSERT INTO `proceso_distrito` VALUES (1099, 109, 'PANGOA', 1);
INSERT INTO `proceso_distrito` VALUES (1100, 109, 'RIO NEGRO', 1);
INSERT INTO `proceso_distrito` VALUES (1101, 109, 'RIO TAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (1102, 109, 'SATIPO', 1);
INSERT INTO `proceso_distrito` VALUES (1103, 110, 'ACOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1104, 110, 'HUARICOLCA', 1);
INSERT INTO `proceso_distrito` VALUES (1105, 110, 'HUASAHUASI', 1);
INSERT INTO `proceso_distrito` VALUES (1106, 110, 'LA UNION', 1);
INSERT INTO `proceso_distrito` VALUES (1107, 110, 'PALCA', 1);
INSERT INTO `proceso_distrito` VALUES (1108, 110, 'PALCAMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1109, 110, 'SAN PEDRO DE CAJAS', 1);
INSERT INTO `proceso_distrito` VALUES (1110, 110, 'TAPO', 1);
INSERT INTO `proceso_distrito` VALUES (1111, 110, 'TARMA', 1);
INSERT INTO `proceso_distrito` VALUES (1112, 111, 'CHACAPALPA', 1);
INSERT INTO `proceso_distrito` VALUES (1113, 111, 'HUAY-HUAY', 1);
INSERT INTO `proceso_distrito` VALUES (1114, 111, 'LA OROYA', 1);
INSERT INTO `proceso_distrito` VALUES (1115, 111, 'MARCAPOMACOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1116, 111, 'MOROCOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1117, 111, 'PACCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1118, 111, 'SANTA ROSA DE SACCO', 1);
INSERT INTO `proceso_distrito` VALUES (1119, 111, 'STA. BARBARA DE CARHUACAYAN', 1);
INSERT INTO `proceso_distrito` VALUES (1120, 111, 'SUITUCANCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1121, 111, 'YAULI', 1);
INSERT INTO `proceso_distrito` VALUES (1122, 112, 'ASCOPE', 1);
INSERT INTO `proceso_distrito` VALUES (1123, 112, 'CASA GRANDE', 1);
INSERT INTO `proceso_distrito` VALUES (1124, 112, 'CHICAMA', 1);
INSERT INTO `proceso_distrito` VALUES (1125, 112, 'CHOCOPE', 1);
INSERT INTO `proceso_distrito` VALUES (1126, 112, 'MAGDALENA DE CAO', 1);
INSERT INTO `proceso_distrito` VALUES (1127, 112, 'PAIJAN', 1);
INSERT INTO `proceso_distrito` VALUES (1128, 112, 'RAZURI', 1);
INSERT INTO `proceso_distrito` VALUES (1129, 112, 'SANTIAGO DE CAO', 1);
INSERT INTO `proceso_distrito` VALUES (1130, 113, 'BAMBAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1131, 113, 'BOLIVAR', 1);
INSERT INTO `proceso_distrito` VALUES (1132, 113, 'CONDORMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1133, 113, 'LONGOTEA', 1);
INSERT INTO `proceso_distrito` VALUES (1134, 113, 'UCHUMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1135, 113, 'UCUNCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1136, 114, 'CHEPEN', 1);
INSERT INTO `proceso_distrito` VALUES (1137, 114, 'PACANGA', 1);
INSERT INTO `proceso_distrito` VALUES (1138, 114, 'PUEBLO NUEVO', 1);
INSERT INTO `proceso_distrito` VALUES (1139, 115, 'CASCAS', 1);
INSERT INTO `proceso_distrito` VALUES (1140, 115, 'LUCMA', 1);
INSERT INTO `proceso_distrito` VALUES (1141, 115, 'MARMOT', 1);
INSERT INTO `proceso_distrito` VALUES (1142, 115, 'SAYAPULLO', 1);
INSERT INTO `proceso_distrito` VALUES (1143, 116, 'CALAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1144, 116, 'CARABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1145, 116, 'HUASO', 1);
INSERT INTO `proceso_distrito` VALUES (1146, 116, 'JULCAN', 1);
INSERT INTO `proceso_distrito` VALUES (1147, 117, 'AGALLPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1148, 117, 'CHARAT', 1);
INSERT INTO `proceso_distrito` VALUES (1149, 117, 'HUARANCHAL', 1);
INSERT INTO `proceso_distrito` VALUES (1150, 117, 'LA CUESTA', 1);
INSERT INTO `proceso_distrito` VALUES (1151, 117, 'MACHE', 1);
INSERT INTO `proceso_distrito` VALUES (1152, 117, 'OTUZCO', 1);
INSERT INTO `proceso_distrito` VALUES (1153, 117, 'PARANDAY', 1);
INSERT INTO `proceso_distrito` VALUES (1154, 117, 'SALPO', 1);
INSERT INTO `proceso_distrito` VALUES (1155, 117, 'SINSICAP', 1);
INSERT INTO `proceso_distrito` VALUES (1156, 117, 'USQUIL', 1);
INSERT INTO `proceso_distrito` VALUES (1157, 118, 'GUADALUPE', 1);
INSERT INTO `proceso_distrito` VALUES (1158, 118, 'JEQUETEPEQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1159, 118, 'PACASMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1160, 118, 'SAN JOSE', 1);
INSERT INTO `proceso_distrito` VALUES (1161, 118, 'SAN PEDRO DE LLOC', 1);
INSERT INTO `proceso_distrito` VALUES (1162, 119, 'BULDIBUYO', 1);
INSERT INTO `proceso_distrito` VALUES (1163, 119, 'CHILLIA', 1);
INSERT INTO `proceso_distrito` VALUES (1164, 119, 'HUANCASPATA', 1);
INSERT INTO `proceso_distrito` VALUES (1165, 119, 'HUAYLILLAS', 1);
INSERT INTO `proceso_distrito` VALUES (1166, 119, 'HUAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1167, 119, 'ONGON', 1);
INSERT INTO `proceso_distrito` VALUES (1168, 119, 'PARCOY', 1);
INSERT INTO `proceso_distrito` VALUES (1169, 119, 'PATAZ', 1);
INSERT INTO `proceso_distrito` VALUES (1170, 119, 'PIAS', 1);
INSERT INTO `proceso_distrito` VALUES (1171, 119, 'SANTIAGO DE CHALLAS', 1);
INSERT INTO `proceso_distrito` VALUES (1172, 119, 'TAURIJA', 1);
INSERT INTO `proceso_distrito` VALUES (1173, 119, 'TAYABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1174, 119, 'URPAY', 1);
INSERT INTO `proceso_distrito` VALUES (1175, 120, 'CHUGAY', 1);
INSERT INTO `proceso_distrito` VALUES (1176, 120, 'COCHORCO', 1);
INSERT INTO `proceso_distrito` VALUES (1177, 120, 'CURGOS', 1);
INSERT INTO `proceso_distrito` VALUES (1178, 120, 'HUAMACHUCO', 1);
INSERT INTO `proceso_distrito` VALUES (1179, 120, 'MARCABAL', 1);
INSERT INTO `proceso_distrito` VALUES (1180, 120, 'SANAGORAN', 1);
INSERT INTO `proceso_distrito` VALUES (1181, 120, 'SARIN', 1);
INSERT INTO `proceso_distrito` VALUES (1182, 120, 'SARTIMBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1183, 121, 'ANGASMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1184, 121, 'CACHICADAN', 1);
INSERT INTO `proceso_distrito` VALUES (1185, 121, 'MOLLEBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1186, 121, 'MOLLEPATA', 1);
INSERT INTO `proceso_distrito` VALUES (1187, 121, 'QUIRUVILCA', 1);
INSERT INTO `proceso_distrito` VALUES (1188, 121, 'SANTA CRUZ DE CHUCA', 1);
INSERT INTO `proceso_distrito` VALUES (1189, 121, 'SANTIAGO DE CHUCO', 1);
INSERT INTO `proceso_distrito` VALUES (1190, 121, 'SITABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1191, 122, 'EL PORVENIR', 1);
INSERT INTO `proceso_distrito` VALUES (1192, 122, 'FLORENCIA DE MORA', 1);
INSERT INTO `proceso_distrito` VALUES (1193, 122, 'HUANCHACO', 1);
INSERT INTO `proceso_distrito` VALUES (1194, 122, 'LA ESPERANZA', 1);
INSERT INTO `proceso_distrito` VALUES (1195, 122, 'LAREDO', 1);
INSERT INTO `proceso_distrito` VALUES (1196, 122, 'MOCHE', 1);
INSERT INTO `proceso_distrito` VALUES (1197, 122, 'POROTO', 1);
INSERT INTO `proceso_distrito` VALUES (1198, 122, 'SALAVERRY', 1);
INSERT INTO `proceso_distrito` VALUES (1199, 122, 'SIMBAL', 1);
INSERT INTO `proceso_distrito` VALUES (1200, 122, 'TRUJILLO', 1);
INSERT INTO `proceso_distrito` VALUES (1201, 122, 'VICTOR LARCO HERRERA', 1);
INSERT INTO `proceso_distrito` VALUES (1202, 123, 'CHAO', 1);
INSERT INTO `proceso_distrito` VALUES (1203, 123, 'GUADALUPITO', 1);
INSERT INTO `proceso_distrito` VALUES (1204, 123, 'VIRU', 1);
INSERT INTO `proceso_distrito` VALUES (1205, 124, 'CAYALTI', 1);
INSERT INTO `proceso_distrito` VALUES (1206, 124, 'CHICLAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1207, 124, 'CHONGOYAPE', 1);
INSERT INTO `proceso_distrito` VALUES (1208, 124, 'ETEN', 1);
INSERT INTO `proceso_distrito` VALUES (1209, 124, 'ETEN PUERTO', 1);
INSERT INTO `proceso_distrito` VALUES (1210, 124, 'JOSE LEONARDO ORTIZ', 1);
INSERT INTO `proceso_distrito` VALUES (1211, 124, 'LA VICTORIA', 1);
INSERT INTO `proceso_distrito` VALUES (1212, 124, 'LAGUNAS', 1);
INSERT INTO `proceso_distrito` VALUES (1213, 124, 'MONSEFU', 1);
INSERT INTO `proceso_distrito` VALUES (1214, 124, 'NUEVA ARICA', 1);
INSERT INTO `proceso_distrito` VALUES (1215, 124, 'OYOTUN', 1);
INSERT INTO `proceso_distrito` VALUES (1216, 124, 'PATAPO', 1);
INSERT INTO `proceso_distrito` VALUES (1217, 124, 'PICSI', 1);
INSERT INTO `proceso_distrito` VALUES (1218, 124, 'PIMENTEL', 1);
INSERT INTO `proceso_distrito` VALUES (1219, 124, 'POMALCA', 1);
INSERT INTO `proceso_distrito` VALUES (1220, 124, 'PUCALA', 1);
INSERT INTO `proceso_distrito` VALUES (1221, 124, 'REQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1222, 124, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (1223, 124, 'SAÑA', 1);
INSERT INTO `proceso_distrito` VALUES (1224, 124, 'TUMAN', 1);
INSERT INTO `proceso_distrito` VALUES (1231, 126, 'CHOCHOPE', 1);
INSERT INTO `proceso_distrito` VALUES (1232, 126, 'ILLIMO', 1);
INSERT INTO `proceso_distrito` VALUES (1233, 126, 'JAYANCA', 1);
INSERT INTO `proceso_distrito` VALUES (1234, 126, 'LAMBAYEQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1235, 126, 'MOCHUMI', 1);
INSERT INTO `proceso_distrito` VALUES (1236, 126, 'MORROPE', 1);
INSERT INTO `proceso_distrito` VALUES (1237, 126, 'MOTUPE', 1);
INSERT INTO `proceso_distrito` VALUES (1238, 126, 'OLMOS', 1);
INSERT INTO `proceso_distrito` VALUES (1239, 126, 'PACORA', 1);
INSERT INTO `proceso_distrito` VALUES (1240, 126, 'SALAS', 1);
INSERT INTO `proceso_distrito` VALUES (1241, 126, 'SAN JOSE', 1);
INSERT INTO `proceso_distrito` VALUES (1242, 126, 'TUCUME', 1);
INSERT INTO `proceso_distrito` VALUES (1243, 127, 'BARRANCA', 1);
INSERT INTO `proceso_distrito` VALUES (1244, 127, 'PARAMONGA', 1);
INSERT INTO `proceso_distrito` VALUES (1245, 127, 'PATIVILCA', 1);
INSERT INTO `proceso_distrito` VALUES (1246, 127, 'SUPE', 1);
INSERT INTO `proceso_distrito` VALUES (1247, 127, 'SUPE PUERTO', 1);
INSERT INTO `proceso_distrito` VALUES (1248, 128, 'CAJATAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (1249, 128, 'COPA', 1);
INSERT INTO `proceso_distrito` VALUES (1250, 128, 'GORGOR', 1);
INSERT INTO `proceso_distrito` VALUES (1251, 128, 'HUANCAPON', 1);
INSERT INTO `proceso_distrito` VALUES (1252, 128, 'MANAS', 1);
INSERT INTO `proceso_distrito` VALUES (1253, 129, 'BELLAVISTA', 1);
INSERT INTO `proceso_distrito` VALUES (1254, 129, 'CALLAO', 1);
INSERT INTO `proceso_distrito` VALUES (1255, 129, 'CARMEN DE LA LEGUA  REYNOSO', 1);
INSERT INTO `proceso_distrito` VALUES (1256, 129, 'LA PERLA', 1);
INSERT INTO `proceso_distrito` VALUES (1257, 129, 'LA PUNTA', 1);
INSERT INTO `proceso_distrito` VALUES (1258, 129, 'VENTANILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1259, 130, 'ARAHUAY', 1);
INSERT INTO `proceso_distrito` VALUES (1260, 130, 'CANTA', 1);
INSERT INTO `proceso_distrito` VALUES (1261, 130, 'HUAMANTANGA', 1);
INSERT INTO `proceso_distrito` VALUES (1262, 130, 'HUAROS', 1);
INSERT INTO `proceso_distrito` VALUES (1263, 130, 'LACHAQUI', 1);
INSERT INTO `proceso_distrito` VALUES (1264, 130, 'SAN BUENAVENTURA', 1);
INSERT INTO `proceso_distrito` VALUES (1265, 130, 'SANTA ROSA DE QUIVES', 1);
INSERT INTO `proceso_distrito` VALUES (1266, 131, 'ASIA', 1);
INSERT INTO `proceso_distrito` VALUES (1267, 131, 'CALANGO', 1);
INSERT INTO `proceso_distrito` VALUES (1268, 131, 'CERRO AZUL', 1);
INSERT INTO `proceso_distrito` VALUES (1269, 131, 'CHILCA', 1);
INSERT INTO `proceso_distrito` VALUES (1270, 131, 'COAYLLO', 1);
INSERT INTO `proceso_distrito` VALUES (1271, 131, 'IMPERIAL', 1);
INSERT INTO `proceso_distrito` VALUES (1272, 131, 'LUNAHUANA', 1);
INSERT INTO `proceso_distrito` VALUES (1273, 131, 'MALA', 1);
INSERT INTO `proceso_distrito` VALUES (1274, 131, 'NUEVO IMPERIAL', 1);
INSERT INTO `proceso_distrito` VALUES (1275, 131, 'PACARAN', 1);
INSERT INTO `proceso_distrito` VALUES (1276, 131, 'QUILMANA', 1);
INSERT INTO `proceso_distrito` VALUES (1277, 131, 'SAN ANTONIO', 1);
INSERT INTO `proceso_distrito` VALUES (1278, 131, 'SAN LUIS', 1);
INSERT INTO `proceso_distrito` VALUES (1279, 131, 'SAN VICENTE DE CAÑETE', 1);
INSERT INTO `proceso_distrito` VALUES (1280, 131, 'SANTA CRUZ DE FLORES', 1);
INSERT INTO `proceso_distrito` VALUES (1281, 131, 'ZUÑIGA', 1);
INSERT INTO `proceso_distrito` VALUES (1282, 132, 'ATAVILLOS ALTO', 1);
INSERT INTO `proceso_distrito` VALUES (1283, 132, 'ATAVILLOS BAJO', 1);
INSERT INTO `proceso_distrito` VALUES (1284, 132, 'AUCALLAMA', 1);
INSERT INTO `proceso_distrito` VALUES (1285, 132, 'CHANCAY', 1);
INSERT INTO `proceso_distrito` VALUES (1286, 132, 'HUARAL', 1);
INSERT INTO `proceso_distrito` VALUES (1287, 132, 'IHUARI', 1);
INSERT INTO `proceso_distrito` VALUES (1288, 132, 'LAMPIAN', 1);
INSERT INTO `proceso_distrito` VALUES (1289, 132, 'PACARAOS', 1);
INSERT INTO `proceso_distrito` VALUES (1290, 132, 'SAN MIGUEL DE ACOS', 1);
INSERT INTO `proceso_distrito` VALUES (1291, 132, 'SANTA CRUZ DE ANDAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1292, 132, 'SUMBILCA', 1);
INSERT INTO `proceso_distrito` VALUES (1293, 132, 'VEINTISIETE DE NOVIEMBRE', 1);
INSERT INTO `proceso_distrito` VALUES (1294, 133, 'ANTIOQUIA', 1);
INSERT INTO `proceso_distrito` VALUES (1295, 133, 'CALLAHUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (1296, 133, 'CARAMPOMA', 1);
INSERT INTO `proceso_distrito` VALUES (1297, 133, 'CHICLA', 1);
INSERT INTO `proceso_distrito` VALUES (1298, 133, 'CUENCA', 1);
INSERT INTO `proceso_distrito` VALUES (1299, 133, 'HUACHUPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1300, 133, 'HUANZA', 1);
INSERT INTO `proceso_distrito` VALUES (1301, 133, 'HUAROCHIRI', 1);
INSERT INTO `proceso_distrito` VALUES (1302, 133, 'LAHUAYTAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (1303, 133, 'LANGA', 1);
INSERT INTO `proceso_distrito` VALUES (1304, 133, 'LARAOS', 1);
INSERT INTO `proceso_distrito` VALUES (1305, 133, 'MARIATANA', 1);
INSERT INTO `proceso_distrito` VALUES (1306, 133, 'MATUCANA', 1);
INSERT INTO `proceso_distrito` VALUES (1307, 133, 'RICARDO PALMA', 1);
INSERT INTO `proceso_distrito` VALUES (1308, 133, 'SAN ANDRES DE TUPICOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1309, 133, 'SAN ANTONIO', 1);
INSERT INTO `proceso_distrito` VALUES (1310, 133, 'SAN BARTOLOME', 1);
INSERT INTO `proceso_distrito` VALUES (1311, 133, 'SAN DAMIAN', 1);
INSERT INTO `proceso_distrito` VALUES (1312, 133, 'SAN JUAN DE IRIS', 1);
INSERT INTO `proceso_distrito` VALUES (1313, 133, 'SAN JUAN DE TANTARANCHE', 1);
INSERT INTO `proceso_distrito` VALUES (1314, 133, 'SAN LORENZO DE QUINTI', 1);
INSERT INTO `proceso_distrito` VALUES (1315, 133, 'SAN MATEO', 1);
INSERT INTO `proceso_distrito` VALUES (1316, 133, 'SAN MATEO DE OTAO', 1);
INSERT INTO `proceso_distrito` VALUES (1317, 133, 'SAN PEDRO DE CASTA', 1);
INSERT INTO `proceso_distrito` VALUES (1318, 133, 'SAN PEDRO DE HUANCAYRE', 1);
INSERT INTO `proceso_distrito` VALUES (1319, 133, 'SANGALLAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1320, 133, 'SANTA CRUZ DE COCACHACRA', 1);
INSERT INTO `proceso_distrito` VALUES (1321, 133, 'SANTA EULALIA', 1);
INSERT INTO `proceso_distrito` VALUES (1322, 133, 'SANTIAGO DE ANCHUCAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1323, 133, 'SANTIAGO DE TUNA', 1);
INSERT INTO `proceso_distrito` VALUES (1324, 133, 'STO. DMGO. DE LOS OLLEROS', 1);
INSERT INTO `proceso_distrito` VALUES (1325, 133, 'SURCO', 1);
INSERT INTO `proceso_distrito` VALUES (1326, 134, 'AMBAR', 1);
INSERT INTO `proceso_distrito` VALUES (1327, 134, 'CALETA DE CARQUIN', 1);
INSERT INTO `proceso_distrito` VALUES (1328, 134, 'CHECRAS', 1);
INSERT INTO `proceso_distrito` VALUES (1329, 134, 'HUACHO', 1);
INSERT INTO `proceso_distrito` VALUES (1330, 134, 'HUALMAY', 1);
INSERT INTO `proceso_distrito` VALUES (1331, 134, 'HUAURA', 1);
INSERT INTO `proceso_distrito` VALUES (1332, 134, 'LEONCIO PRADO', 1);
INSERT INTO `proceso_distrito` VALUES (1333, 134, 'PACCHO', 1);
INSERT INTO `proceso_distrito` VALUES (1334, 134, 'SANTA LEONOR', 1);
INSERT INTO `proceso_distrito` VALUES (1335, 134, 'SANTA MARIA', 1);
INSERT INTO `proceso_distrito` VALUES (1336, 134, 'SAYAN', 1);
INSERT INTO `proceso_distrito` VALUES (1337, 134, 'VEGUETA', 1);
INSERT INTO `proceso_distrito` VALUES (1338, 135, 'ANCON', 1);
INSERT INTO `proceso_distrito` VALUES (1339, 135, 'ATE', 1);
INSERT INTO `proceso_distrito` VALUES (1340, 135, 'BARRANCO', 1);
INSERT INTO `proceso_distrito` VALUES (1341, 135, 'BREÑA', 1);
INSERT INTO `proceso_distrito` VALUES (1342, 135, 'CARABAYLLO', 1);
INSERT INTO `proceso_distrito` VALUES (1343, 135, 'CHACLACAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1344, 135, 'CHORRILLOS', 1);
INSERT INTO `proceso_distrito` VALUES (1345, 135, 'CIENEGUILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1346, 135, 'COMAS', 1);
INSERT INTO `proceso_distrito` VALUES (1347, 135, 'EL AGUSTINO', 1);
INSERT INTO `proceso_distrito` VALUES (1348, 135, 'INDEPENDENCIA', 1);
INSERT INTO `proceso_distrito` VALUES (1349, 135, 'JESUS MARIA', 1);
INSERT INTO `proceso_distrito` VALUES (1350, 135, 'LA MOLINA', 1);
INSERT INTO `proceso_distrito` VALUES (1351, 135, 'LA VICTORIA', 1);
INSERT INTO `proceso_distrito` VALUES (1352, 135, 'LIMA', 1);
INSERT INTO `proceso_distrito` VALUES (1353, 135, 'LINCE', 1);
INSERT INTO `proceso_distrito` VALUES (1354, 135, 'LOS OLIVOS', 1);
INSERT INTO `proceso_distrito` VALUES (1355, 135, 'LURIGANCHO', 1);
INSERT INTO `proceso_distrito` VALUES (1356, 135, 'LURIN', 1);
INSERT INTO `proceso_distrito` VALUES (1357, 135, 'MAGDALENA DEL MAR', 1);
INSERT INTO `proceso_distrito` VALUES (1358, 135, 'Pueblo Libre', 1);
INSERT INTO `proceso_distrito` VALUES (1359, 135, 'MIRAFLORES', 1);
INSERT INTO `proceso_distrito` VALUES (1360, 135, 'PACHACAMAC', 1);
INSERT INTO `proceso_distrito` VALUES (1361, 135, 'PUCUSANA', 1);
INSERT INTO `proceso_distrito` VALUES (1362, 135, 'PUENTE PIEDRA', 1);
INSERT INTO `proceso_distrito` VALUES (1363, 135, 'PUNTA HERMOSA', 1);
INSERT INTO `proceso_distrito` VALUES (1364, 135, 'PUNTA NEGRA', 1);
INSERT INTO `proceso_distrito` VALUES (1365, 135, 'RIMAC', 1);
INSERT INTO `proceso_distrito` VALUES (1366, 135, 'SAN BARTOLO', 1);
INSERT INTO `proceso_distrito` VALUES (1367, 135, 'SAN BORJA', 1);
INSERT INTO `proceso_distrito` VALUES (1368, 135, 'SAN ISIDRO', 1);
INSERT INTO `proceso_distrito` VALUES (1369, 135, 'SAN JUAN DE LURIGANCHO', 1);
INSERT INTO `proceso_distrito` VALUES (1370, 135, 'SAN JUAN DE MIRAFLORES', 1);
INSERT INTO `proceso_distrito` VALUES (1371, 135, 'SAN LUIS', 1);
INSERT INTO `proceso_distrito` VALUES (1372, 135, 'SAN MARTIN DE PORRES', 1);
INSERT INTO `proceso_distrito` VALUES (1373, 135, 'SAN MIGUEL', 1);
INSERT INTO `proceso_distrito` VALUES (1374, 135, 'SANTA ANITA', 1);
INSERT INTO `proceso_distrito` VALUES (1375, 135, 'SANTA MARIA DEL MAR', 1);
INSERT INTO `proceso_distrito` VALUES (1376, 135, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (1377, 135, 'SANTIAGO DE SURCO', 1);
INSERT INTO `proceso_distrito` VALUES (1378, 135, 'SURQUILLO', 1);
INSERT INTO `proceso_distrito` VALUES (1379, 135, 'VILLA EL SALVADOR', 1);
INSERT INTO `proceso_distrito` VALUES (1380, 135, 'VILLA MARIA DEL TRIUNFO', 1);
INSERT INTO `proceso_distrito` VALUES (1381, 136, 'ANDAJES', 1);
INSERT INTO `proceso_distrito` VALUES (1382, 136, 'CAUJUL', 1);
INSERT INTO `proceso_distrito` VALUES (1383, 136, 'COCHAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1384, 136, 'NAVAN', 1);
INSERT INTO `proceso_distrito` VALUES (1385, 136, 'OYON', 1);
INSERT INTO `proceso_distrito` VALUES (1386, 136, 'PACHANGARA', 1);
INSERT INTO `proceso_distrito` VALUES (1387, 137, 'ALIS', 1);
INSERT INTO `proceso_distrito` VALUES (1388, 137, 'AYAUCA', 1);
INSERT INTO `proceso_distrito` VALUES (1389, 137, 'AYAVIRI', 1);
INSERT INTO `proceso_distrito` VALUES (1390, 137, 'AZANGARO', 1);
INSERT INTO `proceso_distrito` VALUES (1391, 137, 'CACRA', 1);
INSERT INTO `proceso_distrito` VALUES (1392, 137, 'CARANIA', 1);
INSERT INTO `proceso_distrito` VALUES (1393, 137, 'CATAHUASI', 1);
INSERT INTO `proceso_distrito` VALUES (1394, 137, 'CHOCOS', 1);
INSERT INTO `proceso_distrito` VALUES (1395, 137, 'COCHAS', 1);
INSERT INTO `proceso_distrito` VALUES (1396, 137, 'COLONIA', 1);
INSERT INTO `proceso_distrito` VALUES (1397, 137, 'HONGOS', 1);
INSERT INTO `proceso_distrito` VALUES (1398, 137, 'HUAMPARA', 1);
INSERT INTO `proceso_distrito` VALUES (1399, 137, 'HUANCAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1400, 137, 'HUANGASCAR', 1);
INSERT INTO `proceso_distrito` VALUES (1401, 137, 'HUANTAN', 1);
INSERT INTO `proceso_distrito` VALUES (1402, 137, 'HUAYEC', 1);
INSERT INTO `proceso_distrito` VALUES (1403, 137, 'LARAOS', 1);
INSERT INTO `proceso_distrito` VALUES (1404, 137, 'LINCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1405, 137, 'MADEAN', 1);
INSERT INTO `proceso_distrito` VALUES (1406, 137, 'MIRAFLORES', 1);
INSERT INTO `proceso_distrito` VALUES (1407, 137, 'OMAS', 1);
INSERT INTO `proceso_distrito` VALUES (1408, 137, 'PUTINZA', 1);
INSERT INTO `proceso_distrito` VALUES (1409, 137, 'QUINCHES', 1);
INSERT INTO `proceso_distrito` VALUES (1410, 137, 'QUINOCAY', 1);
INSERT INTO `proceso_distrito` VALUES (1411, 137, 'SAN JOAQUIN', 1);
INSERT INTO `proceso_distrito` VALUES (1412, 137, 'SAN PEDRO DE PILAS', 1);
INSERT INTO `proceso_distrito` VALUES (1413, 137, 'TANTA', 1);
INSERT INTO `proceso_distrito` VALUES (1414, 137, 'TAURIPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1415, 137, 'TOMAS', 1);
INSERT INTO `proceso_distrito` VALUES (1416, 137, 'TUPE', 1);
INSERT INTO `proceso_distrito` VALUES (1417, 137, 'VIÑAC', 1);
INSERT INTO `proceso_distrito` VALUES (1418, 137, 'VITIS', 1);
INSERT INTO `proceso_distrito` VALUES (1419, 137, 'YAUYOS', 1);
INSERT INTO `proceso_distrito` VALUES (1420, 138, 'BALSAPUERTO', 1);
INSERT INTO `proceso_distrito` VALUES (1421, 138, 'BARRANCA', 1);
INSERT INTO `proceso_distrito` VALUES (1422, 138, 'CAHUAPANAS', 1);
INSERT INTO `proceso_distrito` VALUES (1423, 138, 'JEBEROS', 1);
INSERT INTO `proceso_distrito` VALUES (1424, 138, 'LAGUNAS', 1);
INSERT INTO `proceso_distrito` VALUES (1425, 138, 'MANSERICHE', 1);
INSERT INTO `proceso_distrito` VALUES (1426, 138, 'MORONA', 1);
INSERT INTO `proceso_distrito` VALUES (1427, 138, 'PASTAZA', 1);
INSERT INTO `proceso_distrito` VALUES (1428, 138, 'SANTA CRUZ', 1);
INSERT INTO `proceso_distrito` VALUES (1429, 138, 'TENIENTE CESAR LOPEZ ROJAS', 1);
INSERT INTO `proceso_distrito` VALUES (1430, 138, 'YURIMAGUAS', 1);
INSERT INTO `proceso_distrito` VALUES (1431, 139, 'NAUTA', 1);
INSERT INTO `proceso_distrito` VALUES (1432, 139, 'PARINARI', 1);
INSERT INTO `proceso_distrito` VALUES (1433, 139, 'TIGRE', 1);
INSERT INTO `proceso_distrito` VALUES (1434, 139, 'TROMPETEROS', 1);
INSERT INTO `proceso_distrito` VALUES (1435, 139, 'URARINAS', 1);
INSERT INTO `proceso_distrito` VALUES (1436, 140, 'PEBAS', 1);
INSERT INTO `proceso_distrito` VALUES (1437, 140, 'RAMON CASTILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1438, 140, 'SAN PABLO', 1);
INSERT INTO `proceso_distrito` VALUES (1439, 140, 'YAVARI', 1);
INSERT INTO `proceso_distrito` VALUES (1440, 141, 'ALTO NANAY', 1);
INSERT INTO `proceso_distrito` VALUES (1441, 141, 'BELEN', 1);
INSERT INTO `proceso_distrito` VALUES (1442, 141, 'FERNANDO LORES', 1);
INSERT INTO `proceso_distrito` VALUES (1443, 141, 'INDIANA', 1);
INSERT INTO `proceso_distrito` VALUES (1444, 141, 'IQUITOS', 1);
INSERT INTO `proceso_distrito` VALUES (1445, 141, 'LAS AMAZONAS', 1);
INSERT INTO `proceso_distrito` VALUES (1446, 141, 'MAZAN', 1);
INSERT INTO `proceso_distrito` VALUES (1447, 141, 'NAPO', 1);
INSERT INTO `proceso_distrito` VALUES (1448, 141, 'PUNCHANA', 1);
INSERT INTO `proceso_distrito` VALUES (1449, 141, 'PUTUMAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1450, 141, 'SAN JUAN BAUTISTA', 1);
INSERT INTO `proceso_distrito` VALUES (1451, 141, 'TORRES CAUSANA', 1);
INSERT INTO `proceso_distrito` VALUES (1452, 142, 'ALTO TAPICHE', 1);
INSERT INTO `proceso_distrito` VALUES (1453, 142, 'CAPELO', 1);
INSERT INTO `proceso_distrito` VALUES (1454, 142, 'EMILIO SAN MARTIN', 1);
INSERT INTO `proceso_distrito` VALUES (1455, 142, 'JENARO HERRERA', 1);
INSERT INTO `proceso_distrito` VALUES (1456, 142, 'MAQUIA', 1);
INSERT INTO `proceso_distrito` VALUES (1457, 142, 'PUINAHUA', 1);
INSERT INTO `proceso_distrito` VALUES (1458, 142, 'REQUENA', 1);
INSERT INTO `proceso_distrito` VALUES (1459, 142, 'SAQUENA', 1);
INSERT INTO `proceso_distrito` VALUES (1460, 142, 'SOPLIN', 1);
INSERT INTO `proceso_distrito` VALUES (1461, 142, 'TAPICHE', 1);
INSERT INTO `proceso_distrito` VALUES (1462, 142, 'YAQUERANA', 1);
INSERT INTO `proceso_distrito` VALUES (1463, 142, 'YAQUERANA', 1);
INSERT INTO `proceso_distrito` VALUES (1464, 143, 'CONTAMANA', 1);
INSERT INTO `proceso_distrito` VALUES (1465, 143, 'INAHUAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1466, 143, 'PADRE MARQUEZ', 1);
INSERT INTO `proceso_distrito` VALUES (1467, 143, 'PAMPA HERMOSA', 1);
INSERT INTO `proceso_distrito` VALUES (1468, 143, 'SARAYACU', 1);
INSERT INTO `proceso_distrito` VALUES (1469, 143, 'VARGAS GUERRA', 1);
INSERT INTO `proceso_distrito` VALUES (1470, 144, 'FITZCARRALD', 1);
INSERT INTO `proceso_distrito` VALUES (1471, 144, 'HUEPETUCHE', 1);
INSERT INTO `proceso_distrito` VALUES (1472, 144, 'MADRE DE DIOS', 1);
INSERT INTO `proceso_distrito` VALUES (1473, 144, 'MANU', 1);
INSERT INTO `proceso_distrito` VALUES (1474, 145, 'IBERIA', 1);
INSERT INTO `proceso_distrito` VALUES (1475, 145, 'IÑAPARI', 1);
INSERT INTO `proceso_distrito` VALUES (1476, 145, 'TAHUAMANU', 1);
INSERT INTO `proceso_distrito` VALUES (1477, 146, 'INAMBARI', 1);
INSERT INTO `proceso_distrito` VALUES (1478, 146, 'LABERINTO', 1);
INSERT INTO `proceso_distrito` VALUES (1479, 146, 'LAS PIEDRAS', 1);
INSERT INTO `proceso_distrito` VALUES (1480, 146, 'TAMBOPATA', 1);
INSERT INTO `proceso_distrito` VALUES (1481, 147, 'CHOJATA', 1);
INSERT INTO `proceso_distrito` VALUES (1482, 147, 'COALAQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1483, 147, 'ICHUYA', 1);
INSERT INTO `proceso_distrito` VALUES (1484, 147, 'LA CAPILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1485, 147, 'LLOQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1486, 147, 'MATALAQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1487, 147, 'OMATE', 1);
INSERT INTO `proceso_distrito` VALUES (1488, 147, 'PUQUINA', 1);
INSERT INTO `proceso_distrito` VALUES (1489, 147, 'QUINISTAQUILLAS', 1);
INSERT INTO `proceso_distrito` VALUES (1490, 147, 'UBINAS', 1);
INSERT INTO `proceso_distrito` VALUES (1491, 147, 'YUNGA', 1);
INSERT INTO `proceso_distrito` VALUES (1492, 148, 'EL ALGARROBAL', 1);
INSERT INTO `proceso_distrito` VALUES (1493, 148, 'ILO', 1);
INSERT INTO `proceso_distrito` VALUES (1494, 148, 'PACOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1495, 149, 'CARUMAS', 1);
INSERT INTO `proceso_distrito` VALUES (1496, 149, 'CUCHUMBAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1497, 149, 'MOQUEGUA', 1);
INSERT INTO `proceso_distrito` VALUES (1498, 149, 'SAMEGUA', 1);
INSERT INTO `proceso_distrito` VALUES (1499, 149, 'SAN CRISTOBAL', 1);
INSERT INTO `proceso_distrito` VALUES (1500, 149, 'TORATA', 1);
INSERT INTO `proceso_distrito` VALUES (1501, 150, 'CHACAYAN', 1);
INSERT INTO `proceso_distrito` VALUES (1502, 150, 'GOYLLARISQUIZGA', 1);
INSERT INTO `proceso_distrito` VALUES (1503, 150, 'PAUCAR', 1);
INSERT INTO `proceso_distrito` VALUES (1504, 150, 'SAN PEDRO DE PILLAO', 1);
INSERT INTO `proceso_distrito` VALUES (1505, 150, 'SANTA ANA DE TUSI', 1);
INSERT INTO `proceso_distrito` VALUES (1506, 150, 'TAPUC', 1);
INSERT INTO `proceso_distrito` VALUES (1507, 150, 'VILCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1508, 150, 'YANAHUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (1509, 151, 'CHONTABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1510, 151, 'HUANCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1511, 151, 'OXAPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1512, 151, 'PALCAZU', 1);
INSERT INTO `proceso_distrito` VALUES (1513, 151, 'POZUZO', 1);
INSERT INTO `proceso_distrito` VALUES (1514, 151, 'PUERTO BERMUDEZ', 1);
INSERT INTO `proceso_distrito` VALUES (1515, 151, 'VILLA RICA', 1);
INSERT INTO `proceso_distrito` VALUES (1516, 152, 'CHAUPIMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1517, 152, 'HUACHON', 1);
INSERT INTO `proceso_distrito` VALUES (1518, 152, 'HUARIACA', 1);
INSERT INTO `proceso_distrito` VALUES (1519, 152, 'HUAYLLAY', 1);
INSERT INTO `proceso_distrito` VALUES (1520, 152, 'NINACACA', 1);
INSERT INTO `proceso_distrito` VALUES (1521, 152, 'PALLANCHACRA', 1);
INSERT INTO `proceso_distrito` VALUES (1522, 152, 'PAUCARTAMBO', 1);
INSERT INTO `proceso_distrito` VALUES (1523, 152, 'SAN FCO.DE ASIS DE YARUSYACAN', 1);
INSERT INTO `proceso_distrito` VALUES (1524, 152, 'SIMON BOLIVAR', 1);
INSERT INTO `proceso_distrito` VALUES (1525, 152, 'TICLACAYAN', 1);
INSERT INTO `proceso_distrito` VALUES (1526, 152, 'TINYAHUARCO', 1);
INSERT INTO `proceso_distrito` VALUES (1527, 152, 'VICCO', 1);
INSERT INTO `proceso_distrito` VALUES (1528, 152, 'YANACANCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1529, 153, 'AYABACA', 1);
INSERT INTO `proceso_distrito` VALUES (1530, 153, 'FRIAS', 1);
INSERT INTO `proceso_distrito` VALUES (1531, 153, 'JILILI', 1);
INSERT INTO `proceso_distrito` VALUES (1532, 153, 'LAGUNAS', 1);
INSERT INTO `proceso_distrito` VALUES (1533, 153, 'MONTERO', 1);
INSERT INTO `proceso_distrito` VALUES (1534, 153, 'PACAIPAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1535, 153, 'PAIMAS', 1);
INSERT INTO `proceso_distrito` VALUES (1536, 153, 'SAPILLICA', 1);
INSERT INTO `proceso_distrito` VALUES (1537, 153, 'SICCHEZ', 1);
INSERT INTO `proceso_distrito` VALUES (1538, 153, 'SUYO', 1);
INSERT INTO `proceso_distrito` VALUES (1539, 154, 'CANCHAQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1540, 154, 'EL CARMEN DE LA FRONTERA', 1);
INSERT INTO `proceso_distrito` VALUES (1541, 154, 'HUANCABAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1542, 154, 'HUARMACA', 1);
INSERT INTO `proceso_distrito` VALUES (1543, 154, 'LALAQUIZ', 1);
INSERT INTO `proceso_distrito` VALUES (1544, 154, 'SAN MIGUEL DE EL FAIQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1545, 154, 'SONDOR', 1);
INSERT INTO `proceso_distrito` VALUES (1546, 154, 'SONDORILLO', 1);
INSERT INTO `proceso_distrito` VALUES (1547, 155, 'BUENOS AIRES', 1);
INSERT INTO `proceso_distrito` VALUES (1548, 155, 'CHALACO', 1);
INSERT INTO `proceso_distrito` VALUES (1549, 155, 'CHULUCANAS', 1);
INSERT INTO `proceso_distrito` VALUES (1550, 155, 'LA MATANZA', 1);
INSERT INTO `proceso_distrito` VALUES (1551, 155, 'MORROPON', 1);
INSERT INTO `proceso_distrito` VALUES (1552, 155, 'SALITRAL', 1);
INSERT INTO `proceso_distrito` VALUES (1553, 155, 'SAN JUAN DE BIGOTE', 1);
INSERT INTO `proceso_distrito` VALUES (1554, 155, 'SANTA CATALINA DE MOSSA', 1);
INSERT INTO `proceso_distrito` VALUES (1555, 155, 'SANTO DOMINGO', 1);
INSERT INTO `proceso_distrito` VALUES (1556, 155, 'YAMANGO', 1);
INSERT INTO `proceso_distrito` VALUES (1557, 156, 'AMOTAPE', 1);
INSERT INTO `proceso_distrito` VALUES (1558, 156, 'ARENAL', 1);
INSERT INTO `proceso_distrito` VALUES (1559, 156, 'COLAN', 1);
INSERT INTO `proceso_distrito` VALUES (1560, 156, 'LA HUACA', 1);
INSERT INTO `proceso_distrito` VALUES (1561, 156, 'PAITA', 1);
INSERT INTO `proceso_distrito` VALUES (1562, 156, 'TAMARINDO', 1);
INSERT INTO `proceso_distrito` VALUES (1563, 156, 'VICHAYAL', 1);
INSERT INTO `proceso_distrito` VALUES (1564, 157, 'CASTILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1565, 157, 'CATACAOS', 1);
INSERT INTO `proceso_distrito` VALUES (1566, 157, 'CURA MORI', 1);
INSERT INTO `proceso_distrito` VALUES (1567, 157, 'EL TALLAN', 1);
INSERT INTO `proceso_distrito` VALUES (1568, 157, 'LA ARENA', 1);
INSERT INTO `proceso_distrito` VALUES (1569, 157, 'LA UNION', 1);
INSERT INTO `proceso_distrito` VALUES (1570, 157, 'LAS LOMAS', 1);
INSERT INTO `proceso_distrito` VALUES (1571, 157, 'PIURA', 1);
INSERT INTO `proceso_distrito` VALUES (1572, 157, 'TAMBO GRANDE', 1);
INSERT INTO `proceso_distrito` VALUES (1573, 158, 'BELLAVISTA DE LA UNION', 1);
INSERT INTO `proceso_distrito` VALUES (1574, 158, 'BERNAL', 1);
INSERT INTO `proceso_distrito` VALUES (1575, 158, 'CRISTO NOS VALGA', 1);
INSERT INTO `proceso_distrito` VALUES (1576, 158, 'RINCONADA LLICUAR', 1);
INSERT INTO `proceso_distrito` VALUES (1577, 158, 'SECHURA', 1);
INSERT INTO `proceso_distrito` VALUES (1578, 158, 'VICE', 1);
INSERT INTO `proceso_distrito` VALUES (1579, 159, 'BELLAVISTA', 1);
INSERT INTO `proceso_distrito` VALUES (1580, 159, 'IGNACIO ESCUDERO', 1);
INSERT INTO `proceso_distrito` VALUES (1581, 159, 'LANCONES', 1);
INSERT INTO `proceso_distrito` VALUES (1582, 159, 'MARCAVELICA', 1);
INSERT INTO `proceso_distrito` VALUES (1583, 159, 'MIGUEL CHECA', 1);
INSERT INTO `proceso_distrito` VALUES (1584, 159, 'QUERECOTILLO', 1);
INSERT INTO `proceso_distrito` VALUES (1585, 159, 'SALITRAL', 1);
INSERT INTO `proceso_distrito` VALUES (1586, 159, 'SULLANA', 1);
INSERT INTO `proceso_distrito` VALUES (1587, 160, 'EL ALTO', 1);
INSERT INTO `proceso_distrito` VALUES (1588, 160, 'LA BREA', 1);
INSERT INTO `proceso_distrito` VALUES (1589, 160, 'LOBITOS', 1);
INSERT INTO `proceso_distrito` VALUES (1590, 160, 'LOS ORGANOS', 1);
INSERT INTO `proceso_distrito` VALUES (1591, 160, 'MANCORA', 1);
INSERT INTO `proceso_distrito` VALUES (1592, 160, 'PARIÑAS', 1);
INSERT INTO `proceso_distrito` VALUES (1593, 161, 'ACHAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1594, 161, 'ARAPA', 1);
INSERT INTO `proceso_distrito` VALUES (1595, 161, 'ASILLO', 1);
INSERT INTO `proceso_distrito` VALUES (1596, 161, 'AZANGARO', 1);
INSERT INTO `proceso_distrito` VALUES (1597, 161, 'CAMINACA', 1);
INSERT INTO `proceso_distrito` VALUES (1598, 161, 'CHUPA', 1);
INSERT INTO `proceso_distrito` VALUES (1599, 161, 'JOSE D. CHOQUEHUANCA', 1);
INSERT INTO `proceso_distrito` VALUES (1600, 161, 'MUYANI', 1);
INSERT INTO `proceso_distrito` VALUES (1601, 161, 'POTONI', 1);
INSERT INTO `proceso_distrito` VALUES (1602, 161, 'SAMAN', 1);
INSERT INTO `proceso_distrito` VALUES (1603, 161, 'SAN ANTON', 1);
INSERT INTO `proceso_distrito` VALUES (1604, 161, 'SAN JOSE', 1);
INSERT INTO `proceso_distrito` VALUES (1605, 161, 'SAN JUAN DE SALINAS', 1);
INSERT INTO `proceso_distrito` VALUES (1606, 161, 'SANTIAGO DE PUPUJA', 1);
INSERT INTO `proceso_distrito` VALUES (1607, 161, 'TIRAPATA', 1);
INSERT INTO `proceso_distrito` VALUES (1608, 162, 'AJOYANI', 1);
INSERT INTO `proceso_distrito` VALUES (1609, 162, 'AYAPATA', 1);
INSERT INTO `proceso_distrito` VALUES (1610, 162, 'COASA', 1);
INSERT INTO `proceso_distrito` VALUES (1611, 162, 'CORANI', 1);
INSERT INTO `proceso_distrito` VALUES (1612, 162, 'CRUCERO', 1);
INSERT INTO `proceso_distrito` VALUES (1613, 162, 'ITUATA', 1);
INSERT INTO `proceso_distrito` VALUES (1614, 162, 'MACUSANI', 1);
INSERT INTO `proceso_distrito` VALUES (1615, 162, 'OLLACHEA', 1);
INSERT INTO `proceso_distrito` VALUES (1616, 162, 'SAN GABAN', 1);
INSERT INTO `proceso_distrito` VALUES (1617, 162, 'USICAYOS', 1);
INSERT INTO `proceso_distrito` VALUES (1618, 163, 'DESAGUADERO', 1);
INSERT INTO `proceso_distrito` VALUES (1619, 163, 'HUACULLANI', 1);
INSERT INTO `proceso_distrito` VALUES (1620, 163, 'JULI', 1);
INSERT INTO `proceso_distrito` VALUES (1621, 163, 'KELLUYO', 1);
INSERT INTO `proceso_distrito` VALUES (1622, 163, 'PISACOMA', 1);
INSERT INTO `proceso_distrito` VALUES (1623, 163, 'POMATA', 1);
INSERT INTO `proceso_distrito` VALUES (1624, 163, 'ZEPITA', 1);
INSERT INTO `proceso_distrito` VALUES (1625, 164, 'CAPAZO', 1);
INSERT INTO `proceso_distrito` VALUES (1626, 164, 'CONDURIRI', 1);
INSERT INTO `proceso_distrito` VALUES (1627, 164, 'ILAVE', 1);
INSERT INTO `proceso_distrito` VALUES (1628, 164, 'PILCUYO', 1);
INSERT INTO `proceso_distrito` VALUES (1629, 164, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (1630, 165, 'COJATA', 1);
INSERT INTO `proceso_distrito` VALUES (1631, 165, 'HUANCANE', 1);
INSERT INTO `proceso_distrito` VALUES (1632, 165, 'HUATASANI', 1);
INSERT INTO `proceso_distrito` VALUES (1633, 165, 'INCHUPALLA', 1);
INSERT INTO `proceso_distrito` VALUES (1634, 165, 'PUSI', 1);
INSERT INTO `proceso_distrito` VALUES (1635, 165, 'ROSASPATA', 1);
INSERT INTO `proceso_distrito` VALUES (1636, 165, 'TARACO', 1);
INSERT INTO `proceso_distrito` VALUES (1637, 165, 'VILQUE CHICO', 1);
INSERT INTO `proceso_distrito` VALUES (1638, 166, 'CABANILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1639, 166, 'CALAPUJA', 1);
INSERT INTO `proceso_distrito` VALUES (1640, 166, 'LAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1641, 166, 'NICASIO', 1);
INSERT INTO `proceso_distrito` VALUES (1642, 166, 'OCUVIRI', 1);
INSERT INTO `proceso_distrito` VALUES (1643, 166, 'PALCA', 1);
INSERT INTO `proceso_distrito` VALUES (1644, 166, 'PARATIA', 1);
INSERT INTO `proceso_distrito` VALUES (1645, 166, 'PUCARA', 1);
INSERT INTO `proceso_distrito` VALUES (1646, 166, 'SANTA LUCIA', 1);
INSERT INTO `proceso_distrito` VALUES (1647, 166, 'VILAVILA', 1);
INSERT INTO `proceso_distrito` VALUES (1648, 167, 'ANTAUTA', 1);
INSERT INTO `proceso_distrito` VALUES (1649, 167, 'AYAVIRI', 1);
INSERT INTO `proceso_distrito` VALUES (1650, 167, 'CUPI', 1);
INSERT INTO `proceso_distrito` VALUES (1651, 167, 'LLALLI', 1);
INSERT INTO `proceso_distrito` VALUES (1652, 167, 'MACARI', 1);
INSERT INTO `proceso_distrito` VALUES (1653, 167, 'NUYOA', 1);
INSERT INTO `proceso_distrito` VALUES (1654, 167, 'ORURILLO', 1);
INSERT INTO `proceso_distrito` VALUES (1655, 167, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (1656, 167, 'UMACHIRI', 1);
INSERT INTO `proceso_distrito` VALUES (1657, 168, 'CONIMA', 1);
INSERT INTO `proceso_distrito` VALUES (1658, 168, 'HUAYRAPATA', 1);
INSERT INTO `proceso_distrito` VALUES (1659, 168, 'MOHO', 1);
INSERT INTO `proceso_distrito` VALUES (1660, 168, 'TILALI', 1);
INSERT INTO `proceso_distrito` VALUES (1661, 169, 'ACORA', 1);
INSERT INTO `proceso_distrito` VALUES (1662, 169, 'AMANTANI', 1);
INSERT INTO `proceso_distrito` VALUES (1663, 169, 'ATUNCOLLA', 1);
INSERT INTO `proceso_distrito` VALUES (1664, 169, 'CAPACHICA', 1);
INSERT INTO `proceso_distrito` VALUES (1665, 169, 'CHUCUITO', 1);
INSERT INTO `proceso_distrito` VALUES (1666, 169, 'COATA', 1);
INSERT INTO `proceso_distrito` VALUES (1667, 169, 'HUATA', 1);
INSERT INTO `proceso_distrito` VALUES (1668, 169, 'MAYAZO', 1);
INSERT INTO `proceso_distrito` VALUES (1669, 169, 'PAUCARCOLLA', 1);
INSERT INTO `proceso_distrito` VALUES (1670, 169, 'PICHACANI', 1);
INSERT INTO `proceso_distrito` VALUES (1671, 169, 'PLATERIA', 1);
INSERT INTO `proceso_distrito` VALUES (1672, 169, 'PUNO', 1);
INSERT INTO `proceso_distrito` VALUES (1673, 169, 'SAN ANTONIO', 1);
INSERT INTO `proceso_distrito` VALUES (1674, 169, 'TIQUILLACA', 1);
INSERT INTO `proceso_distrito` VALUES (1675, 169, 'VILQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1676, 170, 'ANANEA', 1);
INSERT INTO `proceso_distrito` VALUES (1677, 170, 'PEDRO VILCA APAZA', 1);
INSERT INTO `proceso_distrito` VALUES (1678, 170, 'PUTINA', 1);
INSERT INTO `proceso_distrito` VALUES (1679, 170, 'QUILCAPUNCU', 1);
INSERT INTO `proceso_distrito` VALUES (1680, 170, 'SINA', 1);
INSERT INTO `proceso_distrito` VALUES (1681, 171, 'CABANA', 1);
INSERT INTO `proceso_distrito` VALUES (1682, 171, 'CABANILLAS', 1);
INSERT INTO `proceso_distrito` VALUES (1683, 171, 'CARACOTO', 1);
INSERT INTO `proceso_distrito` VALUES (1684, 171, 'JULIACA', 1);
INSERT INTO `proceso_distrito` VALUES (1685, 172, 'ALTO INAMBARI', 1);
INSERT INTO `proceso_distrito` VALUES (1686, 172, 'CUYOCUYO', 1);
INSERT INTO `proceso_distrito` VALUES (1687, 172, 'LIMBANI', 1);
INSERT INTO `proceso_distrito` VALUES (1688, 172, 'PATAMBUCO', 1);
INSERT INTO `proceso_distrito` VALUES (1689, 172, 'PHARA', 1);
INSERT INTO `proceso_distrito` VALUES (1690, 172, 'QUIACA', 1);
INSERT INTO `proceso_distrito` VALUES (1691, 172, 'SAN JUAN DEL ORO', 1);
INSERT INTO `proceso_distrito` VALUES (1692, 172, 'SANDIA', 1);
INSERT INTO `proceso_distrito` VALUES (1693, 172, 'YANAHUAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1694, 173, 'ANAPIA', 1);
INSERT INTO `proceso_distrito` VALUES (1695, 173, 'COPANI', 1);
INSERT INTO `proceso_distrito` VALUES (1696, 173, 'CUTURAPI', 1);
INSERT INTO `proceso_distrito` VALUES (1697, 173, 'OLLARAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1698, 173, 'TINICACHI', 1);
INSERT INTO `proceso_distrito` VALUES (1699, 173, 'UNICACHI', 1);
INSERT INTO `proceso_distrito` VALUES (1700, 173, 'YUNGUYO', 1);
INSERT INTO `proceso_distrito` VALUES (1701, 174, 'ALTO BIAVO', 1);
INSERT INTO `proceso_distrito` VALUES (1702, 174, 'BAJO BIAVO', 1);
INSERT INTO `proceso_distrito` VALUES (1703, 174, 'BELLAVISTA', 1);
INSERT INTO `proceso_distrito` VALUES (1704, 174, 'HUALLAGA', 1);
INSERT INTO `proceso_distrito` VALUES (1705, 174, 'SAN PABLO', 1);
INSERT INTO `proceso_distrito` VALUES (1706, 174, 'SAN RAFAEL', 1);
INSERT INTO `proceso_distrito` VALUES (1707, 175, 'AGUA BLANCA', 1);
INSERT INTO `proceso_distrito` VALUES (1708, 175, 'SAN JOSE DE SISA', 1);
INSERT INTO `proceso_distrito` VALUES (1709, 175, 'SAN MARTIN', 1);
INSERT INTO `proceso_distrito` VALUES (1710, 175, 'SANTA ROSA', 1);
INSERT INTO `proceso_distrito` VALUES (1711, 175, 'SHATOJA', 1);
INSERT INTO `proceso_distrito` VALUES (1712, 176, 'ALTO SAPOSOA', 1);
INSERT INTO `proceso_distrito` VALUES (1713, 176, 'EL ESLABON', 1);
INSERT INTO `proceso_distrito` VALUES (1714, 176, 'PISCOYACU', 1);
INSERT INTO `proceso_distrito` VALUES (1715, 176, 'SACANCHE', 1);
INSERT INTO `proceso_distrito` VALUES (1716, 176, 'SAPOSOA', 1);
INSERT INTO `proceso_distrito` VALUES (1717, 176, 'TINGO DE SAPOSOA', 1);
INSERT INTO `proceso_distrito` VALUES (1718, 177, 'ALONSO DE ALVARADO', 1);
INSERT INTO `proceso_distrito` VALUES (1719, 177, 'BARRANQUITA', 1);
INSERT INTO `proceso_distrito` VALUES (1720, 177, 'CAYNARACHI', 1);
INSERT INTO `proceso_distrito` VALUES (1721, 177, 'CUÑUMBUQUI', 1);
INSERT INTO `proceso_distrito` VALUES (1722, 177, 'LAMAS', 1);
INSERT INTO `proceso_distrito` VALUES (1723, 177, 'PINTO RECODO', 1);
INSERT INTO `proceso_distrito` VALUES (1724, 177, 'RUMISAPA', 1);
INSERT INTO `proceso_distrito` VALUES (1725, 177, 'SAN ROQUE DE CUMBAZA', 1);
INSERT INTO `proceso_distrito` VALUES (1726, 177, 'SHANAO', 1);
INSERT INTO `proceso_distrito` VALUES (1727, 177, 'TABALOSOS', 1);
INSERT INTO `proceso_distrito` VALUES (1728, 177, 'ZAPATERO', 1);
INSERT INTO `proceso_distrito` VALUES (1729, 178, 'CAMPANILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1730, 178, 'HUICUNGO', 1);
INSERT INTO `proceso_distrito` VALUES (1731, 178, 'JUANJUI', 1);
INSERT INTO `proceso_distrito` VALUES (1732, 178, 'PACHIZA', 1);
INSERT INTO `proceso_distrito` VALUES (1733, 178, 'PAJARILLO', 1);
INSERT INTO `proceso_distrito` VALUES (1734, 179, 'CALZADA', 1);
INSERT INTO `proceso_distrito` VALUES (1735, 179, 'HABANA', 1);
INSERT INTO `proceso_distrito` VALUES (1736, 179, 'JEPELACIO', 1);
INSERT INTO `proceso_distrito` VALUES (1737, 179, 'MOYOBAMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1738, 179, 'SORITOR', 1);
INSERT INTO `proceso_distrito` VALUES (1739, 179, 'YANTALO', 1);
INSERT INTO `proceso_distrito` VALUES (1740, 180, 'BUENOS AIRES', 1);
INSERT INTO `proceso_distrito` VALUES (1741, 180, 'CASPISAPA', 1);
INSERT INTO `proceso_distrito` VALUES (1742, 180, 'PICOTA', 1);
INSERT INTO `proceso_distrito` VALUES (1743, 180, 'PILLUANA', 1);
INSERT INTO `proceso_distrito` VALUES (1744, 180, 'PUCACACA', 1);
INSERT INTO `proceso_distrito` VALUES (1745, 180, 'SAN CRISTOBAL', 1);
INSERT INTO `proceso_distrito` VALUES (1746, 180, 'SAN HILARION', 1);
INSERT INTO `proceso_distrito` VALUES (1747, 180, 'SHAMBOYACU', 1);
INSERT INTO `proceso_distrito` VALUES (1748, 180, 'TINGO DE PONASA', 1);
INSERT INTO `proceso_distrito` VALUES (1749, 180, 'TRES UNIDOS', 1);
INSERT INTO `proceso_distrito` VALUES (1750, 181, 'AWAJUN', 1);
INSERT INTO `proceso_distrito` VALUES (1751, 181, 'ELIAS SOPLIN VARGAS', 1);
INSERT INTO `proceso_distrito` VALUES (1752, 181, 'NUEVA CAJAMARCA', 1);
INSERT INTO `proceso_distrito` VALUES (1753, 181, 'PARDO MIGUEL', 1);
INSERT INTO `proceso_distrito` VALUES (1754, 181, 'POSIC', 1);
INSERT INTO `proceso_distrito` VALUES (1755, 181, 'RIOJA', 1);
INSERT INTO `proceso_distrito` VALUES (1756, 181, 'SAN FERNANDO', 1);
INSERT INTO `proceso_distrito` VALUES (1757, 181, 'YORONGOS', 1);
INSERT INTO `proceso_distrito` VALUES (1758, 181, 'YURACYACU', 1);
INSERT INTO `proceso_distrito` VALUES (1759, 182, 'ALBERTO LEVEAU', 1);
INSERT INTO `proceso_distrito` VALUES (1760, 182, 'CACATACHI', 1);
INSERT INTO `proceso_distrito` VALUES (1761, 182, 'CHAZUTA', 1);
INSERT INTO `proceso_distrito` VALUES (1762, 182, 'CHIPURANA', 1);
INSERT INTO `proceso_distrito` VALUES (1763, 182, 'EL PORVENIR', 1);
INSERT INTO `proceso_distrito` VALUES (1764, 182, 'HUIMBAYOC', 1);
INSERT INTO `proceso_distrito` VALUES (1765, 182, 'JUAN GUERRA', 1);
INSERT INTO `proceso_distrito` VALUES (1766, 182, 'LA BANDA DE SHILCAYO', 1);
INSERT INTO `proceso_distrito` VALUES (1767, 182, 'MORALES', 1);
INSERT INTO `proceso_distrito` VALUES (1768, 182, 'PAPAPLAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1769, 182, 'SAN ANTONIO', 1);
INSERT INTO `proceso_distrito` VALUES (1770, 182, 'SAUCE', 1);
INSERT INTO `proceso_distrito` VALUES (1771, 182, 'SHAPAJA', 1);
INSERT INTO `proceso_distrito` VALUES (1772, 182, 'TARAPOTO', 1);
INSERT INTO `proceso_distrito` VALUES (1773, 183, 'NUEVO PROGRESO', 1);
INSERT INTO `proceso_distrito` VALUES (1774, 183, 'POLVORA', 1);
INSERT INTO `proceso_distrito` VALUES (1775, 183, 'SHUNTE', 1);
INSERT INTO `proceso_distrito` VALUES (1776, 183, 'TOCACHE', 1);
INSERT INTO `proceso_distrito` VALUES (1777, 183, 'UCHIZA', 1);
INSERT INTO `proceso_distrito` VALUES (1778, 184, 'CAIRANI', 1);
INSERT INTO `proceso_distrito` VALUES (1779, 184, 'CAMILACA', 1);
INSERT INTO `proceso_distrito` VALUES (1780, 184, 'CANDARAVE', 1);
INSERT INTO `proceso_distrito` VALUES (1781, 184, 'CURIBAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1782, 184, 'HUANUARA', 1);
INSERT INTO `proceso_distrito` VALUES (1783, 184, 'QUILAHUANI', 1);
INSERT INTO `proceso_distrito` VALUES (1784, 185, 'ILABAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1785, 185, 'ITE', 1);
INSERT INTO `proceso_distrito` VALUES (1786, 185, 'LOCUMBA', 1);
INSERT INTO `proceso_distrito` VALUES (1787, 186, 'ALTO DE LA ALIANZA', 1);
INSERT INTO `proceso_distrito` VALUES (1788, 186, 'CALANA', 1);
INSERT INTO `proceso_distrito` VALUES (1789, 186, 'CIUDAD NUEVA', 1);
INSERT INTO `proceso_distrito` VALUES (1790, 186, 'GREGORIO ALBARRACIN LANCHIPA', 1);
INSERT INTO `proceso_distrito` VALUES (1791, 186, 'INCLAN', 1);
INSERT INTO `proceso_distrito` VALUES (1792, 186, 'PACHIA', 1);
INSERT INTO `proceso_distrito` VALUES (1793, 186, 'PALCA', 1);
INSERT INTO `proceso_distrito` VALUES (1794, 186, 'POCOLLAY', 1);
INSERT INTO `proceso_distrito` VALUES (1795, 186, 'SAMA', 1);
INSERT INTO `proceso_distrito` VALUES (1796, 186, 'TACNA', 1);
INSERT INTO `proceso_distrito` VALUES (1797, 187, 'ESTIQUE', 1);
INSERT INTO `proceso_distrito` VALUES (1798, 187, 'ESTIQUE-PAMPA', 1);
INSERT INTO `proceso_distrito` VALUES (1799, 187, 'HEROES ALBARRACIN', 1);
INSERT INTO `proceso_distrito` VALUES (1800, 187, 'SITAJARA', 1);
INSERT INTO `proceso_distrito` VALUES (1801, 187, 'SUSAPAYA', 1);
INSERT INTO `proceso_distrito` VALUES (1802, 187, 'TARATA', 1);
INSERT INTO `proceso_distrito` VALUES (1803, 187, 'TARUCACHI', 1);
INSERT INTO `proceso_distrito` VALUES (1804, 187, 'TICACO', 1);
INSERT INTO `proceso_distrito` VALUES (1805, 188, 'CASITAS', 1);
INSERT INTO `proceso_distrito` VALUES (1806, 188, 'ZORRITOS', 1);
INSERT INTO `proceso_distrito` VALUES (1807, 189, 'CORRALES', 1);
INSERT INTO `proceso_distrito` VALUES (1808, 189, 'LA CRUZ', 1);
INSERT INTO `proceso_distrito` VALUES (1809, 189, 'PAMPAS DE HOSPITAL', 1);
INSERT INTO `proceso_distrito` VALUES (1810, 189, 'SAN JACINTO', 1);
INSERT INTO `proceso_distrito` VALUES (1811, 189, 'SAN JUAN DE LA VIRGEN', 1);
INSERT INTO `proceso_distrito` VALUES (1812, 189, 'TUMBES', 1);
INSERT INTO `proceso_distrito` VALUES (1813, 190, 'AGUAS VERDES', 1);
INSERT INTO `proceso_distrito` VALUES (1814, 190, 'MATAPALO', 1);
INSERT INTO `proceso_distrito` VALUES (1815, 190, 'PAPAYAL', 1);
INSERT INTO `proceso_distrito` VALUES (1816, 190, 'ZARUMILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1817, 191, 'RAYMONDI', 1);
INSERT INTO `proceso_distrito` VALUES (1818, 191, 'SEPAHUA', 1);
INSERT INTO `proceso_distrito` VALUES (1819, 191, 'TAHUANIA', 1);
INSERT INTO `proceso_distrito` VALUES (1820, 191, 'YURUA', 1);
INSERT INTO `proceso_distrito` VALUES (1821, 192, 'CALLERIA', 1);
INSERT INTO `proceso_distrito` VALUES (1822, 192, 'CAMPOVERDE', 1);
INSERT INTO `proceso_distrito` VALUES (1823, 192, 'IPARIA', 1);
INSERT INTO `proceso_distrito` VALUES (1824, 192, 'MASISEA', 1);
INSERT INTO `proceso_distrito` VALUES (1825, 192, 'NUEVA REQUENA', 1);
INSERT INTO `proceso_distrito` VALUES (1826, 192, 'YARINACOCHA', 1);
INSERT INTO `proceso_distrito` VALUES (1827, 193, 'CURIMANA', 1);
INSERT INTO `proceso_distrito` VALUES (1828, 193, 'IRAZOLA', 1);
INSERT INTO `proceso_distrito` VALUES (1829, 193, 'PADRE ABAD', 1);
INSERT INTO `proceso_distrito` VALUES (1830, 194, 'PURUS', 1);
INSERT INTO `proceso_distrito` VALUES (1831, 195, 'CALLAO', 1);
INSERT INTO `proceso_distrito` VALUES (1832, 195, 'BELLAVISTA', 1);
INSERT INTO `proceso_distrito` VALUES (1833, 195, 'CARMEN DE LA LEGUA', 1);
INSERT INTO `proceso_distrito` VALUES (1834, 195, 'LA PERLA', 1);
INSERT INTO `proceso_distrito` VALUES (1835, 195, 'LA PUNTA', 1);
INSERT INTO `proceso_distrito` VALUES (1836, 195, 'VENTANILLA', 1);
INSERT INTO `proceso_distrito` VALUES (1837, 195, 'MI PERU', 1);
INSERT INTO `proceso_distrito` VALUES (1838, 129, 'MI PERU', 1);

-- ----------------------------
-- Table structure for proceso_duracion_unidad
-- ----------------------------
DROP TABLE IF EXISTS `proceso_duracion_unidad`;
CREATE TABLE `proceso_duracion_unidad`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_duracion_unidad
-- ----------------------------
INSERT INTO `proceso_duracion_unidad` VALUES (1, 'Mes(es)', 'months', 1);
INSERT INTO `proceso_duracion_unidad` VALUES (2, 'Día(s)', 'days', 1);

-- ----------------------------
-- Table structure for proceso_gasto
-- ----------------------------
DROP TABLE IF EXISTS `proceso_gasto`;
CREATE TABLE `proceso_gasto`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `tipo_gasto` int(0) NOT NULL,
  `referencia` int(0) NOT NULL,
  `pago` decimal(10, 2) NOT NULL,
  `observaciones` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_proceso_gasto_proceso_tipo_gasto`(`tipo_gasto`) USING BTREE,
  CONSTRAINT `FK_proceso_gasto_proceso_tipo_gasto` FOREIGN KEY (`tipo_gasto`) REFERENCES `proceso_tipo_gasto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_gasto
-- ----------------------------
INSERT INTO `proceso_gasto` VALUES (5, 1, 2, 100.00, 'Test', 1, '2024-06-20 19:41:44', 3);
INSERT INTO `proceso_gasto` VALUES (6, 1, 1, 250.00, '', 1, '2024-06-27 20:07:55', 1);

-- ----------------------------
-- Table structure for proceso_gasto_anulacion
-- ----------------------------
DROP TABLE IF EXISTS `proceso_gasto_anulacion`;
CREATE TABLE `proceso_gasto_anulacion`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `referencia` int(0) NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pago_anulacion_pago`(`referencia`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_gasto_anulacion
-- ----------------------------
INSERT INTO `proceso_gasto_anulacion` VALUES (4, 5, 'Motivo de anulación\r\n', 1, '2024-06-20 21:29:40', 1);

-- ----------------------------
-- Table structure for proceso_indicador
-- ----------------------------
DROP TABLE IF EXISTS `proceso_indicador`;
CREATE TABLE `proceso_indicador`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `proveedor` int(0) NULL DEFAULT NULL,
  `tipo_comprobante` int(0) NULL DEFAULT NULL,
  `comprobante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `datos_adicionales` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` int(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ingreso_proveedor`(`proveedor`) USING BTREE,
  INDEX `ingreso_usuario`(`usuario`) USING BTREE,
  CONSTRAINT `ingreso_proveedor` FOREIGN KEY (`proveedor`) REFERENCES `proceso_proveedor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ingreso_usuario` FOREIGN KEY (`usuario`) REFERENCES `base_usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_ingreso
-- ----------------------------
INSERT INTO `proceso_ingreso` VALUES (1, 1, 1, '1111', '', 1, '2024-05-08 10:58:48', 3);
INSERT INTO `proceso_ingreso` VALUES (2, 1, NULL, '', '', 1, '2024-04-30 19:35:35', 1);
INSERT INTO `proceso_ingreso` VALUES (3, 1, NULL, '', '', 1, '2024-04-30 22:54:12', 1);
INSERT INTO `proceso_ingreso` VALUES (4, 1, NULL, '', '', 1, '2024-05-11 23:00:38', 1);
INSERT INTO `proceso_ingreso` VALUES (5, 1, NULL, '', '', 1, '2024-05-11 23:02:22', 1);
INSERT INTO `proceso_ingreso` VALUES (6, 1, 2, '345', 'Datos adicionales', 1, '2024-06-08 11:13:00', 1);
INSERT INTO `proceso_ingreso` VALUES (7, 1, 3, '500', '', 1, '2024-06-06 19:47:18', 1);
INSERT INTO `proceso_ingreso` VALUES (8, 1, NULL, '', '', 1, '2024-06-08 18:23:13', 1);
INSERT INTO `proceso_ingreso` VALUES (9, 1, NULL, '', '', 1, '2024-07-03 14:08:40', 1);
INSERT INTO `proceso_ingreso` VALUES (10, 1, NULL, '', '', 1, '2024-07-03 20:08:40', 1);

-- ----------------------------
-- Table structure for proceso_ingreso_anulacion
-- ----------------------------
DROP TABLE IF EXISTS `proceso_ingreso_anulacion`;
CREATE TABLE `proceso_ingreso_anulacion`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ingreso` int(0) NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `proceso_ingreso_anul_ingreso`(`ingreso`) USING BTREE,
  CONSTRAINT `proceso_ingreso_anul_ingreso` FOREIGN KEY (`ingreso`) REFERENCES `proceso_ingreso` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_ingreso_anulacion
-- ----------------------------
INSERT INTO `proceso_ingreso_anulacion` VALUES (1, 1, 'Test', 1, '2024-05-11 08:28:22', 1);

-- ----------------------------
-- Table structure for proceso_ingreso_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_ingreso_detalle`;
CREATE TABLE `proceso_ingreso_detalle`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ingreso` int(0) NOT NULL,
  `producto` int(0) NOT NULL,
  `cantidad` int(0) NULL DEFAULT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ingreso_detalle_ingreso`(`ingreso`) USING BTREE,
  INDEX `ingreso_detalle_producto`(`producto`) USING BTREE,
  CONSTRAINT `ingreso_detalle_ingreso` FOREIGN KEY (`ingreso`) REFERENCES `proceso_ingreso` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ingreso_detalle_producto` FOREIGN KEY (`producto`) REFERENCES `proceso_producto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_ingreso_detalle
-- ----------------------------
INSERT INTO `proceso_ingreso_detalle` VALUES (1, 1, 3, 10, 200.00, 166.67, '2024-05-08 10:58:35', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (2, 2, 1, 12, 2.00, 2.00, '2024-05-11 19:34:57', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (3, 3, 1, 24, 2.00, 4.00, '2024-05-11 22:53:48', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (4, 5, 2, 48, 3.00, 12.00, '2024-05-11 23:02:16', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (5, 6, 2, 5, 3.00, 1.25, '2024-05-15 11:13:00', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (6, 7, 2, 50, 3.00, 150.00, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (7, 7, 1, 100, 2.00, 200.00, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (8, 7, 3, 36, 200.00, 7200.00, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (9, 8, 2, 12, 13.00, 156.00, '2024-05-23 18:23:13', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (10, 9, 6, 1, 34.00, 34.00, '2024-05-24 14:08:40', 1);
INSERT INTO `proceso_ingreso_detalle` VALUES (11, 10, 1, 50, 10.00, 500.00, '2024-06-27 20:08:40', 1);

-- ----------------------------
-- Table structure for proceso_kardex
-- ----------------------------
DROP TABLE IF EXISTS `proceso_kardex`;
CREATE TABLE `proceso_kardex`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `tipo_kardex` int(0) NOT NULL,
  `referencia` int(0) NOT NULL,
  `producto` int(0) NULL DEFAULT NULL,
  `cantidad` int(0) NULL DEFAULT NULL,
  `precio` decimal(10, 2) NULL DEFAULT NULL,
  `subtotal` decimal(10, 2) NULL DEFAULT NULL,
  `saldo` int(0) NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `proceso_kardex`(`producto`) USING BTREE,
  INDEX `producto_tipo_kardex`(`tipo_kardex`) USING BTREE,
  CONSTRAINT `kardex_producto` FOREIGN KEY (`producto`) REFERENCES `proceso_producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `kardex_tipo_kardex` FOREIGN KEY (`tipo_kardex`) REFERENCES `proceso_tipo_kardex` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_kardex
-- ----------------------------
INSERT INTO `proceso_kardex` VALUES (1, 1, 1, 3, 10, 200.00, 166.67, 10, '2024-05-08 10:58:48', 1);
INSERT INTO `proceso_kardex` VALUES (2, 3, 1, 3, 10, 200.00, 166.67, 0, '2024-05-11 08:28:22', 1);
INSERT INTO `proceso_kardex` VALUES (3, 1, 2, 1, 12, 2.00, 2.00, 12, '2024-05-11 19:35:35', 1);
INSERT INTO `proceso_kardex` VALUES (4, 1, 3, 1, 24, 2.00, 4.00, 36, '2024-05-11 22:54:12', 1);
INSERT INTO `proceso_kardex` VALUES (5, 1, 5, 2, 48, 3.00, 12.00, -48, '2024-05-11 23:02:22', 1);
INSERT INTO `proceso_kardex` VALUES (6, 1, 6, 2, 5, 3.00, 1.25, 5, '2024-05-15 11:13:00', 1);
INSERT INTO `proceso_kardex` VALUES (7, 1, 7, 2, 50, 3.00, 150.00, 55, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_kardex` VALUES (8, 1, 7, 1, 100, 2.00, 200.00, 136, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_kardex` VALUES (9, 1, 7, 3, 36, 200.00, 7200.00, 36, '2024-05-15 19:47:18', 1);
INSERT INTO `proceso_kardex` VALUES (10, 1, 8, 2, 12, 13.00, 156.00, 67, '2024-05-23 18:23:13', 1);
INSERT INTO `proceso_kardex` VALUES (11, 1, 9, 6, 1, 34.00, 34.00, 1, '2024-05-24 14:08:40', 1);
INSERT INTO `proceso_kardex` VALUES (12, 2, 1, 4, 1, 450.00, 450.00, 0, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_kardex` VALUES (13, 2, 1, 2, 5, 33.00, 165.00, 62, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_kardex` VALUES (14, 2, 2, 4, 1, 450.00, 450.00, 0, '2024-05-24 20:36:18', 1);
INSERT INTO `proceso_kardex` VALUES (15, 2, 3, 4, 1, 450.00, 450.00, 0, '2024-05-24 20:37:42', 1);
INSERT INTO `proceso_kardex` VALUES (16, 2, 4, 4, 1, 450.00, 450.00, 0, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_kardex` VALUES (17, 2, 5, 5, 1, 600.00, 600.00, 0, '2024-05-29 10:29:51', 1);
INSERT INTO `proceso_kardex` VALUES (18, 2, 6, 5, 1, 600.00, 600.00, 0, '2024-05-29 10:40:38', 1);
INSERT INTO `proceso_kardex` VALUES (19, 1, 10, 1, 50, 10.00, 500.00, 186, '2024-06-27 20:08:40', 1);
INSERT INTO `proceso_kardex` VALUES (20, 2, 9, 1, 26, 5.00, 130.00, 160, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_kardex` VALUES (21, 2, 10, 1, 10, 6.00, 60.00, 150, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_kardex` VALUES (22, 2, 11, 1, 10, 2.00, 20.00, 140, '2024-07-09 17:35:10', 1);

-- ----------------------------
-- Table structure for proceso_pago
-- ----------------------------
DROP TABLE IF EXISTS `proceso_pago`;
CREATE TABLE `proceso_pago`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `tipo_pago` int(0) NOT NULL,
  `cliente` int(0) NOT NULL,
  `pago` decimal(10, 2) NOT NULL,
  `observaciones` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pago_tipo_pago`(`tipo_pago`) USING BTREE,
  CONSTRAINT `pago_tipo_pago` FOREIGN KEY (`tipo_pago`) REFERENCES `proceso_tipo_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_pago
-- ----------------------------
INSERT INTO `proceso_pago` VALUES (1, 1, 1, 300.00, '', 1, '2024-04-10 14:35:55', 1);
INSERT INTO `proceso_pago` VALUES (2, 1, 3, 450.00, '', 1, '2024-05-24 20:37:42', 1);
INSERT INTO `proceso_pago` VALUES (3, 1, 2, 600.00, '', 1, '2024-06-01 10:29:51', 1);
INSERT INTO `proceso_pago` VALUES (4, 1, 2, 600.00, '', 1, '2024-06-06 10:40:38', 1);
INSERT INTO `proceso_pago` VALUES (5, 1, 3, 500.00, '', 1, '2024-07-01 16:07:54', 1);
INSERT INTO `proceso_pago` VALUES (6, 1, 5, 130.00, '', 1, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_pago` VALUES (7, 1, 5, 60.00, '', 1, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_pago` VALUES (8, 1, 4, 20.00, '', 1, '2024-07-09 17:35:10', 1);

-- ----------------------------
-- Table structure for proceso_pago_anulacion
-- ----------------------------
DROP TABLE IF EXISTS `proceso_pago_anulacion`;
CREATE TABLE `proceso_pago_anulacion`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `pago` int(0) NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pago_anulacion_pago`(`pago`) USING BTREE,
  CONSTRAINT `pago_anulacion_pago` FOREIGN KEY (`pago`) REFERENCES `proceso_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_pago_anulacion
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_producto
-- ----------------------------
DROP TABLE IF EXISTS `proceso_producto`;
CREATE TABLE `proceso_producto`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `tipo` int(0) NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `unidad` int(0) NULL DEFAULT NULL,
  `duracion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `duracion_unidad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `producto_tipo`(`tipo`) USING BTREE,
  CONSTRAINT `producto_tipo` FOREIGN KEY (`tipo`) REFERENCES `proceso_tipo_producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_producto
-- ----------------------------
INSERT INTO `proceso_producto` VALUES (1, 1, 'test', 2.00, 1, NULL, NULL, '2024-05-02 10:37:04', 1);
INSERT INTO `proceso_producto` VALUES (2, 1, 'test2', 3.00, 2, NULL, NULL, '2024-05-02 10:39:36', 1);
INSERT INTO `proceso_producto` VALUES (3, 1, 'test 3', 200.00, 3, NULL, NULL, '2024-05-08 10:57:54', 1);
INSERT INTO `proceso_producto` VALUES (4, 2, 'Membresia 2', 450.00, NULL, '1', '1', '2024-05-11 08:25:20', 1);
INSERT INTO `proceso_producto` VALUES (5, 2, 'Membresia 3', 600.00, NULL, '5', '1', '2024-05-11 09:31:10', 1);
INSERT INTO `proceso_producto` VALUES (6, 1, 'test 4', 34.00, 1, NULL, NULL, '2024-05-24 11:04:10', 1);

-- ----------------------------
-- Table structure for proceso_proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proceso_proveedor`;
CREATE TABLE `proceso_proveedor`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre_o_razon_social` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion_completa` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `contacto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ruc`(`ruc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_proveedor
-- ----------------------------
INSERT INTO `proceso_proveedor` VALUES (1, '12312312312', 'Proveedor 1', '', '', '', '', '2024-05-08 10:58:30', 1);
INSERT INTO `proceso_proveedor` VALUES (2, '14154125125', 'Proveedor 2', '', '', '', '', '2024-06-20 18:15:43', 1);

-- ----------------------------
-- Table structure for proceso_provincia
-- ----------------------------
DROP TABLE IF EXISTS `proceso_provincia`;
CREATE TABLE `proceso_provincia`  (
  `idprovincia` int(0) NOT NULL AUTO_INCREMENT,
  `iddepartamento` int(0) NOT NULL,
  `provincia` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`idprovincia`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_provincia
-- ----------------------------
INSERT INTO `proceso_provincia` VALUES (1, 1, 'BAGUA', 1);
INSERT INTO `proceso_provincia` VALUES (2, 1, 'BONGARA', 1);
INSERT INTO `proceso_provincia` VALUES (3, 1, 'CHACHAPOYAS', 1);
INSERT INTO `proceso_provincia` VALUES (4, 1, 'CONDORCANQUI', 1);
INSERT INTO `proceso_provincia` VALUES (5, 1, 'LUYA', 1);
INSERT INTO `proceso_provincia` VALUES (6, 1, 'RODRIGUEZ DE MENDOZA', 1);
INSERT INTO `proceso_provincia` VALUES (7, 1, 'UTCUBAMBA', 1);
INSERT INTO `proceso_provincia` VALUES (8, 2, 'AIJA', 1);
INSERT INTO `proceso_provincia` VALUES (9, 2, 'ANTONIO RAYMONDI', 1);
INSERT INTO `proceso_provincia` VALUES (10, 2, 'ASUNCION', 1);
INSERT INTO `proceso_provincia` VALUES (11, 2, 'BOLOGNESI', 1);
INSERT INTO `proceso_provincia` VALUES (12, 2, 'CARHUAZ', 1);
INSERT INTO `proceso_provincia` VALUES (13, 2, 'CARLOS F.FITZCARRALD', 1);
INSERT INTO `proceso_provincia` VALUES (14, 2, 'CASMA', 1);
INSERT INTO `proceso_provincia` VALUES (15, 2, 'CORONGO', 1);
INSERT INTO `proceso_provincia` VALUES (16, 2, 'HUARAZ', 1);
INSERT INTO `proceso_provincia` VALUES (17, 2, 'HUARI', 1);
INSERT INTO `proceso_provincia` VALUES (18, 2, 'HUARMEY', 1);
INSERT INTO `proceso_provincia` VALUES (19, 2, 'HUAYLAS', 1);
INSERT INTO `proceso_provincia` VALUES (20, 2, 'MARISCAL LUZURIAGA', 1);
INSERT INTO `proceso_provincia` VALUES (21, 2, 'OCROS', 1);
INSERT INTO `proceso_provincia` VALUES (22, 2, 'PALLASCA', 1);
INSERT INTO `proceso_provincia` VALUES (23, 2, 'POMABAMBA', 1);
INSERT INTO `proceso_provincia` VALUES (24, 2, 'RECUAY', 1);
INSERT INTO `proceso_provincia` VALUES (25, 2, 'SANTA', 1);
INSERT INTO `proceso_provincia` VALUES (26, 2, 'SIHUAS', 1);
INSERT INTO `proceso_provincia` VALUES (27, 2, 'YUNGAY', 1);
INSERT INTO `proceso_provincia` VALUES (28, 3, 'ABANCAY', 1);
INSERT INTO `proceso_provincia` VALUES (29, 3, 'ANDAHUAYLAS', 1);
INSERT INTO `proceso_provincia` VALUES (30, 3, 'ANTABAMBA', 1);
INSERT INTO `proceso_provincia` VALUES (31, 3, 'AYMARAES', 1);
INSERT INTO `proceso_provincia` VALUES (32, 3, 'CHINCHEROS', 1);
INSERT INTO `proceso_provincia` VALUES (33, 3, 'COTABAMBAS', 1);
INSERT INTO `proceso_provincia` VALUES (34, 3, 'GRAU', 1);
INSERT INTO `proceso_provincia` VALUES (35, 4, 'AREQUIPA', 1);
INSERT INTO `proceso_provincia` VALUES (36, 4, 'CAMANA', 1);
INSERT INTO `proceso_provincia` VALUES (37, 4, 'CARAVELI', 1);
INSERT INTO `proceso_provincia` VALUES (38, 4, 'CASTILLA', 1);
INSERT INTO `proceso_provincia` VALUES (39, 4, 'CAYLLOMA', 1);
INSERT INTO `proceso_provincia` VALUES (40, 4, 'CONDESUYOS', 1);
INSERT INTO `proceso_provincia` VALUES (41, 4, 'ISLAY', 1);
INSERT INTO `proceso_provincia` VALUES (42, 4, 'LA UNION', 1);
INSERT INTO `proceso_provincia` VALUES (43, 5, 'CANGALLO', 1);
INSERT INTO `proceso_provincia` VALUES (44, 5, 'HUAMANGA', 1);
INSERT INTO `proceso_provincia` VALUES (45, 5, 'HUANCA SANCOS', 1);
INSERT INTO `proceso_provincia` VALUES (46, 5, 'HUANTA', 1);
INSERT INTO `proceso_provincia` VALUES (47, 5, 'LA MAR', 1);
INSERT INTO `proceso_provincia` VALUES (48, 5, 'LUCANAS', 1);
INSERT INTO `proceso_provincia` VALUES (49, 5, 'PARINACOCHAS', 1);
INSERT INTO `proceso_provincia` VALUES (50, 5, 'PAUCAR DEL SARA SARA', 1);
INSERT INTO `proceso_provincia` VALUES (51, 5, 'SUCRE', 1);
INSERT INTO `proceso_provincia` VALUES (52, 5, 'VICTOR FAJARDO', 1);
INSERT INTO `proceso_provincia` VALUES (53, 5, 'VILCASHUAMAN', 1);
INSERT INTO `proceso_provincia` VALUES (54, 6, 'CAJABAMBA', 1);
INSERT INTO `proceso_provincia` VALUES (55, 6, 'CAJAMARCA', 1);
INSERT INTO `proceso_provincia` VALUES (56, 6, 'CELENDIN', 1);
INSERT INTO `proceso_provincia` VALUES (57, 6, 'CHOTA', 1);
INSERT INTO `proceso_provincia` VALUES (58, 6, 'CONTUMAZA', 1);
INSERT INTO `proceso_provincia` VALUES (59, 6, 'CUTERVO', 1);
INSERT INTO `proceso_provincia` VALUES (60, 6, 'HUALGAYOC', 1);
INSERT INTO `proceso_provincia` VALUES (61, 6, 'JAEN', 1);
INSERT INTO `proceso_provincia` VALUES (62, 6, 'SAN IGNACIO', 1);
INSERT INTO `proceso_provincia` VALUES (63, 6, 'SAN MARCOS', 1);
INSERT INTO `proceso_provincia` VALUES (64, 6, 'SAN MIGUEL', 1);
INSERT INTO `proceso_provincia` VALUES (65, 6, 'SAN PABLO', 1);
INSERT INTO `proceso_provincia` VALUES (66, 6, 'SANTA CRUZ', 1);
INSERT INTO `proceso_provincia` VALUES (67, 7, 'ACOMAYO', 1);
INSERT INTO `proceso_provincia` VALUES (68, 7, 'ANTA', 1);
INSERT INTO `proceso_provincia` VALUES (69, 7, 'CALCA', 1);
INSERT INTO `proceso_provincia` VALUES (70, 7, 'CANAS', 1);
INSERT INTO `proceso_provincia` VALUES (71, 7, 'CANCHIS', 1);
INSERT INTO `proceso_provincia` VALUES (72, 7, 'CHUMBIVILCAS', 1);
INSERT INTO `proceso_provincia` VALUES (73, 7, 'CUSCO', 1);
INSERT INTO `proceso_provincia` VALUES (74, 7, 'ESPINAR', 1);
INSERT INTO `proceso_provincia` VALUES (75, 7, 'LA CONVENCION', 1);
INSERT INTO `proceso_provincia` VALUES (76, 7, 'PARURO', 1);
INSERT INTO `proceso_provincia` VALUES (77, 7, 'PAUCARTAMBO', 1);
INSERT INTO `proceso_provincia` VALUES (78, 7, 'QUISPICANCHI', 1);
INSERT INTO `proceso_provincia` VALUES (79, 7, 'URUBAMBA', 1);
INSERT INTO `proceso_provincia` VALUES (80, 8, 'ACOBAMBA', 1);
INSERT INTO `proceso_provincia` VALUES (81, 8, 'ANGARAES', 1);
INSERT INTO `proceso_provincia` VALUES (82, 8, 'CASTROVIRREYNA', 1);
INSERT INTO `proceso_provincia` VALUES (83, 8, 'CHURCAMPA', 1);
INSERT INTO `proceso_provincia` VALUES (84, 8, 'HUANCAVELICA', 1);
INSERT INTO `proceso_provincia` VALUES (85, 8, 'HUAYTARA', 1);
INSERT INTO `proceso_provincia` VALUES (86, 8, 'TAYACAJA', 1);
INSERT INTO `proceso_provincia` VALUES (87, 9, 'AMBO', 1);
INSERT INTO `proceso_provincia` VALUES (88, 9, 'DOS DE MAYO', 1);
INSERT INTO `proceso_provincia` VALUES (89, 9, 'HUACAYBAMBA', 1);
INSERT INTO `proceso_provincia` VALUES (90, 9, 'HUAMALIES', 1);
INSERT INTO `proceso_provincia` VALUES (91, 9, 'HUANUCO', 1);
INSERT INTO `proceso_provincia` VALUES (92, 9, 'LAURICOCHA', 1);
INSERT INTO `proceso_provincia` VALUES (93, 9, 'LEONCIO PRADO', 1);
INSERT INTO `proceso_provincia` VALUES (94, 9, 'MARAÑON', 1);
INSERT INTO `proceso_provincia` VALUES (95, 9, 'PACHITEA', 1);
INSERT INTO `proceso_provincia` VALUES (96, 9, 'PUERTO INCA', 1);
INSERT INTO `proceso_provincia` VALUES (97, 9, 'YAROWILCA', 1);
INSERT INTO `proceso_provincia` VALUES (98, 10, 'CHINCHA', 1);
INSERT INTO `proceso_provincia` VALUES (99, 10, 'ICA', 1);
INSERT INTO `proceso_provincia` VALUES (100, 10, 'NAZCA', 1);
INSERT INTO `proceso_provincia` VALUES (101, 10, 'PALPA', 1);
INSERT INTO `proceso_provincia` VALUES (102, 10, 'PISCO', 1);
INSERT INTO `proceso_provincia` VALUES (103, 11, 'CHANCHAMAYO', 1);
INSERT INTO `proceso_provincia` VALUES (104, 11, 'CHUPACA', 1);
INSERT INTO `proceso_provincia` VALUES (105, 11, 'CONCEPCION', 1);
INSERT INTO `proceso_provincia` VALUES (106, 11, 'HUANCAYO', 1);
INSERT INTO `proceso_provincia` VALUES (107, 11, 'JAUJA', 1);
INSERT INTO `proceso_provincia` VALUES (108, 11, 'JUNIN', 1);
INSERT INTO `proceso_provincia` VALUES (109, 11, 'SATIPO', 1);
INSERT INTO `proceso_provincia` VALUES (110, 11, 'TARMA', 1);
INSERT INTO `proceso_provincia` VALUES (111, 11, 'YAULI', 1);
INSERT INTO `proceso_provincia` VALUES (112, 12, 'ASCOPE', 1);
INSERT INTO `proceso_provincia` VALUES (113, 12, 'BOLIVAR', 1);
INSERT INTO `proceso_provincia` VALUES (114, 12, 'CHEPEN', 1);
INSERT INTO `proceso_provincia` VALUES (115, 12, 'GRAN CHIMU', 1);
INSERT INTO `proceso_provincia` VALUES (116, 12, 'JULCAN', 1);
INSERT INTO `proceso_provincia` VALUES (117, 12, 'OTUZCO', 1);
INSERT INTO `proceso_provincia` VALUES (118, 12, 'PACASMAYO', 1);
INSERT INTO `proceso_provincia` VALUES (119, 12, 'PATAZ', 1);
INSERT INTO `proceso_provincia` VALUES (120, 12, 'SANCHEZ CARRION', 1);
INSERT INTO `proceso_provincia` VALUES (121, 12, 'SANTIAGO DE CHUCO', 1);
INSERT INTO `proceso_provincia` VALUES (122, 12, 'TRUJILLO', 1);
INSERT INTO `proceso_provincia` VALUES (123, 12, 'VIRU', 1);
INSERT INTO `proceso_provincia` VALUES (124, 13, 'CHICLAYO', 1);
INSERT INTO `proceso_provincia` VALUES (125, 13, 'FERREÑAFE', 1);
INSERT INTO `proceso_provincia` VALUES (126, 13, 'LAMBAYEQUE', 1);
INSERT INTO `proceso_provincia` VALUES (127, 14, 'BARRANCA', 1);
INSERT INTO `proceso_provincia` VALUES (128, 14, 'CAJATAMBO', 1);
INSERT INTO `proceso_provincia` VALUES (129, 14, 'CALLAO', 1);
INSERT INTO `proceso_provincia` VALUES (130, 14, 'CANTA', 1);
INSERT INTO `proceso_provincia` VALUES (131, 14, 'CAÑETE', 1);
INSERT INTO `proceso_provincia` VALUES (132, 14, 'HUARAL', 1);
INSERT INTO `proceso_provincia` VALUES (133, 14, 'HUAROCHIRI', 1);
INSERT INTO `proceso_provincia` VALUES (134, 14, 'HUAURA', 1);
INSERT INTO `proceso_provincia` VALUES (135, 14, 'LIMA', 1);
INSERT INTO `proceso_provincia` VALUES (136, 14, 'OYON', 1);
INSERT INTO `proceso_provincia` VALUES (137, 14, 'YAUYOS', 1);
INSERT INTO `proceso_provincia` VALUES (138, 15, 'ALTO AMAZONAS', 1);
INSERT INTO `proceso_provincia` VALUES (139, 15, 'LORETO', 1);
INSERT INTO `proceso_provincia` VALUES (140, 15, 'MARISCAL R.CASTILLA', 1);
INSERT INTO `proceso_provincia` VALUES (141, 15, 'MAYNAS', 1);
INSERT INTO `proceso_provincia` VALUES (142, 15, 'REQUENA', 1);
INSERT INTO `proceso_provincia` VALUES (143, 15, 'UCAYALI', 1);
INSERT INTO `proceso_provincia` VALUES (144, 16, 'MANU', 1);
INSERT INTO `proceso_provincia` VALUES (145, 16, 'TAHUAMANU', 1);
INSERT INTO `proceso_provincia` VALUES (146, 16, 'TAMBOPATA', 1);
INSERT INTO `proceso_provincia` VALUES (147, 17, 'GENERAL SANCHEZ CERRO', 1);
INSERT INTO `proceso_provincia` VALUES (148, 17, 'ILO', 1);
INSERT INTO `proceso_provincia` VALUES (149, 17, 'MARISCAL NIETO', 1);
INSERT INTO `proceso_provincia` VALUES (150, 18, 'DANIEL ALCIDES CARRION', 1);
INSERT INTO `proceso_provincia` VALUES (151, 18, 'OXAPAMPA', 1);
INSERT INTO `proceso_provincia` VALUES (152, 18, 'PASCO', 1);
INSERT INTO `proceso_provincia` VALUES (153, 19, 'AYABACA', 1);
INSERT INTO `proceso_provincia` VALUES (154, 19, 'HUANCABAMBA', 1);
INSERT INTO `proceso_provincia` VALUES (155, 19, 'MORROPON', 1);
INSERT INTO `proceso_provincia` VALUES (156, 19, 'PAITA', 1);
INSERT INTO `proceso_provincia` VALUES (157, 19, 'PIURA', 1);
INSERT INTO `proceso_provincia` VALUES (158, 19, 'SECHURA', 1);
INSERT INTO `proceso_provincia` VALUES (159, 19, 'SULLANA', 1);
INSERT INTO `proceso_provincia` VALUES (160, 19, 'TALARA', 1);
INSERT INTO `proceso_provincia` VALUES (161, 20, 'AZANGARO', 1);
INSERT INTO `proceso_provincia` VALUES (162, 20, 'CARABAYA', 1);
INSERT INTO `proceso_provincia` VALUES (163, 20, 'CHUCUITO', 1);
INSERT INTO `proceso_provincia` VALUES (164, 20, 'EL COLLAO', 1);
INSERT INTO `proceso_provincia` VALUES (165, 20, 'HUANCANE', 1);
INSERT INTO `proceso_provincia` VALUES (166, 20, 'LAMPA', 1);
INSERT INTO `proceso_provincia` VALUES (167, 20, 'MELGAR', 1);
INSERT INTO `proceso_provincia` VALUES (168, 20, 'MOHO', 1);
INSERT INTO `proceso_provincia` VALUES (169, 20, 'PUNO', 1);
INSERT INTO `proceso_provincia` VALUES (170, 20, 'SAN ANTONIO DE PUTINA', 1);
INSERT INTO `proceso_provincia` VALUES (171, 20, 'SAN ROMAN', 1);
INSERT INTO `proceso_provincia` VALUES (172, 20, 'SANDIA', 1);
INSERT INTO `proceso_provincia` VALUES (173, 20, 'YUNGUYO', 1);
INSERT INTO `proceso_provincia` VALUES (174, 21, 'BELLAVISTA', 1);
INSERT INTO `proceso_provincia` VALUES (175, 21, 'EL DORADO', 1);
INSERT INTO `proceso_provincia` VALUES (176, 21, 'HUALLAGA', 1);
INSERT INTO `proceso_provincia` VALUES (177, 21, 'LAMAS', 1);
INSERT INTO `proceso_provincia` VALUES (178, 21, 'MARISCAL CACERES', 1);
INSERT INTO `proceso_provincia` VALUES (179, 21, 'MOYOBAMBA', 1);
INSERT INTO `proceso_provincia` VALUES (180, 21, 'PICOTA', 1);
INSERT INTO `proceso_provincia` VALUES (181, 21, 'RIOJA', 1);
INSERT INTO `proceso_provincia` VALUES (182, 21, 'SAN MARTIN', 1);
INSERT INTO `proceso_provincia` VALUES (183, 21, 'TOCACHE', 1);
INSERT INTO `proceso_provincia` VALUES (184, 22, 'CANDARAVE', 1);
INSERT INTO `proceso_provincia` VALUES (185, 22, 'JORGE BASADRE', 1);
INSERT INTO `proceso_provincia` VALUES (186, 22, 'TACNA', 1);
INSERT INTO `proceso_provincia` VALUES (187, 22, 'TARATA', 1);
INSERT INTO `proceso_provincia` VALUES (188, 23, 'CONTRALMIRANTE VILLAR', 1);
INSERT INTO `proceso_provincia` VALUES (189, 23, 'TUMBES', 1);
INSERT INTO `proceso_provincia` VALUES (190, 23, 'ZARUMILLA', 1);
INSERT INTO `proceso_provincia` VALUES (191, 24, 'ATALAYA', 1);
INSERT INTO `proceso_provincia` VALUES (192, 24, 'CORONEL PORTILLO', 1);
INSERT INTO `proceso_provincia` VALUES (193, 24, 'PADRE ABAD', 1);
INSERT INTO `proceso_provincia` VALUES (194, 24, 'PURUS', 1);
INSERT INTO `proceso_provincia` VALUES (196, 0, '', 1);

-- ----------------------------
-- Table structure for proceso_tipo_comprobante
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_comprobante`;
CREATE TABLE `proceso_tipo_comprobante`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int(0) NULL DEFAULT 1,
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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_documento
-- ----------------------------
INSERT INTO `proceso_tipo_documento` VALUES (1, 'DNI', 1);
INSERT INTO `proceso_tipo_documento` VALUES (5, 'RUC', 1);

-- ----------------------------
-- Table structure for proceso_tipo_gasto
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_gasto`;
CREATE TABLE `proceso_tipo_gasto`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_gasto
-- ----------------------------
INSERT INTO `proceso_tipo_gasto` VALUES (1, 'pago_proveedor', 1);

-- ----------------------------
-- Table structure for proceso_tipo_kardex
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_kardex`;
CREATE TABLE `proceso_tipo_kardex`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int(0) NULL DEFAULT 1,
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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_pago
-- ----------------------------
INSERT INTO `proceso_tipo_pago` VALUES (1, 'Efectivo', 1);
INSERT INTO `proceso_tipo_pago` VALUES (2, 'Tarjeta', 1);

-- ----------------------------
-- Table structure for proceso_tipo_producto
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_producto`;
CREATE TABLE `proceso_tipo_producto`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_producto
-- ----------------------------
INSERT INTO `proceso_tipo_producto` VALUES (1, 'Producto', 1);
INSERT INTO `proceso_tipo_producto` VALUES (2, 'Servicio', 1);

-- ----------------------------
-- Table structure for proceso_tipo_venta_pago
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_venta_pago`;
CREATE TABLE `proceso_tipo_venta_pago`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_venta_pago
-- ----------------------------
INSERT INTO `proceso_tipo_venta_pago` VALUES (1, 'Crédito', 1);
INSERT INTO `proceso_tipo_venta_pago` VALUES (2, 'Contado', 1);

-- ----------------------------
-- Table structure for proceso_unidad
-- ----------------------------
DROP TABLE IF EXISTS `proceso_unidad`;
CREATE TABLE `proceso_unidad`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `abreviatura` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `estado` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_unidad
-- ----------------------------
INSERT INTO `proceso_unidad` VALUES (1, 'Unidades', 'Und.', 1);
INSERT INTO `proceso_unidad` VALUES (2, 'Paquetes', 'Paq.', 1);
INSERT INTO `proceso_unidad` VALUES (3, 'Cajas', 'Cja.', 1);
INSERT INTO `proceso_unidad` VALUES (4, 'Kilogramos', 'K', 1);

-- ----------------------------
-- Table structure for proceso_venta
-- ----------------------------
DROP TABLE IF EXISTS `proceso_venta`;
CREATE TABLE `proceso_venta`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `cliente` int(0) NULL DEFAULT NULL,
  `tipo_comprobante` int(0) NULL DEFAULT NULL,
  `comprobante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `datos_adicionales` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `igv` decimal(10, 2) NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `usuario` int(0) NULL DEFAULT NULL,
  `tipo_venta_pago` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `venta_cliente`(`cliente`) USING BTREE,
  INDEX `venta_tipo_comprobante`(`tipo_comprobante`) USING BTREE,
  INDEX `venta_tipo_venta_pago`(`tipo_venta_pago`) USING BTREE,
  CONSTRAINT `venta_cliente` FOREIGN KEY (`cliente`) REFERENCES `proceso_cliente` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `venta_tipo_comprobante` FOREIGN KEY (`tipo_comprobante`) REFERENCES `proceso_tipo_comprobante` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `venta_tipo_venta_pago` FOREIGN KEY (`tipo_venta_pago`) REFERENCES `proceso_tipo_venta_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_venta
-- ----------------------------
INSERT INTO `proceso_venta` VALUES (1, 2, 2, '566', '', 521.19, 93.81, 615.00, 1, 1, '2024-04-30 16:32:39', 1);
INSERT INTO `proceso_venta` VALUES (2, 3, 2, '455', '', 381.36, 68.64, 450.00, 1, 2, '2024-05-24 20:36:18', 1);
INSERT INTO `proceso_venta` VALUES (3, 3, 2, '455', '', 381.36, 68.64, 450.00, 1, 2, '2024-05-24 20:37:42', 1);
INSERT INTO `proceso_venta` VALUES (4, 3, 2, '76767', '', 381.36, 68.64, 450.00, 1, 1, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_venta` VALUES (5, 2, 1, '233', '', 508.47, 91.53, 600.00, 1, 2, '2024-06-01 10:29:51', 1);
INSERT INTO `proceso_venta` VALUES (6, 2, 2, '656', '', 508.47, 91.53, 600.00, 1, 2, '2024-07-01 10:40:38', 1);
INSERT INTO `proceso_venta` VALUES (9, 5, 2, '32432432', '', 110.17, 19.83, 130.00, 1, 2, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_venta` VALUES (10, 5, 2, '35353455', '', 50.85, 9.15, 60.00, 1, 2, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_venta` VALUES (11, 4, 1, '123123123', '', 16.95, 3.05, 20.00, 1, 2, '2024-07-09 17:35:10', 1);

-- ----------------------------
-- Table structure for proceso_venta_anulacion
-- ----------------------------
DROP TABLE IF EXISTS `proceso_venta_anulacion`;
CREATE TABLE `proceso_venta_anulacion`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `venta` int(0) NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int(0) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `venta_anulacion_venta`(`venta`) USING BTREE,
  CONSTRAINT `venta_anulacion_venta` FOREIGN KEY (`venta`) REFERENCES `proceso_venta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_venta_anulacion
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_venta_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_venta_detalle`;
CREATE TABLE `proceso_venta_detalle`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `venta` int(0) NULL DEFAULT NULL,
  `producto` int(0) NULL DEFAULT NULL,
  `cantidad` int(0) NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `fecha` datetime(0) NOT NULL,
  `estado` int(0) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `venta_detalle_venta`(`venta`) USING BTREE,
  INDEX `venta_detalle_producto`(`producto`) USING BTREE,
  CONSTRAINT `venta_detalle_producto` FOREIGN KEY (`producto`) REFERENCES `proceso_producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `venta_detalle_venta` FOREIGN KEY (`venta`) REFERENCES `proceso_venta` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_venta_detalle
-- ----------------------------
INSERT INTO `proceso_venta_detalle` VALUES (1, 1, 4, 1, 450.00, 450.00, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_venta_detalle` VALUES (2, 1, 2, 5, 33.00, 165.00, '2024-05-24 16:32:39', 1);
INSERT INTO `proceso_venta_detalle` VALUES (3, 2, 4, 1, 450.00, 450.00, '2024-05-24 20:36:18', 1);
INSERT INTO `proceso_venta_detalle` VALUES (4, 3, 4, 1, 450.00, 450.00, '2024-05-24 20:37:42', 1);
INSERT INTO `proceso_venta_detalle` VALUES (5, 4, 4, 1, 450.00, 450.00, '2024-05-28 14:53:17', 1);
INSERT INTO `proceso_venta_detalle` VALUES (6, 5, 5, 1, 600.00, 600.00, '2024-05-29 10:29:51', 1);
INSERT INTO `proceso_venta_detalle` VALUES (7, 6, 5, 1, 600.00, 600.00, '2024-05-29 10:40:38', 1);
INSERT INTO `proceso_venta_detalle` VALUES (8, 9, 1, 26, 5.00, 130.00, '2024-07-09 11:44:55', 1);
INSERT INTO `proceso_venta_detalle` VALUES (9, 10, 1, 10, 6.00, 60.00, '2024-07-09 11:46:11', 1);
INSERT INTO `proceso_venta_detalle` VALUES (10, 11, 1, 10, 2.00, 20.00, '2024-07-09 17:35:10', 1);

SET FOREIGN_KEY_CHECKS = 1;
