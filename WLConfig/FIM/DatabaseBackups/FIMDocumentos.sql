--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6rc1
-- Dumped by pg_dump version 9.6rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE area (
    id integer NOT NULL,
    superuser boolean,
    enabled boolean
);


ALTER TABLE area OWNER TO postgres;

--
-- Name: areaRelationships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "areaRelationships" (
    "idArea1" integer NOT NULL,
    "idArea2" integer NOT NULL,
    "uploadAndEdit" boolean DEFAULT true
);


ALTER TABLE "areaRelationships" OWNER TO postgres;

--
-- Name: document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE document (
    id integer NOT NULL,
    "fileName" character varying NOT NULL,
    "fileDate" date,
    "idArea" integer,
    deleted boolean DEFAULT false,
    "backedUp" boolean DEFAULT false
);


ALTER TABLE document OWNER TO postgres;

--
-- Name: documentKeywordRelationship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "documentKeywordRelationship" (
    "idKeyword" integer,
    "idDocument" integer
);


ALTER TABLE "documentKeywordRelationship" OWNER TO postgres;

--
-- Name: googleDriveBackups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "googleDriveBackups" (
    "fileName" character varying,
    id character varying NOT NULL,
    date timestamp without time zone DEFAULT now(),
    length real
);


ALTER TABLE "googleDriveBackups" OWNER TO postgres;

--
-- Name: keyword; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE keyword (
    id integer
);


ALTER TABLE keyword OWNER TO postgres;

--
-- Name: object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE object (
    id integer NOT NULL,
    name character varying,
    description text,
    "createdOn" timestamp(6) without time zone DEFAULT now(),
    "createdBy" integer,
    color character varying,
    kind character varying
);


ALTER TABLE object OWNER TO postgres;

--
-- Name: object_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE object_id_seq
    START WITH 157
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE object_id_seq OWNER TO postgres;

--
-- Name: object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE object_id_seq OWNED BY object.id;


--
-- Name: transactionRecord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "transactionRecord" (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT now(),
    "idObject" integer,
    "idUsuario" integer,
    "idTransactionType" integer
);


ALTER TABLE "transactionRecord" OWNER TO postgres;

--
-- Name: transactionRecord_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "transactionRecord_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "transactionRecord_id_seq" OWNER TO postgres;

--
-- Name: transactionRecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "transactionRecord_id_seq" OWNED BY "transactionRecord".id;


