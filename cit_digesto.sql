--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

-- Started on 2020-03-02 10:54:50 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11927)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 3270627)
-- Name:  documentos_relacionados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public." documentos_relacionados" (
    id_docum_relacion integer NOT NULL,
    id_documento integer,
    id_tipo_doc integer,
    id_autoridad integer,
    numero integer,
    fecha date,
    id_relacion integer,
    observaciones character varying(250),
    anio integer
);


ALTER TABLE public." documentos_relacionados" OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 3270129)
-- Name:  documentos_relacionados_id_docum_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public." documentos_relacionados_id_docum_relacion_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public." documentos_relacionados_id_docum_relacion_seq" OWNER TO postgres;

--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 173
-- Name:  documentos_relacionados_id_docum_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public." documentos_relacionados_id_docum_relacion_seq" OWNED BY public." documentos_relacionados".id_docum_relacion;


--
-- TOC entry 174 (class 1259 OID 3270131)
-- Name: actualizada_derogada_id_actualiza_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actualizada_derogada_id_actualiza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actualizada_derogada_id_actualiza_seq OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 3270651)
-- Name: actualizada_derogada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actualizada_derogada (
    id_actualiza bigint DEFAULT nextval('public.actualizada_derogada_id_actualiza_seq'::regclass) NOT NULL,
    observaciones integer,
    id_documento_actualiza bigint,
    id_documento bigint NOT NULL
);


ALTER TABLE public.actualizada_derogada OWNER TO postgres;

--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE actualizada_derogada; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.actualizada_derogada IS 'guarda la informacion de que norma actualiza, deroga, etc.';


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN actualizada_derogada.id_documento_actualiza; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.actualizada_derogada.id_documento_actualiza IS 'Guarda el ID del documento que se actualiza o deroga
';


--
-- TOC entry 175 (class 1259 OID 3270133)
-- Name: conf_autoridades_id_autoridad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_autoridades_id_autoridad_seq
    START WITH 38
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_autoridades_id_autoridad_seq OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 3270655)
-- Name: conf_autoridades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_autoridades (
    id_autoridad integer DEFAULT nextval('public.conf_autoridades_id_autoridad_seq'::regclass) NOT NULL,
    autoridad character varying(255),
    codigo character varying(5)
);


ALTER TABLE public.conf_autoridades OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 3270659)
-- Name: conf_autoridades_tipo_docs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_autoridades_tipo_docs (
    id_autoridad_tipo integer NOT NULL,
    id_autoridad integer NOT NULL,
    id_tipo_doc integer NOT NULL
);


ALTER TABLE public.conf_autoridades_tipo_docs OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 3270135)
-- Name: conf_autoridades_tipo_docs_id_autoridad_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq OWNER TO postgres;

--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 176
-- Name: conf_autoridades_tipo_docs_id_autoridad_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq OWNED BY public.conf_autoridades_tipo_docs.id_autoridad_tipo;


--
-- TOC entry 177 (class 1259 OID 3270137)
-- Name: conf_calves_id_clave_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_calves_id_clave_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_calves_id_clave_seq OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 3270662)
-- Name: conf_calves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_calves (
    id_clave bigint DEFAULT nextval('public.conf_calves_id_clave_seq'::regclass) NOT NULL,
    clave character varying(255)
);


ALTER TABLE public.conf_calves OWNER TO postgres;

--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE conf_calves; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.conf_calves IS 'Palabras Claves para utilizar en documento';


--
-- TOC entry 178 (class 1259 OID 3270139)
-- Name: conf_categorias_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_categorias_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_categorias_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 3270666)
-- Name: conf_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_categorias (
    id_categoria integer DEFAULT nextval('public.conf_categorias_id_categoria_seq'::regclass) NOT NULL,
    descripcion character varying(255),
    activa smallint DEFAULT 1
);


ALTER TABLE public.conf_categorias OWNER TO postgres;

--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE conf_categorias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.conf_categorias IS 'categoria principal
';


--
-- TOC entry 180 (class 1259 OID 3270143)
-- Name: conf_dependencia_id_dependencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_dependencia_id_dependencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_dependencia_id_dependencia_seq OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 3270670)
-- Name: conf_dependencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_dependencia (
    id_dependencia integer DEFAULT nextval('public.conf_dependencia_id_dependencia_seq'::regclass) NOT NULL,
    dependencia text,
    denominacion text,
    activa smallint DEFAULT 1
);


ALTER TABLE public.conf_dependencia OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 3270677)
-- Name: conf_dependencia_autoridades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_dependencia_autoridades (
    id_depen_autoridad integer NOT NULL,
    id_dependencia integer NOT NULL,
    id_autoridad integer NOT NULL
);


ALTER TABLE public.conf_dependencia_autoridades OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 3270141)
-- Name: conf_dependencia_autoridades_id_depen_autoridad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_dependencia_autoridades_id_depen_autoridad_seq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_dependencia_autoridades_id_depen_autoridad_seq OWNER TO postgres;

--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 179
-- Name: conf_dependencia_autoridades_id_depen_autoridad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conf_dependencia_autoridades_id_depen_autoridad_seq OWNED BY public.conf_dependencia_autoridades.id_depen_autoridad;


--
-- TOC entry 204 (class 1259 OID 3270680)
-- Name: conf_genera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_genera (
    id_genera integer NOT NULL,
    genera character varying(255),
    id_dependencia integer
);


ALTER TABLE public.conf_genera OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 3270145)
-- Name: conf_genera_id_genera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_genera_id_genera_seq
    START WITH 59
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_genera_id_genera_seq OWNER TO postgres;

--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 181
-- Name: conf_genera_id_genera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conf_genera_id_genera_seq OWNED BY public.conf_genera.id_genera;


--
-- TOC entry 182 (class 1259 OID 3270147)
-- Name: conf_programas_id_programa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_programas_id_programa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_programas_id_programa_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 3270683)
-- Name: conf_programas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_programas (
    id_programa integer DEFAULT nextval('public.conf_programas_id_programa_seq'::regclass) NOT NULL,
    programa character varying(255)
);


ALTER TABLE public.conf_programas OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 3270149)
-- Name: conf_sub_categoria_id_sub_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_sub_categoria_id_sub_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_sub_categoria_id_sub_categoria_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 3270687)
-- Name: conf_sub_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_sub_categoria (
    id_sub_categoria integer DEFAULT nextval('public.conf_sub_categoria_id_sub_categoria_seq'::regclass) NOT NULL,
    descripcion character varying(255),
    id_categoria integer,
    activa smallint DEFAULT 1
);


ALTER TABLE public.conf_sub_categoria OWNER TO postgres;

--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE conf_sub_categoria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.conf_sub_categoria IS 'subcategorias';


