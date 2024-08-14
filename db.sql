--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-13 23:57:18 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16973)
-- Name: comuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comuna (
    comuna_id integer NOT NULL,
    comuna_nombre character varying NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 16972)
-- Name: comuna_comuna_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comuna_comuna_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 222
-- Name: comuna_comuna_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comuna_comuna_id_seq OWNED BY public.comuna.comuna_id;


--
-- TOC entry 221 (class 1259 OID 16953)
-- Name: inmueble; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inmueble (
    inm_id integer NOT NULL,
    inm_nombre character varying NOT NULL,
    inm_descripcion character varying NOT NULL,
    inm_m2construidos real NOT NULL,
    inm_m2total real NOT NULL,
    inm_num_estacionamientos integer DEFAULT 0,
    inm_num_habitaciones integer NOT NULL,
    inm_num_banos integer NOT NULL,
    inm_direccion character varying NOT NULL,
    tipoi_codigo integer,
    inm_precio real NOT NULL,
    usu_rut integer,
    comuna_id integer
);


--
-- TOC entry 224 (class 1259 OID 16986)
-- Name: inmueble_arrendatario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inmueble_arrendatario (
    inm_id integer,
    usu_rut integer,
    ia_estado boolean DEFAULT false,
    ia_fecha_inicio date NOT NULL,
    ia_fecha_fin date
);


--
-- TOC entry 220 (class 1259 OID 16952)
-- Name: inmueble_inm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inmueble_inm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 220
-- Name: inmueble_inm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inmueble_inm_id_seq OWNED BY public.inmueble.inm_id;


--
-- TOC entry 219 (class 1259 OID 16944)
-- Name: tipo_inmueble; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_inmueble (
    tipoi_codigo integer NOT NULL,
    tipoi_descripcion character varying NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16943)
-- Name: tipo_inmueble_tipoi_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipo_inmueble_tipoi_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 218
-- Name: tipo_inmueble_tipoi_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_inmueble_tipoi_codigo_seq OWNED BY public.tipo_inmueble.tipoi_codigo;


--
-- TOC entry 217 (class 1259 OID 16930)
-- Name: tipo_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_usuario (
    tipou_codigo integer NOT NULL,
    tipou_descripcion character varying NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 16929)
-- Name: tipo_usuario_tipou_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipo_usuario_tipou_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_usuario_tipou_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_usuario_tipou_codigo_seq OWNED BY public.tipo_usuario.tipou_codigo;


--
-- TOC entry 215 (class 1259 OID 16922)
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    usu_rut integer NOT NULL,
    usu_nombres character varying NOT NULL,
    usu_apepat character varying NOT NULL,
    usu_apemat character varying,
    usu_direccion character varying NOT NULL,
    usu_telefono character varying,
    usu_mail character varying,
    tipou_codigo integer
);


--
-- TOC entry 3503 (class 2604 OID 16976)
-- Name: comuna comuna_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comuna ALTER COLUMN comuna_id SET DEFAULT nextval('public.comuna_comuna_id_seq'::regclass);


--
-- TOC entry 3501 (class 2604 OID 16956)
-- Name: inmueble inm_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble ALTER COLUMN inm_id SET DEFAULT nextval('public.inmueble_inm_id_seq'::regclass);


--
-- TOC entry 3500 (class 2604 OID 16947)
-- Name: tipo_inmueble tipoi_codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_inmueble ALTER COLUMN tipoi_codigo SET DEFAULT nextval('public.tipo_inmueble_tipoi_codigo_seq'::regclass);


--
-- TOC entry 3499 (class 2604 OID 16933)
-- Name: tipo_usuario tipou_codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_usuario ALTER COLUMN tipou_codigo SET DEFAULT nextval('public.tipo_usuario_tipou_codigo_seq'::regclass);


