/*
 Navicat Premium Dump SQL

 Source Server         : laragon_6
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3308
 Source Schema         : tahua

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 03/09/2024 15:09:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_cliente_sistema
-- ----------------------------
DROP TABLE IF EXISTS `base_cliente_sistema`;
CREATE TABLE `base_cliente_sistema`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ruc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre_o_razon_social` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion_completa` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `contacto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ruc`(`ruc` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_cliente_sistema
-- ----------------------------
INSERT INTO `base_cliente_sistema` VALUES (1, '10478672882', 'demo', 'Lima', 'usuario', '98765321', '', '2020-10-28 00:00:00', 1);

-- ----------------------------
-- Table structure for base_configuracion
-- ----------------------------
DROP TABLE IF EXISTS `base_configuracion`;
CREATE TABLE `base_configuracion`  (
  `id` int NOT NULL,
  `url_servicio` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ruc` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `envio` tinyint(1) NOT NULL,
  `send_email` int NOT NULL,
  `sunat_ruc_validacion` int NOT NULL,
  `sunat_ruc_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dashboard` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `igv` decimal(10, 2) NOT NULL,
  `estado` int NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_configuracion
-- ----------------------------
INSERT INTO `base_configuracion` VALUES (1, 'https://<localhost>/', '20478672883', 0, 1, 0, 'https://e-beta.sunat.gob.pe/ol-ti-itcpfegem-beta/billService?wsdl', 'SISTEMA', '1.00.01', '', '', 'Todos los derechos reservados', 18.00, 1, '2024-08-13 14:57:30');

-- ----------------------------
-- Table structure for base_estado
-- ----------------------------
DROP TABLE IF EXISTS `base_estado`;
CREATE TABLE `base_estado`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `visibilidad` int NOT NULL DEFAULT 1,
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
  `id` int NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `icono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `padre` int NOT NULL,
  `estado` int NOT NULL,
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
INSERT INTO `base_menu` VALUES (4, 'Pagos', 'fa fa-usd', NULL, 0, 1);
INSERT INTO `base_menu` VALUES (6, 'Página Web', 'si si-home', NULL, 0, 1);
INSERT INTO `base_menu` VALUES (8, 'Reportes', 'si si-bar-chart', '', 0, 1);
INSERT INTO `base_menu` VALUES (10, 'Gimnasio', 'si si-home', NULL, 0, 1);
INSERT INTO `base_menu` VALUES (101, 'Configuración', 'fa fa-gears', 'sistema/configuracion', 1, 1);
INSERT INTO `base_menu` VALUES (103, 'Clientes del sistema', 'si si-briefcase', 'sistema/clientes', 1, 0);
INSERT INTO `base_menu` VALUES (104, 'Usuarios', 'si si-users', 'sistema/usuarios', 1, 1);
INSERT INTO `base_menu` VALUES (105, 'Auditoría', 'fa fa-eye', 'sistema/auditoria', 1, 1);
INSERT INTO `base_menu` VALUES (107, 'Perfiles', 'si si-users', 'sistema/perfiles', 1, 1);
INSERT INTO `base_menu` VALUES (201, 'Clientes', 'si si-handbag', 'inventario/clientes', 2, 1);
INSERT INTO `base_menu` VALUES (202, 'Proveedores', 'si si-share', 'inventario/proveedores', 2, 1);
INSERT INTO `base_menu` VALUES (203, 'Productos y Servicios', 'si si-tag', 'inventario/productos', 2, 1);
INSERT INTO `base_menu` VALUES (205, 'Códigos de descuento', 'fa fa-percent', 'inventario/codigos', 2, 1);
INSERT INTO `base_menu` VALUES (301, 'Ingresos', 'si si-login', 'transacciones/ingresos', 3, 1);
INSERT INTO `base_menu` VALUES (303, 'Ventas', 'si si-basket', 'transacciones/ventas', 3, 1);
INSERT INTO `base_menu` VALUES (308, 'Punto de Venta', 'si si-basket', 'transacciones/puntoDeVenta', 3, 1);
INSERT INTO `base_menu` VALUES (309, 'Caja', 'si si-drawer', 'transacciones/caja', 3, 1);
INSERT INTO `base_menu` VALUES (402, 'Pagos a proveedores', 'si si-wallet', 'pagos/pagosProveedor', 4, 1);
INSERT INTO `base_menu` VALUES (403, 'Pagos de clientes', 'fa fa-usd', 'pagos/pagosCliente', 4, 1);
INSERT INTO `base_menu` VALUES (601, 'Contactos externos', 'si si-note', 'web/contactosExternos', 6, 1);
INSERT INTO `base_menu` VALUES (801, 'Clientes', 'si si-users', 'reportes/clientes', 8, 1);
INSERT INTO `base_menu` VALUES (802, 'Transacciones', 'si si-shuffle', 'reportes/transacciones', 8, 1);
INSERT INTO `base_menu` VALUES (804, 'Kardex', 'si si-bar-chart', 'reportes/kardex', 8, 1);
INSERT INTO `base_menu` VALUES (1001, 'Sucursales', 'fa fa-map-marker', 'gimnasio/sucursales', 10, 1);
INSERT INTO `base_menu` VALUES (1002, 'Salas', 'si si-layers', 'gimnasio/salas', 10, 1);
INSERT INTO `base_menu` VALUES (1003, 'Cursos', 'si si-pencil', 'gimnasio/cursos', 10, 1);
INSERT INTO `base_menu` VALUES (1004, 'Planificación de horarios', 'si si-calendar', 'gimnasio/planificacion', 10, 1);

-- ----------------------------
-- Table structure for base_menu_perfil
-- ----------------------------
DROP TABLE IF EXISTS `base_menu_perfil`;
CREATE TABLE `base_menu_perfil`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `perfil` int NULL DEFAULT NULL,
  `menu` int NULL DEFAULT NULL,
  `visible` int NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_perfil_menu`(`menu` ASC) USING BTREE,
  INDEX `menu_perfil_perfil`(`perfil` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_menu_perfil
-- ----------------------------
INSERT INTO `base_menu_perfil` VALUES (14, 1, 105, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (55, 6, 308, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (56, 5, 308, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (57, 4, 201, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (58, 4, 202, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (59, 4, 203, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (60, 4, 205, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (61, 4, 301, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (62, 4, 303, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (63, 4, 308, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (64, 4, 309, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (65, 3, 801, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (66, 3, 802, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (67, 3, 804, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (68, 2, 201, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (69, 2, 202, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (70, 2, 203, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (71, 2, 205, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (72, 2, 301, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (73, 2, 303, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (74, 2, 308, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (75, 2, 309, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (76, 2, 402, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (77, 2, 403, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (78, 2, 601, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (79, 2, 801, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (80, 2, 802, 1, 1);
INSERT INTO `base_menu_perfil` VALUES (81, 2, 804, 1, 1);

-- ----------------------------
-- Table structure for base_meses
-- ----------------------------
DROP TABLE IF EXISTS `base_meses`;
CREATE TABLE `base_meses`  (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int NOT NULL,
  `usuario` int NOT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_perfil
-- ----------------------------
INSERT INTO `base_perfil` VALUES (1, 'Superadministrador', 1, 1, '2024-08-22 18:33:24');
INSERT INTO `base_perfil` VALUES (2, 'Administrador', 1, 1, '2024-08-22 18:33:28');
INSERT INTO `base_perfil` VALUES (3, 'Contador', 1, 1, '2024-08-22 18:33:31');
INSERT INTO `base_perfil` VALUES (4, 'Recepcionista', 1, 1, '2024-08-22 18:33:33');
INSERT INTO `base_perfil` VALUES (5, 'Cajero', 1, 1, '2024-08-24 21:33:17');
INSERT INTO `base_perfil` VALUES (6, 'Moso', 1, 1, '2024-08-24 21:49:24');

-- ----------------------------
-- Table structure for base_sucursal
-- ----------------------------
DROP TABLE IF EXISTS `base_sucursal`;
CREATE TABLE `base_sucursal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sucursal` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `serie_boleta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `numeracion_boleta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `serie_factura` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `numeracion_factura` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sunat_integracion` tinyint NULL DEFAULT 2,
  `sunat_api_ruta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sunat_api_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_sucursal
-- ----------------------------
INSERT INTO `base_sucursal` VALUES (1, 'Golden Plaza', 'Av. Centenario 290 - Golden Plaza, HUARAZ - HUARAZ - ANCASH', '1', '18', '1', '21', 1, 'https://api.nubefact.com/api/v1/a55fda65-6ba2-4f1a-8bf8-db494df66624', '80d80ab7b8e842c4a9616ae00d37fd17c4ad565fb8da4468a40d3427b5d6b9c0', 1);
INSERT INTO `base_sucursal` VALUES (2, 'SUNAT', 'Jr. Simón Bolívar 667, HUARAZ - HUARAZ - ANCASH', '1', '30', '1', '50', 2, NULL, NULL, 1);
INSERT INTO `base_sucursal` VALUES (3, 'Restaurant', 'Av. Centenario 290 - Golden Plaza, HUARAZ - HUARAZ - ANCASH', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1);
INSERT INTO `base_sucursal` VALUES (4, 'Externa', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1);

-- ----------------------------
-- Table structure for base_usuario
-- ----------------------------
DROP TABLE IF EXISTS `base_usuario`;
CREATE TABLE `base_usuario`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_sistema` int NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dni` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int NOT NULL,
  `perfil` int NULL DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `intentos` int NULL DEFAULT 0,
  `ultimo_intento` datetime NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `usuario_perfil`(`perfil` ASC) USING BTREE,
  INDEX `usuario_cliente_sistema`(`cliente_sistema` ASC) USING BTREE,
  CONSTRAINT `usuario_cliente_sistema` FOREIGN KEY (`cliente_sistema`) REFERENCES `base_cliente_sistema` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_usuario
-- ----------------------------
INSERT INTO `base_usuario` VALUES (1, 1, 'superadmin', '$2y$10$SSXdJa7U54TMwV4U7mP3duu77wTOt/cik.phIIZq7c77diRtHPC6.', 'Superadmin', '01', '12345678', 'direccion', '999999999', 'gmllasacas@gmail.com', 1, 1, '2019-02-27 14:18:43', 0, '2024-09-01 07:57:10', NULL);
INSERT INTO `base_usuario` VALUES (2, 1, 'test', '$2y$10$SSXdJa7U54TMwV4U7mP3duu77wTOt/cik.phIIZq7c77diRtHPC6.', 'Administrador', 'Prueba', '34324324', '', '', 'test@test', 1, 2, '2024-04-30 23:53:10', 0, '2024-07-10 20:27:28', NULL);
INSERT INTO `base_usuario` VALUES (3, 1, 'superadmin2', '$2y$10$99ySCMePqir/f6GWLGUjw.dtHa9iBXxPWYhSgxK/r7i2Yr8Y33k4.', 'Superadmin', '02', '12345678', 'direccion', '999999999', 'gmllasacas@gmail.com', 1, 1, '2019-02-27 14:18:43', 0, '2024-07-13 16:20:20', NULL);

-- ----------------------------
-- Table structure for base_usuario_sucursal
-- ----------------------------
DROP TABLE IF EXISTS `base_usuario_sucursal`;
CREATE TABLE `base_usuario_sucursal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` int NULL DEFAULT NULL,
  `sucursal` int NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_usuario_sucursal
-- ----------------------------
INSERT INTO `base_usuario_sucursal` VALUES (4, 2, 2, '2024-07-24 20:14:22', 1);
INSERT INTO `base_usuario_sucursal` VALUES (5, 3, 2, '2024-07-24 20:14:22', 1);
INSERT INTO `base_usuario_sucursal` VALUES (9, 2, 3, '2024-07-24 21:20:44', 1);
INSERT INTO `base_usuario_sucursal` VALUES (24, 1, 1, '2024-08-21 09:15:16', 1);
INSERT INTO `base_usuario_sucursal` VALUES (25, 2, 1, '2024-08-21 09:15:16', 1);

-- ----------------------------
-- Table structure for proceso_auditoria
-- ----------------------------
DROP TABLE IF EXISTS `proceso_auditoria`;
CREATE TABLE `proceso_auditoria`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` int NULL DEFAULT NULL,
  `accion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `sucursal` int NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auditoria_usuario_fk`(`usuario` ASC) USING BTREE,
  INDEX `auditoria_sucursal_fk`(`sucursal` ASC) USING BTREE,
  INDEX `auditoria_estado_fk`(`estado` ASC) USING BTREE,
  CONSTRAINT `auditoria_estado_fk` FOREIGN KEY (`estado`) REFERENCES `base_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auditoria_sucursal_fk` FOREIGN KEY (`sucursal`) REFERENCES `base_sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auditoria_usuario_fk` FOREIGN KEY (`usuario`) REFERENCES `base_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_auditoria
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_caja
-- ----------------------------
DROP TABLE IF EXISTS `proceso_caja`;
CREATE TABLE `proceso_caja`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sucursal` int NULL DEFAULT NULL,
  `apertura` decimal(10, 2) NULL DEFAULT NULL,
  `cierre` decimal(10, 2) NULL DEFAULT NULL,
  `notas` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notas_cierre` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` int NULL DEFAULT NULL,
  `usuario_cierre` int NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `fecha_apertura` datetime NULL DEFAULT NULL,
  `fecha_cierre` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proceso_caja
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_caja_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_caja_detalle`;
CREATE TABLE `proceso_caja_detalle`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_caja_detalle` int NULL DEFAULT 1,
  `caja` int NULL DEFAULT NULL,
  `referencia` int NULL DEFAULT NULL,
  `monto` decimal(10, 2) NULL DEFAULT NULL,
  `usuario` int NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proceso_caja_detalle
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_cliente
-- ----------------------------
DROP TABLE IF EXISTS `proceso_cliente`;
CREATE TABLE `proceso_cliente`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `documento` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre_o_razon_social` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `departamento` int NULL DEFAULT NULL,
  `provincia` int NULL DEFAULT NULL,
  `distrito` int NULL DEFAULT NULL,
  `direccion_completa` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `notas` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `contacto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `contacto_telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `membresia` int NULL DEFAULT NULL,
  `usuario` int NULL DEFAULT NULL,
  `estado` int NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ruc`(`documento` ASC) USING BTREE,
  INDEX `cliente_tipo_documento`(`tipo_documento` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_cliente
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_cliente_servicio
-- ----------------------------
DROP TABLE IF EXISTS `proceso_cliente_servicio`;
CREATE TABLE `proceso_cliente_servicio`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `venta` int NULL DEFAULT NULL,
  `producto` int NULL DEFAULT NULL,
  `fecha_fin` date NULL DEFAULT NULL,
  `usuario` int NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_cliente_servicio
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_codigo_descuento
-- ----------------------------
DROP TABLE IF EXISTS `proceso_codigo_descuento`;
CREATE TABLE `proceso_codigo_descuento`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descuento_tipo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descuento_cantidad` decimal(10, 2) NOT NULL,
  `observaciones` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `usuario` int NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pago_tipo_pago`(`codigo` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_codigo_descuento
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_contacto_externo
-- ----------------------------
DROP TABLE IF EXISTS `proceso_contacto_externo`;
CREATE TABLE `proceso_contacto_externo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `asunto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proceso_contacto_externo
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_control
-- ----------------------------
DROP TABLE IF EXISTS `proceso_control`;
CREATE TABLE `proceso_control`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `periodo` date NULL DEFAULT NULL,
  `rotacion` decimal(10, 4) NULL DEFAULT NULL,
  `duracion` decimal(10, 4) NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_credito` int NOT NULL,
  `referencia` int NULL DEFAULT NULL,
  `cliente` int NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `credito` decimal(10, 2) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `credito_tipo_credito`(`tipo_credito` ASC) USING BTREE,
  INDEX `credito_cliente`(`cliente` ASC) USING BTREE,
  CONSTRAINT `credito_cliente` FOREIGN KEY (`cliente`) REFERENCES `proceso_cliente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `credito_tipo_credito` FOREIGN KEY (`tipo_credito`) REFERENCES `proceso_tipo_credito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_credito
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_curso
-- ----------------------------
DROP TABLE IF EXISTS `proceso_curso`;
CREATE TABLE `proceso_curso`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` int NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proceso_curso
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_departamento
-- ----------------------------
DROP TABLE IF EXISTS `proceso_departamento`;
CREATE TABLE `proceso_departamento`  (
  `iddepartamento` int NOT NULL AUTO_INCREMENT,
  `departamento` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`iddepartamento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

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
  `iddistrito` int NOT NULL AUTO_INCREMENT,
  `idprovincia` int NOT NULL,
  `distrito` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int NULL DEFAULT 1,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_duracion_unidad
-- ----------------------------
INSERT INTO `proceso_duracion_unidad` VALUES (1, 'Mes(es)', 'months', 1);
INSERT INTO `proceso_duracion_unidad` VALUES (2, 'Día(s)', 'days', 1);

-- ----------------------------
-- Table structure for proceso_envio_sunat
-- ----------------------------
DROP TABLE IF EXISTS `proceso_envio_sunat`;
CREATE TABLE `proceso_envio_sunat`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` int NOT NULL,
  `datos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `errores` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `venta` int NOT NULL,
  `tipo_de_comprobante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `serie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enlace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sunat_ticket_numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aceptada_por_sunat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sunat_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sunat_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sunat_responsecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sunat_soap_error` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pdf_zip_base64` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `cadena_para_codigo_qr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codigo_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proceso_envio_sunat
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_gasto
-- ----------------------------
DROP TABLE IF EXISTS `proceso_gasto`;
CREATE TABLE `proceso_gasto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_gasto` int NOT NULL,
  `referencia` int NOT NULL,
  `pago` decimal(10, 2) NOT NULL,
  `observaciones` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_proceso_gasto_proceso_tipo_gasto`(`tipo_gasto` ASC) USING BTREE,
  CONSTRAINT `FK_proceso_gasto_proceso_tipo_gasto` FOREIGN KEY (`tipo_gasto`) REFERENCES `proceso_tipo_gasto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_gasto
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_gasto_anulacion
-- ----------------------------
DROP TABLE IF EXISTS `proceso_gasto_anulacion`;
CREATE TABLE `proceso_gasto_anulacion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `referencia` int NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pago_anulacion_pago`(`referencia` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_gasto_anulacion
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_indicador
-- ----------------------------
DROP TABLE IF EXISTS `proceso_indicador`;
CREATE TABLE `proceso_indicador`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `sucursal` int NOT NULL,
  `proveedor` int NULL DEFAULT NULL,
  `tipo_comprobante` int NULL DEFAULT NULL,
  `comprobante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tipo_ingreso_pago` int NULL DEFAULT NULL,
  `datos_adicionales` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` int NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ingreso_proveedor`(`proveedor` ASC) USING BTREE,
  INDEX `ingreso_usuario`(`usuario` ASC) USING BTREE,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `ingreso` int NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `proceso_ingreso_anul_ingreso`(`ingreso` ASC) USING BTREE,
  CONSTRAINT `proceso_ingreso_anul_ingreso` FOREIGN KEY (`ingreso`) REFERENCES `proceso_ingreso` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_ingreso_anulacion
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_ingreso_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_ingreso_detalle`;
CREATE TABLE `proceso_ingreso_detalle`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ingreso` int NOT NULL,
  `producto` int NOT NULL,
  `cantidad` int NULL DEFAULT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ingreso_detalle_ingreso`(`ingreso` ASC) USING BTREE,
  INDEX `ingreso_detalle_producto`(`producto` ASC) USING BTREE,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `sucursal` int NOT NULL,
  `tipo_kardex` int NOT NULL,
  `referencia` int NOT NULL,
  `producto` int NULL DEFAULT NULL,
  `cantidad` int NULL DEFAULT NULL,
  `precio` decimal(10, 2) NULL DEFAULT NULL,
  `subtotal` decimal(10, 2) NULL DEFAULT NULL,
  `saldo` int NULL DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `proceso_kardex`(`producto` ASC) USING BTREE,
  INDEX `producto_tipo_kardex`(`tipo_kardex` ASC) USING BTREE,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_pago` int NOT NULL,
  `cliente` int NOT NULL,
  `pago` decimal(10, 2) NOT NULL,
  `observaciones` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `numero_operacion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `venta` int NULL DEFAULT NULL,
  `usuario` int NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pago_tipo_pago`(`tipo_pago` ASC) USING BTREE,
  CONSTRAINT `pago_tipo_pago` FOREIGN KEY (`tipo_pago`) REFERENCES `proceso_tipo_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_pago
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_pago_anulacion
-- ----------------------------
DROP TABLE IF EXISTS `proceso_pago_anulacion`;
CREATE TABLE `proceso_pago_anulacion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pago` int NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pago_anulacion_pago`(`pago` ASC) USING BTREE,
  CONSTRAINT `pago_anulacion_pago` FOREIGN KEY (`pago`) REFERENCES `proceso_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_pago_anulacion
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_producto
-- ----------------------------
DROP TABLE IF EXISTS `proceso_producto`;
CREATE TABLE `proceso_producto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` int NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `precio` decimal(10, 2) NULL DEFAULT NULL,
  `unidad` int NULL DEFAULT NULL,
  `duracion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `duracion_unidad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `favorito` smallint NULL DEFAULT 0,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `producto_tipo`(`tipo` ASC) USING BTREE,
  CONSTRAINT `producto_tipo` FOREIGN KEY (`tipo`) REFERENCES `proceso_tipo_producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_producto
-- ----------------------------
INSERT INTO `proceso_producto` VALUES (100, 1, 'C4 Performance (pre-entreno)', 15.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (101, 1, 'Red Bull', 8.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (102, 1, 'Mix Especial 150gr.', 13.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (103, 1, 'Mix Berries 150gr.', 12.50, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (104, 1, 'Cashews 120gr.', 12.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (105, 1, 'Mix Cacao c/ Pasas 150gr.', 14.50, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (106, 1, 'Mix Cacao c/ Berries 150gr.', 15.60, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (107, 1, 'Mix Tropical c/ Piña 150gr.', 15.50, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (108, 1, 'Mix Criollo Picante 30gr.', 2.20, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (109, 1, 'Mix Crunchy 30gr.', 2.20, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (110, 1, 'Mix Criollo 30gr.', 2.10, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (111, 1, 'Almendras 40gr.', 4.50, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (112, 1, 'Maíz Gigante del Cuzco 40gr.', 3.20, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (113, 1, 'Pistachos 40gr.', 6.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (114, 1, 'Cashews Salados 40gr.', 4.70, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (115, 1, 'Maní Tostado 40gr.', 3.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (116, 1, 'Mix Cacao Nibs 40gr.', 3.60, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (117, 1, 'Mix Especial 40gr.', 3.50, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (118, 1, 'Mix Berry 40gr.', 3.20, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (119, 1, 'Maní c/ Pasas 40gr.', 2.50, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (120, 1, 'Mix Criollo 40gr.', 3.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (121, 1, 'Mix Premium 40gr.', 3.50, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (122, 1, 'Mix Tropical c/ Piña 40gr.', 4.60, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (123, 1, 'Mix cacao c/ berry', 4.50, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (124, 1, 'Mix Cacao c/ pasas 40gr.', 4.20, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (125, 1, 'Nox-Up Sachet (pre-entreno)', 6.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (126, 1, 'Monster ZERO', 9.50, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (127, 2, 'Plan estudiante ', 69.90, NULL, '1', '1', 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (128, 2, 'Plan “Good Morning” (turno mañana)', 79.90, NULL, '1', '1', 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (129, 2, 'Plan GOLD', 99.90, NULL, '1', '1', 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (130, 1, 'ISO WHEY COOCKIES AND CREAM', 8.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (131, 1, 'BIGM COOKIES N CREAM', 5.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (132, 1, 'ISO WHEY CHOCOLATE', 8.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (133, 1, 'ISO WHEY COOKIES AND CREAM', 8.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (134, 1, 'ISO WHEY VAINILLA', 8.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (135, 1, 'Quemador', 5.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (136, 1, 'Carnet', 2.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (137, 1, 'Gatorade 500ml', 3.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (138, 1, 'Promocion Turno Mañana', 50.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (139, 1, 'Agua San Carlos 750ml', 2.00, 1, NULL, NULL, 0, '2024-09-01 21:17:44', 1);
INSERT INTO `proceso_producto` VALUES (140, 2, 'sesión exlocal', 8.00, NULL, '2', '1', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (141, 2, 'Promocion Turno Mañana + Exlocal', 80.00, NULL, '1', '1', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (142, 2, 'Plan Estandar + Exlocal', 100.00, NULL, '1', '1', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (143, 2, 'Promocion Turno Mañana', 50.00, NULL, '1', '1', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (144, 2, 'Promocion Grupal', 240.00, NULL, '1', '1', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (145, 2, 'Promoción Gym Bro', 170.00, NULL, '1', '1', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (146, 2, 'Sesion', 10.00, NULL, '2', '1', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (147, 2, 'Plan “Premium” (1 año)', 840.00, NULL, '1', '12', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (148, 2, 'Plan “Gold” (6 meses)', 450.00, NULL, '1', '6', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (149, 2, 'Plan “Miembro Tahua” (3 meses)', 240.00, NULL, '1', '3', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (150, 2, 'Plan Estandár', 89.90, NULL, '1', '1', 0, '2024-09-01 21:56:51', 1);
INSERT INTO `proceso_producto` VALUES (151, 2, 'Plan Estandár medio mes', 60.00, NULL, '2', '15', 0, '2024-09-01 21:56:51', 1);

-- ----------------------------
-- Table structure for proceso_proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proceso_proveedor`;
CREATE TABLE `proceso_proveedor`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ruc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nombre_o_razon_social` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `direccion_completa` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `contacto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ruc`(`ruc` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_proveedor
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_provincia
-- ----------------------------
DROP TABLE IF EXISTS `proceso_provincia`;
CREATE TABLE `proceso_provincia`  (
  `idprovincia` int NOT NULL AUTO_INCREMENT,
  `iddepartamento` int NOT NULL,
  `provincia` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int NULL DEFAULT 1,
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
-- Table structure for proceso_sala
-- ----------------------------
DROP TABLE IF EXISTS `proceso_sala`;
CREATE TABLE `proceso_sala`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sucursal` int NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` int NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proceso_sala
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_tipo_caja_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_caja_detalle`;
CREATE TABLE `proceso_tipo_caja_detalle`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_caja_detalle
-- ----------------------------
INSERT INTO `proceso_tipo_caja_detalle` VALUES (1, 'Ajuste', 1);
INSERT INTO `proceso_tipo_caja_detalle` VALUES (2, 'Venta', 1);
INSERT INTO `proceso_tipo_caja_detalle` VALUES (3, 'Anulación de venta', 1);

-- ----------------------------
-- Table structure for proceso_tipo_comprobante
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_comprobante`;
CREATE TABLE `proceso_tipo_comprobante`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_comprobante
-- ----------------------------
INSERT INTO `proceso_tipo_comprobante` VALUES (1, 'FACTURA', 1);
INSERT INTO `proceso_tipo_comprobante` VALUES (3, 'BOLETA DE VENTA', 1);
INSERT INTO `proceso_tipo_comprobante` VALUES (7, 'NOTA DE CRÉDITO', 2);
INSERT INTO `proceso_tipo_comprobante` VALUES (8, 'NOTA DE DÉBITO', 2);

-- ----------------------------
-- Table structure for proceso_tipo_credito
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_credito`;
CREATE TABLE `proceso_tipo_credito`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int NULL DEFAULT 1,
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
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_documento
-- ----------------------------
INSERT INTO `proceso_tipo_documento` VALUES ('-', 'VARIOS', 0);
INSERT INTO `proceso_tipo_documento` VALUES ('1', 'DNI', 1);
INSERT INTO `proceso_tipo_documento` VALUES ('4', '	\r\nCARNET DE EXTRANJERIA', 1);
INSERT INTO `proceso_tipo_documento` VALUES ('6', 'RUC', 1);

-- ----------------------------
-- Table structure for proceso_tipo_gasto
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_gasto`;
CREATE TABLE `proceso_tipo_gasto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_gasto
-- ----------------------------
INSERT INTO `proceso_tipo_gasto` VALUES (1, 'pago_proveedor', 1);

-- ----------------------------
-- Table structure for proceso_tipo_ingreso_pago
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_ingreso_pago`;
CREATE TABLE `proceso_tipo_ingreso_pago`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_tipo_ingreso_pago
-- ----------------------------
INSERT INTO `proceso_tipo_ingreso_pago` VALUES (1, 'Total', 1);
INSERT INTO `proceso_tipo_ingreso_pago` VALUES (2, 'Parcial', 1);

-- ----------------------------
-- Table structure for proceso_tipo_kardex
-- ----------------------------
DROP TABLE IF EXISTS `proceso_tipo_kardex`;
CREATE TABLE `proceso_tipo_kardex`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int NULL DEFAULT 1,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `abreviatura` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `estado` int NULL DEFAULT 1,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `sucursal` int NOT NULL,
  `cliente` int NULL DEFAULT NULL,
  `tipo_comprobante` int NULL DEFAULT NULL,
  `codigo_descuento` int NULL DEFAULT NULL,
  `comprobante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `datos_adicionales` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `igv` decimal(10, 2) NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `descuento` decimal(10, 2) NOT NULL,
  `total_inicial` decimal(10, 2) NOT NULL,
  `usuario` int NULL DEFAULT NULL,
  `tipo_venta_pago` int NOT NULL,
  `fecha` datetime NOT NULL,
  `sunat` tinyint NULL DEFAULT 0,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `venta_cliente`(`cliente` ASC) USING BTREE,
  INDEX `venta_tipo_comprobante`(`tipo_comprobante` ASC) USING BTREE,
  INDEX `venta_tipo_venta_pago`(`tipo_venta_pago` ASC) USING BTREE,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `venta` int NOT NULL,
  `motivo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario` int NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `venta_anulacion_venta`(`venta` ASC) USING BTREE,
  CONSTRAINT `venta_anulacion_venta` FOREIGN KEY (`venta`) REFERENCES `proceso_venta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_venta_anulacion
-- ----------------------------

-- ----------------------------
-- Table structure for proceso_venta_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_venta_detalle`;
CREATE TABLE `proceso_venta_detalle`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `venta` int NULL DEFAULT NULL,
  `producto` int NULL DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `venta_detalle_venta`(`venta` ASC) USING BTREE,
  INDEX `venta_detalle_producto`(`producto` ASC) USING BTREE,
  CONSTRAINT `venta_detalle_producto` FOREIGN KEY (`producto`) REFERENCES `proceso_producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `venta_detalle_venta` FOREIGN KEY (`venta`) REFERENCES `proceso_venta` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_venta_detalle
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