--
-- TOC entry 184 (class 1259 OID 3270151)
-- Name: conf_sub_sub_categoria_id_sub_sub_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_sub_sub_categoria_id_sub_sub_categoria_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_sub_sub_categoria_id_sub_sub_categoria_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 3270691)
-- Name: conf_sub_sub_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_sub_sub_categoria (
    id_sub_sub_categoria bigint DEFAULT nextval('public.conf_sub_sub_categoria_id_sub_sub_categoria_seq'::regclass) NOT NULL,
    descripcion character varying(255),
    id_sub_categoria integer NOT NULL
);


ALTER TABLE public.conf_sub_sub_categoria OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 3270153)
-- Name: conf_tipo_acceso_id_tipo_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_tipo_acceso_id_tipo_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_tipo_acceso_id_tipo_acceso_seq OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 3270695)
-- Name: conf_tipo_acceso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_tipo_acceso (
    id_tipo_acceso integer DEFAULT nextval('public.conf_tipo_acceso_id_tipo_acceso_seq'::regclass) NOT NULL,
    acceso character varying(100)
);


ALTER TABLE public.conf_tipo_acceso OWNER TO postgres;

--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE conf_tipo_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.conf_tipo_acceso IS 'si es privada o publica, esto es si es el digesto o no
';


--
-- TOC entry 186 (class 1259 OID 3270155)
-- Name: conf_tipo_docs_id_tipo_doc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_tipo_docs_id_tipo_doc_seq
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_tipo_docs_id_tipo_doc_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 3270699)
-- Name: conf_tipo_docs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_tipo_docs (
    id_tipo_doc integer DEFAULT nextval('public.conf_tipo_docs_id_tipo_doc_seq'::regclass) NOT NULL,
    documento character varying(255),
    codigo character varying(5)
);


ALTER TABLE public.conf_tipo_docs OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 3270157)
-- Name: conf_tipo_estado_id_tipo_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_tipo_estado_id_tipo_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_tipo_estado_id_tipo_estado_seq OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 3270703)
-- Name: conf_tipo_estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_tipo_estado (
    id_tipo_estado integer DEFAULT nextval('public.conf_tipo_estado_id_tipo_estado_seq'::regclass) NOT NULL,
    estado character varying(255)
);


ALTER TABLE public.conf_tipo_estado OWNER TO postgres;

--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE conf_tipo_estado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.conf_tipo_estado IS 'vigente, derogada, etc';


--
-- TOC entry 188 (class 1259 OID 3270159)
-- Name: documento_categorias_id_documento_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documento_categorias_id_documento_categoria_seq
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documento_categorias_id_documento_categoria_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 3270707)
-- Name: documento_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documento_categorias (
    id_documento_categoria bigint DEFAULT nextval('public.documento_categorias_id_documento_categoria_seq'::regclass) NOT NULL,
    id_documento bigint NOT NULL,
    id_categoria integer NOT NULL,
    id_sub_categoria integer NOT NULL
);


ALTER TABLE public.documento_categorias OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 3270163)
-- Name: documentos_id_documento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documentos_id_documento_seq
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documentos_id_documento_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 3270711)
-- Name: documentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documentos (
    id_documento bigint DEFAULT nextval('public.documentos_id_documento_seq'::regclass) NOT NULL,
    id_tipo_doc integer NOT NULL,
    id_autoridad integer NOT NULL,
    numero integer,
    fecha date,
    anio integer,
    id_tipo_estado integer NOT NULL,
    estado_por_cual text,
    cudap text,
    dep_aplicacion integer,
    id_genera integer,
    normas_rel text,
    id_programa integer,
    referencia text,
    archivo character varying(255),
    res_rector character varying(50),
    res_rector_normas text,
    id_tipo_acceso integer,
    usuario_registra character varying(255),
    fecha_registra date,
    hora_registra character varying(8),
    id_usuario integer,
    dep_genera integer,
    tipo_dependencia character varying,
    dependencia integer DEFAULT 0,
    archivo_doc bytea,
    archivo_nombre character varying,
    ad_referendum smallint,
    correos_destino character varying(255)
);


ALTER TABLE public.documentos OWNER TO postgres;

--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN documentos.estado_por_cual; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.documentos.estado_por_cual IS 'contiene las normas, ordenanzas, etc, si la que se esta cargando o modificando ha sido derogada, actualizada, etc
';


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN documentos.dep_aplicacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.documentos.dep_aplicacion IS 'dpendencia de aplicacion';


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN documentos.id_genera; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.documentos.id_genera IS 'dependencia que genera';


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN documentos.normas_rel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.documentos.normas_rel IS 'guarda las normas relacionadas
';


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN documentos.res_rector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.documentos.res_rector IS 'Ad.referendum o modificada son las dos unicas opciones';


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN documentos.res_rector_normas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.documentos.res_rector_normas IS 'Contiene las normas de rector cuando se ha seleccionado Ad-Referendum o Modificada
';


--
-- TOC entry 189 (class 1259 OID 3270161)
-- Name: documentos_claves_id_doc_claves_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documentos_claves_id_doc_claves_seq
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documentos_claves_id_doc_claves_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 3270718)
-- Name: documentos_claves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documentos_claves (
    id_doc_claves bigint DEFAULT nextval('public.documentos_claves_id_doc_claves_seq'::regclass) NOT NULL,
    id_clave bigint NOT NULL,
    id_documento bigint NOT NULL
);


ALTER TABLE public.documentos_claves OWNER TO postgres;

--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE documentos_claves; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.documentos_claves IS 'guarda las claves que se han seleccionado, esto es para poder hacer un digesto de palabras comunes.

Relacion 1:N';


--
-- TOC entry 214 (class 1259 OID 3270722)
-- Name: documentos_relacion_exterior; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documentos_relacion_exterior (
    id_doc_exterior integer NOT NULL,
    id_documento integer,
    id_tipo_doc integer,
    numero integer,
    fecha integer,
    id_relacion integer,
    observaciones character varying(250),
    documento_ext bytea
);


ALTER TABLE public.documentos_relacion_exterior OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 3270165)
-- Name: documentos_relacion_exterior_id_doc_exterior_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documentos_relacion_exterior_id_doc_exterior_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documentos_relacion_exterior_id_doc_exterior_seq OWNER TO postgres;

--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 191
-- Name: documentos_relacion_exterior_id_doc_exterior_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documentos_relacion_exterior_id_doc_exterior_seq OWNED BY public.documentos_relacion_exterior.id_doc_exterior;


--
-- TOC entry 215 (class 1259 OID 3270728)
-- Name: estado_relacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_relacion (
    id_relacion integer NOT NULL,
    relacion character varying
);


ALTER TABLE public.estado_relacion OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 3270167)
-- Name: estado_relacion_id_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_relacion_id_relacion_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_relacion_id_relacion_seq OWNER TO postgres;

--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 192
-- Name: estado_relacion_id_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_relacion_id_relacion_seq OWNED BY public.estado_relacion.id_relacion;


SET default_with_oids = true;