--
-- TOC entry 3672 (class 0 OID 16973)
-- Dependencies: 223
-- Data for Name: comuna; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comuna VALUES (1101, 'Iquique');
INSERT INTO public.comuna VALUES (1107, 'Alto Hospicio');
INSERT INTO public.comuna VALUES (1401, 'Pozo Almonte');
INSERT INTO public.comuna VALUES (1402, 'Camiña');
INSERT INTO public.comuna VALUES (1403, 'Colchane');
INSERT INTO public.comuna VALUES (1404, 'Huara');
INSERT INTO public.comuna VALUES (1405, 'Pica');
INSERT INTO public.comuna VALUES (2101, 'Antofagasta');
INSERT INTO public.comuna VALUES (2102, 'Mejillones');
INSERT INTO public.comuna VALUES (2103, 'Sierra Gorda');
INSERT INTO public.comuna VALUES (2104, 'Taltal');
INSERT INTO public.comuna VALUES (2201, 'Calama');
INSERT INTO public.comuna VALUES (2202, 'Ollague');
INSERT INTO public.comuna VALUES (2203, 'San Pedro de Atacama');
INSERT INTO public.comuna VALUES (2301, 'Tocopilla');
INSERT INTO public.comuna VALUES (2302, 'María Elena');
INSERT INTO public.comuna VALUES (3101, 'Copiapó');
INSERT INTO public.comuna VALUES (3102, 'Caldera');
INSERT INTO public.comuna VALUES (3103, 'Tierra Amarilla');
INSERT INTO public.comuna VALUES (3201, 'Chañaral');
INSERT INTO public.comuna VALUES (3202, 'Diego de Almagro');
INSERT INTO public.comuna VALUES (3301, 'Vallenar');
INSERT INTO public.comuna VALUES (3302, 'Alto del Carmen');
INSERT INTO public.comuna VALUES (3303, 'Freirina');
INSERT INTO public.comuna VALUES (3304, 'Huasco');
INSERT INTO public.comuna VALUES (4101, 'La Serena');
INSERT INTO public.comuna VALUES (4102, 'Coquimbo');
INSERT INTO public.comuna VALUES (4103, 'Andacollo');
INSERT INTO public.comuna VALUES (4104, 'La Higuera');
INSERT INTO public.comuna VALUES (4105, 'Paihuano');
INSERT INTO public.comuna VALUES (4106, 'Vicuña');
INSERT INTO public.comuna VALUES (4201, 'Illapel');
INSERT INTO public.comuna VALUES (4202, 'Canela');
INSERT INTO public.comuna VALUES (4203, 'Los Vilos');
INSERT INTO public.comuna VALUES (4204, 'Salamanca');
INSERT INTO public.comuna VALUES (4301, 'Ovalle');
INSERT INTO public.comuna VALUES (4302, 'Combarbalá');
INSERT INTO public.comuna VALUES (4303, 'Monte Patria');
INSERT INTO public.comuna VALUES (4304, 'Punitaqui');
INSERT INTO public.comuna VALUES (4305, 'Río Hurtado');
INSERT INTO public.comuna VALUES (5101, 'Valparaíso');
INSERT INTO public.comuna VALUES (5102, 'Casablanca');
INSERT INTO public.comuna VALUES (5103, 'Concón');
INSERT INTO public.comuna VALUES (5104, 'Juan Fernández');
INSERT INTO public.comuna VALUES (5105, 'Puchuncaví');
INSERT INTO public.comuna VALUES (5106, 'Quilpué');
INSERT INTO public.comuna VALUES (5107, 'Quintero');
INSERT INTO public.comuna VALUES (5108, 'Villa Alemana');
INSERT INTO public.comuna VALUES (5109, 'Viña del Mar');
INSERT INTO public.comuna VALUES (5201, 'Isla de Pascua');
INSERT INTO public.comuna VALUES (5301, 'Los Andes');
INSERT INTO public.comuna VALUES (5302, 'Calle Larga');
INSERT INTO public.comuna VALUES (5303, 'Rinconada');
INSERT INTO public.comuna VALUES (5304, 'San Esteban');
INSERT INTO public.comuna VALUES (5401, 'La Ligua');
INSERT INTO public.comuna VALUES (5402, 'Cabildo');
INSERT INTO public.comuna VALUES (5403, 'Papudo');
INSERT INTO public.comuna VALUES (5404, 'Petorca');
INSERT INTO public.comuna VALUES (5405, 'Zapallar');
INSERT INTO public.comuna VALUES (5501, 'Quillota');
INSERT INTO public.comuna VALUES (5502, 'Calera');
INSERT INTO public.comuna VALUES (5503, 'Hijuelas');
INSERT INTO public.comuna VALUES (5504, 'La Cruz');
INSERT INTO public.comuna VALUES (5505, 'Limache');
INSERT INTO public.comuna VALUES (5506, 'Nogales');
INSERT INTO public.comuna VALUES (5507, 'Olmué');
INSERT INTO public.comuna VALUES (5601, 'San Antonio');
INSERT INTO public.comuna VALUES (5602, 'Algarrobo');
INSERT INTO public.comuna VALUES (5603, 'Cartagena');
INSERT INTO public.comuna VALUES (5604, 'El Quisco');
INSERT INTO public.comuna VALUES (5605, 'El Tabo');
INSERT INTO public.comuna VALUES (5606, 'Santo Domingo');
INSERT INTO public.comuna VALUES (5701, 'San Felipe');
INSERT INTO public.comuna VALUES (5702, 'Catemu');
INSERT INTO public.comuna VALUES (5703, 'Llay Llay');
INSERT INTO public.comuna VALUES (5704, 'Panquehue');
INSERT INTO public.comuna VALUES (5705, 'Putaendo');
INSERT INTO public.comuna VALUES (5706, 'Santa María');
INSERT INTO public.comuna VALUES (6101, 'Rancagua');
INSERT INTO public.comuna VALUES (6102, 'Codegua');
INSERT INTO public.comuna VALUES (6103, 'Coinco');
INSERT INTO public.comuna VALUES (6104, 'Coltauco');
INSERT INTO public.comuna VALUES (6105, 'Doñihue');
INSERT INTO public.comuna VALUES (6106, 'Graneros');
INSERT INTO public.comuna VALUES (6107, 'Las Cabras');
INSERT INTO public.comuna VALUES (6108, 'Machalí');
INSERT INTO public.comuna VALUES (6109, 'Malloa');
INSERT INTO public.comuna VALUES (6110, 'Mostazal');
INSERT INTO public.comuna VALUES (6111, 'Olivar');
INSERT INTO public.comuna VALUES (6112, 'Peumo');
INSERT INTO public.comuna VALUES (6113, 'Pichidegua');
INSERT INTO public.comuna VALUES (6114, 'Quinta de Tilcoco');
INSERT INTO public.comuna VALUES (6115, 'Rengo');
INSERT INTO public.comuna VALUES (6116, 'Requinoa');
INSERT INTO public.comuna VALUES (6117, 'San Vicente');
INSERT INTO public.comuna VALUES (6201, 'Pichilemu');
INSERT INTO public.comuna VALUES (6202, 'La Estrella');
INSERT INTO public.comuna VALUES (6203, 'Litueche');
INSERT INTO public.comuna VALUES (6204, 'Marchihue');
INSERT INTO public.comuna VALUES (6205, 'Navidad');
INSERT INTO public.comuna VALUES (6206, 'Paredones');
INSERT INTO public.comuna VALUES (6301, 'San Fernando');
INSERT INTO public.comuna VALUES (6302, 'Chépica');
INSERT INTO public.comuna VALUES (6303, 'Chimbarongo');
INSERT INTO public.comuna VALUES (6304, 'Lolol');
INSERT INTO public.comuna VALUES (6305, 'Nancagua');
INSERT INTO public.comuna VALUES (6306, 'Palmilla');
INSERT INTO public.comuna VALUES (6307, 'Peralillo');
INSERT INTO public.comuna VALUES (6308, 'Placilla');
INSERT INTO public.comuna VALUES (6309, 'Pumanque');
INSERT INTO public.comuna VALUES (6310, 'Santa Cruz');
INSERT INTO public.comuna VALUES (7101, 'Talca');
INSERT INTO public.comuna VALUES (7102, 'Constitución');
INSERT INTO public.comuna VALUES (7103, 'Curepto');
INSERT INTO public.comuna VALUES (7104, 'Empedrado');
INSERT INTO public.comuna VALUES (7105, 'Maule');
INSERT INTO public.comuna VALUES (7106, 'Pelarco');
INSERT INTO public.comuna VALUES (7107, 'Pencahue');
INSERT INTO public.comuna VALUES (7108, 'Río Claro');
INSERT INTO public.comuna VALUES (7109, 'San Clemente');
INSERT INTO public.comuna VALUES (7110, 'San Rafael');
INSERT INTO public.comuna VALUES (7201, 'Cauquenes');
INSERT INTO public.comuna VALUES (7202, 'Chanco');
INSERT INTO public.comuna VALUES (7203, 'Pelluhue');
INSERT INTO public.comuna VALUES (7301, 'Curicó');
INSERT INTO public.comuna VALUES (7302, 'Hualañé');
INSERT INTO public.comuna VALUES (7303, 'Licantén');
INSERT INTO public.comuna VALUES (7304, 'Molina');
INSERT INTO public.comuna VALUES (7305, 'Rauco');
INSERT INTO public.comuna VALUES (7306, 'Romeral');
INSERT INTO public.comuna VALUES (7307, 'Sagrada Familia');
INSERT INTO public.comuna VALUES (7308, 'Teno');
INSERT INTO public.comuna VALUES (7309, 'Vichuquén');
INSERT INTO public.comuna VALUES (7401, 'Linares');
INSERT INTO public.comuna VALUES (7402, 'Colbún');
INSERT INTO public.comuna VALUES (7403, 'Longaví');
INSERT INTO public.comuna VALUES (7404, 'Parral');
INSERT INTO public.comuna VALUES (7405, 'Retiro');
INSERT INTO public.comuna VALUES (7406, 'San Javier');
INSERT INTO public.comuna VALUES (7407, 'Villa Alegre');
INSERT INTO public.comuna VALUES (7408, 'Yerbas Buenas');
INSERT INTO public.comuna VALUES (8101, 'Concepción');
INSERT INTO public.comuna VALUES (8102, 'Coronel');
INSERT INTO public.comuna VALUES (8103, 'Chiguayante');
INSERT INTO public.comuna VALUES (8104, 'Florida');
INSERT INTO public.comuna VALUES (8105, 'Hualqui');
INSERT INTO public.comuna VALUES (8106, 'Lota');
INSERT INTO public.comuna VALUES (8107, 'Penco');
INSERT INTO public.comuna VALUES (8108, 'San Pedro De La Paz');
INSERT INTO public.comuna VALUES (8109, 'Santa Juana');
INSERT INTO public.comuna VALUES (8110, 'Talcahuano');
INSERT INTO public.comuna VALUES (8111, 'Tomé');
INSERT INTO public.comuna VALUES (8112, 'Hualpén');
INSERT INTO public.comuna VALUES (8201, 'Lebu');
INSERT INTO public.comuna VALUES (8202, 'Arauco');
INSERT INTO public.comuna VALUES (8203, 'Cañete');
INSERT INTO public.comuna VALUES (8204, 'Contulmo');
INSERT INTO public.comuna VALUES (8205, 'Curanilahue');
INSERT INTO public.comuna VALUES (8206, 'Los Alamos');
INSERT INTO public.comuna VALUES (8207, 'Tirua');
INSERT INTO public.comuna VALUES (8301, 'Los Angeles');
INSERT INTO public.comuna VALUES (8302, 'Antuco');
INSERT INTO public.comuna VALUES (8303, 'Cabrero');
INSERT INTO public.comuna VALUES (8304, 'Laja');
INSERT INTO public.comuna VALUES (8305, 'Mulchén');
INSERT INTO public.comuna VALUES (8306, 'Nacimiento');
INSERT INTO public.comuna VALUES (8307, 'Negrete');
INSERT INTO public.comuna VALUES (8308, 'Quilaco');
INSERT INTO public.comuna VALUES (8309, 'Quilleco');
INSERT INTO public.comuna VALUES (8310, 'San Rosendo');
INSERT INTO public.comuna VALUES (8311, 'Santa Bárbara');
INSERT INTO public.comuna VALUES (8312, 'Tucapel');
INSERT INTO public.comuna VALUES (8313, 'Yumbel');
INSERT INTO public.comuna VALUES (8314, 'Alto Biobío');
INSERT INTO public.comuna VALUES (9101, 'Temuco');
INSERT INTO public.comuna VALUES (9102, 'Carahue');
INSERT INTO public.comuna VALUES (9103, 'Cunco');
INSERT INTO public.comuna VALUES (9104, 'Curarrehue');
INSERT INTO public.comuna VALUES (9105, 'Freire');
INSERT INTO public.comuna VALUES (9106, 'Galvarino');
INSERT INTO public.comuna VALUES (9107, 'Gorbea');
INSERT INTO public.comuna VALUES (9108, 'Lautaro');
INSERT INTO public.comuna VALUES (9109, 'Loncoche');
INSERT INTO public.comuna VALUES (9110, 'Melipeuco');
INSERT INTO public.comuna VALUES (9111, 'Nueva Imperial');
INSERT INTO public.comuna VALUES (9112, 'Padre Las Casas');
INSERT INTO public.comuna VALUES (9113, 'Perquenco');
INSERT INTO public.comuna VALUES (9114, 'Pitrufquén');
INSERT INTO public.comuna VALUES (9115, 'Pucón');
INSERT INTO public.comuna VALUES (9116, 'Saavedra');
INSERT INTO public.comuna VALUES (9117, 'Teodoro Schmidt');
INSERT INTO public.comuna VALUES (9118, 'Toltén');
INSERT INTO public.comuna VALUES (9119, 'Vilcún');
INSERT INTO public.comuna VALUES (9120, 'Villarrica');
INSERT INTO public.comuna VALUES (9121, 'Cholchol');
INSERT INTO public.comuna VALUES (9201, 'Angol');
INSERT INTO public.comuna VALUES (9202, 'Collipulli');
INSERT INTO public.comuna VALUES (9203, 'Curacautín');
INSERT INTO public.comuna VALUES (9204, 'Ercilla');
INSERT INTO public.comuna VALUES (9205, 'Lonquimay');


