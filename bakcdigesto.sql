PGDMP                         y            cit_digesto    9.6.17    9.6.17 �    u	           0    0    ENCODING    ENCODING         SET client_encoding = 'LATIN1';
                       false            v	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            w	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            x	           1262    21076    cit_digesto    DATABASE     k   CREATE DATABASE cit_digesto WITH TEMPLATE = template0 ENCODING = 'LATIN1' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE cit_digesto;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            y	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            z	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    21077     documentos_relacionados    TABLE     !  CREATE TABLE public." documentos_relacionados" (
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
 .   DROP TABLE public." documentos_relacionados";
       public         postgres    false    3            �            1259    21080 .    documentos_relacionados_id_docum_relacion_seq    SEQUENCE     �   CREATE SEQUENCE public." documentos_relacionados_id_docum_relacion_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public." documentos_relacionados_id_docum_relacion_seq";
       public       postgres    false    185    3            {	           0    0 .    documentos_relacionados_id_docum_relacion_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public." documentos_relacionados_id_docum_relacion_seq" OWNED BY public." documentos_relacionados".id_docum_relacion;
            public       postgres    false    186            �            1259    21082 %   actualizada_derogada_id_actualiza_seq    SEQUENCE     �   CREATE SEQUENCE public.actualizada_derogada_id_actualiza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.actualizada_derogada_id_actualiza_seq;
       public       postgres    false    3            �            1259    21084    actualizada_derogada    TABLE     �   CREATE TABLE public.actualizada_derogada (
    id_actualiza bigint DEFAULT nextval('public.actualizada_derogada_id_actualiza_seq'::regclass) NOT NULL,
    observaciones integer,
    id_documento_actualiza bigint,
    id_documento bigint NOT NULL
);
 (   DROP TABLE public.actualizada_derogada;
       public         postgres    false    187    3            |	           0    0    TABLE actualizada_derogada    COMMENT     n   COMMENT ON TABLE public.actualizada_derogada IS 'guarda la informacion de que norma actualiza, deroga, etc.';
            public       postgres    false    188            }	           0    0 2   COLUMN actualizada_derogada.id_documento_actualiza    COMMENT     �   COMMENT ON COLUMN public.actualizada_derogada.id_documento_actualiza IS 'Guarda el ID del documento que se actualiza o deroga
';
            public       postgres    false    188            �            1259    21088 !   conf_autoridades_id_autoridad_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_autoridades_id_autoridad_seq
    START WITH 38
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.conf_autoridades_id_autoridad_seq;
       public       postgres    false    3            �            1259    21090    conf_autoridades    TABLE     �   CREATE TABLE public.conf_autoridades (
    id_autoridad integer DEFAULT nextval('public.conf_autoridades_id_autoridad_seq'::regclass) NOT NULL,
    autoridad character varying(255),
    codigo character varying(5)
);
 $   DROP TABLE public.conf_autoridades;
       public         postgres    false    189    3            �            1259    21094    conf_autoridades_tipo_docs    TABLE     �   CREATE TABLE public.conf_autoridades_tipo_docs (
    id_autoridad_tipo integer NOT NULL,
    id_autoridad integer NOT NULL,
    id_tipo_doc integer NOT NULL
);
 .   DROP TABLE public.conf_autoridades_tipo_docs;
       public         postgres    false    3            �            1259    21097 0   conf_autoridades_tipo_docs_id_autoridad_tipo_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq;
       public       postgres    false    3    191            ~	           0    0 0   conf_autoridades_tipo_docs_id_autoridad_tipo_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq OWNED BY public.conf_autoridades_tipo_docs.id_autoridad_tipo;
            public       postgres    false    192            �            1259    21099    conf_calves_id_clave_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_calves_id_clave_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.conf_calves_id_clave_seq;
       public       postgres    false    3            �            1259    21101    conf_calves    TABLE     �   CREATE TABLE public.conf_calves (
    id_clave bigint DEFAULT nextval('public.conf_calves_id_clave_seq'::regclass) NOT NULL,
    clave character varying(255)
);
    DROP TABLE public.conf_calves;
       public         postgres    false    193    3            	           0    0    TABLE conf_calves    COMMENT     U   COMMENT ON TABLE public.conf_calves IS 'Palabras Claves para utilizar en documento';
            public       postgres    false    194            �            1259    21105     conf_categorias_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_categorias_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.conf_categorias_id_categoria_seq;
       public       postgres    false    3            �            1259    21107    conf_categorias    TABLE     �   CREATE TABLE public.conf_categorias (
    id_categoria integer DEFAULT nextval('public.conf_categorias_id_categoria_seq'::regclass) NOT NULL,
    descripcion character varying(255),
    activa smallint DEFAULT 1
);
 #   DROP TABLE public.conf_categorias;
       public         postgres    false    195    3            �	           0    0    TABLE conf_categorias    COMMENT     C   COMMENT ON TABLE public.conf_categorias IS 'categoria principal
';
            public       postgres    false    196            �            1259    21112 #   conf_dependencia_id_dependencia_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_dependencia_id_dependencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.conf_dependencia_id_dependencia_seq;
       public       postgres    false    3            �            1259    21114    conf_dependencia    TABLE     �   CREATE TABLE public.conf_dependencia (
    id_dependencia integer DEFAULT nextval('public.conf_dependencia_id_dependencia_seq'::regclass) NOT NULL,
    dependencia text,
    denominacion text,
    activa smallint DEFAULT 1
);
 $   DROP TABLE public.conf_dependencia;
       public         postgres    false    197    3            �            1259    21122    conf_dependencia_autoridades    TABLE     �   CREATE TABLE public.conf_dependencia_autoridades (
    id_depen_autoridad integer NOT NULL,
    id_dependencia integer NOT NULL,
    id_autoridad integer NOT NULL
);
 0   DROP TABLE public.conf_dependencia_autoridades;
       public         postgres    false    3            �            1259    21125 3   conf_dependencia_autoridades_id_depen_autoridad_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_dependencia_autoridades_id_depen_autoridad_seq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.conf_dependencia_autoridades_id_depen_autoridad_seq;
       public       postgres    false    199    3            �	           0    0 3   conf_dependencia_autoridades_id_depen_autoridad_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.conf_dependencia_autoridades_id_depen_autoridad_seq OWNED BY public.conf_dependencia_autoridades.id_depen_autoridad;
            public       postgres    false    200            �            1259    21127    conf_genera    TABLE     �   CREATE TABLE public.conf_genera (
    id_genera integer NOT NULL,
    genera character varying(255),
    id_dependencia integer
);
    DROP TABLE public.conf_genera;
       public         postgres    false    3            �            1259    21130    conf_genera_id_genera_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_genera_id_genera_seq
    START WITH 59
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.conf_genera_id_genera_seq;
       public       postgres    false    3    201            �	           0    0    conf_genera_id_genera_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.conf_genera_id_genera_seq OWNED BY public.conf_genera.id_genera;
            public       postgres    false    202            �            1259    21132    conf_programas_id_programa_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_programas_id_programa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.conf_programas_id_programa_seq;
       public       postgres    false    3            �            1259    21134    conf_programas    TABLE     �   CREATE TABLE public.conf_programas (
    id_programa integer DEFAULT nextval('public.conf_programas_id_programa_seq'::regclass) NOT NULL,
    programa character varying(255)
);
 "   DROP TABLE public.conf_programas;
       public         postgres    false    203    3            �            1259    21138 '   conf_sub_categoria_id_sub_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_sub_categoria_id_sub_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.conf_sub_categoria_id_sub_categoria_seq;
       public       postgres    false    3            �            1259    21140    conf_sub_categoria    TABLE     �   CREATE TABLE public.conf_sub_categoria (
    id_sub_categoria integer DEFAULT nextval('public.conf_sub_categoria_id_sub_categoria_seq'::regclass) NOT NULL,
    descripcion character varying(255),
    id_categoria integer,
    activa smallint DEFAULT 1
);
 &   DROP TABLE public.conf_sub_categoria;
       public         postgres    false    205    3            �	           0    0    TABLE conf_sub_categoria    COMMENT     ?   COMMENT ON TABLE public.conf_sub_categoria IS 'subcategorias';
            public       postgres    false    206            �            1259    21145 /   conf_sub_sub_categoria_id_sub_sub_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_sub_sub_categoria_id_sub_sub_categoria_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.conf_sub_sub_categoria_id_sub_sub_categoria_seq;
       public       postgres    false    3            �            1259    21147    conf_sub_sub_categoria    TABLE     �   CREATE TABLE public.conf_sub_sub_categoria (
    id_sub_sub_categoria bigint DEFAULT nextval('public.conf_sub_sub_categoria_id_sub_sub_categoria_seq'::regclass) NOT NULL,
    descripcion character varying(255),
    id_sub_categoria integer NOT NULL
);
 *   DROP TABLE public.conf_sub_sub_categoria;
       public         postgres    false    207    3            �            1259    21151 #   conf_tipo_acceso_id_tipo_acceso_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_tipo_acceso_id_tipo_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.conf_tipo_acceso_id_tipo_acceso_seq;
       public       postgres    false    3            �            1259    21153    conf_tipo_acceso    TABLE     �   CREATE TABLE public.conf_tipo_acceso (
    id_tipo_acceso integer DEFAULT nextval('public.conf_tipo_acceso_id_tipo_acceso_seq'::regclass) NOT NULL,
    acceso character varying(100)
);
 $   DROP TABLE public.conf_tipo_acceso;
       public         postgres    false    209    3            �	           0    0    TABLE conf_tipo_acceso    COMMENT     g   COMMENT ON TABLE public.conf_tipo_acceso IS 'si es privada o publica, esto es si es el digesto o no
';
            public       postgres    false    210            �            1259    21157    conf_tipo_docs_id_tipo_doc_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_tipo_docs_id_tipo_doc_seq
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.conf_tipo_docs_id_tipo_doc_seq;
       public       postgres    false    3            �            1259    21159    conf_tipo_docs    TABLE     �   CREATE TABLE public.conf_tipo_docs (
    id_tipo_doc integer DEFAULT nextval('public.conf_tipo_docs_id_tipo_doc_seq'::regclass) NOT NULL,
    documento character varying(255),
    codigo character varying(5)
);
 "   DROP TABLE public.conf_tipo_docs;
       public         postgres    false    211    3            �            1259    21163 #   conf_tipo_estado_id_tipo_estado_seq    SEQUENCE     �   CREATE SEQUENCE public.conf_tipo_estado_id_tipo_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.conf_tipo_estado_id_tipo_estado_seq;
       public       postgres    false    3            �            1259    21165    conf_tipo_estado    TABLE     �   CREATE TABLE public.conf_tipo_estado (
    id_tipo_estado integer DEFAULT nextval('public.conf_tipo_estado_id_tipo_estado_seq'::regclass) NOT NULL,
    estado character varying(255)
);
 $   DROP TABLE public.conf_tipo_estado;
       public         postgres    false    213    3            �	           0    0    TABLE conf_tipo_estado    COMMENT     F   COMMENT ON TABLE public.conf_tipo_estado IS 'vigente, derogada, etc';
            public       postgres    false    214            �            1259    21169 /   documento_categorias_id_documento_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.documento_categorias_id_documento_categoria_seq
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.documento_categorias_id_documento_categoria_seq;
       public       postgres    false    3            �            1259    21171    documento_categorias    TABLE       CREATE TABLE public.documento_categorias (
    id_documento_categoria bigint DEFAULT nextval('public.documento_categorias_id_documento_categoria_seq'::regclass) NOT NULL,
    id_documento bigint NOT NULL,
    id_categoria integer NOT NULL,
    id_sub_categoria integer NOT NULL
);
 (   DROP TABLE public.documento_categorias;
       public         postgres    false    215    3            �            1259    21175    documentos_id_documento_seq    SEQUENCE     �   CREATE SEQUENCE public.documentos_id_documento_seq
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.documentos_id_documento_seq;
       public       postgres    false    3            �            1259    21177 
   documentos    TABLE     �  CREATE TABLE public.documentos (
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
    DROP TABLE public.documentos;
       public         postgres    false    217    3            �	           0    0 !   COLUMN documentos.estado_por_cual    COMMENT     �   COMMENT ON COLUMN public.documentos.estado_por_cual IS 'contiene las normas, ordenanzas, etc, si la que se esta cargando o modificando ha sido derogada, actualizada, etc
';
            public       postgres    false    218            �	           0    0     COLUMN documentos.dep_aplicacion    COMMENT     R   COMMENT ON COLUMN public.documentos.dep_aplicacion IS 'dpendencia de aplicacion';
            public       postgres    false    218            �	           0    0    COLUMN documentos.id_genera    COMMENT     K   COMMENT ON COLUMN public.documentos.id_genera IS 'dependencia que genera';
            public       postgres    false    218            �	           0    0    COLUMN documentos.normas_rel    COMMENT     U   COMMENT ON COLUMN public.documentos.normas_rel IS 'guarda las normas relacionadas
';
            public       postgres    false    218            �	           0    0    COLUMN documentos.res_rector    COMMENT     l   COMMENT ON COLUMN public.documentos.res_rector IS 'Ad.referendum o modificada son las dos unicas opciones';
            public       postgres    false    218            �	           0    0 #   COLUMN documentos.res_rector_normas    COMMENT     �   COMMENT ON COLUMN public.documentos.res_rector_normas IS 'Contiene las normas de rector cuando se ha seleccionado Ad-Referendum o Modificada
';
            public       postgres    false    218            �            1259    21185 #   documentos_claves_id_doc_claves_seq    SEQUENCE     �   CREATE SEQUENCE public.documentos_claves_id_doc_claves_seq
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.documentos_claves_id_doc_claves_seq;
       public       postgres    false    3            �            1259    21187    documentos_claves    TABLE     �   CREATE TABLE public.documentos_claves (
    id_doc_claves bigint DEFAULT nextval('public.documentos_claves_id_doc_claves_seq'::regclass) NOT NULL,
    id_clave bigint NOT NULL,
    id_documento bigint NOT NULL
);
 %   DROP TABLE public.documentos_claves;
       public         postgres    false    219    3            �	           0    0    TABLE documentos_claves    COMMENT     �   COMMENT ON TABLE public.documentos_claves IS 'guarda las claves que se han seleccionado, esto es para poder hacer un digesto de palabras comunes.

Relacion 1:N';
            public       postgres    false    220            �            1259    21191    documentos_relacion_exterior    TABLE       CREATE TABLE public.documentos_relacion_exterior (
    id_doc_exterior integer NOT NULL,
    id_documento integer,
    id_tipo_doc integer,
    numero integer,
    fecha integer,
    id_relacion integer,
    observaciones character varying(250),
    documento_ext bytea
);
 0   DROP TABLE public.documentos_relacion_exterior;
       public         postgres    false    3            �            1259    21197 0   documentos_relacion_exterior_id_doc_exterior_seq    SEQUENCE     �   CREATE SEQUENCE public.documentos_relacion_exterior_id_doc_exterior_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.documentos_relacion_exterior_id_doc_exterior_seq;
       public       postgres    false    3    221            �	           0    0 0   documentos_relacion_exterior_id_doc_exterior_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.documentos_relacion_exterior_id_doc_exterior_seq OWNED BY public.documentos_relacion_exterior.id_doc_exterior;
            public       postgres    false    222            �            1259    21199    estado_relacion    TABLE     j   CREATE TABLE public.estado_relacion (
    id_relacion integer NOT NULL,
    relacion character varying
);
 #   DROP TABLE public.estado_relacion;
       public         postgres    false    3            �            1259    21205    estado_relacion_id_relacion_seq    SEQUENCE     �   CREATE SEQUENCE public.estado_relacion_id_relacion_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estado_relacion_id_relacion_seq;
       public       postgres    false    3    223            �	           0    0    estado_relacion_id_relacion_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estado_relacion_id_relacion_seq OWNED BY public.estado_relacion.id_relacion;
            public       postgres    false    224            �            1259    21207    notificaciones    TABLE     �   CREATE TABLE public.notificaciones (
    id_notificacion integer NOT NULL,
    nombres character varying(255),
    correo1 character varying(200),
    tel character varying(50),
    id_genera integer NOT NULL
);
 "   DROP TABLE public.notificaciones;
       public         postgres    true    3            �            1259    21210    notificaciones_claves    TABLE     �   CREATE TABLE public.notificaciones_claves (
    id_notifi_calve integer NOT NULL,
    id_clave bigint NOT NULL,
    id_notificacion integer NOT NULL
);
 )   DROP TABLE public.notificaciones_claves;
       public         postgres    true    3            �            1259    21213 )   notificaciones_claves_id_notifi_calve_seq    SEQUENCE     �   CREATE SEQUENCE public.notificaciones_claves_id_notifi_calve_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.notificaciones_claves_id_notifi_calve_seq;
       public       postgres    false    3    226            �	           0    0 )   notificaciones_claves_id_notifi_calve_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.notificaciones_claves_id_notifi_calve_seq OWNED BY public.notificaciones_claves.id_notifi_calve;
            public       postgres    false    227            �            1259    21215 "   notificaciones_id_notificacion_seq    SEQUENCE     �   CREATE SEQUENCE public.notificaciones_id_notificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.notificaciones_id_notificacion_seq;
       public       postgres    false    3    225            �	           0    0 "   notificaciones_id_notificacion_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.notificaciones_id_notificacion_seq OWNED BY public.notificaciones.id_notificacion;
            public       postgres    false    228            �            1259    21217    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(255),
    apellido character varying(255),
    nro_documento integer,
    id_toba character varying(100),
    id_dependencia integer
);
    DROP TABLE public.usuarios;
       public         postgres    false    3            �            1259    21220    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public       postgres    false    229    3            �	           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
            public       postgres    false    230            Y           2604    21222 *    documentos_relacionados id_docum_relacion    DEFAULT     �   ALTER TABLE ONLY public." documentos_relacionados" ALTER COLUMN id_docum_relacion SET DEFAULT nextval('public." documentos_relacionados_id_docum_relacion_seq"'::regclass);
 [   ALTER TABLE public." documentos_relacionados" ALTER COLUMN id_docum_relacion DROP DEFAULT;
       public       postgres    false    186    185            \           2604    21223 ,   conf_autoridades_tipo_docs id_autoridad_tipo    DEFAULT     �   ALTER TABLE ONLY public.conf_autoridades_tipo_docs ALTER COLUMN id_autoridad_tipo SET DEFAULT nextval('public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq'::regclass);
 [   ALTER TABLE public.conf_autoridades_tipo_docs ALTER COLUMN id_autoridad_tipo DROP DEFAULT;
       public       postgres    false    192    191            b           2604    21224 /   conf_dependencia_autoridades id_depen_autoridad    DEFAULT     �   ALTER TABLE ONLY public.conf_dependencia_autoridades ALTER COLUMN id_depen_autoridad SET DEFAULT nextval('public.conf_dependencia_autoridades_id_depen_autoridad_seq'::regclass);
 ^   ALTER TABLE public.conf_dependencia_autoridades ALTER COLUMN id_depen_autoridad DROP DEFAULT;
       public       postgres    false    200    199            c           2604    21225    conf_genera id_genera    DEFAULT     ~   ALTER TABLE ONLY public.conf_genera ALTER COLUMN id_genera SET DEFAULT nextval('public.conf_genera_id_genera_seq'::regclass);
 D   ALTER TABLE public.conf_genera ALTER COLUMN id_genera DROP DEFAULT;
       public       postgres    false    202    201            o           2604    21226 ,   documentos_relacion_exterior id_doc_exterior    DEFAULT     �   ALTER TABLE ONLY public.documentos_relacion_exterior ALTER COLUMN id_doc_exterior SET DEFAULT nextval('public.documentos_relacion_exterior_id_doc_exterior_seq'::regclass);
 [   ALTER TABLE public.documentos_relacion_exterior ALTER COLUMN id_doc_exterior DROP DEFAULT;
       public       postgres    false    222    221            p           2604    21227    estado_relacion id_relacion    DEFAULT     �   ALTER TABLE ONLY public.estado_relacion ALTER COLUMN id_relacion SET DEFAULT nextval('public.estado_relacion_id_relacion_seq'::regclass);
 J   ALTER TABLE public.estado_relacion ALTER COLUMN id_relacion DROP DEFAULT;
       public       postgres    false    224    223            q           2604    21228    notificaciones id_notificacion    DEFAULT     �   ALTER TABLE ONLY public.notificaciones ALTER COLUMN id_notificacion SET DEFAULT nextval('public.notificaciones_id_notificacion_seq'::regclass);
 M   ALTER TABLE public.notificaciones ALTER COLUMN id_notificacion DROP DEFAULT;
       public       postgres    false    228    225            r           2604    21229 %   notificaciones_claves id_notifi_calve    DEFAULT     �   ALTER TABLE ONLY public.notificaciones_claves ALTER COLUMN id_notifi_calve SET DEFAULT nextval('public.notificaciones_claves_id_notifi_calve_seq'::regclass);
 T   ALTER TABLE public.notificaciones_claves ALTER COLUMN id_notifi_calve DROP DEFAULT;
       public       postgres    false    227    226            s           2604    21230    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public       postgres    false    230    229            ^	           2613    6367665    6367665    BLOB     (   SELECT pg_catalog.lo_create('6367665');
 (   SELECT pg_catalog.lo_unlink('6367665');
             postgres    false            _	           2613    6367666    6367666    BLOB     (   SELECT pg_catalog.lo_create('6367666');
 (   SELECT pg_catalog.lo_unlink('6367666');
             postgres    false            `	           2613    6367667    6367667    BLOB     (   SELECT pg_catalog.lo_create('6367667');
 (   SELECT pg_catalog.lo_unlink('6367667');
             postgres    false            a	           2613    6367668    6367668    BLOB     (   SELECT pg_catalog.lo_create('6367668');
 (   SELECT pg_catalog.lo_unlink('6367668');
             postgres    false            b	           2613    6367669    6367669    BLOB     (   SELECT pg_catalog.lo_create('6367669');
 (   SELECT pg_catalog.lo_unlink('6367669');
             postgres    false            c	           2613    6367694    6367694    BLOB     (   SELECT pg_catalog.lo_create('6367694');
 (   SELECT pg_catalog.lo_unlink('6367694');
             postgres    false            d	           2613    6367695    6367695    BLOB     (   SELECT pg_catalog.lo_create('6367695');
 (   SELECT pg_catalog.lo_unlink('6367695');
             postgres    false            e	           2613    6367696    6367696    BLOB     (   SELECT pg_catalog.lo_create('6367696');
 (   SELECT pg_catalog.lo_unlink('6367696');
             postgres    false            f	           2613    6367697    6367697    BLOB     (   SELECT pg_catalog.lo_create('6367697');
 (   SELECT pg_catalog.lo_unlink('6367697');
             postgres    false            g	           2613    6367698    6367698    BLOB     (   SELECT pg_catalog.lo_create('6367698');
 (   SELECT pg_catalog.lo_unlink('6367698');
             postgres    false            h	           2613    6367699    6367699    BLOB     (   SELECT pg_catalog.lo_create('6367699');
 (   SELECT pg_catalog.lo_unlink('6367699');
             postgres    false            i	           2613    6367700    6367700    BLOB     (   SELECT pg_catalog.lo_create('6367700');
 (   SELECT pg_catalog.lo_unlink('6367700');
             postgres    false            j	           2613    6367701    6367701    BLOB     (   SELECT pg_catalog.lo_create('6367701');
 (   SELECT pg_catalog.lo_unlink('6367701');
             postgres    false            k	           2613    6367702    6367702    BLOB     (   SELECT pg_catalog.lo_create('6367702');
 (   SELECT pg_catalog.lo_unlink('6367702');
             postgres    false            l	           2613    6367703    6367703    BLOB     (   SELECT pg_catalog.lo_create('6367703');
 (   SELECT pg_catalog.lo_unlink('6367703');
             postgres    false            m	           2613    6367704    6367704    BLOB     (   SELECT pg_catalog.lo_create('6367704');
 (   SELECT pg_catalog.lo_unlink('6367704');
             postgres    false            n	           2613    6367705    6367705    BLOB     (   SELECT pg_catalog.lo_create('6367705');
 (   SELECT pg_catalog.lo_unlink('6367705');
             postgres    false            o	           2613    6367706    6367706    BLOB     (   SELECT pg_catalog.lo_create('6367706');
 (   SELECT pg_catalog.lo_unlink('6367706');
             postgres    false            p	           2613    6367707    6367707    BLOB     (   SELECT pg_catalog.lo_create('6367707');
 (   SELECT pg_catalog.lo_unlink('6367707');
             postgres    false            q	           2613    6367708    6367708    BLOB     (   SELECT pg_catalog.lo_create('6367708');
 (   SELECT pg_catalog.lo_unlink('6367708');
             postgres    false            0	          0    21077     documentos_relacionados 
   TABLE DATA               �   COPY public." documentos_relacionados" (id_docum_relacion, id_documento, id_tipo_doc, id_autoridad, numero, fecha, id_relacion, observaciones, anio) FROM stdin;
    public       postgres    false    185   ��       �	           0    0 .    documentos_relacionados_id_docum_relacion_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public." documentos_relacionados_id_docum_relacion_seq"', 1, false);
            public       postgres    false    186            3	          0    21084    actualizada_derogada 
   TABLE DATA               q   COPY public.actualizada_derogada (id_actualiza, observaciones, id_documento_actualiza, id_documento) FROM stdin;
    public       postgres    false    188   ��       �	           0    0 %   actualizada_derogada_id_actualiza_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.actualizada_derogada_id_actualiza_seq', 1, false);
            public       postgres    false    187            5	          0    21090    conf_autoridades 
   TABLE DATA               K   COPY public.conf_autoridades (id_autoridad, autoridad, codigo) FROM stdin;
    public       postgres    false    190   �       �	           0    0 !   conf_autoridades_id_autoridad_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.conf_autoridades_id_autoridad_seq', 38, true);
            public       postgres    false    189            6	          0    21094    conf_autoridades_tipo_docs 
   TABLE DATA               b   COPY public.conf_autoridades_tipo_docs (id_autoridad_tipo, id_autoridad, id_tipo_doc) FROM stdin;
    public       postgres    false    191   \�       �	           0    0 0   conf_autoridades_tipo_docs_id_autoridad_tipo_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.conf_autoridades_tipo_docs_id_autoridad_tipo_seq', 17, true);
            public       postgres    false    192            9	          0    21101    conf_calves 
   TABLE DATA               6   COPY public.conf_calves (id_clave, clave) FROM stdin;
    public       postgres    false    194   ��       �	           0    0    conf_calves_id_clave_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.conf_calves_id_clave_seq', 2, true);
            public       postgres    false    193            ;	          0    21107    conf_categorias 
   TABLE DATA               L   COPY public.conf_categorias (id_categoria, descripcion, activa) FROM stdin;
    public       postgres    false    196   ��       �	           0    0     conf_categorias_id_categoria_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.conf_categorias_id_categoria_seq', 48, true);
            public       postgres    false    195            =	          0    21114    conf_dependencia 
   TABLE DATA               ]   COPY public.conf_dependencia (id_dependencia, dependencia, denominacion, activa) FROM stdin;
    public       postgres    false    198   ��       >	          0    21122    conf_dependencia_autoridades 
   TABLE DATA               h   COPY public.conf_dependencia_autoridades (id_depen_autoridad, id_dependencia, id_autoridad) FROM stdin;
    public       postgres    false    199   H�       �	           0    0 3   conf_dependencia_autoridades_id_depen_autoridad_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.conf_dependencia_autoridades_id_depen_autoridad_seq', 13, true);
            public       postgres    false    200            �	           0    0 #   conf_dependencia_id_dependencia_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.conf_dependencia_id_dependencia_seq', 25, true);
            public       postgres    false    197            @	          0    21127    conf_genera 
   TABLE DATA               H   COPY public.conf_genera (id_genera, genera, id_dependencia) FROM stdin;
    public       postgres    false    201   s�       �	           0    0    conf_genera_id_genera_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.conf_genera_id_genera_seq', 59, true);
            public       postgres    false    202            C	          0    21134    conf_programas 
   TABLE DATA               ?   COPY public.conf_programas (id_programa, programa) FROM stdin;
    public       postgres    false    204   ��       �	           0    0    conf_programas_id_programa_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.conf_programas_id_programa_seq', 1, false);
            public       postgres    false    203            E	          0    21140    conf_sub_categoria 
   TABLE DATA               a   COPY public.conf_sub_categoria (id_sub_categoria, descripcion, id_categoria, activa) FROM stdin;
    public       postgres    false    206   ��       �	           0    0 '   conf_sub_categoria_id_sub_categoria_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.conf_sub_categoria_id_sub_categoria_seq', 180, true);
            public       postgres    false    205            G	          0    21147    conf_sub_sub_categoria 
   TABLE DATA               e   COPY public.conf_sub_sub_categoria (id_sub_sub_categoria, descripcion, id_sub_categoria) FROM stdin;
    public       postgres    false    208   ��       �	           0    0 /   conf_sub_sub_categoria_id_sub_sub_categoria_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.conf_sub_sub_categoria_id_sub_sub_categoria_seq', 7, true);
            public       postgres    false    207            I	          0    21153    conf_tipo_acceso 
   TABLE DATA               B   COPY public.conf_tipo_acceso (id_tipo_acceso, acceso) FROM stdin;
    public       postgres    false    210   ��       �	           0    0 #   conf_tipo_acceso_id_tipo_acceso_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.conf_tipo_acceso_id_tipo_acceso_seq', 1, false);
            public       postgres    false    209            K	          0    21159    conf_tipo_docs 
   TABLE DATA               H   COPY public.conf_tipo_docs (id_tipo_doc, documento, codigo) FROM stdin;
    public       postgres    false    212   <       �	           0    0    conf_tipo_docs_id_tipo_doc_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.conf_tipo_docs_id_tipo_doc_seq', 12, true);
            public       postgres    false    211            M	          0    21165    conf_tipo_estado 
   TABLE DATA               B   COPY public.conf_tipo_estado (id_tipo_estado, estado) FROM stdin;
    public       postgres    false    214   �       �	           0    0 #   conf_tipo_estado_id_tipo_estado_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.conf_tipo_estado_id_tipo_estado_seq', 1, false);
            public       postgres    false    213            O	          0    21171    documento_categorias 
   TABLE DATA               t   COPY public.documento_categorias (id_documento_categoria, id_documento, id_categoria, id_sub_categoria) FROM stdin;
    public       postgres    false    216   �       �	           0    0 /   documento_categorias_id_documento_categoria_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.documento_categorias_id_documento_categoria_seq', 23, true);
            public       postgres    false    215            Q	          0    21177 
   documentos 
   TABLE DATA               �  COPY public.documentos (id_documento, id_tipo_doc, id_autoridad, numero, fecha, anio, id_tipo_estado, estado_por_cual, cudap, dep_aplicacion, id_genera, normas_rel, id_programa, referencia, archivo, res_rector, res_rector_normas, id_tipo_acceso, usuario_registra, fecha_registra, hora_registra, id_usuario, dep_genera, tipo_dependencia, dependencia, archivo_doc, archivo_nombre, ad_referendum, correos_destino) FROM stdin;
    public       postgres    false    218   �       S	          0    21187    documentos_claves 
   TABLE DATA               R   COPY public.documentos_claves (id_doc_claves, id_clave, id_documento) FROM stdin;
    public       postgres    false    220         �	           0    0 #   documentos_claves_id_doc_claves_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.documentos_claves_id_doc_claves_seq', 11, true);
            public       postgres    false    219            �	           0    0    documentos_id_documento_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.documentos_id_documento_seq', 23, true);
            public       postgres    false    217            T	          0    21191    documentos_relacion_exterior 
   TABLE DATA               �   COPY public.documentos_relacion_exterior (id_doc_exterior, id_documento, id_tipo_doc, numero, fecha, id_relacion, observaciones, documento_ext) FROM stdin;
    public       postgres    false    221   )      �	           0    0 0   documentos_relacion_exterior_id_doc_exterior_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.documentos_relacion_exterior_id_doc_exterior_seq', 1, false);
            public       postgres    false    222            V	          0    21199    estado_relacion 
   TABLE DATA               @   COPY public.estado_relacion (id_relacion, relacion) FROM stdin;
    public       postgres    false    223   F      �	           0    0    estado_relacion_id_relacion_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.estado_relacion_id_relacion_seq', 3, true);
            public       postgres    false    224            X	          0    21207    notificaciones 
   TABLE DATA               [   COPY public.notificaciones (id_notificacion, nombres, correo1, tel, id_genera) FROM stdin;
    public       postgres    false    225   c      Y	          0    21210    notificaciones_claves 
   TABLE DATA               [   COPY public.notificaciones_claves (id_notifi_calve, id_clave, id_notificacion) FROM stdin;
    public       postgres    false    226   �      �	           0    0 )   notificaciones_claves_id_notifi_calve_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.notificaciones_claves_id_notifi_calve_seq', 1, false);
            public       postgres    false    227            �	           0    0 "   notificaciones_id_notificacion_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.notificaciones_id_notificacion_seq', 1, false);
            public       postgres    false    228            \	          0    21217    usuarios 
   TABLE DATA               h   COPY public.usuarios (id_usuario, nombre, apellido, nro_documento, id_toba, id_dependencia) FROM stdin;
    public       postgres    false    229   �      �	           0    0    usuarios_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 7, true);
            public       postgres    false    230            r	          0    0    BLOBS    BLOBS                                false   �      u           2606    21232 6    documentos_relacionados  documentos_relacionados_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public." documentos_relacionados"
    ADD CONSTRAINT " documentos_relacionados_pkey" PRIMARY KEY (id_docum_relacion);
 d   ALTER TABLE ONLY public." documentos_relacionados" DROP CONSTRAINT " documentos_relacionados_pkey";
       public         postgres    false    185    185            w           2606    21234 .   actualizada_derogada actualizada_derogada_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.actualizada_derogada
    ADD CONSTRAINT actualizada_derogada_pkey PRIMARY KEY (id_actualiza);
 X   ALTER TABLE ONLY public.actualizada_derogada DROP CONSTRAINT actualizada_derogada_pkey;
       public         postgres    false    188    188            y           2606    21236 &   conf_autoridades conf_autoridades_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.conf_autoridades
    ADD CONSTRAINT conf_autoridades_pkey PRIMARY KEY (id_autoridad);
 P   ALTER TABLE ONLY public.conf_autoridades DROP CONSTRAINT conf_autoridades_pkey;
       public         postgres    false    190    190            {           2606    21238 :   conf_autoridades_tipo_docs conf_autoridades_tipo_docs_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.conf_autoridades_tipo_docs
    ADD CONSTRAINT conf_autoridades_tipo_docs_pkey PRIMARY KEY (id_autoridad_tipo);
 d   ALTER TABLE ONLY public.conf_autoridades_tipo_docs DROP CONSTRAINT conf_autoridades_tipo_docs_pkey;
       public         postgres    false    191    191            }           2606    21240    conf_calves conf_calves_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.conf_calves
    ADD CONSTRAINT conf_calves_pkey PRIMARY KEY (id_clave);
 F   ALTER TABLE ONLY public.conf_calves DROP CONSTRAINT conf_calves_pkey;
       public         postgres    false    194    194                       2606    21242 $   conf_categorias conf_categorias_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.conf_categorias
    ADD CONSTRAINT conf_categorias_pkey PRIMARY KEY (id_categoria);
 N   ALTER TABLE ONLY public.conf_categorias DROP CONSTRAINT conf_categorias_pkey;
       public         postgres    false    196    196            �           2606    21244 >   conf_dependencia_autoridades conf_dependencia_autoridades_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.conf_dependencia_autoridades
    ADD CONSTRAINT conf_dependencia_autoridades_pkey PRIMARY KEY (id_depen_autoridad);
 h   ALTER TABLE ONLY public.conf_dependencia_autoridades DROP CONSTRAINT conf_dependencia_autoridades_pkey;
       public         postgres    false    199    199            �           2606    21246 &   conf_dependencia conf_dependencia_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.conf_dependencia
    ADD CONSTRAINT conf_dependencia_pkey PRIMARY KEY (id_dependencia);
 P   ALTER TABLE ONLY public.conf_dependencia DROP CONSTRAINT conf_dependencia_pkey;
       public         postgres    false    198    198            �           2606    21248    conf_genera conf_genera_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.conf_genera
    ADD CONSTRAINT conf_genera_pkey PRIMARY KEY (id_genera);
 F   ALTER TABLE ONLY public.conf_genera DROP CONSTRAINT conf_genera_pkey;
       public         postgres    false    201    201            �           2606    21250 "   conf_programas conf_programas_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.conf_programas
    ADD CONSTRAINT conf_programas_pkey PRIMARY KEY (id_programa);
 L   ALTER TABLE ONLY public.conf_programas DROP CONSTRAINT conf_programas_pkey;
       public         postgres    false    204    204            �           2606    21252 *   conf_sub_categoria conf_sub_categoria_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.conf_sub_categoria
    ADD CONSTRAINT conf_sub_categoria_pkey PRIMARY KEY (id_sub_categoria);
 T   ALTER TABLE ONLY public.conf_sub_categoria DROP CONSTRAINT conf_sub_categoria_pkey;
       public         postgres    false    206    206            �           2606    21254 2   conf_sub_sub_categoria conf_sub_sub_categoria_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.conf_sub_sub_categoria
    ADD CONSTRAINT conf_sub_sub_categoria_pkey PRIMARY KEY (id_sub_sub_categoria);
 \   ALTER TABLE ONLY public.conf_sub_sub_categoria DROP CONSTRAINT conf_sub_sub_categoria_pkey;
       public         postgres    false    208    208            �           2606    21256 &   conf_tipo_acceso conf_tipo_acceso_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.conf_tipo_acceso
    ADD CONSTRAINT conf_tipo_acceso_pkey PRIMARY KEY (id_tipo_acceso);
 P   ALTER TABLE ONLY public.conf_tipo_acceso DROP CONSTRAINT conf_tipo_acceso_pkey;
       public         postgres    false    210    210            �           2606    21258 "   conf_tipo_docs conf_tipo_docs_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.conf_tipo_docs
    ADD CONSTRAINT conf_tipo_docs_pkey PRIMARY KEY (id_tipo_doc);
 L   ALTER TABLE ONLY public.conf_tipo_docs DROP CONSTRAINT conf_tipo_docs_pkey;
       public         postgres    false    212    212            �           2606    21260 &   conf_tipo_estado conf_tipo_estado_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.conf_tipo_estado
    ADD CONSTRAINT conf_tipo_estado_pkey PRIMARY KEY (id_tipo_estado);
 P   ALTER TABLE ONLY public.conf_tipo_estado DROP CONSTRAINT conf_tipo_estado_pkey;
       public         postgres    false    214    214            �           2606    21262 .   documento_categorias documento_categorias_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.documento_categorias
    ADD CONSTRAINT documento_categorias_pkey PRIMARY KEY (id_documento_categoria);
 X   ALTER TABLE ONLY public.documento_categorias DROP CONSTRAINT documento_categorias_pkey;
       public         postgres    false    216    216            �           2606    21264 (   documentos_claves documentos_claves_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.documentos_claves
    ADD CONSTRAINT documentos_claves_pkey PRIMARY KEY (id_doc_claves);
 R   ALTER TABLE ONLY public.documentos_claves DROP CONSTRAINT documentos_claves_pkey;
       public         postgres    false    220    220            �           2606    21266    documentos documentos_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_pkey PRIMARY KEY (id_documento);
 D   ALTER TABLE ONLY public.documentos DROP CONSTRAINT documentos_pkey;
       public         postgres    false    218    218            �           2606    21268 >   documentos_relacion_exterior documentos_relacion_exterior_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.documentos_relacion_exterior
    ADD CONSTRAINT documentos_relacion_exterior_pkey PRIMARY KEY (id_doc_exterior);
 h   ALTER TABLE ONLY public.documentos_relacion_exterior DROP CONSTRAINT documentos_relacion_exterior_pkey;
       public         postgres    false    221    221            �           2606    21270 $   estado_relacion estado_relacion_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estado_relacion
    ADD CONSTRAINT estado_relacion_pkey PRIMARY KEY (id_relacion);
 N   ALTER TABLE ONLY public.estado_relacion DROP CONSTRAINT estado_relacion_pkey;
       public         postgres    false    223    223            �           2606    21272 0   notificaciones_claves notificaciones_claves_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.notificaciones_claves
    ADD CONSTRAINT notificaciones_claves_pkey PRIMARY KEY (id_notifi_calve);
 Z   ALTER TABLE ONLY public.notificaciones_claves DROP CONSTRAINT notificaciones_claves_pkey;
       public         postgres    false    226    226            �           2606    21274 "   notificaciones notificaciones_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);
 L   ALTER TABLE ONLY public.notificaciones DROP CONSTRAINT notificaciones_pkey;
       public         postgres    false    225    225            �           2606    21276    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    229    229            �           2606    21277    documentos Ref_00    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT "Ref_00" FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 =   ALTER TABLE ONLY public.documentos DROP CONSTRAINT "Ref_00";
       public       postgres    false    2209    218    229            �           2606    21282    documentos Ref_01    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT "Ref_01" FOREIGN KEY (id_genera) REFERENCES public.conf_genera(id_genera);
 =   ALTER TABLE ONLY public.documentos DROP CONSTRAINT "Ref_01";
       public       postgres    false    201    218    2181            �           2606    21287    conf_genera Ref_02    FK CONSTRAINT     �   ALTER TABLE ONLY public.conf_genera
    ADD CONSTRAINT "Ref_02" FOREIGN KEY (id_dependencia) REFERENCES public.conf_dependencia(id_dependencia);
 >   ALTER TABLE ONLY public.conf_genera DROP CONSTRAINT "Ref_02";
       public       postgres    false    198    201    2177            �           2606    21292    usuarios Ref_03    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT "Ref_03" FOREIGN KEY (id_dependencia) REFERENCES public.conf_dependencia(id_dependencia);
 ;   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT "Ref_03";
       public       postgres    false    198    229    2177            �           2606    21297    notificaciones Ref_04    FK CONSTRAINT     �   ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT "Ref_04" FOREIGN KEY (id_genera) REFERENCES public.conf_genera(id_genera);
 A   ALTER TABLE ONLY public.notificaciones DROP CONSTRAINT "Ref_04";
       public       postgres    false    201    225    2181            �           2606    21302 #   conf_dependencia_autoridades Ref_05    FK CONSTRAINT     �   ALTER TABLE ONLY public.conf_dependencia_autoridades
    ADD CONSTRAINT "Ref_05" FOREIGN KEY (id_dependencia) REFERENCES public.conf_dependencia(id_dependencia);
 O   ALTER TABLE ONLY public.conf_dependencia_autoridades DROP CONSTRAINT "Ref_05";
       public       postgres    false    198    199    2177            �           2606    21307 #   conf_dependencia_autoridades Ref_06    FK CONSTRAINT     �   ALTER TABLE ONLY public.conf_dependencia_autoridades
    ADD CONSTRAINT "Ref_06" FOREIGN KEY (id_autoridad) REFERENCES public.conf_autoridades(id_autoridad);
 O   ALTER TABLE ONLY public.conf_dependencia_autoridades DROP CONSTRAINT "Ref_06";
       public       postgres    false    190    199    2169            �           2606    21312 !   conf_autoridades_tipo_docs Ref_07    FK CONSTRAINT     �   ALTER TABLE ONLY public.conf_autoridades_tipo_docs
    ADD CONSTRAINT "Ref_07" FOREIGN KEY (id_autoridad) REFERENCES public.conf_autoridades(id_autoridad);
 M   ALTER TABLE ONLY public.conf_autoridades_tipo_docs DROP CONSTRAINT "Ref_07";
       public       postgres    false    2169    191    190            �           2606    21317 !   conf_autoridades_tipo_docs Ref_08    FK CONSTRAINT     �   ALTER TABLE ONLY public.conf_autoridades_tipo_docs
    ADD CONSTRAINT "Ref_08" FOREIGN KEY (id_tipo_doc) REFERENCES public.conf_tipo_docs(id_tipo_doc);
 M   ALTER TABLE ONLY public.conf_autoridades_tipo_docs DROP CONSTRAINT "Ref_08";
       public       postgres    false    191    212    2191            �           2606    21322     documentos_relacionados Ref_09    FK CONSTRAINT     �   ALTER TABLE ONLY public." documentos_relacionados"
    ADD CONSTRAINT "Ref_09" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);
 M   ALTER TABLE ONLY public." documentos_relacionados" DROP CONSTRAINT "Ref_09";
       public       postgres    false    2197    185    218            �           2606    21327     documentos_relacionados Ref_10    FK CONSTRAINT     �   ALTER TABLE ONLY public." documentos_relacionados"
    ADD CONSTRAINT "Ref_10" FOREIGN KEY (id_relacion) REFERENCES public.estado_relacion(id_relacion);
 M   ALTER TABLE ONLY public." documentos_relacionados" DROP CONSTRAINT "Ref_10";
       public       postgres    false    223    185    2203            �           2606    21332 #   documentos_relacion_exterior Ref_11    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos_relacion_exterior
    ADD CONSTRAINT "Ref_11" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);
 O   ALTER TABLE ONLY public.documentos_relacion_exterior DROP CONSTRAINT "Ref_11";
       public       postgres    false    218    221    2197            �           2606    21337 #   documentos_relacion_exterior Ref_12    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos_relacion_exterior
    ADD CONSTRAINT "Ref_12" FOREIGN KEY (id_relacion) REFERENCES public.estado_relacion(id_relacion);
 O   ALTER TABLE ONLY public.documentos_relacion_exterior DROP CONSTRAINT "Ref_12";
       public       postgres    false    223    221    2203            �           2606    21342 ;   actualizada_derogada Ref_actualizada_derogada_to_documentos    FK CONSTRAINT     �   ALTER TABLE ONLY public.actualizada_derogada
    ADD CONSTRAINT "Ref_actualizada_derogada_to_documentos" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);
 g   ALTER TABLE ONLY public.actualizada_derogada DROP CONSTRAINT "Ref_actualizada_derogada_to_documentos";
       public       postgres    false    218    188    2197            �           2606    21347 <   conf_sub_categoria Ref_conf_sub_categoria_to_conf_categorias    FK CONSTRAINT     �   ALTER TABLE ONLY public.conf_sub_categoria
    ADD CONSTRAINT "Ref_conf_sub_categoria_to_conf_categorias" FOREIGN KEY (id_categoria) REFERENCES public.conf_categorias(id_categoria);
 h   ALTER TABLE ONLY public.conf_sub_categoria DROP CONSTRAINT "Ref_conf_sub_categoria_to_conf_categorias";
       public       postgres    false    196    206    2175            �           2606    21352 ;   documento_categorias Ref_documento_categorias_to_documentos    FK CONSTRAINT     �   ALTER TABLE ONLY public.documento_categorias
    ADD CONSTRAINT "Ref_documento_categorias_to_documentos" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);
 g   ALTER TABLE ONLY public.documento_categorias DROP CONSTRAINT "Ref_documento_categorias_to_documentos";
       public       postgres    false    218    216    2197            �           2606    21357 6   documentos_claves Ref_documentos_claves_to_conf_calves    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos_claves
    ADD CONSTRAINT "Ref_documentos_claves_to_conf_calves" FOREIGN KEY (id_clave) REFERENCES public.conf_calves(id_clave);
 b   ALTER TABLE ONLY public.documentos_claves DROP CONSTRAINT "Ref_documentos_claves_to_conf_calves";
       public       postgres    false    194    220    2173            �           2606    21362 5   documentos_claves Ref_documentos_claves_to_documentos    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos_claves
    ADD CONSTRAINT "Ref_documentos_claves_to_documentos" FOREIGN KEY (id_documento) REFERENCES public.documentos(id_documento);
 a   ALTER TABLE ONLY public.documentos_claves DROP CONSTRAINT "Ref_documentos_claves_to_documentos";
       public       postgres    false    218    2197    220            �           2606    21367 >   notificaciones_claves Ref_notificaciones_claves_to_conf_calves    FK CONSTRAINT     �   ALTER TABLE ONLY public.notificaciones_claves
    ADD CONSTRAINT "Ref_notificaciones_claves_to_conf_calves" FOREIGN KEY (id_clave) REFERENCES public.conf_calves(id_clave);
 j   ALTER TABLE ONLY public.notificaciones_claves DROP CONSTRAINT "Ref_notificaciones_claves_to_conf_calves";
       public       postgres    false    194    226    2173            �           2606    21372 A   notificaciones_claves Ref_notificaciones_claves_to_notificaciones    FK CONSTRAINT     �   ALTER TABLE ONLY public.notificaciones_claves
    ADD CONSTRAINT "Ref_notificaciones_claves_to_notificaciones" FOREIGN KEY (id_notificacion) REFERENCES public.notificaciones(id_notificacion);
 m   ALTER TABLE ONLY public.notificaciones_claves DROP CONSTRAINT "Ref_notificaciones_claves_to_notificaciones";
       public       postgres    false    225    2205    226            �           2606    21377 )   documentos documentos_to_conf_autoridades    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_autoridades FOREIGN KEY (id_autoridad) REFERENCES public.conf_autoridades(id_autoridad);
 S   ALTER TABLE ONLY public.documentos DROP CONSTRAINT documentos_to_conf_autoridades;
       public       postgres    false    2169    190    218            �           2606    21382 '   documentos documentos_to_conf_programas    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_programas FOREIGN KEY (id_programa) REFERENCES public.conf_programas(id_programa);
 Q   ALTER TABLE ONLY public.documentos DROP CONSTRAINT documentos_to_conf_programas;
       public       postgres    false    204    218    2183            �           2606    21387 )   documentos documentos_to_conf_tipo_acceso    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_tipo_acceso FOREIGN KEY (id_tipo_acceso) REFERENCES public.conf_tipo_acceso(id_tipo_acceso);
 S   ALTER TABLE ONLY public.documentos DROP CONSTRAINT documentos_to_conf_tipo_acceso;
       public       postgres    false    2189    218    210            �           2606    21392 '   documentos documentos_to_conf_tipo_docs    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_tipo_docs FOREIGN KEY (id_tipo_doc) REFERENCES public.conf_tipo_docs(id_tipo_doc);
 Q   ALTER TABLE ONLY public.documentos DROP CONSTRAINT documentos_to_conf_tipo_docs;
       public       postgres    false    2191    212    218            �           2606    21397 )   documentos documentos_to_conf_tipo_estado    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_to_conf_tipo_estado FOREIGN KEY (id_tipo_estado) REFERENCES public.conf_tipo_estado(id_tipo_estado);
 S   ALTER TABLE ONLY public.documentos DROP CONSTRAINT documentos_to_conf_tipo_estado;
       public       postgres    false    218    2193    214            0	      x������ � �      3	      x������ � �      5	   2   x�3��tIMN�����26�t��+N��Wp�,JM.�,��tv����� ��      6	      x�3�46�4����� �      9	   B   x�3�t��+)J,��2�tI-.�L��2�.�M,���2I'��s�pz�&e�$&g��q��qqq >>E      ;	   �  x�]R�r�0�q_�����^%��i��HHjƙ��K���cR����p@��h�g��Sl^�$��=�=`�ѣ�߾��<�_�%9 .��qfk�%�Ppk���[����?�>�p'�>/`Б�(
�*!Q���)�J��	�d�U]w,P���.�y�����,Y6;o֪�*�}��;}I҃L�eM��&�L��D�^`]�ȑ�G��`k�?q��G��$��	2�z6�y�5�Bi��.�1/����ک��{p4n�kREUx�)X~��d��!�ס��q\�\������2��b�[�p�Y(�9��BZ�Qp��e��9�]M�w�:�8&�{E�^������j(���&�)��,�����E�5���Y��i���RN��Q�G��lu�u�h��G�F�p���y���
�-��Q�o�������      =	   �   x�]�=�0���9E��J��ۤ�+�#��X�HM�$Bpdf.��F�y?7`�cL`�:�I��=i˙|�GcZp�3Ǔ��ha��:�㏅�#��Qƨ_z��3�%?ms�$�;=�}��2�R�e	��'���>��u�|"�A��ǽ|�"'�^��WJ}��H�      >	      x�34�4�4��2���\1z\\\  ��      @	   %   x�34�t��+N��Wp�,JM.�,�������� �Pj      C	      x�3���SH-.HM�L�LN,����� W��      E	   �   x�uP�N�0<o��_�pJ�D�U��ܸ,�"m�z#;����ȡ'~�Mq����z�,����F������O�G��� ւ��6x�hZ���Q��2{Y�:�U��qA���� !�����lu9͈��KTYX��"�%P2�8
#%��D��� g1k����)�W+�EL=z�cp�M��-�aۚZ��4��h���j#3ZO�Z�x-�<F�#���W؛��'�I���T��+hi��I�����&˲O��yU      G	      x������ � �      I	   .   x�3���Sp-.HM�L�LN,�2�t�LO-.�Wp/J������ �M      K	   :   x�3��/JI�K̫J���2�t�,J.�I,�t�r�2�J-��)M��������� ��      M	   <   x�3��LO�+I�2�tI-�OOLI�2�H,J�L���(��M8�KJs2�@�=... �      O	      x������ � �      Q	      x������ � �      S	      x������ � �      T	      x������ � �      V	      x������ � �      X	      x������ � �      Y	      x������ � �      \	      x������ � �      r	   �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�          �)a     x�              