--
-- TOC entry 216 (class 1259 OID 3270734)
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificaciones (
    id_notificacion integer NOT NULL,
    nombres character varying(255),
    correo1 character varying(200),
    tel character varying(50),
    id_genera integer NOT NULL
);


ALTER TABLE public.notificaciones OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 3270737)
-- Name: notificaciones_claves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificaciones_claves (
    id_notifi_calve integer NOT NULL,
    id_clave bigint NOT NULL,
    id_notificacion integer NOT NULL
);


ALTER TABLE public.notificaciones_claves OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 3270169)
-- Name: notificaciones_claves_id_notifi_calve_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificaciones_claves_id_notifi_calve_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificaciones_claves_id_notifi_calve_seq OWNER TO postgres;

--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 193
-- Name: notificaciones_claves_id_notifi_calve_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificaciones_claves_id_notifi_calve_seq OWNED BY public.notificaciones_claves.id_notifi_calve;


--
-- TOC entry 194 (class 1259 OID 3270171)
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificaciones_id_notificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificaciones_id_notificacion_seq OWNER TO postgres;

--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 194
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificaciones_id_notificacion_seq OWNED BY public.notificaciones.id_notificacion;


SET default_with_oids = false;

--
-- TOC entry 218 (class 1259 OID 3270740)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(255),
    apellido character varying(255),
    nro_documento integer,
    id_toba character varying(100),
    id_dependencia integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 3270173)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 195
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 2087 (class 2604 OID 3270743)
-- Name:  documentos_relacionados id_docum_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." documentos_relacionados" ALTER COLUMN id_docum_relacion SET DEFAULT nextval('public." documentos_relacionados_id_docum_relacion_seq"'::regclass);


