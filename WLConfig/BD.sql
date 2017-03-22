/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : PostgreSQL
 Source Server Version : 90602
 Source Host           : localhost
 Source Database       : FIMDocumentos
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90602
 File Encoding         : utf-8

 Date: 03/21/2017 21:01:34 PM
*/

-- ----------------------------
--  Sequence structure for documentRelationships_id_seq
-- ----------------------------
CREATE SEQUENCE "documentRelationships_id_seq" INCREMENT 1 START 162 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;

-- ----------------------------
--  Sequence structure for object_id_seq
-- ----------------------------
CREATE SEQUENCE "object_id_seq" INCREMENT 1 START 579 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;

-- ----------------------------
--  Sequence structure for transactionRecord_id_seq
-- ----------------------------
CREATE SEQUENCE "transactionRecord_id_seq" INCREMENT 1 START 940 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;

-- ----------------------------
--  Sequence structure for transactionType_id_seq
-- ----------------------------
CREATE SEQUENCE "transactionType_id_seq" INCREMENT 1 START 11 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;

-- ----------------------------
--  Table structure for googleDriveBackups
-- ----------------------------
CREATE TABLE "googleDriveBackups" (
	"fileName" varchar COLLATE "default",
	"id" varchar NOT NULL COLLATE "default",
	"date" timestamp(6) NULL DEFAULT now(),
	"length" float4
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of googleDriveBackups
-- ----------------------------
BEGIN;
INSERT INTO "googleDriveBackups" VALUES ('Giovanni''s_Room.zip', '0B64tcW7d1P2_NEh1aDZad3NURTA', '2017-03-18 08:50:46.791187', '362290');
INSERT INTO "googleDriveBackups" VALUES ('Casos de Uso Analizador.zip', '0B64tcW7d1P2_RzdyekdSNzFRc00', '2017-03-18 08:53:18.556031', '21774');
INSERT INTO "googleDriveBackups" VALUES ('Casos de Uso Analizador.zip', '0B64tcW7d1P2_NlBCbV9xOEk1UlU', '2017-03-18 08:56:33.990001', '21774');
INSERT INTO "googleDriveBackups" VALUES ('Giovanni''s_Room.zip', '0B64tcW7d1P2_eVpBanVzOXRLWjg', '2017-03-18 09:01:22.615875', '362290');
INSERT INTO "googleDriveBackups" VALUES ('Libros new', '0B64tcW7d1P2_anRRcElkQ05DOTA', '2017-03-18 09:13:57.017434', '0');
INSERT INTO "googleDriveBackups" VALUES ('Mara Wilson - Where Am I Now True Stories of Girlhood and Accidental Fame.zip', '0B64tcW7d1P2_QjdSd3NqNnhlVUE', '2017-03-18 10:33:04.75828', '8.38523e+06');
INSERT INTO "googleDriveBackups" VALUES ('Pasenow o el romanticismo (Trilogía de los sonámbulos 1) (Spanish Edition)_nodrm.zip', '0B64tcW7d1P2_UFhWTmpfYlJoRk0', '2017-03-18 11:21:56.433206', '293528');
INSERT INTO "googleDriveBackups" VALUES ('Another_Country.zip', '0B64tcW7d1P2_UkljS2dtbHNLbHc', '2017-03-18 11:41:18.024616', '904718');
INSERT INTO "googleDriveBackups" VALUES ('The_Fire_Next_Time.zip', '0B64tcW7d1P2_T1BhT3dabGNEVnM', '2017-03-18 11:43:38.859832', '303857');
INSERT INTO "googleDriveBackups" VALUES ('Discos', '0B64tcW7d1P2_QUlWQmhvMlJXbWM', '2017-03-19 00:16:15.358829', '0');
INSERT INTO "googleDriveBackups" VALUES ('Libros', '0B64tcW7d1P2_emszQ3cyQ2VKY28', '2017-03-19 00:17:59.297697', '0');
INSERT INTO "googleDriveBackups" VALUES ('Carpeta a borrar', '0B64tcW7d1P2_NlRFcHVWUEdpWjg', '2017-03-21 08:25:24.788909', '0');
INSERT INTO "googleDriveBackups" VALUES ('FullFIMBackup#20170321_082627.zip', '0B64tcW7d1P2_WVVLakN5bkZadkE', '2017-03-21 08:26:31.292655', '1.511e+06');
INSERT INTO "googleDriveBackups" VALUES ('c1', '0B64tcW7d1P2_TVl3RE83bzBWOWM', '2017-03-21 15:18:43.033919', '0');
INSERT INTO "googleDriveBackups" VALUES ('c4', '0B64tcW7d1P2_Ml9rVzJ3Zk1EeHc', '2017-03-21 15:18:48.050022', '0');
INSERT INTO "googleDriveBackups" VALUES ('Giovanni''s_Room.zip', '0B64tcW7d1P2_NFc5WkQ3NVFRMW8', '2017-03-21 15:18:51.330139', '591253');
INSERT INTO "googleDriveBackups" VALUES ('The_Fire_Next_Time.zip', '0B64tcW7d1P2_d0VSSXRDdVJlc1U', '2017-03-21 15:35:21.849007', '303857');
INSERT INTO "googleDriveBackups" VALUES ('carpeta a respaldar', '0B64tcW7d1P2_ZWtLMGRqOHpWZW8', '2017-03-21 16:18:46.280953', '0');
INSERT INTO "googleDriveBackups" VALUES ('c4', '0B64tcW7d1P2_VngyeVV2SndDTVU', '2017-03-21 16:38:10.024538', '0');
INSERT INTO "googleDriveBackups" VALUES ('c4', '0B64tcW7d1P2_QVV6cXpfX3lUbEU', '2017-03-21 16:38:31.113094', '0');
INSERT INTO "googleDriveBackups" VALUES ('Carpeta respaldada', '0B64tcW7d1P2_dm05dDhoWmpQU2M', '2017-03-21 16:46:07.887822', '0');
INSERT INTO "googleDriveBackups" VALUES ('Carpeta respaldada', '0B64tcW7d1P2_NUwzcUt3cVIyejg', '2017-03-21 16:46:35.635373', '0');
INSERT INTO "googleDriveBackups" VALUES ('If_Beale_Street_Could_Talk.zip', '0B64tcW7d1P2_ekFVRWc2cTFuUXM', '2017-03-21 16:46:42.086554', '138414');
INSERT INTO "googleDriveBackups" VALUES ('FullFIMBackup#20170321_172308.zip', '0B64tcW7d1P2_aXlOZnRBcV9nWXc', '2017-03-21 17:23:17.863625', '6.43841e+06');
COMMIT;

-- ----------------------------
--  Table structure for transactionType
-- ----------------------------
CREATE TABLE "transactionType" (
	"id" int4 NOT NULL DEFAULT nextval('"transactionType_id_seq"'::regclass),
	"name" varchar COLLATE "default"
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of transactionType
-- ----------------------------
BEGIN;
INSERT INTO "transactionType" VALUES ('1', 'Creación de área');
INSERT INTO "transactionType" VALUES ('2', 'Edición de área');
INSERT INTO "transactionType" VALUES ('3', 'Creación de documento');
INSERT INTO "transactionType" VALUES ('4', 'Edición de documento');
INSERT INTO "transactionType" VALUES ('5', 'Creación de palabra clave');
INSERT INTO "transactionType" VALUES ('6', 'Edición de palabra clave');
INSERT INTO "transactionType" VALUES ('7', 'Creación de usuario');
INSERT INTO "transactionType" VALUES ('8', 'Edición de usuario');
INSERT INTO "transactionType" VALUES ('9', 'Eliminación de documento');
INSERT INTO "transactionType" VALUES ('10', 'Restauración de documento');
COMMIT;

-- ----------------------------
--  Table structure for keyword
-- ----------------------------
CREATE TABLE "keyword" (
	"id" int4
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of keyword
-- ----------------------------
BEGIN;
INSERT INTO "keyword" VALUES ('133');
INSERT INTO "keyword" VALUES ('132');
INSERT INTO "keyword" VALUES ('134');
INSERT INTO "keyword" VALUES ('135');
INSERT INTO "keyword" VALUES ('142');
INSERT INTO "keyword" VALUES ('144');
INSERT INTO "keyword" VALUES ('146');
INSERT INTO "keyword" VALUES ('148');
INSERT INTO "keyword" VALUES ('150');
INSERT INTO "keyword" VALUES ('152');
INSERT INTO "keyword" VALUES ('153');
INSERT INTO "keyword" VALUES ('154');
INSERT INTO "keyword" VALUES ('156');
INSERT INTO "keyword" VALUES ('160');
INSERT INTO "keyword" VALUES ('188');
INSERT INTO "keyword" VALUES ('189');
INSERT INTO "keyword" VALUES ('190');
INSERT INTO "keyword" VALUES ('191');
INSERT INTO "keyword" VALUES ('193');
INSERT INTO "keyword" VALUES ('194');
INSERT INTO "keyword" VALUES ('192');
INSERT INTO "keyword" VALUES ('198');
INSERT INTO "keyword" VALUES ('199');
INSERT INTO "keyword" VALUES ('204');
INSERT INTO "keyword" VALUES ('206');
INSERT INTO "keyword" VALUES ('214');
INSERT INTO "keyword" VALUES ('224');
INSERT INTO "keyword" VALUES ('226');
INSERT INTO "keyword" VALUES ('228');
INSERT INTO "keyword" VALUES ('282');
INSERT INTO "keyword" VALUES ('299');
INSERT INTO "keyword" VALUES ('311');
INSERT INTO "keyword" VALUES ('313');
INSERT INTO "keyword" VALUES ('317');
INSERT INTO "keyword" VALUES ('318');
INSERT INTO "keyword" VALUES ('319');
INSERT INTO "keyword" VALUES ('569');
INSERT INTO "keyword" VALUES ('579');
COMMIT;

-- ----------------------------
--  Table structure for area
-- ----------------------------
CREATE TABLE "area" (
	"id" int4 NOT NULL,
	"superuser" bool,
	"enabled" bool,
	"folderName" varchar COLLATE "default"
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of area
-- ----------------------------
BEGIN;
INSERT INTO "area" VALUES ('0', null, null, null);
INSERT INTO "area" VALUES ('126', 'f', 't', 'Coodinación académica');
INSERT INTO "area" VALUES ('127', 'f', 't', 'Coordinación administrativa');
INSERT INTO "area" VALUES ('123', 't', 't', 'Dirección');
INSERT INTO "area" VALUES ('196', 'f', 't', 'Control escolar');
INSERT INTO "area" VALUES ('157', 'f', 't', 'Area de superusuarios');
INSERT INTO "area" VALUES ('130', 'f', 't', 'Secretaria');
INSERT INTO "area" VALUES ('207', 'f', 't', 'Cooperativa2');
INSERT INTO "area" VALUES ('128', 'f', 't', 'Jefaturas de carrera');
INSERT INTO "area" VALUES ('129', 'f', 't', 'Tutorias');
COMMIT;

-- ----------------------------
--  Table structure for documentRelationships
-- ----------------------------
CREATE TABLE "documentRelationships" (
	"idDocumentParent" int2,
	"idDocumentChild" int2,
	"id" int4 NOT NULL DEFAULT nextval('"documentRelationships_id_seq"'::regclass)
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of documentRelationships
-- ----------------------------
BEGIN;
INSERT INTO "documentRelationships" VALUES ('568', '570', '153');
INSERT INTO "documentRelationships" VALUES ('574', '567', '156');
INSERT INTO "documentRelationships" VALUES ('575', '574', '157');
INSERT INTO "documentRelationships" VALUES ('568', '575', '158');
INSERT INTO "documentRelationships" VALUES ('571', '572', '159');
INSERT INTO "documentRelationships" VALUES ('571', '573', '160');
INSERT INTO "documentRelationships" VALUES ('571', '568', '161');
INSERT INTO "documentRelationships" VALUES ('576', '577', '162');
COMMIT;

-- ----------------------------
--  Table structure for usuario
-- ----------------------------
CREATE TABLE "usuario" (
	"id" int4 NOT NULL,
	"contraseña" varchar COLLATE "default",
	"isAdministrator" bool,
	"enabled" bool,
	"idArea" int4,
	"root" bool
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of usuario
-- ----------------------------
BEGIN;
INSERT INTO "usuario" VALUES ('136', 'tesorero', 't', 't', '127', 'f');
INSERT INTO "usuario" VALUES ('139', 'secretaria', 'f', 't', '130', 'f');
INSERT INTO "usuario" VALUES ('138', 'usuarioArea4', 'f', 't', '129', 'f');
INSERT INTO "usuario" VALUES ('9', null, null, null, null, 'f');
INSERT INTO "usuario" VALUES ('155', 'root2', 't', 't', '123', 't');
INSERT INTO "usuario" VALUES ('124', 'root', 't', 't', '123', 't');
INSERT INTO "usuario" VALUES ('125', 'coordinadoracademico', 'f', 't', '126', 'f');
INSERT INTO "usuario" VALUES ('197', 'controlescolar', 'f', 't', '196', 'f');
INSERT INTO "usuario" VALUES ('140', 'direccion2', 't', 't', '123', 'f');
INSERT INTO "usuario" VALUES ('344', 'usuarionormal', 'f', 't', '128', 'f');
INSERT INTO "usuario" VALUES ('491', 'hello', 't', 't', '126', 't');
INSERT INTO "usuario" VALUES ('215', 'root0', 't', 't', '0', 't');
INSERT INTO "usuario" VALUES ('137', 'usuarioArea3', 't', 't', '128', 'f');
COMMIT;

-- ----------------------------
--  Table structure for object
-- ----------------------------
CREATE TABLE "object" (
	"id" int4 NOT NULL DEFAULT nextval('object_id_seq'::regclass),
	"name" varchar COLLATE "default",
	"description" text COLLATE "default",
	"createdOn" timestamp(6) NULL DEFAULT now(),
	"createdBy" int4,
	"color" varchar COLLATE "default",
	"kind" varchar COLLATE "default"
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of object
-- ----------------------------
BEGIN;
INSERT INTO "object" VALUES ('133', 'informe', null, '2017-01-11 09:34:12.118052', '124', null, 'keyword');
INSERT INTO "object" VALUES ('132', 'enero', null, '2017-01-11 09:34:12.109452', '124', null, 'keyword');
INSERT INTO "object" VALUES ('134', 'palabras', null, '2017-01-11 09:34:32.047557', '124', null, 'keyword');
INSERT INTO "object" VALUES ('138', 'usuarioArea4', '', '2017-01-11 19:20:12.925937', '124', null, null);
INSERT INTO "object" VALUES ('142', 'area2', null, '2017-01-11 22:08:42.233543', '136', null, 'keyword');
INSERT INTO "object" VALUES ('144', 'de area 5', null, '2017-01-11 22:14:58.413576', '139', null, 'keyword');
INSERT INTO "object" VALUES ('139', 'secretaria', null, '2017-01-11 19:21:09.010166', '124', null, null);
INSERT INTO "object" VALUES ('274', 'C(4)', 'C', '2017-03-14 20:13:17.603582', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('136', 'tesorero', null, '2017-01-11 19:15:57.637905', '124', null, null);
INSERT INTO "object" VALUES ('148', 'diciembre', null, '2017-01-12 16:10:14.173322', '124', null, 'keyword');
INSERT INTO "object" VALUES ('150', 'inteligencia artificial', null, '2017-01-12 16:35:21.29638', '124', null, 'keyword');
INSERT INTO "object" VALUES ('188', 'acta3242342342', null, '2017-02-10 19:24:42.582805', '124', null, 'keyword');
INSERT INTO "object" VALUES ('129', 'Tutorias', null, '2017-01-10 21:40:06.294055', '124', null, null);
INSERT INTO "object" VALUES ('152', 'captura', null, '2017-01-12 17:17:20.586458', '124', null, 'keyword');
INSERT INTO "object" VALUES ('153', 'prueba', null, '2017-01-12 17:17:20.587463', '124', null, 'keyword');
INSERT INTO "object" VALUES ('154', 'clave', null, '2017-01-12 17:18:09.788549', '124', null, 'keyword');
INSERT INTO "object" VALUES ('155', 'root2', '', '2017-01-15 11:24:12.97042', '124', null, null);
INSERT INTO "object" VALUES ('146', 'documento', null, '2017-01-11 22:32:12.274006', '136', null, 'keyword');
INSERT INTO "object" VALUES ('160', 'tutorias', null, '2017-01-16 20:15:09.072381', '124', null, 'keyword');
INSERT INTO "object" VALUES ('198', 'nuevapalabraclave', null, '2017-02-10 19:41:25.669713', '124', null, 'keyword');
INSERT INTO "object" VALUES ('199', 'kardex', null, '2017-02-10 19:41:30.590993', '124', null, 'keyword');
INSERT INTO "object" VALUES ('156', 'nueva', null, '2017-01-15 18:41:54.172433', '124', null, 'keyword');
INSERT INTO "object" VALUES ('200', 'kardex', 'kardex', '2017-02-10 19:43:11.67423', '197', '#01579b', 'document');
INSERT INTO "object" VALUES ('140', 'direccion2', null, '2017-01-11 19:27:45.830832', '124', null, null);
INSERT INTO "object" VALUES ('124', 'root', null, '2017-01-10 20:18:49.060262', '9', null, null);
INSERT INTO "object" VALUES ('126', 'Coodinación académica', null, '2017-01-10 21:39:51.234457', '124', null, null);
INSERT INTO "object" VALUES ('125', 'coordinadoracademico', null, '2017-01-10 21:23:09.250603', '124', null, null);
INSERT INTO "object" VALUES ('246', 'Solicitud', 'Solicitud', '2017-03-14 17:21:52.552375', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('247', 'Carpeta de Jonathan Gil', 'Carpeta de Jonathan Gil', '2017-03-14 17:34:17.058772', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('127', 'Coordinación administrativa', null, '2017-01-10 21:39:55.83921', '124', null, null);
INSERT INTO "object" VALUES ('123', 'Dirección', null, '2017-01-10 20:18:27.652247', '9', null, null);
INSERT INTO "object" VALUES ('189', 'descripcion', null, '2017-02-10 19:24:42.583821', '124', null, 'keyword');
INSERT INTO "object" VALUES ('190', 'diplomado', null, '2017-02-10 19:24:42.595338', '124', null, 'keyword');
INSERT INTO "object" VALUES ('191', 'inscripción', null, '2017-02-10 19:24:42.597517', '124', null, 'keyword');
INSERT INTO "object" VALUES ('192', 'cuota', null, '2017-02-10 19:24:42.603559', '124', null, 'keyword');
INSERT INTO "object" VALUES ('193', 'reinscripción', null, '2017-02-10 19:24:42.606175', '124', null, 'keyword');
INSERT INTO "object" VALUES ('194', 'cursos', null, '2017-02-10 19:24:42.608029', '124', null, 'keyword');
INSERT INTO "object" VALUES ('224', 'carpeta', null, '2017-03-14 10:33:19.111885', '124', null, 'keyword');
INSERT INTO "object" VALUES ('196', 'Control escolar', null, '2017-02-10 19:30:12.912091', '124', null, 'area');
INSERT INTO "object" VALUES ('197', 'controlescolar', '', '2017-02-10 19:41:06.672244', '124', null, null);
INSERT INTO "object" VALUES ('157', 'Area de superusuarios', null, '2017-01-15 19:44:41.615557', '124', null, null);
INSERT INTO "object" VALUES ('130', 'Secretaria', null, '2017-01-10 21:40:11.575524', '124', null, null);
INSERT INTO "object" VALUES ('202', 'informe2', 'informe2', '2017-03-09 07:30:47.891938', '139', '#01579b', 'document');
INSERT INTO "object" VALUES ('204', 'corporate', null, '2017-03-12 11:55:18.379912', '124', null, 'keyword');
INSERT INTO "object" VALUES ('206', 'maestria', null, '2017-03-12 11:56:26.30289', '124', null, 'keyword');
INSERT INTO "object" VALUES ('207', 'Cooperativa2', null, '2017-03-12 12:33:20.641547', '124', null, 'area');
INSERT INTO "object" VALUES ('185', 'd1', 'd1', '2017-01-21 17:00:16.321775', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('186', 'd2', 'd2', '2017-01-21 17:00:33.588267', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('225', 'Solcitud de empleo', 'Solcitud de empleo', '2017-03-14 11:57:21.39212', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('195', 'Cuota', 'Cuota', '2017-02-10 19:27:25.053907', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('226', 'direccion', null, '2017-03-14 11:57:21.480946', '124', null, 'keyword');
INSERT INTO "object" VALUES ('205', 'maestria', 'maestria', '2017-03-12 11:56:26.274744', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('187', 'Acta de consejo2', 'Descripción acta de consejo2', '2017-02-10 19:24:42.543898', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('203', 'C', 'C', '2017-03-12 11:55:18.347403', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('208', 'jaysome', 'hello', '2017-03-12 15:38:55.738701', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('209', 'practica', 'practica', '2017-03-12 17:50:39.096316', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('210', 'practicas', 'practicas', '2017-03-12 17:52:16.942572', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('211', 'modern times', 'modern times', '2017-03-12 18:01:25.916923', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('213', 'Caratula CD', 'Caratula CD', '2017-03-12 19:26:18.659041', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('214', 'Caratula CD Servicio Social', null, '2017-03-12 19:26:18.725564', '124', null, 'keyword');
INSERT INTO "object" VALUES ('215', 'root0', '', '2017-03-12 20:02:19.334219', '124', null, null);
INSERT INTO "object" VALUES ('216', 'Prueba', 'Prueba', '2017-03-13 15:55:11.96142', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('217', 'PDFs Importantes', 'PDFs Importantes', '2017-03-13 16:27:12.467779', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('218', 'Carpeta de prueba', 'Carpeta de prueba', '2017-03-14 06:43:50.810887', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('219', 'carpeta', 'carpeta', '2017-03-14 06:46:47.541926', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('221', 'Carpeta', 'Carpeta', '2017-03-14 08:24:41.993184', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('228', 'libro', null, '2017-03-14 12:17:32.871619', '125', null, 'keyword');
INSERT INTO "object" VALUES ('248', 'Carpeta de Jonathan Gil', 'Carpeta de Jonathan Gil', '2017-03-14 17:41:21.285522', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('227', 'Libro', 'Libro', '2017-03-14 12:17:32.815831', '125', '#01579b', 'document');
INSERT INTO "object" VALUES ('223', 'Carpeta', 'Carpeta', '2017-03-14 08:53:00.427921', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('229', 'Carpetas Diana', 'Carpetas Diana', '2017-03-14 12:47:07.598884', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('230', 'Elogio de la locura', 'Elogio de la locura', '2017-03-14 16:17:59.700048', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('231', 'Elogio de la locura', 'Elogio de la locura', '2017-03-14 16:18:26.44998', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('232', 'e', 'e', '2017-03-14 16:20:28.789239', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('233', 'e2', 'e2', '2017-03-14 16:23:50.770383', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('234', 'e3', 'e3', '2017-03-14 16:24:57.559317', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('235', 'e4', 'e4', '2017-03-14 16:25:20.39029', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('236', 'Elogio', 'Elogio', '2017-03-14 16:28:03.817215', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('237', 'Elogio2', 'Elogio2', '2017-03-14 16:28:22.770118', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('238', 'e3', 'e3', '2017-03-14 16:29:36.663019', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('239', '1', '1', '2017-03-14 16:32:54.614167', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('240', '2', '2', '2017-03-14 16:33:13.005041', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('249', 'Carpeta de Jonathan Gil', 'Carpeta de Jonathan Gil', '2017-03-14 17:44:09.185691', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('242', 'Elogio1', 'Elogio1', '2017-03-14 16:35:45.127465', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('241', 'Elogio2', 'Elogio2', '2017-03-14 16:35:33.653318', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('243', 'Carpeta de Jonathan', 'Carpeta de Jonathan', '2017-03-14 16:39:01.917828', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('244', 'Caratula', 'Caratula', '2017-03-14 17:04:38.274121', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('245', 'fotos', 'fotos', '2017-03-14 17:20:32.127971', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('250', 'Carpeta de Jonathan Gil', 'Carpeta de Jonathan Gil', '2017-03-14 17:49:52.685203', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('251', 'Carpeta de Jonathan Gil', 'Carpeta de Jonathan Gil', '2017-03-14 17:50:02.449838', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('252', '/Carpeta de Jonathan Gil(1)(2)', 'Carpeta de Jonathan Gil', '2017-03-14 17:53:49.217054', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('254', 'Carpeta de Jonathan Gil(1)', 'Carpeta de Jonathan Gil', '2017-03-14 17:59:45.405282', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('255', 'Carpeta de Jonathan Gil(1)(2)', 'Carpeta de Jonathan Gil', '2017-03-14 18:00:27.674588', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('253', 'Carpeta de Jonathan Gil', 'Carpeta de Jonathan Gil', '2017-03-14 17:59:36.380144', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('256', 'c', 'c', '2017-03-14 18:25:07.298655', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('257', 'c(1)(1)(1)(1)', 'c', '2017-03-14 18:29:17.623954', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('258', 'C', 'C', '2017-03-14 18:47:07.591832', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('259', 'C(0)', 'C', '2017-03-14 18:47:20.997596', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('260', 'C(1)', 'C', '2017-03-14 18:47:55.833374', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('261', 'C(1)(2)', 'C', '2017-03-14 18:49:14.147349', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('137', 'usuarioArea3', null, '2017-01-11 19:19:22.243116', '124', '', null);
INSERT INTO "object" VALUES ('262', 'C(1)(2)(3)', 'C', '2017-03-14 18:49:31.021204', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('263', 'C', 'C', '2017-03-14 18:55:37.682006', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('264', '(1)', 'C', '2017-03-14 18:55:49.213728', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('265', '(2)', 'C', '2017-03-14 18:55:56.667799', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('266', '(3)', 'C', '2017-03-14 19:01:06.970088', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('267', '(4)', 'C', '2017-03-14 19:02:02.591055', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('276', 'Caratula', 'Caratula', '2017-03-14 20:16:46.947089', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('277', 'C', 'C', '2017-03-14 20:19:56.144985', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('269', 'C(1)(1)(1)(1)', 'C', '2017-03-14 19:30:02.055356', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('278', 'Carátula', 'Carátula', '2017-03-14 20:25:20.238999', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('275', 'Caratula', 'C', '2017-03-14 20:15:14.128047', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('270', 'C(1)(3)', 'C', '2017-03-14 19:49:41.329603', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('324', 'archivo grande', 'asdmfadsf', '2017-03-16 11:20:33.711961', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('325', 'archivo grande', 'archivo grande', '2017-03-16 11:33:44.395324', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('271', 'C(2)', 'C', '2017-03-14 19:50:06.238383', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('268', 'C', 'C', '2017-03-14 19:29:53.445147', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('326', 'Elogio', 'Elogio', '2017-03-16 11:38:05.084237', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('281', 'Solicitud', 'Solicitud', '2017-03-14 20:49:24.95251', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('279', 'Carátulas', 'Carátulas', '2017-03-14 20:41:31.078665', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('327', 'hello', 'hello', '2017-03-16 11:38:21.80691', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('282', 'caratulas', null, '2017-03-14 22:12:55.258666', '124', null, 'keyword');
INSERT INTO "object" VALUES ('328', 'hello', 'hello', '2017-03-16 11:38:21.993118', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('280', 'Carátula', 'Carátula', '2017-03-14 20:43:50.416378', '124', null, 'document');
INSERT INTO "object" VALUES ('272', 'C(7)(1)(1)', 'C', '2017-03-14 19:53:43.068534', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('284', 'Solicitudes de trabajo', 'Solicitudes de trabajo', '2017-03-15 05:25:52.912328', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('285', 'Carpeta', 'Carpeta', '2017-03-15 05:27:24.790107', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('273', 'C', 'C', '2017-03-14 20:10:29.382122', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('286', 'Carátula', 'Carátula', '2017-03-15 05:27:59.038674', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('329', 'hello', 'asdfads', '2017-03-16 11:41:25.266592', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('283', 'Carátulas', 'Carátulas', '2017-03-15 05:21:22.954133', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('287', 'Carátulas2', 'Carátulas', '2017-03-15 06:19:07.528644', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('330', 'hello', 'asdfads', '2017-03-16 11:41:25.540835', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('288', 'Caratulas', 'Caratulas', '2017-03-15 06:20:33.08028', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('289', 'Carátulas2', 'Carátulas', '2017-03-15 06:23:53.992724', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('290', 'Carátulas', 'Carátulas', '2017-03-15 06:28:46.521681', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('291', 'Carátulas', 'Carátulas', '2017-03-15 06:31:25.898631', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('292', 'Carátulas', 'Carátulas', '2017-03-15 06:32:57.995556', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('293', 'Carátulas', 'Carátulas', '2017-03-15 06:34:25.034807', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('294', 'Carátulas', 'Carátulas', '2017-03-15 06:38:26.81111', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('296', 'Carátula', 'Carátula', '2017-03-15 07:03:04.870305', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('297', 'Caratula', 'Caratula', '2017-03-15 07:10:15.186383', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('298', 'Carátula CD', 'Carátula CD', '2017-03-15 07:27:07.962157', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('299', 'Caratula', null, '2017-03-15 07:27:08.052386', '124', null, 'keyword');
INSERT INTO "object" VALUES ('295', 'Carátulas2', 'Carátulas2', '2017-03-15 06:44:18.694009', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('300', 'Carátulas', 'Carátulas', '2017-03-15 08:23:19.629616', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('301', 'Formato', 'Formato', '2017-03-15 08:23:46.644484', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('302', 'Carátulas2', 'Carátulas2', '2017-03-15 08:29:37.429082', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('303', 'caratula', 'ccaratula', '2017-03-15 08:29:50.586869', '124', null, 'document');
INSERT INTO "object" VALUES ('304', 'Carátulas', 'Carátulas', '2017-03-15 12:03:20.802903', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('305', 'Carátula2', 'Carátula2', '2017-03-15 12:03:42.821071', '124', null, 'document');
INSERT INTO "object" VALUES ('306', 'Elogio', 'Elogio', '2017-03-15 12:06:56.43009', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('331', 'Fausto', 'Fausto', '2017-03-16 11:44:15.2993', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('332', 'asdfasdf', 'asfdasdfsadf', '2017-03-16 11:44:24.87359', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('307', 'Libro2354', 'Libro2354', '2017-03-15 12:08:49.385705', '124', null, 'document');
INSERT INTO "object" VALUES ('308', 'Carátulas Marzo', 'Carátulas Marzo', '2017-03-15 22:25:45.165325', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('309', 'Caratulas Mayo', 'Caratulas Mayo', '2017-03-15 22:47:02.352526', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('310', 'Elogio de la locura', 'Elogio de la locura', '2017-03-16 08:03:40.381168', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('311', 'nueva palabra clave', null, '2017-03-16 08:04:13.435108', '124', null, 'keyword');
INSERT INTO "object" VALUES ('312', 'Libros', 'Libros', '2017-03-16 08:07:50.531052', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('313', 'Carpeta de libros', null, '2017-03-16 08:07:50.614059', '124', null, 'keyword');
INSERT INTO "object" VALUES ('314', 'jar', 'jar', '2017-03-16 09:22:13.452792', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('315', 'Novelas', 'Novelas', '2017-03-16 09:40:08.340078', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('316', 'archivox', 'bla bla', '2017-03-16 11:15:44.065508', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('317', 'rev', null, '2017-03-16 11:15:44.294269', '124', null, 'keyword');
INSERT INTO "object" VALUES ('318', 'rev1', null, '2017-03-16 11:15:44.303525', '124', null, 'keyword');
INSERT INTO "object" VALUES ('319', 'informe nuevo', null, '2017-03-16 11:15:44.310383', '124', null, 'keyword');
INSERT INTO "object" VALUES ('320', 'archivoxD', 'bla bla bla', '2017-03-16 11:18:00.898541', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('321', 'archivoxD', 'bla bla bla', '2017-03-16 11:18:01.049584', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('322', 'asd', 'asd', '2017-03-16 11:19:14.616142', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('323', 'archivo grande', 'archivo grande', '2017-03-16 11:19:59.091538', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('333', 'asdfasdf', 'asfdasdfsadf', '2017-03-16 11:44:25.077255', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('334', 'elogio', 'elogio', '2017-03-16 11:47:25.318303', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('335', 'sdfgsdfg', 'sdfgsdfg', '2017-03-16 11:47:35.440414', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('336', 'sdfgsdfg', 'sdfgsdfg', '2017-03-16 11:47:35.808471', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('337', 'sdfgdfsg', 'sdfgsdfgdfsg', '2017-03-16 11:47:47.976015', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('338', 'archivo', 'archivo', '2017-03-16 11:50:33.843609', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('340', 'asdfads', 'asdfasdf', '2017-03-16 12:19:25.882788', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('341', 'asdf', 'asdf', '2017-03-16 12:20:04.768828', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('342', 'xcvb', 'xcvb', '2017-03-16 12:21:09.277111', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('343', 'jkljkl', 'jkljklj', '2017-03-16 12:21:24.155051', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('344', 'usuarionormal', '', '2017-03-16 12:23:31.408122', '124', null, null);
INSERT INTO "object" VALUES ('345', 'Carpeta de usuario normal', 'Carpeta de usuario normal', '2017-03-16 12:31:59.669159', '344', '#01579b', 'document');
INSERT INTO "object" VALUES ('346', 'libro de carpeta', 'libro de carpeta', '2017-03-16 12:34:27.777899', '344', '#01579b', 'document');
INSERT INTO "object" VALUES ('128', 'Jefaturas de carrera', null, '2017-01-10 21:40:00.649318', '124', null, null);
INSERT INTO "object" VALUES ('339', 'Archivo grande', 'Archivo grande', '2017-03-16 12:18:49.332244', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('347', 'direccion', 'direccion', '2017-03-16 12:46:10.827333', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('348', 'carpeta de direccion', 'carpeta de direccion', '2017-03-16 12:52:47.762125', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('349', 'Area de Jonathan', null, '2017-03-16 15:07:29.816515', '124', null, 'area');
INSERT INTO "object" VALUES ('350', 'Area de Jonathan 2', null, '2017-03-16 15:10:39.605597', '124', null, 'area');
INSERT INTO "object" VALUES ('351', 'elogio', 'elogio', '2017-03-16 17:18:08.74313', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('352', 'Elogio', 'Elogio', '2017-03-16 17:28:11.876374', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('385', 'Elogio', 'Elogio', '2017-03-16 18:18:21.389872', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('386', 'frur', 'frur', '2017-03-16 18:20:56.8653', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('387', 'The BEATLES', 'The BEATLES', '2017-03-16 20:51:58.395207', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('388', 'Angular', 'Angular', '2017-03-16 21:52:27.020919', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('390', 'The BEATLES', 'The BEATLES', '2017-03-16 21:57:13.581174', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('455', 'c3', 'c3', '2017-03-19 20:49:37.065976', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('456', 'Giovanni''s Room', 'Giovanni''s Room', '2017-03-19 20:50:40.741416', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('389', 'Angular', 'Angular', '2017-03-16 21:55:53.860549', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('391', 'Elogio de la locura', 'Elogio de la locura', '2017-03-17 06:15:05.618723', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('392', 'Carpeta de Jonathan', 'Carpeta de Jonathan', '2017-03-17 06:16:51.243676', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('393', 'e', 'e', '2017-03-17 07:22:40.661322', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('394', 'e', 'e', '2017-03-17 07:22:40.682803', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('395', 'r', 'r', '2017-03-17 07:22:56.891636', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('457', 'Giovanni''s Room', 'Giovanni''s Room', '2017-03-19 20:53:16.070439', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('396', 'Elogio', 'Elogio', '2017-03-17 07:29:43.138228', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('397', 'Carpeta de Jonathan', 'Carpeta de Jonathan', '2017-03-17 08:18:54.947195', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('398', 'JGS', 'JGS', '2017-03-17 09:49:48.887528', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('399', 'JGS', 'JGS', '2017-03-17 09:54:28.907445', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('400', 'JAY SOM', 'JAY SOM', '2017-03-17 10:06:40.295205', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('401', 'Giovanni''s Room', 'Giovanni''s Room', '2017-03-18 08:11:09.592158', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('402', 'Caso de uso', 'Caso de uso', '2017-03-18 08:53:11.882861', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('403', 'Libros de Jonathan', 'Libros de Jonathan', '2017-03-18 09:04:15.573961', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('404', 'Eleanor', 'Eleanor', '2017-03-18 09:04:44.777963', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('405', 'Libros Again', 'Libros Again', '2017-03-18 09:07:40.629645', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('406', 'Libros new', 'Libros new', '2017-03-18 09:10:57.1398', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('407', 'Esch', 'Esch', '2017-03-18 09:12:20.314221', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('408', 'Eleanor', 'Eleanor', '2017-03-18 10:20:16.607817', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('409', 'Libros papá', 'Libros papá', '2017-03-18 10:21:04.961526', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('410', 'Mara Wilson', 'Mara Wilson', '2017-03-18 10:21:23.495516', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('411', 'Libros rusos', 'Libros rusos', '2017-03-18 10:30:17.863408', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('412', 'Pasenow', 'Pasenow', '2017-03-18 10:30:34.232304', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('414', 'Libros de Jonathan', 'Libros de Jonathan', '2017-03-18 11:05:32.879181', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('416', 'Libros de James Baldwin', 'Libros de James Baldwin', '2017-03-18 11:06:40.539309', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('417', 'The Fire Next Time', 'The Fire Next Time', '2017-03-18 11:07:10.622724', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('418', 'Libros controversiales', 'Libros controversiales', '2017-03-18 11:07:42.518703', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('419', 'Curriculum Vitae', 'Curriculum Vitae', '2017-03-18 11:08:17.233931', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('413', 'Another Country', 'Another Country', '2017-03-18 11:05:10.881074', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('415', 'Go tell it to the mountain', 'Go tell it to the mountain', '2017-03-18 11:05:52.428763', '124', null, 'document');
INSERT INTO "object" VALUES ('420', 'Libros', 'Libros', '2017-03-18 11:31:26.535617', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('421', 'Giovanni''s Room', 'Giovanni''s Room', '2017-03-18 11:32:11.169461', '124', null, 'document');
INSERT INTO "object" VALUES ('422', 'Libros de Jonathan', 'Libros de Jonathan', '2017-03-18 11:37:00.04411', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('423', 'Another Country', 'Another Country', '2017-03-18 11:37:17.522807', '124', null, 'document');
INSERT INTO "object" VALUES ('424', 'Como cuarta carpeta', 'Como cuarta carpeta', '2017-03-18 11:42:40.76921', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('425', 'The Fire Next Time', 'The Fire Next Time', '2017-03-18 11:43:08.545056', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('426', 'Películas', 'Unas pelis, wey', '2017-03-18 16:36:00.758453', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('427', 'Drama', 'Drama', '2017-03-18 16:36:30.035799', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('428', '00s', '00s', '2017-03-18 16:36:58.965125', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('429', 'Quentin Tarantino', 'Quentin Tarantino', '2017-03-18 16:37:16.049392', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('430', '90s', '90s', '2017-03-18 16:37:34.336934', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('431', 'Discos', 'Discos', '2017-03-18 16:52:14.909605', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('432', 'Carpeta de Jonathan', 'Carpeta de Jonathan', '2017-03-19 18:40:46.153491', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('433', 'Carpeta de Papá', 'Carpeta de Papá', '2017-03-19 18:41:17.485784', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('434', 'Carpeta amazing', 'Carpeta amazing', '2017-03-19 18:43:44.731715', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('435', 'c1', 'c1', '2017-03-19 18:44:40.341298', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('436', 'c1', 'c1', '2017-03-19 18:55:56.988752', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('437', 'c2', 'c2', '2017-03-19 18:56:05.502798', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('438', 'c3', 'c3', '2017-03-19 18:56:12.355619', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('439', 'book', 'book', '2017-03-19 18:58:34.568948', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('440', 'c1', 'c1', '2017-03-19 19:01:38.8836', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('441', 'cinside', 'cinside', '2017-03-19 19:03:12.238489', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('442', 'c4', 'c4', '2017-03-19 19:03:29.096326', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('460', 'c4', 'c4', '2017-03-19 20:54:03.326668', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('458', 'NO SIRVEN', 'c1', '2017-03-19 20:53:24.076708', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('459', 'NO SIRVEN', 'c2', '2017-03-19 20:53:55.082535', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('443', 'NO SIRVE', 'NO SIRVE', '2017-03-19 19:03:52.099143', '124', null, 'document');
INSERT INTO "object" VALUES ('444', 'c5', 'c5', '2017-03-19 19:17:53.389939', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('445', 'c6', 'c6', '2017-03-19 19:33:24.967521', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('446', 'c7', 'c7', '2017-03-19 19:37:38.002086', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('447', 'c8', 'c8', '2017-03-19 19:40:53.271937', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('448', 'c9', 'c9', '2017-03-19 19:42:11.993422', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('449', 'c10', 'c10', '2017-03-19 19:51:20.587376', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('450', 'c11', 'c11', '2017-03-19 19:58:43.235351', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('451', 'c12', 'c12', '2017-03-19 20:01:24.181026', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('452', 'Giovanni''s Room', 'Giovanni''s Room', '2017-03-19 20:39:58.441613', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('453', 'c1', 'c1', '2017-03-19 20:49:13.444471', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('454', 'c2', 'c2', '2017-03-19 20:49:23.592014', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('461', 'NO SIRVEN', 'c5', '2017-03-19 20:54:10.756997', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('462', 'c1', 'c1', '2017-03-19 20:57:08.880596', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('463', 'c1', 'c1', '2017-03-19 20:59:54.885702', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('464', 'c2', 'c2', '2017-03-19 21:00:30.023138', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('465', 'c1', 'c1', '2017-03-19 21:07:31.109929', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('466', 'c2', 'c2', '2017-03-19 21:07:44.865946', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('467', 'c3', 'c3', '2017-03-19 21:10:43.858', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('468', 'c1', 'c1', '2017-03-19 21:15:18.982952', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('469', 'c2', 'c2', '2017-03-19 21:16:42.558897', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('470', 'c1', 'c1', '2017-03-19 21:18:37.707565', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('471', 'c2', 'c2', '2017-03-19 21:19:09.609506', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('472', 'c1', 'c1', '2017-03-19 21:21:36.186976', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('473', 'c2', 'c2', '2017-03-19 21:21:47.820427', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('474', 'c3', 'c3', '2017-03-19 21:24:25.840713', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('475', 'c4', 'c4', '2017-03-19 21:24:32.8859', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('476', 'c5', 'c5', '2017-03-19 21:25:12.149095', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('477', 'c5', 'c5', '2017-03-19 21:28:20.046932', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('478', 'c6', 'c6', '2017-03-19 21:29:11.505046', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('479', 'c1', 'c1', '2017-03-19 21:32:31.021879', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('480', 'c2', 'c2', '2017-03-19 21:32:37.543227', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('481', 'A1', 'a1', '2017-03-19 21:38:45.700569', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('482', 'A2', 'a2', '2017-03-19 21:38:54.328916', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('483', 'a3', 'a3', '2017-03-19 21:41:30.193576', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('484', 'a1', 'a1', '2017-03-19 21:43:46.231052', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('485', 'a2', 'a2', '2017-03-19 21:43:54.297111', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('486', 'a3', 'a3', '2017-03-19 21:50:22.713301', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('487', 'a2', 'a2', '2017-03-19 21:58:54.989983', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('488', 'a1', 'a1', '2017-03-19 23:54:38.546653', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('489', 'a2', 'a2', '2017-03-19 23:54:49.680962', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('490', 'a3', 'a3', '2017-03-19 23:54:59.230469', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('491', 'hello2', null, '2017-03-20 19:05:46.254897', '124', null, 'user');
INSERT INTO "object" VALUES ('492', 'a1', 'a1', '2017-03-20 20:15:36.516772', '124', '', 'document');
INSERT INTO "object" VALUES ('493', 'Another Country', 'Another Country', '2017-03-20 20:29:45.191845', '124', '', 'document');
INSERT INTO "object" VALUES ('494', 'Giovanni''s Room', 'Giovanni''s Room', '2017-03-20 20:34:52.836281', '124', '', 'document');
INSERT INTO "object" VALUES ('495', 'Giovann''is Room', 'Giovann''is Room', '2017-03-20 20:39:23.329036', '124', '', 'document');
INSERT INTO "object" VALUES ('496', 'Giovann''s Room', 'Giovann''s Room', '2017-03-20 20:42:17.67533', '124', '', 'document');
INSERT INTO "object" VALUES ('497', 'a1', 'a1', '2017-03-20 20:44:09.638392', '124', '', 'document');
INSERT INTO "object" VALUES ('498', 'Giovanni''s Room', 'Giovanni''s Room', '2017-03-20 20:45:04.285655', '124', '', 'document');
INSERT INTO "object" VALUES ('499', 'Another Country', 'Another Country', '2017-03-20 20:46:55.817189', '124', '', 'document');
INSERT INTO "object" VALUES ('500', 'a1', 'a1', '2017-03-20 20:57:55.684413', '124', '', 'document');
INSERT INTO "object" VALUES ('501', 'a2', 'a2', '2017-03-20 20:58:04.768852', '124', '', 'document');
INSERT INTO "object" VALUES ('502', 'Giovanni''s Room', 'Giovanni''s Room', '2017-03-20 20:58:47.230135', '124', '', 'document');
INSERT INTO "object" VALUES ('503', 'gr', 'gr', '2017-03-21 07:39:24.97275', '124', '', 'document');
INSERT INTO "object" VALUES ('504', 'gr', 'gr', '2017-03-21 07:39:58.922086', '124', '', 'document');
INSERT INTO "object" VALUES ('505', 'GR', 'GR', '2017-03-21 07:41:39.664311', '124', '', 'document');
INSERT INTO "object" VALUES ('506', 'CARPETA DE PRUEBA A MOVER', 'CARPETA DE PRUEBA A MOVER', '2017-03-21 07:45:12.945925', '124', '', 'document');
INSERT INTO "object" VALUES ('507', 'Carpeta de prueba', 'Carpeta de prueba', '2017-03-21 08:04:04.399676', '124', '', 'document');
INSERT INTO "object" VALUES ('508', 'gr', 'gr', '2017-03-21 08:04:16.082053', '124', '', 'document');
INSERT INTO "object" VALUES ('509', 'gr', 'gr', '2017-03-21 08:04:36.942364', '124', '', 'document');
INSERT INTO "object" VALUES ('510', 'zz', 'zz', '2017-03-21 08:07:37.313984', '124', '', 'document');
INSERT INTO "object" VALUES ('511', 'zz', 'zz', '2017-03-21 08:07:53.519195', '124', '', 'document');
INSERT INTO "object" VALUES ('512', 'Carpeta a borrar', 'Carpeta a borrar', '2017-03-21 08:11:19.573408', '124', '', 'document');
INSERT INTO "object" VALUES ('513', 'Documento a borrar', 'Documento a borrar', '2017-03-21 08:13:55.625956', '124', '', 'document');
INSERT INTO "object" VALUES ('514', 'Nueva carpeta', 'Nueva carpeta', '2017-03-21 08:17:50.06697', '124', '', 'document');
INSERT INTO "object" VALUES ('515', 'hello', 'hello', '2017-03-21 08:18:09.869197', '124', '', 'document');
INSERT INTO "object" VALUES ('516', 'c1', 'c1', '2017-03-21 08:27:48.226534', '124', '', 'document');
INSERT INTO "object" VALUES ('517', 'c2', 'c2', '2017-03-21 08:27:58.077326', '124', '', 'document');
INSERT INTO "object" VALUES ('518', 'c3', 'c3', '2017-03-21 08:28:06.71098', '124', '', 'document');
INSERT INTO "object" VALUES ('519', 'c1', 'c1', '2017-03-21 08:48:51.591758', '124', '', 'document');
INSERT INTO "object" VALUES ('520', 'c2', 'c2', '2017-03-21 08:49:01.794558', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('521', 'c3', 'c3', '2017-03-21 08:51:02.865248', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('522', 'beale', 'beale', '2017-03-21 08:51:33.501217', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('523', 'c4', 'c4', '2017-03-21 08:52:44.814229', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('524', 'c1', 'c1', '2017-03-21 09:46:10.923275', '124', '', 'document');
INSERT INTO "object" VALUES ('525', 'c2', 'c2', '2017-03-21 09:53:19.91892', '124', '', 'document');
INSERT INTO "object" VALUES ('526', 'c3', 'c3', '2017-03-21 09:53:42.727125', '124', '', 'document');
INSERT INTO "object" VALUES ('527', 'c5', 'c5', '2017-03-21 09:56:56.233026', '124', '', 'document');
INSERT INTO "object" VALUES ('528', 'gr', 'gr', '2017-03-21 10:02:04.740313', '124', '', 'document');
INSERT INTO "object" VALUES ('529', 'borrado', 'borrado', '2017-03-21 10:06:48.236504', '124', '', 'document');
INSERT INTO "object" VALUES ('530', 'a2', 'a2', '2017-03-21 10:15:01.422085', '124', '', 'document');
INSERT INTO "object" VALUES ('531', 'Beale', 'Beale', '2017-03-21 10:22:25.634934', '124', '', 'document');
INSERT INTO "object" VALUES ('532', 'b', 'b', '2017-03-21 10:24:09.717862', '124', '', 'document');
INSERT INTO "object" VALUES ('533', 'c3', 'c3', '2017-03-21 10:31:22.610793', '124', '', 'document');
INSERT INTO "object" VALUES ('534', 'mountain', 'mountain', '2017-03-21 10:31:37.830451', '124', '', 'document');
INSERT INTO "object" VALUES ('535', 'Borrado', 'Borrado', '2017-03-21 10:41:10.11235', '124', '', 'document');
INSERT INTO "object" VALUES ('536', 'a1', 'a1', '2017-03-21 10:43:24.795182', '124', '', 'document');
INSERT INTO "object" VALUES ('537', 'c1', 'c1', '2017-03-21 10:43:33.610008', '124', '', 'document');
INSERT INTO "object" VALUES ('538', 'fire', 'fire', '2017-03-21 10:44:20.137197', '124', '', 'document');
INSERT INTO "object" VALUES ('539', 'c2', 'c2', '2017-03-21 10:59:37.709219', '124', '', 'document');
INSERT INTO "object" VALUES ('540', 'c1', 'c2', '2017-03-21 11:07:00.99386', '124', '', 'document');
INSERT INTO "object" VALUES ('541', 'c1', 'c1', '2017-03-21 11:07:41.730818', '124', '', 'document');
INSERT INTO "object" VALUES ('542', 'c1', 'c1', '2017-03-21 11:07:54.061894', '124', '', 'document');
INSERT INTO "object" VALUES ('543', 'c1', 'c1', '2017-03-21 11:19:15.673898', '124', '', 'document');
INSERT INTO "object" VALUES ('544', 'c1', 'c1', '2017-03-21 11:20:04.324466', '124', '', 'document');
INSERT INTO "object" VALUES ('545', 'c1', 'c1', '2017-03-21 11:22:51.165473', '124', '', 'document');
INSERT INTO "object" VALUES ('546', 'c2', 'c2', '2017-03-21 11:22:59.769369', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('547', 'c1', 'c1', '2017-03-21 11:28:59.847971', '124', '', 'document');
INSERT INTO "object" VALUES ('548', 'c2', 'c2', '2017-03-21 11:29:08.158129', '124', '', 'document');
INSERT INTO "object" VALUES ('549', 'c2', 'c2', '2017-03-21 11:30:45.944874', '124', '', 'document');
INSERT INTO "object" VALUES ('550', 'gr', 'gr', '2017-03-21 11:32:26.226963', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('551', 'mountain2', 'mountain2', '2017-03-21 11:32:51.73229', '124', '', 'document');
INSERT INTO "object" VALUES ('552', 'beale', 'beale', '2017-03-21 11:35:11.692321', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('553', 'c2', 'c2', '2017-03-21 12:16:50.674816', '124', '', 'document');
INSERT INTO "object" VALUES ('554', 'carpeta a pasar', 'carpeta a pasar', '2017-03-21 12:24:30.605888', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('555', 'Libros de Jonathan', 'Libros de Jonathan', '2017-03-21 12:25:23.108577', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('556', 'Beale', 'Beale', '2017-03-21 12:56:45.190129', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('557', 'c6', 'c6', '2017-03-21 12:57:31.768106', '124', '', 'document');
INSERT INTO "object" VALUES ('558', 'c4', 'c4', '2017-03-21 12:57:52.307451', '124', '', 'document');
INSERT INTO "object" VALUES ('559', 'c8', 'c8', '2017-03-21 12:58:35.168468', '124', '', 'document');
INSERT INTO "object" VALUES ('560', 'c9', 'c9', '2017-03-21 13:00:38.776627', '124', '', 'document');
INSERT INTO "object" VALUES ('561', 'c5', 'c5', '2017-03-21 13:04:54.887036', '124', '', 'document');
INSERT INTO "object" VALUES ('562', 'c11', 'c11', '2017-03-21 13:05:51.430545', '124', '', 'document');
INSERT INTO "object" VALUES ('563', 'carpeta', 'carpeta', '2017-03-21 13:10:20.403388', '124', '', 'document');
INSERT INTO "object" VALUES ('564', 'c1', 'c1', '2017-03-21 13:15:56.873764', '124', '', 'document');
INSERT INTO "object" VALUES ('565', 'c2', 'c2', '2017-03-21 13:16:04.710814', '124', '', 'document');
INSERT INTO "object" VALUES ('566', 'c3', 'c3', '2017-03-21 13:16:12.707295', '124', '', 'document');
INSERT INTO "object" VALUES ('569', 'cosa', null, '2017-03-21 13:23:48.919601', '124', '', 'keyword');
INSERT INTO "object" VALUES ('567', 'g2', 'g2', '2017-03-21 13:20:50.634958', '124', '', 'document');
INSERT INTO "object" VALUES ('568', 'c1', 'c1', '2017-03-21 13:21:54.480414', '124', '', 'document');
INSERT INTO "object" VALUES ('570', 'c2', 'c2', '2017-03-21 15:15:03.102835', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('571', 'c4', 'c4', '2017-03-21 15:17:26.892066', '124', '', 'document');
INSERT INTO "object" VALUES ('572', 'dirección', 'dirección', '2017-03-21 15:23:39.26768', '124', '', 'document');
INSERT INTO "object" VALUES ('573', 'Another Country', 'Another Country', '2017-03-21 16:03:36.95323', '197', '', 'document');
INSERT INTO "object" VALUES ('574', 'controlescolar', 'controlescolar', '2017-03-21 16:07:36.152911', '197', '', 'document');
INSERT INTO "object" VALUES ('575', 'carpeta a respaldar', 'carpeta a respaldar', '2017-03-21 16:18:39.940239', '124', '', 'document');
INSERT INTO "object" VALUES ('576', 'Carpeta respaldada', 'Carpeta restaurada', '2017-03-21 16:46:02.07705', '124', '', 'document');
INSERT INTO "object" VALUES ('577', 'Beale', 'Beale', '2017-03-21 16:46:20.122499', '124', '#01579b', 'document');
INSERT INTO "object" VALUES ('578', 'Brulots', 'Brulots', '2017-03-21 16:48:37.031487', '137', '', 'document');
INSERT INTO "object" VALUES ('579', 'Canciones', null, '2017-03-21 16:48:37.077383', '137', '', 'keyword');
COMMIT;

-- ----------------------------
--  Table structure for document
-- ----------------------------
CREATE TABLE "document" (
	"id" int4 NOT NULL,
	"fileName" varchar NOT NULL COLLATE "default",
	"fileDate" date,
	"idArea" int4,
	"deleted" bool DEFAULT false,
	"backedUp" bool DEFAULT false,
	"isFolder" bool DEFAULT false
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of document
-- ----------------------------
BEGIN;
INSERT INTO "document" VALUES ('567', 'Giovanni''s_Room.pdf', '2017-03-20', '196', 'f', 't', 'f');
INSERT INTO "document" VALUES ('574', 'controlescolar', '2017-03-21', '126', 'f', 'f', 't');
INSERT INTO "document" VALUES ('575', 'carpeta a respaldar', '2017-03-21', '127', 'f', 't', 't');
INSERT INTO "document" VALUES ('572', 'The_Fire_Next_Time.pdf', '2017-03-21', '207', 'f', 't', 'f');
INSERT INTO "document" VALUES ('573', 'Another_Country.pdf', '2017-03-21', '207', 'f', 'f', 'f');
INSERT INTO "document" VALUES ('568', 'c1', '2017-03-20', '207', 'f', 't', 't');
INSERT INTO "document" VALUES ('571', 'c4', '2017-03-21', '207', 't', 't', 't');
INSERT INTO "document" VALUES ('576', 'Carpeta respaldada', '2017-03-21', '127', 'f', 't', 't');
INSERT INTO "document" VALUES ('577', 'If_Beale_Street_Could_Talk.epub', '2017-03-21', '127', 'f', 't', 'f');
INSERT INTO "document" VALUES ('578', '05 BruÌlots.mp3', '2017-03-21', '128', 'f', 'f', 'f');
INSERT INTO "document" VALUES ('570', 'c2', '2017-03-21', '127', 'f', 'f', 't');
COMMIT;

-- ----------------------------
--  Table structure for transactionRecord
-- ----------------------------
CREATE TABLE "transactionRecord" (
	"id" int4 NOT NULL DEFAULT nextval('"transactionRecord_id_seq"'::regclass),
	"date" timestamp(6) NULL DEFAULT now(),
	"idObject" int4,
	"idUsuario" int4,
	"idTransactionType" int4
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of transactionRecord
-- ----------------------------
BEGIN;
INSERT INTO "transactionRecord" VALUES ('837', '2017-03-20 20:57:55.70276', '500', '124', '3');
INSERT INTO "transactionRecord" VALUES ('838', '2017-03-20 20:58:04.771642', '501', '124', '3');
INSERT INTO "transactionRecord" VALUES ('839', '2017-03-20 20:58:47.24619', '502', '124', '3');
INSERT INTO "transactionRecord" VALUES ('840', '2017-03-21 07:39:25.096638', '503', '124', '3');
INSERT INTO "transactionRecord" VALUES ('841', '2017-03-21 07:39:58.932241', '504', '124', '3');
INSERT INTO "transactionRecord" VALUES ('842', '2017-03-21 07:41:39.675205', '505', '124', '3');
INSERT INTO "transactionRecord" VALUES ('843', '2017-03-21 07:45:12.965462', '506', '124', '3');
INSERT INTO "transactionRecord" VALUES ('844', '2017-03-21 08:04:04.419288', '507', '124', '3');
INSERT INTO "transactionRecord" VALUES ('845', '2017-03-21 08:04:16.090129', '508', '124', '3');
INSERT INTO "transactionRecord" VALUES ('846', '2017-03-21 08:04:36.95084', '509', '124', '3');
INSERT INTO "transactionRecord" VALUES ('847', '2017-03-21 08:07:37.329407', '510', '124', '3');
INSERT INTO "transactionRecord" VALUES ('848', '2017-03-21 08:07:53.534606', '511', '124', '3');
INSERT INTO "transactionRecord" VALUES ('849', '2017-03-21 08:11:19.590967', '512', '124', '3');
INSERT INTO "transactionRecord" VALUES ('850', '2017-03-21 08:13:23.105108', '512', '124', '9');
INSERT INTO "transactionRecord" VALUES ('851', '2017-03-21 08:13:55.647638', '513', '124', '3');
INSERT INTO "transactionRecord" VALUES ('852', '2017-03-21 08:14:01.323666', '513', '124', '9');
INSERT INTO "transactionRecord" VALUES ('853', '2017-03-21 08:14:12.520003', '513', '124', '10');
INSERT INTO "transactionRecord" VALUES ('854', '2017-03-21 08:14:14.741549', '512', '124', '10');
INSERT INTO "transactionRecord" VALUES ('855', '2017-03-21 08:17:50.085611', '514', '124', '3');
INSERT INTO "transactionRecord" VALUES ('856', '2017-03-21 08:18:09.877479', '515', '124', '3');
INSERT INTO "transactionRecord" VALUES ('857', '2017-03-21 08:18:41.879097', '515', '124', '9');
INSERT INTO "transactionRecord" VALUES ('858', '2017-03-21 08:18:47.278906', '515', '124', '10');
INSERT INTO "transactionRecord" VALUES ('859', '2017-03-21 08:19:45.228457', '515', '124', '9');
INSERT INTO "transactionRecord" VALUES ('860', '2017-03-21 08:27:48.242601', '516', '124', '3');
INSERT INTO "transactionRecord" VALUES ('861', '2017-03-21 08:27:58.108071', '517', '124', '3');
INSERT INTO "transactionRecord" VALUES ('862', '2017-03-21 08:28:06.716411', '518', '124', '3');
INSERT INTO "transactionRecord" VALUES ('863', '2017-03-21 08:48:51.609755', '519', '124', '3');
INSERT INTO "transactionRecord" VALUES ('864', '2017-03-21 08:49:01.79792', '520', '124', '3');
INSERT INTO "transactionRecord" VALUES ('865', '2017-03-21 08:51:02.870777', '521', '124', '3');
INSERT INTO "transactionRecord" VALUES ('866', '2017-03-21 08:51:33.516614', '522', '124', '3');
INSERT INTO "transactionRecord" VALUES ('867', '2017-03-21 08:52:44.827784', '523', '124', '3');
INSERT INTO "transactionRecord" VALUES ('868', '2017-03-21 09:46:10.947002', '524', '124', '3');
INSERT INTO "transactionRecord" VALUES ('869', '2017-03-21 09:53:19.924825', '525', '124', '3');
INSERT INTO "transactionRecord" VALUES ('870', '2017-03-21 09:53:42.734292', '526', '124', '3');
INSERT INTO "transactionRecord" VALUES ('871', '2017-03-21 09:56:56.279794', '527', '124', '3');
INSERT INTO "transactionRecord" VALUES ('872', '2017-03-21 10:02:04.750499', '528', '124', '3');
INSERT INTO "transactionRecord" VALUES ('873', '2017-03-21 10:03:34.96687', '528', '124', '9');
INSERT INTO "transactionRecord" VALUES ('874', '2017-03-21 10:06:48.242329', '529', '124', '3');
INSERT INTO "transactionRecord" VALUES ('875', '2017-03-21 10:07:02.141684', '529', '124', '9');
INSERT INTO "transactionRecord" VALUES ('876', '2017-03-21 10:15:01.452095', '530', '124', '3');
INSERT INTO "transactionRecord" VALUES ('877', '2017-03-21 10:15:45.584434', '530', '124', '9');
INSERT INTO "transactionRecord" VALUES ('878', '2017-03-21 10:22:25.658871', '531', '124', '3');
INSERT INTO "transactionRecord" VALUES ('879', '2017-03-21 10:22:37.310295', '531', '124', '9');
INSERT INTO "transactionRecord" VALUES ('880', '2017-03-21 10:24:09.73999', '532', '124', '3');
INSERT INTO "transactionRecord" VALUES ('881', '2017-03-21 10:24:15.463417', '532', '124', '9');
INSERT INTO "transactionRecord" VALUES ('882', '2017-03-21 10:31:22.629684', '533', '124', '3');
INSERT INTO "transactionRecord" VALUES ('883', '2017-03-21 10:31:37.850496', '534', '124', '3');
INSERT INTO "transactionRecord" VALUES ('884', '2017-03-21 10:41:10.142478', '535', '124', '3');
INSERT INTO "transactionRecord" VALUES ('885', '2017-03-21 10:41:14.870217', '535', '124', '9');
INSERT INTO "transactionRecord" VALUES ('886', '2017-03-21 10:43:24.818552', '536', '124', '3');
INSERT INTO "transactionRecord" VALUES ('887', '2017-03-21 10:43:33.615991', '537', '124', '3');
INSERT INTO "transactionRecord" VALUES ('888', '2017-03-21 10:44:20.139723', '538', '124', '3');
INSERT INTO "transactionRecord" VALUES ('889', '2017-03-21 10:44:23.22909', '538', '124', '9');
INSERT INTO "transactionRecord" VALUES ('890', '2017-03-21 10:59:37.729501', '539', '124', '3');
INSERT INTO "transactionRecord" VALUES ('891', '2017-03-21 11:07:01.010348', '540', '124', '3');
INSERT INTO "transactionRecord" VALUES ('892', '2017-03-21 11:07:41.749552', '541', '124', '3');
INSERT INTO "transactionRecord" VALUES ('893', '2017-03-21 11:07:54.077005', '542', '124', '3');
INSERT INTO "transactionRecord" VALUES ('894', '2017-03-21 11:19:15.692574', '543', '124', '3');
INSERT INTO "transactionRecord" VALUES ('895', '2017-03-21 11:20:04.331251', '544', '124', '3');
INSERT INTO "transactionRecord" VALUES ('896', '2017-03-21 11:22:51.183084', '545', '124', '3');
INSERT INTO "transactionRecord" VALUES ('897', '2017-03-21 11:22:59.784553', '546', '124', '3');
INSERT INTO "transactionRecord" VALUES ('898', '2017-03-21 11:28:59.864129', '547', '124', '3');
INSERT INTO "transactionRecord" VALUES ('899', '2017-03-21 11:29:08.174151', '548', '124', '3');
INSERT INTO "transactionRecord" VALUES ('900', '2017-03-21 11:30:45.948719', '549', '124', '3');
INSERT INTO "transactionRecord" VALUES ('901', '2017-03-21 11:31:47.824658', '547', '124', '9');
INSERT INTO "transactionRecord" VALUES ('902', '2017-03-21 11:32:26.230382', '550', '124', '3');
INSERT INTO "transactionRecord" VALUES ('903', '2017-03-21 11:32:51.742185', '551', '124', '3');
INSERT INTO "transactionRecord" VALUES ('904', '2017-03-21 11:33:39.649204', '551', '124', '9');
INSERT INTO "transactionRecord" VALUES ('905', '2017-03-21 11:35:11.697725', '552', '124', '3');
INSERT INTO "transactionRecord" VALUES ('906', '2017-03-21 12:16:50.698581', '553', '124', '3');
INSERT INTO "transactionRecord" VALUES ('907', '2017-03-21 12:24:30.608791', '554', '124', '3');
INSERT INTO "transactionRecord" VALUES ('908', '2017-03-21 12:25:23.113055', '555', '124', '3');
INSERT INTO "transactionRecord" VALUES ('909', '2017-03-21 12:56:45.199319', '556', '124', '3');
INSERT INTO "transactionRecord" VALUES ('910', '2017-03-21 12:57:31.780498', '557', '124', '3');
INSERT INTO "transactionRecord" VALUES ('911', '2017-03-21 12:57:52.315938', '558', '124', '3');
INSERT INTO "transactionRecord" VALUES ('912', '2017-03-21 12:58:35.182725', '559', '124', '3');
INSERT INTO "transactionRecord" VALUES ('913', '2017-03-21 13:00:38.790627', '560', '124', '3');
INSERT INTO "transactionRecord" VALUES ('914', '2017-03-21 13:04:54.904138', '561', '124', '3');
INSERT INTO "transactionRecord" VALUES ('915', '2017-03-21 13:05:51.449677', '562', '124', '3');
INSERT INTO "transactionRecord" VALUES ('916', '2017-03-21 13:10:20.422292', '563', '124', '3');
INSERT INTO "transactionRecord" VALUES ('917', '2017-03-21 13:15:56.892476', '564', '124', '3');
INSERT INTO "transactionRecord" VALUES ('918', '2017-03-21 13:16:04.72033', '565', '124', '3');
INSERT INTO "transactionRecord" VALUES ('919', '2017-03-21 13:16:12.719235', '566', '124', '3');
INSERT INTO "transactionRecord" VALUES ('920', '2017-03-21 13:20:50.655011', '567', '124', '3');
INSERT INTO "transactionRecord" VALUES ('921', '2017-03-21 13:21:32.361201', '567', '124', '9');
INSERT INTO "transactionRecord" VALUES ('922', '2017-03-21 13:21:54.496258', '568', '124', '3');
INSERT INTO "transactionRecord" VALUES ('923', '2017-03-21 13:23:48.95172', '569', '124', '5');
INSERT INTO "transactionRecord" VALUES ('924', '2017-03-21 15:15:03.134961', '570', '124', '3');
INSERT INTO "transactionRecord" VALUES ('925', '2017-03-21 15:17:26.910217', '571', '124', '3');
INSERT INTO "transactionRecord" VALUES ('926', '2017-03-21 15:19:46.314296', '571', '124', '9');
INSERT INTO "transactionRecord" VALUES ('927', '2017-03-21 15:23:39.290756', '572', '124', '3');
INSERT INTO "transactionRecord" VALUES ('928', '2017-03-21 16:03:36.993472', '573', '197', '3');
INSERT INTO "transactionRecord" VALUES ('929', '2017-03-21 16:04:33.802571', '573', '197', '9');
INSERT INTO "transactionRecord" VALUES ('930', '2017-03-21 16:06:06.424804', '573', '197', '10');
INSERT INTO "transactionRecord" VALUES ('931', '2017-03-21 16:06:08.165169', '573', '197', '9');
INSERT INTO "transactionRecord" VALUES ('932', '2017-03-21 16:07:19.391992', '573', '197', '10');
INSERT INTO "transactionRecord" VALUES ('933', '2017-03-21 16:07:36.168829', '574', '197', '3');
INSERT INTO "transactionRecord" VALUES ('934', '2017-03-21 16:18:39.96842', '575', '124', '3');
INSERT INTO "transactionRecord" VALUES ('935', '2017-03-21 16:24:08.354527', '567', '124', '10');
INSERT INTO "transactionRecord" VALUES ('936', '2017-03-21 16:46:02.095146', '576', '124', '3');
INSERT INTO "transactionRecord" VALUES ('937', '2017-03-21 16:46:20.126351', '577', '124', '3');
INSERT INTO "transactionRecord" VALUES ('938', '2017-03-21 16:48:03.83441', '137', '124', '8');
INSERT INTO "transactionRecord" VALUES ('939', '2017-03-21 16:48:37.048805', '578', '137', '3');
INSERT INTO "transactionRecord" VALUES ('940', '2017-03-21 16:48:37.094709', '579', '137', '5');
COMMIT;

-- ----------------------------
--  Table structure for areaRelationships
-- ----------------------------
CREATE TABLE "areaRelationships" (
	"idArea1" int4 NOT NULL,
	"idArea2" int4 NOT NULL,
	"uploadAndEdit" bool DEFAULT true
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Table structure for documentKeywordRelationship
-- ----------------------------
CREATE TABLE "documentKeywordRelationship" (
	"idKeyword" int4,
	"idDocument" int4
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of documentKeywordRelationship
-- ----------------------------
BEGIN;
INSERT INTO "documentKeywordRelationship" VALUES ('569', '567');
INSERT INTO "documentKeywordRelationship" VALUES ('133', '568');
INSERT INTO "documentKeywordRelationship" VALUES ('579', '578');
COMMIT;


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "documentRelationships_id_seq" RESTART 163 OWNED BY "documentRelationships"."id";
ALTER SEQUENCE "object_id_seq" RESTART 580 OWNED BY "object"."id";
ALTER SEQUENCE "transactionRecord_id_seq" RESTART 941 OWNED BY "transactionRecord"."id";
ALTER SEQUENCE "transactionType_id_seq" RESTART 12 OWNED BY "transactionType"."id";
-- ----------------------------
--  Primary key structure for table googleDriveBackups
-- ----------------------------
ALTER TABLE "googleDriveBackups" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table transactionType
-- ----------------------------
CREATE UNIQUE INDEX  "transactionType_id_key" ON "transactionType" USING btree("id" "pg_catalog"."int4_ops" ASC NULLS LAST);

-- ----------------------------
--  Indexes structure for table keyword
-- ----------------------------
CREATE UNIQUE INDEX  "keyword_id_key" ON "keyword" USING btree("id" "pg_catalog"."int4_ops" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table area
-- ----------------------------
ALTER TABLE "area" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table area
-- ----------------------------
CREATE UNIQUE INDEX  "area_id_key" ON "area" USING btree("id" "pg_catalog"."int4_ops" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table usuario
-- ----------------------------
ALTER TABLE "usuario" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table usuario
-- ----------------------------
CREATE UNIQUE INDEX  "usuario_id_key" ON "usuario" USING btree("id" "pg_catalog"."int4_ops" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table object
-- ----------------------------
ALTER TABLE "object" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table object
-- ----------------------------
CREATE UNIQUE INDEX  "object_id_key" ON "object" USING btree("id" "pg_catalog"."int4_ops" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table document
-- ----------------------------
ALTER TABLE "document" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table document
-- ----------------------------
CREATE UNIQUE INDEX  "document_id_key" ON "document" USING btree("id" "pg_catalog"."int4_ops" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table areaRelationships
-- ----------------------------
ALTER TABLE "areaRelationships" ADD PRIMARY KEY ("idArea1", "idArea2") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table usuario
-- ----------------------------
ALTER TABLE "usuario" ADD CONSTRAINT "usuario_idArea_fkey" FOREIGN KEY ("idArea") REFERENCES "area" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table object
-- ----------------------------
ALTER TABLE "object" ADD CONSTRAINT "fkCreatedByUsers" FOREIGN KEY ("createdBy") REFERENCES "usuario" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table document
-- ----------------------------
ALTER TABLE "document" ADD CONSTRAINT "documents_idObject_fkey" FOREIGN KEY ("id") REFERENCES "object" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "document" ADD CONSTRAINT "docuemnts_idArea_fkey" FOREIGN KEY ("idArea") REFERENCES "area" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table transactionRecord
-- ----------------------------
ALTER TABLE "transactionRecord" ADD CONSTRAINT "transactionRecord_idUsuario_fkey" FOREIGN KEY ("idUsuario") REFERENCES "usuario" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "transactionRecord" ADD CONSTRAINT "transactionRecord_idObject_fkey" FOREIGN KEY ("idObject") REFERENCES "object" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "transactionRecord" ADD CONSTRAINT "transactionRecord_idTransactionType_fkey" FOREIGN KEY ("idTransactionType") REFERENCES "transactionType" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table areaRelationships
-- ----------------------------
ALTER TABLE "areaRelationships" ADD CONSTRAINT "areaRelationships_idArea2_fkey" FOREIGN KEY ("idArea2") REFERENCES "area" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "areaRelationships" ADD CONSTRAINT "areaRelationships_idArea1_fkey" FOREIGN KEY ("idArea1") REFERENCES "area" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table documentKeywordRelationship
-- ----------------------------
ALTER TABLE "documentKeywordRelationship" ADD CONSTRAINT "documentKeywordRelationship_idKeyword_fkey" FOREIGN KEY ("idKeyword") REFERENCES "keyword" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "documentKeywordRelationship" ADD CONSTRAINT "documentKeywordRelationship_idDocument_fkey" FOREIGN KEY ("idDocument") REFERENCES "document" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