--
-- TOC entry 3670 (class 0 OID 16953)
-- Dependencies: 221
-- Data for Name: inmueble; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.inmueble VALUES (1, 'Casa en el arbol', 'Donde tenga mis dibujos', 10, 10, 0, 1, 1, 'El arbol 8', 1, 1.5e+07, 13, 5405);


--
-- TOC entry 3673 (class 0 OID 16986)
-- Dependencies: 224
-- Data for Name: inmueble_arrendatario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3668 (class 0 OID 16944)
-- Dependencies: 219
-- Data for Name: tipo_inmueble; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipo_inmueble VALUES (1, 'CASA');
INSERT INTO public.tipo_inmueble VALUES (2, 'DEPARTAMENTO');
INSERT INTO public.tipo_inmueble VALUES (3, 'OFICINA');
INSERT INTO public.tipo_inmueble VALUES (4, 'TERRENO');


--
-- TOC entry 3666 (class 0 OID 16930)
-- Dependencies: 217
-- Data for Name: tipo_usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipo_usuario VALUES (1, 'ARRENDATARIO');
INSERT INTO public.tipo_usuario VALUES (2, 'ARRENDADOR');


--
-- TOC entry 3664 (class 0 OID 16922)
-- Dependencies: 215
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario VALUES (13, 'Oscar', 'Undurraga', 'Acuña', 'El Centro', '8888', 'oscar@gm.com', 2);