--
-- TOC entry 2090 (class 2604 OID 3270744)
-- Name: conf_autoridades_tipo_docs id_autoridad_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_autoridades_tipo_docs ALTER COLUMN id_autoridad_tipo SET DEFAULT nextval('public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 3270745)
-- Name: conf_dependencia_autoridades id_depen_autoridad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_dependencia_autoridades ALTER COLUMN id_depen_autoridad SET DEFAULT nextval('public.conf_dependencia_autoridades_id_depen_autoridad_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 3270746)
-- Name: conf_genera id_genera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_genera ALTER COLUMN id_genera SET DEFAULT nextval('public.conf_genera_id_genera_seq'::regclass);


--
-- TOC entry 2109 (class 2604 OID 3270747)
-- Name: documentos_relacion_exterior id_doc_exterior; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_relacion_exterior ALTER COLUMN id_doc_exterior SET DEFAULT nextval('public.documentos_relacion_exterior_id_doc_exterior_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 3270748)
-- Name: estado_relacion id_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_relacion ALTER COLUMN id_relacion SET DEFAULT nextval('public.estado_relacion_id_relacion_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 3270749)
-- Name: notificaciones id_notificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones ALTER COLUMN id_notificacion SET DEFAULT nextval('public.notificaciones_id_notificacion_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 3270750)
-- Name: notificaciones_claves id_notifi_calve; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones_claves ALTER COLUMN id_notifi_calve SET DEFAULT nextval('public.notificaciones_claves_id_notifi_calve_seq'::regclass);


--
-- TOC entry 2113 (class 2604 OID 3270751)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 2340 (class 2613 OID 6367665)
-- Name: 6367665; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367665');


ALTER LARGE OBJECT 6367665 OWNER TO postgres;

--
-- TOC entry 2341 (class 2613 OID 6367666)
-- Name: 6367666; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367666');


ALTER LARGE OBJECT 6367666 OWNER TO postgres;

--
-- TOC entry 2342 (class 2613 OID 6367667)
-- Name: 6367667; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367667');


ALTER LARGE OBJECT 6367667 OWNER TO postgres;

--
-- TOC entry 2343 (class 2613 OID 6367668)
-- Name: 6367668; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367668');


ALTER LARGE OBJECT 6367668 OWNER TO postgres;

--
-- TOC entry 2344 (class 2613 OID 6367669)
-- Name: 6367669; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367669');


ALTER LARGE OBJECT 6367669 OWNER TO postgres;

--
-- TOC entry 2345 (class 2613 OID 6367694)
-- Name: 6367694; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367694');


ALTER LARGE OBJECT 6367694 OWNER TO postgres;

--
-- TOC entry 2346 (class 2613 OID 6367695)
-- Name: 6367695; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367695');


ALTER LARGE OBJECT 6367695 OWNER TO postgres;

--
-- TOC entry 2347 (class 2613 OID 6367696)
-- Name: 6367696; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367696');


ALTER LARGE OBJECT 6367696 OWNER TO postgres;

--
-- TOC entry 2348 (class 2613 OID 6367697)
-- Name: 6367697; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367697');


ALTER LARGE OBJECT 6367697 OWNER TO postgres;

--
-- TOC entry 2349 (class 2613 OID 6367698)
-- Name: 6367698; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367698');


ALTER LARGE OBJECT 6367698 OWNER TO postgres;

--
-- TOC entry 2350 (class 2613 OID 6367699)
-- Name: 6367699; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367699');


ALTER LARGE OBJECT 6367699 OWNER TO postgres;

--
-- TOC entry 2351 (class 2613 OID 6367700)
-- Name: 6367700; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367700');


ALTER LARGE OBJECT 6367700 OWNER TO postgres;

--
-- TOC entry 2352 (class 2613 OID 6367701)
-- Name: 6367701; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367701');


ALTER LARGE OBJECT 6367701 OWNER TO postgres;

--
-- TOC entry 2353 (class 2613 OID 6367702)
-- Name: 6367702; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367702');


ALTER LARGE OBJECT 6367702 OWNER TO postgres;

--
-- TOC entry 2354 (class 2613 OID 6367703)
-- Name: 6367703; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367703');


ALTER LARGE OBJECT 6367703 OWNER TO postgres;

--
-- TOC entry 2355 (class 2613 OID 6367704)
-- Name: 6367704; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367704');


ALTER LARGE OBJECT 6367704 OWNER TO postgres;

--
-- TOC entry 2356 (class 2613 OID 6367705)
-- Name: 6367705; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367705');


ALTER LARGE OBJECT 6367705 OWNER TO postgres;

--
-- TOC entry 2357 (class 2613 OID 6367706)
-- Name: 6367706; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367706');


ALTER LARGE OBJECT 6367706 OWNER TO postgres;

--
-- TOC entry 2358 (class 2613 OID 6367707)
-- Name: 6367707; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367707');


ALTER LARGE OBJECT 6367707 OWNER TO postgres;

--
-- TOC entry 2359 (class 2613 OID 6367708)
-- Name: 6367708; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('6367708');


ALTER LARGE OBJECT 6367708 OWNER TO postgres;

--
-- TOC entry 2317 (class 0 OID 3270627)
-- Dependencies: 196
-- Data for Name:  documentos_relacionados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public." documentos_relacionados" (id_docum_relacion, id_documento, id_tipo_doc, id_autoridad, numero, fecha, id_relacion, observaciones, anio) FROM stdin;



--
-- TOC entry 2318 (class 0 OID 3270651)
-- Dependencies: 197
-- Data for Name: actualizada_derogada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actualizada_derogada (id_actualiza, observaciones, id_documento_actualiza, id_documento) FROM stdin;
\.


--
-- TOC entry 2319 (class 0 OID 3270655)
-- Dependencies: 198
-- Data for Name: conf_autoridades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_autoridades (id_autoridad, autoridad, codigo) FROM stdin;
13	Director General de Personal	\N
18	Rector	\N
29	Decano	\N
32	Rector Interventor	\N
34	Rector Normalizador	\N
37	Direcci�n General de Personal	\N
0	Sin Especificar	\N
30	Consejo Directivo	CD
1	Asamblea Universitaria	AU
2	Auditor Interno	AI
9	Consejo Superior	CS
31	Consejo Superior Provisorio	CSP
\.


--
-- TOC entry 2320 (class 0 OID 3270659)
-- Dependencies: 199
-- Data for Name: conf_autoridades_tipo_docs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_autoridades_tipo_docs (id_autoridad_tipo, id_autoridad, id_tipo_doc) FROM stdin;
1	1	1
2	30	1
3	30	4
4	30	6
5	30	9
6	29	1
7	29	2
8	29	3
9	9	1
10	9	2
11	18	1
12	18	2
13	1	2
14	30	2
15	18	3
16	37	4
\.


--
-- TOC entry 2321 (class 0 OID 3270662)
-- Dependencies: 200
-- Data for Name: conf_calves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_calves (id_clave, clave) FROM stdin;
1	Contrato
2	Despido
3	Sumario
4	Jubilacion
5	Concurso
\.


--
-- TOC entry 2322 (class 0 OID 3270666)
-- Dependencies: 201
-- Data for Name: conf_categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_categorias (id_categoria, descripcion, activa) FROM stdin;
12	ADSCRIPCIONES Y TRASLADOS	1
13	ASIGNACI�N DE FUNCIONES	1
14	AVAL, AUSPICIO Y DECLARACIONES DE INTER�S	1
15	BAJAS	1
16	BECAS	1
17	CALENDARIO	1
18	CARRERAS Y DIPLOMATURAS	1
19	CONCURSOS	1
20	CONTRATOS	1
21	CONVENIOS	1
22	CREACI�N	1
23	DEDICACI�N	1
24	DESIGNACIONES INTERINAS	1
25	DESIGNACIONES EFECTIVAS	1
26	DESIGNACIONES ESPECIALES	1
27	DIPLOMAS	1
28	ELECCIONES	1
29	EFECTIVIZACIONES	1
30	ESTRUCTURA ORG�NICO-FUNCIONAL	1
31	FONDOS DE CYT	1
32	INCENTIVOS	1
33	LEGALES	1
34	LICENCIAS	1
35	MODIFICATORIAS	1
36	OBRAS	1
37	PAGOS	1
38	PATRIMONIO	1
39	PARITARIAS	1
40	PRESUPUESTO	1
41	PROGRAMA DE INTEGRACI�N	1
42	RATIFICACIONES	1
43	DISTINCIONES	1
44	AGRADECIMIENTO Y RECONOCIMIENTO	1
45	RECONOCIMIENTO DE ANTIG�EDAD Y VACACIONES	1
46	REGLAMENTOS	1
47	VARIOS	1
11	ADICIONALES / SUPLEMENTOS	1
10	A CARGO / REASUME	1
48	AUDITOR�A	1
\.


--
-- TOC entry 2323 (class 0 OID 3270670)
-- Dependencies: 202
-- Data for Name: conf_dependencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_dependencia (id_dependencia, dependencia, denominacion, activa) FROM stdin;
2	ASAMBLEA UNIVERSITARIA	AU	1
3	CONSEJO SUPERIOR	CS	1
4	Secretar�a Acad�mica del Rectorado	SA	1
5	Secretar�a de Bienestar Universitario del Rectorado	SBU	1
6	Secretar�a de Extensi�n y Vinculaci�n del Rectorado	SEyV	1
7	Secretar�a de Gesti�n Econ�mica y de Servicios del Rectorado	SGEyS	1
8	Secretar�a de Investigaci�n, Internacionales y Posgrado	SIIP	1
9	Secretar�a de Relaciones Institucionales, Asuntos Legales, Administraci�n y Planificaci�n del Rectorado	SRIALAyP	1
10	Auditor�a Interna	UAI	1
11	Centro de Informaci�n y Comunicaci�n del Rectorado	CICUNC	1
12	Facultad de Artes y Dise�o	FAD	1
13	Facultad de Ciencias Agrarias	FCA	1
14	Facultad de Ciencias Aplicadas a la Industria	FCAI	1
15	Facultad de Ciencias Econ�micas	FCE	1
16	Facultad de Ciencias Pol�ticas y Sociales	FCPyS	1
17	Facultad de Ciencias Exactas y Naturales	FCEN	1
18	Facultad de Derecho	FD	1
19	Facultad de Filosof�a y Letras	FFyL	1
20	Facultad de Odontolog�a	FOD	1
21	Facultad de Ciencias M�dicas	FCM	1
22	Facultad de Educaci�n	FED	1
23	Facultad de Ingenier�a	FIN	1
24	Instituto Balseiro	IB	1
25	Hospital Universitario	HUN	1
1	RECTORADO	REC	1
\.


--
-- TOC entry 2324 (class 0 OID 3270677)
-- Dependencies: 203
-- Data for Name: conf_dependencia_autoridades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_dependencia_autoridades (id_depen_autoridad, id_dependencia, id_autoridad) FROM stdin;
10	1	18
11	2	1
12	10	2
13	3	9
\.


--
-- TOC entry 2325 (class 0 OID 3270680)
-- Dependencies: 204
-- Data for Name: conf_genera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_genera (id_genera, genera, id_dependencia) FROM stdin;
2	Asamblea Universitaria	1
3	Auditor�a Interna	1
4	CICUNC	1
5	CICUNC - Centro de Infor. y Comunicaci�n	1
6	CICUNC - Centro Documentaci�n Hist�rica	1
7	CICUNC - Nodo Inform�tico	1
8	Consejo Asesor de Seguridad	1
9	Consejo Asesor Permanente -CAP-	1
10	Consejo Superior 	1
11	Coordinadora de Gesit�n Administrativa	1
12	Dcci�n. Gral. de Organizaci�n y Sistemas	1
13	Direcci�n Area Operativa	1
14	Direcci�n de Acci�n Social	1
15	Direcci�n de Certificaciones	1
16	Direcci�n de Compras y Suministros	1
17	Direcci�n de Contrataciones y Patrimonio	1
18	Direcci�n de Despacho	1
19	Direcci�n de Diplomas y Certificaciones 	1
20	Direcci�n de Hogar y Club	1
21	Direcci�n de Jardines Maternales	1
22	Direcci�n de Liquidaci�n de Haberes	1
23	Direcci�n de Presupuesto	1
24	Direcci�n de Registros Contables 	1
25	Direcci�n de Registros y Legajos	1
26	Direcci�n de Residencias Universitarias 	1
27	Direcci�n de Salud Estudiantil 	1
28	Direcci�n de Seguridad Social	1
29	Direcci�n General Acad�mica 	1
30	Direcci�n General Administrativa 	1
31	Direcci�n General de Contabilidad	1
32	Direcci�n General de Deportes	1
33	Direcci�n General de Educaci�n Polimodal	1
34	Direcci�n General de Jardines Maternales	1
35	Direcci�n General de Recursos Humanos	1
36	Direcci�n General de Sanidad Universitaria	1
37	Direcci�n General de Tesorer�a 	1
38	Direcci�n General Econ�mico Financiera 	1
39	Director General de Personal 	1
40	Espacio de la Ciencia y la Tecnolog�a	1
41	FUNDAR	1
42	Junta Calificadora de M�ritos	1
43	Mesa de Entradas 	1
44	Oficina de Seguros 	1
45	Secretar�a Acad�mica	1
46	Secretar�a Administrativa	1
47	Secretar�a de Bienestar y Acci�n Social	1
48	Secretar�a de Ciencia y T�cnica	1
49	Secretar�a de Desarrollo Institucional	1
50	Secretar�a de Extensi�n Universitaria	1
51	Secretar�a de Gesti�n Administrativa, Econ�mica y Servicios	1
52	Secretar�a de Relaciones Institucionales	1
53	Secretar�a de Relaciones Institucionales y Territorializaci�n	1
54	Secretar�a de Relaciones Internacionales e Integraci�n	1
55	Secretar�a Econ�mico Administrativa	1
56	Secretar�a Econ�mico Financiera	1
57	Secretar�a Planeamiento y L. de I. y S.	1
58	Secretario de Gesti�n Administrativa Econ�mica y de Servicios 	1
59	SID - Sistema Integrado de Documentaci�n	1
60	Organismos Artistico	1
61	CIT	1
62	CIREC	1
63	CINDA	1
64	Cine-Teatro Universidad	1
65	ACASU  - Asoc. Coop. Acci�n Social Univ.	1
66	�rea de Financiamiento- Desarr. de la UNCU	1
67	Asoc. - Docentes e Investigadores UNCU	1
68	Asoc. Coop. de la Editorial -ACEDIUNC-	1
69	Asoc. de Ayuda al Deporte Univ. -AADU-	1
70	Comisi�n Asesora de Reingenier�a  Adm.	1
71	FADIUNC- Asociaci�n Docentes e Investigadores	1
72	FUA- Federaci�n Universitaria Argentina	1
73	FUC- Federaci�n Universitaria de Cuyo	1
74	FUESMEN - Fundaci�n de medicina Nuclear	1
75	EDIUNC	1
76	Asoc. Coop. - Jardines Maternales	1
77	Inst. de Int. Latinoamericana de UNCU - INILA	1
1	prueba	1
\.


--
-- TOC entry 2326 (class 0 OID 3270683)
-- Dependencies: 205
-- Data for Name: conf_programas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_programas (id_programa, programa) FROM stdin;
2	FOMEC
3	FRAC
0	Sin Especificar
1	Educaci�n de Posgrado
\.


--
-- TOC entry 2327 (class 0 OID 3270687)
-- Dependencies: 206
-- Data for Name: conf_sub_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_sub_categoria (id_sub_categoria, descripcion, id_categoria, activa) FROM stdin;
65	Car�cter Cr�tico de la Funci�n	11	1
66	Mayor Dedicaci�n	11	1
67	T�tulo	11	1
68	Falla de Caja	11	1
69	Mayor Responsabilidad	11	1
70	Movilidad Fija	11	1
71	Adscripciones Docentes	12	1
72	Adscripciones Apoyo Acad�mico	12	1
73	Traslados Docentes	12	1
74	Traslados Apoyo Acad�mico	12	1
75	ORD. 82	15	1
76	Fallecimiento	15	1
77	Jubilaci�n Apoyo Acad�mico	15	1
78	Jubilaci�n Docente	15	1
79	Temprana	15	1
80	Art. 62 - Estatuto	15	1
81	Ord. 48	15	1
82	Renuncia	15	1
83	Otras	15	1
84	Prestaci�n de Servicios	16	1
85	Capacitaci�n Pre Profesional Universitaria	16	1
86	Movilidad	16	1
87	Prestaci�n de Servicios para Actividades Acad�micas	16	1
88	SBU	16	1
89	Otras	16	1
90	Asuetos / Feriados	17	1
91	Acad�mico	17	1
92	Creaci�n Carreras de Grado y Pre Grado	18	1
93	Creaci�n Carreras de Posgrado	18	1
94	Planes de Estudio Carreras de Grado y Pre Grado	18	1
95	Planes de Estudio Carreras de Posgrado	18	1
96	Diplomaturas	18	1
97	Condiciones de Admisibilidad	18	1
98	Apoyo Acad�mico	19	1
99	Apoyo Acad�mico por Ord. 43	19	1
100	Docente Efectivo	19	1
101	Docente Abreviado	19	1
102	Directivos de Escuelas	19	1
103	Apoyo Acad�mico	20	1
104	Apoyo Acad�mico por Ord. 43	20	1
105	Por Paritarias	20	1
106	Docente	20	1
107	Por V�a de Excepci�n	20	1
108	Otros	20	1
109	Pasant�as-Consejo Superior	21	1
110	Pasant�as-Rector	21	1
111	Consejo Superior	21	1
112	Rector	21	1
113	Dependencias	22	1
114	Programas	22	1
115	Facultades	22	1
116	Otros	22	1
117	Colegios	25	1
118	Auxiliar de Gesti�n	24	1
119	Coordinadores de Gesti�n	24	1
120	Organizadores-Ejecutores	24	1
121	Secretarios	24	1
122	Organismos Art�sticos	24	1
123	Diplomas	27	1
124	Rev�lida de T�tulos	27	1
125	Docentes	29	1
126	Apoyo Acad�mico	29	1
127	Organismos Art�sticos	29	1
128	Entrega	31	1
129	Rendici�n	31	1
130	Archivo de Actuaciones	33	1
131	Designaci�n de Instructor Sumariante	33	1
132	Recursos	33	1
133	Reclamos	33	1
134	Instrucci�n de Informaci�n Sumaria	33	1
135	Sanciones	33	1
136	Sumario Administrativo	33	1
137	Otros	33	1
138	Posmaternidad	34	1
139	Adopci�n	34	1
140	Incompatibilidad	34	1
141	Adelanto	34	1
142	Gremial	34	1
143	Accidente de Trabajo	34	1
144	Actividades Deportivas	34	1
145	Afecciones o Lesiones	34	1
146	A�o Sab�tico	34	1
147	Asistencia a Congresos	34	1
148	Excedencia	34	1
149	Razones de Estudio	34	1
150	Razones Particulares	34	1
151	Reducci�n Horaria	34	1
152	Vacaciones extraordinarias	34	1
153	Justificaci�n Inasistencias	34	1
154	Otras	34	1
155	Ampliaci�n Plazo	36	1
156	Contrataci�n Directa	36	1
157	Licitaci�n P�blica-Autoriza	36	1
158	Licitaci�n P�blica-Adjudica	36	1
159	Redeterminaci�n de Precios	36	1
160	Sustituci�n del 5% del Fondo de Reparos	36	1
161	Trabajos Adicionales	36	1
162	Otros	36	1
163	Adelanto a Responsable	37	1
164	Factura	37	1
165	Reintegros	37	1
166	SPU	37	1
167	Subsidios	37	1
168	Transferencias	37	1
169	Vi�ticos	37	1
170	Otros	37	1
171	Docentes	39	1
172	Apoyo Acad�mico	39	1
173	Baja-Transferencia de Bienes	38	1
174	Donaciones	38	1
175	Entrega	41	1
176	Rendici�n	41	1
177	Otros	41	1
178	Renuncia Condicionada por Jubilaci�n	47	1
179	Permanencia en la Actividad Docente	47	1
180	Permanencia en la Actividad de Apoyo Acad�mico	47	1
\.


--
-- TOC entry 2328 (class 0 OID 3270691)
-- Dependencies: 207
-- Data for Name: conf_sub_sub_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_sub_sub_categoria (id_sub_sub_categoria, descripcion, id_sub_categoria) FROM stdin;
\.


--
-- TOC entry 2329 (class 0 OID 3270695)
-- Dependencies: 208
-- Data for Name: conf_tipo_acceso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_tipo_acceso (id_tipo_acceso, acceso) FROM stdin;
0	Sin Especificar
1	Digesto Gral
\.


--
-- TOC entry 2330 (class 0 OID 3270699)
-- Dependencies: 209
-- Data for Name: conf_tipo_docs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_tipo_docs (id_tipo_doc, documento, codigo) FROM stdin;
2	Ordenanza	O
8	Decreto Nacional	DN
9	Resoluci�n Ministerial	RM
1	Resoluci�n	R
7	Ley	LEY
12	Declaraci�n	D
6	Decreto	DEC
3	Circular	CIRC
4	Circular de gesti�n	CIGE
5	Disposicion	DISP
\.


--
-- TOC entry 2331 (class 0 OID 3270703)
-- Dependencies: 210
-- Data for Name: conf_tipo_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_tipo_estado (id_tipo_estado, estado) FROM stdin;
1	Vigente
3	Derogada
4	Parcialmente Derogada
2	Actualizada
\.


--
-- TOC entry 2332 (class 0 OID 3270707)
-- Dependencies: 211
-- Data for Name: documento_categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documento_categorias (id_documento_categoria, id_documento, id_categoria, id_sub_categoria) FROM stdin;
22	22	16	85
23	23	22	113
\.


--
-- TOC entry 2333 (class 0 OID 3270711)
-- Dependencies: 212
-- Data for Name: documentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documentos (id_documento, id_tipo_doc, id_autoridad, numero, fecha, anio, id_tipo_estado, estado_por_cual, cudap, dep_aplicacion, id_genera, normas_rel, id_programa, referencia, archivo, res_rector, res_rector_normas, id_tipo_acceso, usuario_registra, fecha_registra, hora_registra, id_usuario, dep_genera, tipo_dependencia, dependencia, archivo_doc, archivo_nombre, ad_referendum, correos_destino) FROM stdin;
22	2	18	123	2019-11-22	2019	1	5	5555	0	\N	\N	0	555555	REC_O__123_2019.pdf	\N	\N	\N	Prueba de alta	2019-11-22	13:21:58	7	1	REC	1	\N	\N	0	\N
\.


--
-- TOC entry 2334 (class 0 OID 3270718)
-- Dependencies: 213
-- Data for Name: documentos_claves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documentos_claves (id_doc_claves, id_clave, id_documento) FROM stdin;
\.


--
-- TOC entry 2335 (class 0 OID 3270722)
-- Dependencies: 214
-- Data for Name: documentos_relacion_exterior; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documentos_relacion_exterior (id_doc_exterior, id_documento, id_tipo_doc, numero, fecha, id_relacion, observaciones, documento_ext) FROM stdin;
\.


--
-- TOC entry 2336 (class 0 OID 3270728)
-- Dependencies: 215
-- Data for Name: estado_relacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado_relacion (id_relacion, relacion) FROM stdin;
1	Actualiza
2	Modifica
3	Complementa
\.


--
-- TOC entry 2337 (class 0 OID 3270734)
-- Dependencies: 216
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notificaciones (id_notificacion, nombres, correo1, tel, id_genera) FROM stdin;
\.


--
-- TOC entry 2338 (class 0 OID 3270737)
-- Dependencies: 217
-- Data for Name: notificaciones_claves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notificaciones_claves (id_notifi_calve, id_clave, id_notificacion) FROM stdin;
\.


--
-- TOC entry 2339 (class 0 OID 3270740)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nombre, apellido, nro_documento, id_toba, id_dependencia) FROM stdin;
7	alta_rect	alta_rect	99	alta_rect	1
8	alta_rect	alta_rect	99	toba	1
\.


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 173
-- Name:  documentos_relacionados_id_docum_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public." documentos_relacionados_id_docum_relacion_seq"', 1, false);


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 174
-- Name: actualizada_derogada_id_actualiza_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actualizada_derogada_id_actualiza_seq', 1, false);


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 175
-- Name: conf_autoridades_id_autoridad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_autoridades_id_autoridad_seq', 38, true);


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 176
-- Name: conf_autoridades_tipo_docs_id_autoridad_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq', 16, true);


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 177
-- Name: conf_calves_id_clave_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_calves_id_clave_seq', 2, true);


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 178
-- Name: conf_categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_categorias_id_categoria_seq', 48, true);


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 179
-- Name: conf_dependencia_autoridades_id_depen_autoridad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_dependencia_autoridades_id_depen_autoridad_seq', 13, true);


--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 180
-- Name: conf_dependencia_id_dependencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_dependencia_id_dependencia_seq', 25, true);


--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 181
-- Name: conf_genera_id_genera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_genera_id_genera_seq', 59, true);


--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 182
-- Name: conf_programas_id_programa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_programas_id_programa_seq', 1, false);


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 183
-- Name: conf_sub_categoria_id_sub_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_sub_categoria_id_sub_categoria_seq', 180, true);


--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 184
-- Name: conf_sub_sub_categoria_id_sub_sub_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_sub_sub_categoria_id_sub_sub_categoria_seq', 7, true);


--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 185
-- Name: conf_tipo_acceso_id_tipo_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_tipo_acceso_id_tipo_acceso_seq', 1, false);


--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 186
-- Name: conf_tipo_docs_id_tipo_doc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_tipo_docs_id_tipo_doc_seq', 12, true);


--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 187
-- Name: conf_tipo_estado_id_tipo_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_tipo_estado_id_tipo_estado_seq', 1, false);


--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 188
-- Name: documento_categorias_id_documento_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documento_categorias_id_documento_categoria_seq', 23, true);


--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 189
-- Name: documentos_claves_id_doc_claves_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documentos_claves_id_doc_claves_seq', 11, true);


--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 190
-- Name: documentos_id_documento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documentos_id_documento_seq', 23, true);


--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 191
-- Name: documentos_relacion_exterior_id_doc_exterior_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documentos_relacion_exterior_id_doc_exterior_seq', 1, false);


--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 192
-- Name: estado_relacion_id_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_relacion_id_relacion_seq', 3, true);


--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 193
-- Name: notificaciones_claves_id_notifi_calve_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notificaciones_claves_id_notifi_calve_seq', 1, false);


--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 194
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notificaciones_id_notificacion_seq', 1, false);


--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 195
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 7, true);


--
-- TOC entry 2360 (class 0 OID 0)
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

BEGIN;

SELECT pg_catalog.lo_open('6367665', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367666', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367667', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367668', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367669', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367694', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367695', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367696', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367697', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367698', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367699', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367700', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367701', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367702', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367703', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367704', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367705', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367706', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367707', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('6367708', 131072);
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- TOC entry 2115 (class 2606 OID 3270764)
-- Name:  documentos_relacionados  documentos_relacionados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." documentos_relacionados"
    ADD CONSTRAINT " documentos_relacionados_pkey" PRIMARY KEY (id_docum_relacion);


--
-- TOC entry 2117 (class 2606 OID 3270766)
-- Name: actualizada_derogada actualizada_derogada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actualizada_derogada
    ADD CONSTRAINT actualizada_derogada_pkey PRIMARY KEY (id_actualiza);


--
-- TOC entry 2119 (class 2606 OID 3270768)
-- Name: conf_autoridades conf_autoridades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_autoridades
    ADD CONSTRAINT conf_autoridades_pkey PRIMARY KEY (id_autoridad);


--
-- TOC entry 2121 (class 2606 OID 3270770)
-- Name: conf_autoridades_tipo_docs conf_autoridades_tipo_docs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_autoridades_tipo_docs
    ADD CONSTRAINT conf_autoridades_tipo_docs_pkey PRIMARY KEY (id_autoridad_tipo);


--
-- TOC entry 2123 (class 2606 OID 3270772)
-- Name: conf_calves conf_calves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_calves
    ADD CONSTRAINT conf_calves_pkey PRIMARY KEY (id_clave);


--
-- TOC entry 2125 (class 2606 OID 3270774)
-- Name: conf_categorias conf_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_categorias
    ADD CONSTRAINT conf_categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 2129 (class 2606 OID 3270776)
-- Name: conf_dependencia_autoridades conf_dependencia_autoridades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_dependencia_autoridades
    ADD CONSTRAINT conf_dependencia_autoridades_pkey PRIMARY KEY (id_depen_autoridad);


--
-- TOC entry 2127 (class 2606 OID 3270778)
-- Name: conf_dependencia conf_dependencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_dependencia
    ADD CONSTRAINT conf_dependencia_pkey PRIMARY KEY (id_dependencia);


--
-- TOC entry 2131 (class 2606 OID 3270780)
-- Name: conf_genera conf_genera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_genera
    ADD CONSTRAINT conf_genera_pkey PRIMARY KEY (id_genera);


--
-- TOC entry 2133 (class 2606 OID 3270782)
-- Name: conf_programas conf_programas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_programas
    ADD CONSTRAINT conf_programas_pkey PRIMARY KEY (id_programa);


--
-- TOC entry 2135 (class 2606 OID 3270784)
-- Name: conf_sub_categoria conf_sub_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_sub_categoria
    ADD CONSTRAINT conf_sub_categoria_pkey PRIMARY KEY (id_sub_categoria);


--
-- TOC entry 2137 (class 2606 OID 3270786)
-- Name: conf_sub_sub_categoria conf_sub_sub_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_sub_sub_categoria
    ADD CONSTRAINT conf_sub_sub_categoria_pkey PRIMARY KEY (id_sub_sub_categoria);


--
-- TOC entry 2139 (class 2606 OID 3270788)
-- Name: conf_tipo_acceso conf_tipo_acceso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_tipo_acceso
    ADD CONSTRAINT conf_tipo_acceso_pkey PRIMARY KEY (id_tipo_acceso);


--
-- TOC entry 2141 (class 2606 OID 3270790)
-- Name: conf_tipo_docs conf_tipo_docs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_tipo_docs
    ADD CONSTRAINT conf_tipo_docs_pkey PRIMARY KEY (id_tipo_doc);


--
-- TOC entry 2143 (class 2606 OID 3270792)
-- Name: conf_tipo_estado conf_tipo_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_tipo_estado
    ADD CONSTRAINT conf_tipo_estado_pkey PRIMARY KEY (id_tipo_estado);


--
-- TOC entry 2145 (class 2606 OID 3270794)
-- Name: documento_categorias documento_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento_categorias
    ADD CONSTRAINT documento_categorias_pkey PRIMARY KEY (id_documento_categoria);


--
-- TOC entry 2149 (class 2606 OID 3270796)
-- Name: documentos_claves documentos_claves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_claves
    ADD CONSTRAINT documentos_claves_pkey PRIMARY KEY (id_doc_claves);


--
-- TOC entry 2147 (class 2606 OID 3270798)
-- Name: documentos documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_pkey PRIMARY KEY (id_documento);


--
-- TOC entry 2151 (class 2606 OID 3270800)
-- Name: documentos_relacion_exterior documentos_relacion_exterior_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_relacion_exterior
    ADD CONSTRAINT documentos_relacion_exterior_pkey PRIMARY KEY (id_doc_exterior);


--
-- TOC entry 2153 (class 2606 OID 3270802)
-- Name: estado_relacion estado_relacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_relacion
    ADD CONSTRAINT estado_relacion_pkey PRIMARY KEY (id_relacion);


--
-- TOC entry 2157 (class 2606 OID 3270804)
-- Name: notificaciones_claves notificaciones_claves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones_claves
    ADD CONSTRAINT notificaciones_claves_pkey PRIMARY KEY (id_notifi_calve);


--
-- TOC entry 2155 (class 2606 OID 3270806)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- TOC entry 2159 (class 2606 OID 3270808)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2170 (class 2606 OID 3270809)
-- Name: documentos Ref_00; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT "Ref_00" FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 2171 (class 2606 OID 3270814)
-- Name: documentos Ref_01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT "Ref_01" FOREIGN KEY (id_genera) REFERENCES public.conf_genera(id_genera);


--
-- TOC entry 2167 (class 2606 OID 3270819)
-- Name: conf_genera Ref_02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_genera
    ADD CONSTRAINT "Ref_02" FOREIGN KEY (id_dependencia) REFERENCES public.conf_dependencia(id_dependencia);


--
-- TOC entry 2184 (class 2606 OID 3270824)
-- Name: usuarios Ref_03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT "Ref_03" FOREIGN KEY (id_dependencia) REFERENCES public.conf_dependencia(id_dependencia);


--
-- TOC entry 2181 (class 2606 OID 3270829)
-- Name: notificaciones Ref_04; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT "Ref_04" FOREIGN KEY (id_genera) REFERENCES public.conf_genera(id_genera);


--
-- TOC entry 2165 (class 2606 OID 3270834)
-- Name: conf_dependencia_autoridades Ref_05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_dependencia_autoridades
    ADD CONSTRAINT "Ref_05" FOREIGN KEY (id_dependencia) REFERENCES public.conf_dependencia(id_dependencia);


--
-- TOC entry 2166 (class 2606 OID 3270839)
-- Name: conf_dependencia_autoridades Ref_06; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_dependencia_autoridades
    ADD CONSTRAINT "Ref_06" FOREIGN KEY (id_autoridad) REFERENCES public.conf_autoridades(id_autoridad);


--
-- TOC entry 2163 (class 2606 OID 3270844)
-- Name: conf_autoridades_tipo_docs Ref_07; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_autoridades_tipo_docs
    ADD CONSTRAINT "Ref_07" FOREIGN KEY (id_autoridad) REFERENCES public.conf_autoridades(id_autoridad);


--
-- TOC entry 2164 (class 2606 OID 3270849)
-- Name: conf_autoridades_tipo_docs Ref_08; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_autoridades_tipo_docs
    ADD CONSTRAINT "Ref_08" FOREIGN KEY (id_tipo_doc) REFERENCES public.conf_tipo_docs(id_tipo_doc);


--
-- TOC entry 2160 (class 2606 OID 3270854)
-- Name:  documentos_relacionados Ref_09; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." documentos_relacionados"
    ADD CONSTRAINT "Ref_09" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);


--
-- TOC entry 2161 (class 2606 OID 3270859)
-- Name:  documentos_relacionados Ref_10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." documentos_relacionados"
    ADD CONSTRAINT "Ref_10" FOREIGN KEY (id_relacion) REFERENCES public.estado_relacion(id_relacion);


--
-- TOC entry 2179 (class 2606 OID 3270864)
-- Name: documentos_relacion_exterior Ref_11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_relacion_exterior
    ADD CONSTRAINT "Ref_11" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);


--
-- TOC entry 2180 (class 2606 OID 3270869)
-- Name: documentos_relacion_exterior Ref_12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_relacion_exterior
    ADD CONSTRAINT "Ref_12" FOREIGN KEY (id_relacion) REFERENCES public.estado_relacion(id_relacion);


--
-- TOC entry 2162 (class 2606 OID 3270874)
-- Name: actualizada_derogada Ref_actualizada_derogada_to_documentos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actualizada_derogada
    ADD CONSTRAINT "Ref_actualizada_derogada_to_documentos" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);


--
-- TOC entry 2168 (class 2606 OID 3270879)
-- Name: conf_sub_categoria Ref_conf_sub_categoria_to_conf_categorias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_sub_categoria
    ADD CONSTRAINT "Ref_conf_sub_categoria_to_conf_categorias" FOREIGN KEY (id_categoria) REFERENCES public.conf_categorias(id_categoria);


--
-- TOC entry 2169 (class 2606 OID 3270884)
-- Name: documento_categorias Ref_documento_categorias_to_documentos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento_categorias
    ADD CONSTRAINT "Ref_documento_categorias_to_documentos" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);