--
-- Name: transactionType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "transactionType" (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE "transactionType" OWNER TO postgres;

--
-- Name: transactionType_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "transactionType_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "transactionType_id_seq" OWNER TO postgres;

--
-- Name: transactionType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "transactionType_id_seq" OWNED BY "transactionType".id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    "contraseña" character varying,
    "isAdministrator" boolean,
    enabled boolean,
    "idArea" integer,
    root boolean
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: object id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY object ALTER COLUMN id SET DEFAULT nextval('object_id_seq'::regclass);


--
-- Name: transactionRecord id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "transactionRecord" ALTER COLUMN id SET DEFAULT nextval('"transactionRecord_id_seq"'::regclass);


--
-- Name: transactionType id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "transactionType" ALTER COLUMN id SET DEFAULT nextval('"transactionType_id_seq"'::regclass);


--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY area (id, superuser, enabled) FROM stdin;
0	\N	\N
129	f	t
126	f	t
128	f	t
127	f	t
123	t	t
196	f	t
157	f	t
130	f	t
207	f	t
\.


--
-- Data for Name: areaRelationships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "areaRelationships" ("idArea1", "idArea2", "uploadAndEdit") FROM stdin;
123	128	t
123	127	t
126	127	t
126	128	t
123	129	t
123	126	t
123	130	t
128	130	t
129	196	t
157	123	f
157	196	f
128	126	f
127	130	f
127	126	f
127	128	f
127	123	f
130	126	f
130	128	f
130	127	f
130	123	f
196	130	t
196	128	t
\.


--
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY document (id, "fileName", "fileDate", "idArea", deleted, "backedUp") FROM stdin;
213	caratulacd.doc	2017-03-12	126	f	f
217	pdfsImportantes.zip	2017-03-13	123	f	f
\.


--
-- Data for Name: documentKeywordRelationship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "documentKeywordRelationship" ("idKeyword", "idDocument") FROM stdin;
214	213
\.


--
-- Data for Name: googleDriveBackups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "googleDriveBackups" ("fileName", id, date, length) FROM stdin;
FullFIMBackup#20170313_204852.zip	0B64tcW7d1P2_ZW91cVhhXzR5UlU	2017-03-13 20:50:50.033541	80774488
\.


--
-- Data for Name: keyword; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY keyword (id) FROM stdin;
133
132
134
135
142
144
146
148
150
152
153
154
156
160
188
189
190
191
193
194
192
198
199
204
206
214
\.


--
-- Data for Name: object; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY object (id, name, description, "createdOn", "createdBy", color, kind) FROM stdin;
133	informe	\N	2017-01-11 09:34:12.118052	124	\N	keyword
132	enero	\N	2017-01-11 09:34:12.109452	124	\N	keyword
134	palabras	\N	2017-01-11 09:34:32.047557	124	\N	keyword
137	usuarioArea3		2017-01-11 19:19:22.243116	124	\N	\N
138	usuarioArea4		2017-01-11 19:20:12.925937	124	\N	\N
142	area2	\N	2017-01-11 22:08:42.233543	136	\N	keyword
144	de area 5	\N	2017-01-11 22:14:58.413576	139	\N	keyword
139	secretaria	\N	2017-01-11 19:21:09.010166	124	\N	\N
136	tesorero	\N	2017-01-11 19:15:57.637905	124	\N	\N
148	diciembre	\N	2017-01-12 16:10:14.173322	124	\N	keyword
150	inteligencia artificial	\N	2017-01-12 16:35:21.29638	124	\N	keyword
129	Tutorias	\N	2017-01-10 21:40:06.294055	124	\N	\N
152	captura	\N	2017-01-12 17:17:20.586458	124	\N	keyword
153	prueba	\N	2017-01-12 17:17:20.587463	124	\N	keyword
154	clave	\N	2017-01-12 17:18:09.788549	124	\N	keyword
155	root2		2017-01-15 11:24:12.97042	124	\N	\N
146	documento	\N	2017-01-11 22:32:12.274006	136	\N	keyword
160	tutorias	\N	2017-01-16 20:15:09.072381	124	\N	keyword
198	nuevapalabraclave	\N	2017-02-10 19:41:25.669713	124	\N	keyword
199	kardex	\N	2017-02-10 19:41:30.590993	124	\N	keyword
156	nueva	\N	2017-01-15 18:41:54.172433	124	\N	keyword
200	kardex	kardex	2017-02-10 19:43:11.67423	197	#01579b	document
140	direccion2	\N	2017-01-11 19:27:45.830832	124	\N	\N
124	root	\N	2017-01-10 20:18:49.060262	9	\N	\N
126	Coodinación académica	\N	2017-01-10 21:39:51.234457	124	\N	\N
125	coordinadoracademico	\N	2017-01-10 21:23:09.250603	124	\N	\N
128	Jefaturas de carrera	\N	2017-01-10 21:40:00.649318	124	\N	\N
127	Coordinación administrativa	\N	2017-01-10 21:39:55.83921	124	\N	\N
123	Dirección	\N	2017-01-10 20:18:27.652247	9	\N	\N
189	descripcion	\N	2017-02-10 19:24:42.583821	124	\N	keyword
190	diplomado	\N	2017-02-10 19:24:42.595338	124	\N	keyword
191	inscripción	\N	2017-02-10 19:24:42.597517	124	\N	keyword
192	cuota	\N	2017-02-10 19:24:42.603559	124	\N	keyword
193	reinscripción	\N	2017-02-10 19:24:42.606175	124	\N	keyword
194	cursos	\N	2017-02-10 19:24:42.608029	124	\N	keyword
196	Control escolar	\N	2017-02-10 19:30:12.912091	124	\N	area
197	controlescolar		2017-02-10 19:41:06.672244	124	\N	\N
157	Area de superusuarios	\N	2017-01-15 19:44:41.615557	124	\N	\N
130	Secretaria	\N	2017-01-10 21:40:11.575524	124	\N	\N
202	informe2	informe2	2017-03-09 07:30:47.891938	139	#01579b	document
204	corporate	\N	2017-03-12 11:55:18.379912	124	\N	keyword
206	maestria	\N	2017-03-12 11:56:26.30289	124	\N	keyword
207	Cooperativa2	\N	2017-03-12 12:33:20.641547	124	\N	area
188	acta	\N	2017-02-10 19:24:42.582805	124	\N	keyword
185	d1	d1	2017-01-21 17:00:16.321775	124	#01579b	document
186	d2	d2	2017-01-21 17:00:33.588267	124	#01579b	document
195	Cuota	Cuota	2017-02-10 19:27:25.053907	124	#01579b	document
205	maestria	maestria	2017-03-12 11:56:26.274744	124	#01579b	document
187	Acta de consejo2	Descripción acta de consejo2	2017-02-10 19:24:42.543898	124	#01579b	document
203	C	C	2017-03-12 11:55:18.347403	124	#01579b	document
208	jaysome	hello	2017-03-12 15:38:55.738701	124	#01579b	document
209	practica	practica	2017-03-12 17:50:39.096316	124	#01579b	document
210	practicas	practicas	2017-03-12 17:52:16.942572	124	#01579b	document
211	modern times	modern times	2017-03-12 18:01:25.916923	124	#01579b	document
213	Caratula CD	Caratula CD	2017-03-12 19:26:18.659041	124	#01579b	document
214	Caratula CD Servicio Social	\N	2017-03-12 19:26:18.725564	124	\N	keyword
215	root0		2017-03-12 20:02:19.334219	124	\N	\N
216	Prueba	Prueba	2017-03-13 15:55:11.96142	124	#01579b	document
217	PDFs Importantes	PDFs Importantes	2017-03-13 16:27:12.467779	124	#01579b	document
\.


--
-- Name: object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('object_id_seq', 217, true);


--
-- Data for Name: transactionRecord; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "transactionRecord" (id, date, "idObject", "idUsuario", "idTransactionType") FROM stdin;
3	2017-03-12 11:54:33.668454	202	139	4
4	2017-03-12 11:55:18.370357	203	124	3
5	2017-03-12 11:55:18.393311	204	124	5
6	2017-03-12 11:56:26.290968	205	124	3
7	2017-03-12 11:56:26.309855	206	124	5
8	2017-03-12 12:33:20.649533	207	124	1
9	2017-03-12 12:33:31.446614	207	124	2
13	2017-03-12 12:36:26.971559	188	124	6
14	2017-03-12 14:53:34.044676	185	124	4
15	2017-03-12 14:55:34.620226	186	124	4
16	2017-03-12 14:55:37.890091	187	124	4
17	2017-03-12 14:55:40.374554	195	124	4
18	2017-03-12 14:55:42.927969	203	124	4
19	2017-03-12 14:55:50.070927	205	124	4
20	2017-03-12 15:19:43.696039	187	124	4
21	2017-03-12 15:21:13.477584	203	124	4
22	2017-03-12 15:38:55.769339	208	124	3
23	2017-03-12 17:50:39.130605	209	124	3
24	2017-03-12 17:52:16.958392	210	124	3
25	2017-03-12 18:01:25.954301	211	124	3
26	2017-03-12 18:34:22.483344	195	124	4
27	2017-03-12 18:35:27.234921	185	124	4
28	2017-03-12 18:35:37.922621	186	124	4
29	2017-03-12 18:35:51.155677	208	124	4
30	2017-03-12 18:37:21.792906	205	124	4
31	2017-03-12 18:37:35.312119	211	124	4
32	2017-03-12 19:22:46.738581	187	124	4
33	2017-03-12 19:23:44.719506	202	139	4
34	2017-03-12 19:23:53.769087	187	124	4
35	2017-03-12 19:26:18.678785	213	124	3
36	2017-03-12 19:26:18.728895	214	124	5
37	2017-03-12 19:26:33.34467	213	124	4
38	2017-03-12 19:26:36.746851	213	124	4
39	2017-03-12 19:30:52.69264	213	124	4
40	2017-03-12 19:31:13.847224	213	124	4
41	2017-03-12 19:32:16.743116	213	124	4
42	2017-03-12 19:33:15.177127	213	124	4
43	2017-03-12 19:33:18.867826	213	124	4
44	2017-03-12 19:34:36.951745	213	124	4
45	2017-03-12 19:34:39.924965	213	124	4
46	2017-03-12 19:34:49.140476	213	124	4
47	2017-03-12 19:37:00.781857	213	124	4
48	2017-03-12 19:37:02.67883	213	124	4
49	2017-03-12 19:37:04.613686	213	124	4
50	2017-03-12 19:37:54.90644	213	124	4
51	2017-03-12 19:37:57.038218	213	124	4
52	2017-03-12 20:02:19.362369	215	124	7
53	2017-03-13 15:55:12.107033	216	124	3
54	2017-03-13 16:27:12.508095	217	124	3
\.


--
-- Name: transactionRecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"transactionRecord_id_seq"', 54, true);


--
-- Data for Name: transactionType; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "transactionType" (id, name) FROM stdin;
1	Creación de área
2	Edición de área
3	Creación de documento
4	Edición de documento
5	Creación de palabra clave
6	Edición de palabra clave
7	Creación de usuario
8	Edición de usuario
9	Eliminación de documento
10	Restauración de documento
\.


--
-- Name: transactionType_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"transactionType_id_seq"', 10, true);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id, "contraseña", "isAdministrator", enabled, "idArea", root) FROM stdin;
136	tesorero	t	t	127	f
139	secretaria	f	t	130	f
138	usuarioArea4	f	t	129	f
137	usuarioArea3	f	t	128	f
9	\N	\N	\N	\N	f
155	root2	t	t	123	t
124	root	t	t	123	t
125	coordinadoracademico	f	t	126	f
197	controlescolar	f	t	196	f
140	direccion2	t	t	123	f
215	root0	t	t	123	t
\.


--
-- Name: areaRelationships areaRelationships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "areaRelationships"
    ADD CONSTRAINT "areaRelationships_pkey" PRIMARY KEY ("idArea1", "idArea2");


--
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- Name: googleDriveBackups googleDriveBackups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "googleDriveBackups"
    ADD CONSTRAINT "googleDriveBackups_pkey" PRIMARY KEY (id);


--
-- Name: object object_name_kind_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY object
    ADD CONSTRAINT object_name_kind_key UNIQUE (name, kind);


--
-- Name: object object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY object
    ADD CONSTRAINT object_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: area_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX area_id_key ON area USING btree (id);


--
-- Name: document_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX document_id_key ON document USING btree (id);


--
-- Name: keyword_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX keyword_id_key ON keyword USING btree (id);


--
-- Name: object_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX object_id_key ON object USING btree (id);


--
-- Name: transactionType_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "transactionType_id_key" ON "transactionType" USING btree (id);


--
-- Name: usuario_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuario_id_key ON usuario USING btree (id);


--
-- Name: areaRelationships areaRelationships_idArea1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "areaRelationships"
    ADD CONSTRAINT "areaRelationships_idArea1_fkey" FOREIGN KEY ("idArea1") REFERENCES area(id);


--
-- Name: areaRelationships areaRelationships_idArea2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "areaRelationships"
    ADD CONSTRAINT "areaRelationships_idArea2_fkey" FOREIGN KEY ("idArea2") REFERENCES area(id);


--
-- Name: document docuemnts_idArea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document
    ADD CONSTRAINT "docuemnts_idArea_fkey" FOREIGN KEY ("idArea") REFERENCES area(id);


--
-- Name: documentKeywordRelationship documentKeywordRelationship_idDocument_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "documentKeywordRelationship"
    ADD CONSTRAINT "documentKeywordRelationship_idDocument_fkey" FOREIGN KEY ("idDocument") REFERENCES document(id);


--
-- Name: documentKeywordRelationship documentKeywordRelationship_idKeyword_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "documentKeywordRelationship"
    ADD CONSTRAINT "documentKeywordRelationship_idKeyword_fkey" FOREIGN KEY ("idKeyword") REFERENCES keyword(id);


--
-- Name: document documents_idObject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document
    ADD CONSTRAINT "documents_idObject_fkey" FOREIGN KEY (id) REFERENCES object(id);


--
-- Name: object fkCreatedByUsers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY object
    ADD CONSTRAINT "fkCreatedByUsers" FOREIGN KEY ("createdBy") REFERENCES usuario(id);


--
-- Name: transactionRecord transactionRecord_idObject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "transactionRecord"
    ADD CONSTRAINT "transactionRecord_idObject_fkey" FOREIGN KEY ("idObject") REFERENCES object(id);


--
-- Name: transactionRecord transactionRecord_idTransactionType_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "transactionRecord"
    ADD CONSTRAINT "transactionRecord_idTransactionType_fkey" FOREIGN KEY ("idTransactionType") REFERENCES "transactionType"(id);


--
-- Name: transactionRecord transactionRecord_idUsuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "transactionRecord"
    ADD CONSTRAINT "transactionRecord_idUsuario_fkey" FOREIGN KEY ("idUsuario") REFERENCES usuario(id);


--
-- Name: usuario usuario_idArea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT "usuario_idArea_fkey" FOREIGN KEY ("idArea") REFERENCES area(id);


--
-- PostgreSQL database dump complete
--