--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 222
-- Name: comuna_comuna_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comuna_comuna_id_seq', 1, false);


--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 220
-- Name: inmueble_inm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inmueble_inm_id_seq', 1, true);


--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 218
-- Name: tipo_inmueble_tipoi_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_inmueble_tipoi_codigo_seq', 4, true);


--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_usuario_tipou_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_usuario_tipou_codigo_seq', 2, true);


--
-- TOC entry 3514 (class 2606 OID 16980)
-- Name: comuna comuna_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comuna
    ADD CONSTRAINT comuna_pk PRIMARY KEY (comuna_id);


--
-- TOC entry 3512 (class 2606 OID 16961)
-- Name: inmueble inmueble_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble
    ADD CONSTRAINT inmueble_pk PRIMARY KEY (inm_id);


--
-- TOC entry 3510 (class 2606 OID 16951)
-- Name: tipo_inmueble tipo_inmueble_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_inmueble
    ADD CONSTRAINT tipo_inmueble_pk PRIMARY KEY (tipoi_codigo);


--
-- TOC entry 3508 (class 2606 OID 16937)
-- Name: tipo_usuario tipo_usuario_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pk PRIMARY KEY (tipou_codigo);


--
-- TOC entry 3506 (class 2606 OID 16928)
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (usu_rut);