--
-- TOC entry 2177 (class 2606 OID 3270889)
-- Name: documentos_claves Ref_documentos_claves_to_conf_calves; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_claves
    ADD CONSTRAINT "Ref_documentos_claves_to_conf_calves" FOREIGN KEY (id_clave) REFERENCES public.conf_calves(id_clave);


--
-- TOC entry 2178 (class 2606 OID 3270894)
-- Name: documentos_claves Ref_documentos_claves_to_documentos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_claves
    ADD CONSTRAINT "Ref_documentos_claves_to_documentos" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);


--
-- TOC entry 2182 (class 2606 OID 3270899)
-- Name: notificaciones_claves Ref_notificaciones_claves_to_conf_calves; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones_claves
    ADD CONSTRAINT "Ref_notificaciones_claves_to_conf_calves" FOREIGN KEY (id_clave) REFERENCES public.conf_calves(id_clave);


--
-- TOC entry 2183 (class 2606 OID 3270904)
-- Name: notificaciones_claves Ref_notificaciones_claves_to_notificaciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones_claves
    ADD CONSTRAINT "Ref_notificaciones_claves_to_notificaciones" FOREIGN KEY (id_notificacion) REFERENCES public.notificaciones(id_notificacion);


--
-- TOC entry 2172 (class 2606 OID 3270909)
-- Name: documentos documentos_to_conf_autoridades; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_autoridades FOREIGN KEY (id_autoridad) REFERENCES public.conf_autoridades(id_autoridad);


--
-- TOC entry 2173 (class 2606 OID 3270914)
-- Name: documentos documentos_to_conf_programas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_programas FOREIGN KEY (id_programa) REFERENCES public.conf_programas(id_programa);


--
-- TOC entry 2174 (class 2606 OID 3270919)
-- Name: documentos documentos_to_conf_tipo_acceso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_tipo_acceso FOREIGN KEY (id_tipo_acceso) REFERENCES public.conf_tipo_acceso(id_tipo_acceso);


--
-- TOC entry 2175 (class 2606 OID 3270924)
-- Name: documentos documentos_to_conf_tipo_docs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_tipo_docs FOREIGN KEY (id_tipo_doc) REFERENCES public.conf_tipo_docs(id_tipo_doc);


--
-- TOC entry 2176 (class 2606 OID 3270929)
-- Name: documentos documentos_to_conf_tipo_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_tipo_estado FOREIGN KEY (id_tipo_estado) REFERENCES public.conf_tipo_estado(id_tipo_estado);


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-03-02 10:54:57 -03

--
-- PostgreSQL database dump complete
--