--
-- TOC entry 3519 (class 2606 OID 16990)
-- Name: inmueble_arrendatario inmueble_arrendatario_inmueble_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble_arrendatario
    ADD CONSTRAINT inmueble_arrendatario_inmueble_fk FOREIGN KEY (inm_id) REFERENCES public.inmueble(inm_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3520 (class 2606 OID 16995)
-- Name: inmueble_arrendatario inmueble_arrendatario_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble_arrendatario
    ADD CONSTRAINT inmueble_arrendatario_usuario_fk FOREIGN KEY (usu_rut) REFERENCES public.usuario(usu_rut) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3516 (class 2606 OID 16981)
-- Name: inmueble inmueble_comuna_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble
    ADD CONSTRAINT inmueble_comuna_fk FOREIGN KEY (comuna_id) REFERENCES public.comuna(comuna_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3517 (class 2606 OID 16962)
-- Name: inmueble inmueble_tipo_inmueble_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble
    ADD CONSTRAINT inmueble_tipo_inmueble_fk FOREIGN KEY (tipoi_codigo) REFERENCES public.tipo_inmueble(tipoi_codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3518 (class 2606 OID 16967)
-- Name: inmueble inmueble_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble
    ADD CONSTRAINT inmueble_usuario_fk FOREIGN KEY (usu_rut) REFERENCES public.usuario(usu_rut) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3515 (class 2606 OID 16938)
-- Name: usuario usuario_tipo_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_tipo_usuario_fk FOREIGN KEY (tipou_codigo) REFERENCES public.tipo_usuario(tipou_codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2024-08-13 23:57:18 -04

--
-- PostgreSQL database dump complete
--

