PGDMP                          y            toba_2_7    9.6.17    9.6.17 R   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16393    toba_2_7    DATABASE     f   CREATE DATABASE toba_2_7 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE toba_2_7;
             postgres    false            
            2615    18605 
   desarrollo    SCHEMA        CREATE SCHEMA desarrollo;
    DROP SCHEMA desarrollo;
             postgres    false                        2615    20816    desarrollo_logs    SCHEMA        CREATE SCHEMA desarrollo_logs;
    DROP SCHEMA desarrollo_logs;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        2615    20961 
   referencia    SCHEMA        CREATE SCHEMA referencia;
    DROP SCHEMA referencia;
             postgres    false                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �           1255    20814    sp_old_pwd_copy()    FUNCTION     �  CREATE FUNCTION desarrollo.sp_old_pwd_copy() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
				DECLARE
				BEGIN
					IF (TG_OP = 'INSERT') OR (TG_OP = 'DELETE') THEN
						RAISE EXCEPTION 'Error en la programación del trigger';
					END IF;

					IF (OLD.clave != NEW.clave) OR (OLD.autentificacion != NEW.autentificacion) THEN
						INSERT INTO apex_usuario_pwd_usados (usuario, clave, algoritmo) VALUES (OLD.usuario, OLD.clave, OLD.autentificacion);
					END IF;
					RETURN NULL;
				END;
			$$;
 ,   DROP FUNCTION desarrollo.sp_old_pwd_copy();
    
   desarrollo       postgres    false    1    10            �            1259    19313    apex_admin_album_fotos    TABLE     ,  CREATE TABLE desarrollo.apex_admin_album_fotos (
    proyecto character varying(15) NOT NULL,
    usuario character varying(60) NOT NULL,
    foto_tipo character varying(20) NOT NULL,
    foto_nombre text NOT NULL,
    foto_nodos_visibles text,
    foto_opciones text,
    predeterminada smallint
);
 .   DROP TABLE desarrollo.apex_admin_album_fotos;
    
   desarrollo         postgres    false    10            �            1259    19321 !   apex_admin_param_previsualizazion    TABLE     �   CREATE TABLE desarrollo.apex_admin_param_previsualizazion (
    proyecto character varying(15) NOT NULL,
    usuario character varying(60) NOT NULL,
    grupo_acceso text NOT NULL,
    punto_acceso text NOT NULL,
    perfil_datos text
);
 9   DROP TABLE desarrollo.apex_admin_param_previsualizazion;
    
   desarrollo         postgres    false    10            -           1259    19967    apex_admin_persistencia    TABLE       CREATE TABLE desarrollo.apex_admin_persistencia (
    ap bigint DEFAULT nextval(('"apex_admin_persistencia_seq"'::text)::regclass) NOT NULL,
    clase character varying(60) NOT NULL,
    archivo text NOT NULL,
    descripcion text NOT NULL,
    categoria character varying(20)
);
 /   DROP TABLE desarrollo.apex_admin_persistencia;
    
   desarrollo         postgres    false    10            ,           1259    19965    apex_admin_persistencia_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_admin_persistencia_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE desarrollo.apex_admin_persistencia_seq;
    
   desarrollo       postgres    false    10            �            1259    19305    apex_arbol_items_fotos    TABLE     �   CREATE TABLE desarrollo.apex_arbol_items_fotos (
    proyecto character varying(15) NOT NULL,
    usuario character varying(60) NOT NULL,
    foto_nombre text NOT NULL,
    foto_nodos_visibles text,
    foto_opciones text
);
 .   DROP TABLE desarrollo.apex_arbol_items_fotos;
    
   desarrollo         postgres    false    10            �            1259    18632    apex_checksum_proyectos    TABLE     �   CREATE TABLE desarrollo.apex_checksum_proyectos (
    checksum character varying(200) NOT NULL,
    proyecto character varying(15) NOT NULL
);
 /   DROP TABLE desarrollo.apex_checksum_proyectos;
    
   desarrollo         postgres    false    10            �            1259    19107 
   apex_clase    TABLE     �  CREATE TABLE desarrollo.apex_clase (
    proyecto character varying(15) NOT NULL,
    clase character varying(60) NOT NULL,
    clase_tipo bigint NOT NULL,
    archivo character varying(80),
    descripcion text NOT NULL,
    icono character varying(60) NOT NULL,
    descripcion_corta character varying(40),
    editor_proyecto character varying(15) NOT NULL,
    editor_item character varying(60) NOT NULL,
    objeto_dr_proyecto character varying(15) NOT NULL,
    objeto_dr bigint NOT NULL,
    utiliza_fuente_datos bigint,
    screenshot character varying(60),
    ancestro_proyecto character varying(15),
    ancestro character varying(60),
    instanciador_id bigint,
    instanciador_proyecto character varying(15),
    instanciador_item character varying(60),
    editor_id bigint,
    editor_ancestro_proyecto character varying(15),
    editor_ancestro character varying(60),
    plan_dump_objeto text,
    sql_info text,
    doc_clase text,
    doc_db text,
    doc_sql text,
    vinculos smallint,
    autodoc smallint,
    parametro_a text,
    parametro_b text,
    parametro_c text,
    exclusivo_toba smallint,
    solicitud_tipo character varying(20)
);
 "   DROP TABLE desarrollo.apex_clase;
    
   desarrollo         postgres    false    10            �            1259    19129    apex_clase_relacion    TABLE     *  CREATE TABLE desarrollo.apex_clase_relacion (
    proyecto character varying(15) NOT NULL,
    clase_relacion bigint DEFAULT nextval(('"apex_clase_relacion_seq"'::text)::regclass) NOT NULL,
    clase_contenedora character varying(60) NOT NULL,
    clase_contenida character varying(60) NOT NULL
);
 +   DROP TABLE desarrollo.apex_clase_relacion;
    
   desarrollo         postgres    false    10            �            1259    19127    apex_clase_relacion_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_clase_relacion_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE desarrollo.apex_clase_relacion_seq;
    
   desarrollo       postgres    false    10            �            1259    19098    apex_clase_tipo    TABLE     7  CREATE TABLE desarrollo.apex_clase_tipo (
    clase_tipo bigint DEFAULT nextval(('"apex_clase_tipo_seq"'::text)::regclass) NOT NULL,
    descripcion_corta character varying(40) NOT NULL,
    descripcion text,
    icono character varying(60),
    orden double precision,
    metodologia character varying(10)
);
 '   DROP TABLE desarrollo.apex_clase_tipo;
    
   desarrollo         postgres    false    10            �            1259    19096    apex_clase_tipo_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_clase_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE desarrollo.apex_clase_tipo_seq;
    
   desarrollo       postgres    false    10            �            1259    18816    apex_columna_estilo    TABLE     �   CREATE TABLE desarrollo.apex_columna_estilo (
    columna_estilo bigint DEFAULT nextval(('"apex_columna_estilo_seq"'::text)::regclass) NOT NULL,
    css character varying(40) NOT NULL,
    descripcion text,
    descripcion_corta character varying(40)
);
 +   DROP TABLE desarrollo.apex_columna_estilo;
    
   desarrollo         postgres    false    10            �            1259    18814    apex_columna_estilo_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_columna_estilo_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE desarrollo.apex_columna_estilo_seq;
    
   desarrollo       postgres    false    10            �            1259    18827    apex_columna_formato    TABLE     a  CREATE TABLE desarrollo.apex_columna_formato (
    columna_formato bigint DEFAULT nextval(('"apex_columna_formato_seq"'::text)::regclass) NOT NULL,
    funcion character varying(60) NOT NULL,
    archivo character varying(80),
    descripcion text,
    descripcion_corta character varying(40),
    parametros text,
    estilo_defecto bigint NOT NULL
);
 ,   DROP TABLE desarrollo.apex_columna_formato;
    
   desarrollo         postgres    false    10            �            1259    18825    apex_columna_formato_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_columna_formato_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE desarrollo.apex_columna_formato_seq;
    
   desarrollo       postgres    false    10            �            1259    18876    apex_consulta_php    TABLE     X  CREATE TABLE desarrollo.apex_consulta_php (
    proyecto character varying(15) NOT NULL,
    consulta_php bigint DEFAULT nextval(('"apex_consulta_php_seq"'::text)::regclass) NOT NULL,
    clase character varying(60) NOT NULL,
    archivo_clase character varying(60),
    archivo text NOT NULL,
    descripcion text,
    punto_montaje bigint
);
 )   DROP TABLE desarrollo.apex_consulta_php;
    
   desarrollo         postgres    false    10            �            1259    18874    apex_consulta_php_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_consulta_php_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE desarrollo.apex_consulta_php_seq;
    
   desarrollo       postgres    false    10            �            1259    19329    apex_conversion    TABLE     �   CREATE TABLE desarrollo.apex_conversion (
    proyecto character varying(15) NOT NULL,
    conversion_aplicada character varying(60) NOT NULL,
    fecha timestamp without time zone NOT NULL
);
 '   DROP TABLE desarrollo.apex_conversion;
    
   desarrollo         postgres    false    10                       1259    19539    apex_dimension    TABLE     l  CREATE TABLE desarrollo.apex_dimension (
    proyecto character varying(15) NOT NULL,
    dimension bigint DEFAULT nextval(('"apex_dimension_seq"'::text)::regclass) NOT NULL,
    nombre character varying(80) NOT NULL,
    descripcion text,
    schema character varying(60),
    tabla character varying(80) NOT NULL,
    col_id text NOT NULL,
    col_desc text NOT NULL,
    col_desc_separador character varying(40),
    multitabla_col_tabla character varying(80),
    multitabla_id_tabla character varying(40),
    fuente_datos_proyecto character varying(15) NOT NULL,
    fuente_datos character varying(20) NOT NULL
);
 &   DROP TABLE desarrollo.apex_dimension;
    
   desarrollo         postgres    false    10                       1259    19560    apex_dimension_gatillo    TABLE     �  CREATE TABLE desarrollo.apex_dimension_gatillo (
    proyecto character varying(15) NOT NULL,
    dimension bigint NOT NULL,
    gatillo bigint DEFAULT nextval(('"apex_dimension_gatillo_seq"'::text)::regclass) NOT NULL,
    tipo character varying(20) NOT NULL,
    orden bigint NOT NULL,
    tabla_rel_dim character varying(80) NOT NULL,
    columnas_rel_dim text,
    tabla_gatillo character varying(80),
    ruta_tabla_rel_dim text
);
 .   DROP TABLE desarrollo.apex_dimension_gatillo;
    
   desarrollo         postgres    false    10                       1259    19558    apex_dimension_gatillo_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_dimension_gatillo_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE desarrollo.apex_dimension_gatillo_seq;
    
   desarrollo       postgres    false    10                       1259    19537    apex_dimension_seq    SEQUENCE     ~   CREATE SEQUENCE desarrollo.apex_dimension_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE desarrollo.apex_dimension_seq;
    
   desarrollo       postgres    false    10            �            1259    18762    apex_elemento_formulario    TABLE     �  CREATE TABLE desarrollo.apex_elemento_formulario (
    elemento_formulario character varying(50) NOT NULL,
    padre character varying(30),
    descripcion text NOT NULL,
    parametros text,
    proyecto character varying(15) NOT NULL,
    exclusivo_toba smallint,
    obsoleto smallint DEFAULT 0,
    es_seleccion smallint DEFAULT 0,
    es_seleccion_multiple smallint DEFAULT 0
);
 0   DROP TABLE desarrollo.apex_elemento_formulario;
    
   desarrollo         postgres    false    10            �            1259    18650    apex_estilo    TABLE     �   CREATE TABLE desarrollo.apex_estilo (
    estilo character varying(40) NOT NULL,
    descripcion text NOT NULL,
    proyecto character varying(15) NOT NULL,
    es_css3 smallint DEFAULT 0 NOT NULL,
    paleta text
);
 #   DROP TABLE desarrollo.apex_estilo;
    
   desarrollo         postgres    false    10                       1259    19680    apex_eventos_pantalla    TABLE     �   CREATE TABLE desarrollo.apex_eventos_pantalla (
    pantalla bigint NOT NULL,
    objeto_ci bigint NOT NULL,
    evento_id bigint NOT NULL,
    proyecto character varying(15) NOT NULL
);
 -   DROP TABLE desarrollo.apex_eventos_pantalla;
    
   desarrollo         postgres    false    10            �            1259    18698    apex_fuente_datos    TABLE       CREATE TABLE desarrollo.apex_fuente_datos (
    proyecto character varying(15) NOT NULL,
    fuente_datos character varying(20) NOT NULL,
    descripcion text NOT NULL,
    descripcion_corta character varying(40),
    fuente_datos_motor character varying(30),
    host character varying(60),
    punto_montaje bigint,
    subclase_archivo text,
    subclase_nombre character varying(60),
    orden smallint,
    schema character varying(60),
    instancia_id character varying,
    administrador character varying,
    link_instancia smallint,
    tiene_auditoria smallint DEFAULT 0 NOT NULL,
    parsea_errores smallint DEFAULT 0 NOT NULL,
    permisos_por_tabla smallint DEFAULT 0 NOT NULL,
    usuario character varying,
    clave character varying,
    base character varying
);
 )   DROP TABLE desarrollo.apex_fuente_datos;
    
   desarrollo         postgres    false    10            �            1259    18690    apex_fuente_datos_motor    TABLE     �   CREATE TABLE desarrollo.apex_fuente_datos_motor (
    fuente_datos_motor character varying(30) NOT NULL,
    nombre text NOT NULL,
    version character varying(30) NOT NULL
);
 /   DROP TABLE desarrollo.apex_fuente_datos_motor;
    
   desarrollo         postgres    false    10            �            1259    18724    apex_fuente_datos_schemas    TABLE     �   CREATE TABLE desarrollo.apex_fuente_datos_schemas (
    proyecto character varying(15) NOT NULL,
    fuente_datos character varying(20) NOT NULL,
    nombre text NOT NULL,
    principal smallint DEFAULT 0 NOT NULL
);
 1   DROP TABLE desarrollo.apex_fuente_datos_schemas;
    
   desarrollo         postgres    false    10                       1259    19578    apex_gadgets    TABLE     �  CREATE TABLE desarrollo.apex_gadgets (
    gadget bigint DEFAULT nextval(('"apex_gadgets_seq"'::text)::regclass) NOT NULL,
    proyecto character varying(15) NOT NULL,
    gadget_url character varying(250),
    titulo character varying(50),
    descripcion character varying(250),
    tipo_gadget character(1) NOT NULL,
    subclase character varying(80),
    subclase_archivo character varying(255)
);
 $   DROP TABLE desarrollo.apex_gadgets;
    
   desarrollo         postgres    false    10                       1259    19576    apex_gadgets_seq    SEQUENCE     |   CREATE SEQUENCE desarrollo.apex_gadgets_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE desarrollo.apex_gadgets_seq;
    
   desarrollo       postgres    false    10            (           1259    19922    apex_grafico    TABLE     �   CREATE TABLE desarrollo.apex_grafico (
    grafico character varying(20) NOT NULL,
    descripcion_corta character varying(40),
    descripcion text NOT NULL,
    parametros text
);
 $   DROP TABLE desarrollo.apex_grafico;
    
   desarrollo         postgres    false    10            X           1259    20518 $   apex_grupo_acc_restriccion_funcional    TABLE     �   CREATE TABLE desarrollo.apex_grupo_acc_restriccion_funcional (
    proyecto character varying(15) NOT NULL,
    usuario_grupo_acc character varying(30) NOT NULL,
    restriccion_funcional bigint NOT NULL
);
 <   DROP TABLE desarrollo.apex_grupo_acc_restriccion_funcional;
    
   desarrollo         postgres    false    10            �            1259    18610    apex_instancia    TABLE     x  CREATE TABLE desarrollo.apex_instancia (
    instancia character varying(80) NOT NULL,
    version character varying(15) NOT NULL,
    institucion text,
    observaciones text,
    administrador_1 character varying(60),
    administrador_2 character varying(60),
    administrador_3 character varying(60),
    creacion timestamp(0) without time zone DEFAULT now() NOT NULL
);
 &   DROP TABLE desarrollo.apex_instancia;
    
   desarrollo         postgres    false    10            �            1259    19009 	   apex_item    TABLE       CREATE TABLE desarrollo.apex_item (
    item_id bigint,
    proyecto character varying(15) NOT NULL,
    item character varying(60) DEFAULT nextval(('"apex_item_seq"'::text)::regclass) NOT NULL,
    padre_id bigint,
    padre_proyecto character varying(15) NOT NULL,
    padre character varying(60) NOT NULL,
    carpeta smallint,
    nivel_acceso smallint,
    solicitud_tipo character varying(20),
    pagina_tipo_proyecto character varying(15),
    pagina_tipo character varying(20),
    actividad_buffer_proyecto character varying(15),
    actividad_buffer bigint,
    actividad_patron_proyecto character varying(15),
    actividad_patron character varying(20),
    nombre character varying(80) NOT NULL,
    descripcion text,
    punto_montaje bigint,
    actividad_accion text,
    menu smallint,
    orden double precision,
    solicitud_registrar smallint,
    solicitud_obs_tipo_proyecto character varying(15),
    solicitud_obs_tipo character varying(20),
    solicitud_observacion text,
    solicitud_registrar_cron smallint,
    prueba_directorios smallint,
    zona_proyecto character varying(15),
    zona character varying(20),
    zona_orden double precision,
    zona_listar smallint,
    imagen_recurso_origen character varying(10),
    imagen character varying(60),
    parametro_a text,
    parametro_b text,
    parametro_c text,
    publico smallint,
    redirecciona smallint,
    usuario character varying(60),
    exportable smallint,
    creacion timestamp(0) without time zone DEFAULT now(),
    retrasar_headers smallint DEFAULT 0
);
 !   DROP TABLE desarrollo.apex_item;
    
   desarrollo         postgres    false    10            �            1259    19065    apex_item_info    TABLE     �   CREATE TABLE desarrollo.apex_item_info (
    item_id bigint,
    item_proyecto character varying(15) NOT NULL,
    item character varying(60) NOT NULL,
    descripcion_breve text,
    descripcion_larga text
);
 &   DROP TABLE desarrollo.apex_item_info;
    
   desarrollo         postgres    false    10                        1259    19370    apex_item_msg    TABLE     �  CREATE TABLE desarrollo.apex_item_msg (
    item_msg bigint DEFAULT nextval(('"apex_item_msg_seq"'::text)::regclass) NOT NULL,
    msg_tipo character varying(20) NOT NULL,
    indice character varying(255) NOT NULL,
    item_id bigint,
    item_proyecto character varying(15) NOT NULL,
    item character varying(60) NOT NULL,
    descripcion_corta character varying(50),
    mensaje_a text,
    mensaje_b text,
    mensaje_c text,
    mensaje_customizable text,
    parametro_patron text
);
 %   DROP TABLE desarrollo.apex_item_msg;
    
   desarrollo         postgres    false    10            �            1259    19368    apex_item_msg_seq    SEQUENCE     }   CREATE SEQUENCE desarrollo.apex_item_msg_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE desarrollo.apex_item_msg_seq;
    
   desarrollo       postgres    false    10                       1259    19454    apex_item_nota    TABLE       CREATE TABLE desarrollo.apex_item_nota (
    item_nota bigint DEFAULT nextval(('"apex_item_nota_seq"'::text)::regclass) NOT NULL,
    nota_tipo character varying(20) NOT NULL,
    item_id bigint,
    item_proyecto character varying(15) NOT NULL,
    item character varying(60) NOT NULL,
    usuario_origen character varying(20),
    usuario_destino character varying(20),
    titulo character varying(50),
    texto text,
    leido smallint,
    bl smallint,
    creacion timestamp(0) without time zone DEFAULT now()
);
 &   DROP TABLE desarrollo.apex_item_nota;
    
   desarrollo         postgres    false    10                       1259    19452    apex_item_nota_seq    SEQUENCE     ~   CREATE SEQUENCE desarrollo.apex_item_nota_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE desarrollo.apex_item_nota_seq;
    
   desarrollo       postgres    false    10            �            1259    19290    apex_item_objeto    TABLE     �   CREATE TABLE desarrollo.apex_item_objeto (
    item_id bigint,
    proyecto character varying(15) NOT NULL,
    item character varying(60) NOT NULL,
    objeto bigint NOT NULL,
    orden smallint NOT NULL,
    inicializar smallint
);
 (   DROP TABLE desarrollo.apex_item_objeto;
    
   desarrollo         postgres    false    10            �            1259    19078    apex_item_permisos_tablas    TABLE     �   CREATE TABLE desarrollo.apex_item_permisos_tablas (
    proyecto character varying(15) NOT NULL,
    item character varying(60) NOT NULL,
    fuente_datos character varying(20) NOT NULL,
    esquema text,
    tabla text NOT NULL,
    permisos text
);
 1   DROP TABLE desarrollo.apex_item_permisos_tablas;
    
   desarrollo         postgres    false    10            �            1259    19007    apex_item_seq    SEQUENCE     z   CREATE SEQUENCE desarrollo.apex_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE desarrollo.apex_item_seq;
    
   desarrollo       postgres    false    10            �            1259    18989    apex_item_zona    TABLE     �  CREATE TABLE desarrollo.apex_item_zona (
    proyecto character varying(15) NOT NULL,
    zona character varying(20) NOT NULL,
    nombre character varying(80) NOT NULL,
    clave_editable character varying(100),
    archivo character varying(80),
    descripcion character varying,
    consulta_archivo text,
    consulta_clase character varying(60),
    consulta_metodo character varying(80),
    punto_montaje bigint
);
 &   DROP TABLE desarrollo.apex_item_zona;
    
   desarrollo         postgres    false    10            �            1259    18664    apex_log_sistema_tipo    TABLE     �   CREATE TABLE desarrollo.apex_log_sistema_tipo (
    log_sistema_tipo character varying(20) NOT NULL,
    descripcion text NOT NULL
);
 -   DROP TABLE desarrollo.apex_log_sistema_tipo;
    
   desarrollo         postgres    false    10            _           1259    20648 	   apex_menu    TABLE     �   CREATE TABLE desarrollo.apex_menu (
    proyecto character varying(15) NOT NULL,
    menu_id character varying(50) NOT NULL,
    descripcion text,
    tipo_menu character varying(40) NOT NULL
);
 !   DROP TABLE desarrollo.apex_menu;
    
   desarrollo         postgres    false    10            a           1259    20668    apex_menu_operaciones    TABLE     o  CREATE TABLE desarrollo.apex_menu_operaciones (
    proyecto character varying(15) NOT NULL,
    menu_id character varying(50) NOT NULL,
    menu_elemento bigint DEFAULT nextval(('"apex_menu_operaciones_seq"'::text)::regclass) NOT NULL,
    item character varying(60),
    padre character varying(60),
    descripcion text,
    carpeta smallint DEFAULT 0 NOT NULL
);
 -   DROP TABLE desarrollo.apex_menu_operaciones;
    
   desarrollo         postgres    false    10            `           1259    20666    apex_menu_operaciones_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_menu_operaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE desarrollo.apex_menu_operaciones_seq;
    
   desarrollo       postgres    false    10            �            1259    18642    apex_menu_tipos    TABLE     �   CREATE TABLE desarrollo.apex_menu_tipos (
    menu character varying(40) NOT NULL,
    descripcion text NOT NULL,
    archivo text NOT NULL,
    soporta_frames smallint
);
 '   DROP TABLE desarrollo.apex_menu_tipos;
    
   desarrollo         postgres    false    10            =           1259    20193    apex_molde_opciones_generacion    TABLE       CREATE TABLE desarrollo.apex_molde_opciones_generacion (
    proyecto character varying(15) NOT NULL,
    uso_autoload smallint,
    origen_datos_cuadro character varying(20),
    punto_montaje bigint,
    carga_php_include text,
    carga_php_clase text
);
 6   DROP TABLE desarrollo.apex_molde_opciones_generacion;
    
   desarrollo         postgres    false    10            C           1259    20255    apex_molde_operacion    TABLE     �  CREATE TABLE desarrollo.apex_molde_operacion (
    proyecto character varying(255) NOT NULL,
    molde bigint DEFAULT nextval(('"apex_molde_operacion_seq"'::text)::regclass) NOT NULL,
    operacion_tipo bigint NOT NULL,
    nombre text,
    item character varying(60) NOT NULL,
    carpeta_archivos text NOT NULL,
    prefijo_clases character varying(30) NOT NULL,
    fuente character varying(20) NOT NULL,
    punto_montaje bigint
);
 ,   DROP TABLE desarrollo.apex_molde_operacion;
    
   desarrollo         postgres    false    10            H           1259    20321    apex_molde_operacion_abms    TABLE     y  CREATE TABLE desarrollo.apex_molde_operacion_abms (
    proyecto character varying(255) NOT NULL,
    molde bigint NOT NULL,
    tabla text NOT NULL,
    gen_usa_filtro smallint,
    gen_separar_pantallas smallint,
    filtro_comprobar_parametros smallint,
    cuadro_eof text,
    cuadro_eliminar_filas smallint,
    cuadro_id text,
    cuadro_forzar_filtro smallint,
    cuadro_carga_origen character varying(15),
    cuadro_carga_sql text,
    cuadro_carga_php_include text,
    cuadro_carga_php_clase text,
    cuadro_carga_php_metodo text,
    datos_tabla_validacion smallint,
    apdb_pre smallint,
    punto_montaje bigint
);
 1   DROP TABLE desarrollo.apex_molde_operacion_abms;
    
   desarrollo         postgres    false    10            J           1259    20341    apex_molde_operacion_abms_fila    TABLE       CREATE TABLE desarrollo.apex_molde_operacion_abms_fila (
    proyecto character varying(255) NOT NULL,
    molde bigint NOT NULL,
    fila bigint DEFAULT nextval(('"apex_molde_operacion_abms_fila_seq"'::text)::regclass) NOT NULL,
    orden double precision NOT NULL,
    columna text NOT NULL,
    asistente_tipo_dato bigint,
    etiqueta text,
    en_cuadro smallint,
    en_form smallint,
    en_filtro smallint,
    filtro_operador character varying(10),
    cuadro_estilo bigint,
    cuadro_formato bigint,
    dt_tipo_dato character varying(1),
    dt_largo smallint,
    dt_secuencia text,
    dt_pk smallint,
    elemento_formulario character varying(30),
    ef_obligatorio smallint,
    ef_desactivar_modificacion smallint,
    ef_procesar_javascript smallint,
    ef_carga_origen character varying(15),
    ef_carga_sql character varying,
    ef_carga_php_include text,
    ef_carga_php_clase text,
    ef_carga_php_metodo text,
    ef_carga_tabla text,
    ef_carga_col_clave text,
    ef_carga_col_desc text,
    punto_montaje bigint
);
 6   DROP TABLE desarrollo.apex_molde_operacion_abms_fila;
    
   desarrollo         postgres    false    10            I           1259    20339 "   apex_molde_operacion_abms_fila_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_molde_operacion_abms_fila_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE desarrollo.apex_molde_operacion_abms_fila_seq;
    
   desarrollo       postgres    false    10            K           1259    20387     apex_molde_operacion_importacion    TABLE     �   CREATE TABLE desarrollo.apex_molde_operacion_importacion (
    proyecto character varying(255) NOT NULL,
    molde bigint NOT NULL,
    origen_item character varying(60) NOT NULL,
    origen_proyecto character varying(30)
);
 8   DROP TABLE desarrollo.apex_molde_operacion_importacion;
    
   desarrollo         postgres    false    10            E           1259    20293    apex_molde_operacion_log    TABLE     %  CREATE TABLE desarrollo.apex_molde_operacion_log (
    proyecto character varying(255) NOT NULL,
    molde bigint NOT NULL,
    generacion bigint DEFAULT nextval(('"apex_molde_operacion_log_seq"'::text)::regclass) NOT NULL,
    momento timestamp(0) without time zone DEFAULT now() NOT NULL
);
 0   DROP TABLE desarrollo.apex_molde_operacion_log;
    
   desarrollo         postgres    false    10            G           1259    20307 "   apex_molde_operacion_log_elementos    TABLE     -  CREATE TABLE desarrollo.apex_molde_operacion_log_elementos (
    generacion bigint NOT NULL,
    molde bigint NOT NULL,
    id bigint DEFAULT nextval(('"apex_molde_operacion_log_elementos_seq"'::text)::regclass) NOT NULL,
    tipo text NOT NULL,
    proyecto text NOT NULL,
    clave text NOT NULL
);
 :   DROP TABLE desarrollo.apex_molde_operacion_log_elementos;
    
   desarrollo         postgres    false    10            F           1259    20305 &   apex_molde_operacion_log_elementos_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_molde_operacion_log_elementos_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE desarrollo.apex_molde_operacion_log_elementos_seq;
    
   desarrollo       postgres    false    10            D           1259    20291    apex_molde_operacion_log_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_molde_operacion_log_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE desarrollo.apex_molde_operacion_log_seq;
    
   desarrollo       postgres    false    10            B           1259    20253    apex_molde_operacion_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_molde_operacion_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE desarrollo.apex_molde_operacion_seq;
    
   desarrollo       postgres    false    10            ?           1259    20213    apex_molde_operacion_tipo    TABLE     n  CREATE TABLE desarrollo.apex_molde_operacion_tipo (
    operacion_tipo bigint DEFAULT nextval(('"apex_molde_operacion_tipo_seq"'::text)::regclass) NOT NULL,
    descripcion_corta character varying(40) NOT NULL,
    descripcion text,
    clase text NOT NULL,
    ci text NOT NULL,
    icono character varying(30),
    vista_previa text,
    orden double precision
);
 1   DROP TABLE desarrollo.apex_molde_operacion_tipo;
    
   desarrollo         postgres    false    10            A           1259    20224    apex_molde_operacion_tipo_dato    TABLE     �  CREATE TABLE desarrollo.apex_molde_operacion_tipo_dato (
    tipo_dato bigint DEFAULT nextval(('"apex_molde_operacion_tipo_dato_seq"'::text)::regclass) NOT NULL,
    descripcion_corta character varying(40) NOT NULL,
    descripcion text,
    dt_tipo_dato character varying(1),
    elemento_formulario character varying(30),
    cuadro_estilo bigint,
    cuadro_formato bigint,
    orden double precision,
    filtro_operador character varying(10)
);
 6   DROP TABLE desarrollo.apex_molde_operacion_tipo_dato;
    
   desarrollo         postgres    false    10            @           1259    20222 "   apex_molde_operacion_tipo_dato_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_molde_operacion_tipo_dato_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE desarrollo.apex_molde_operacion_tipo_dato_seq;
    
   desarrollo       postgres    false    10            >           1259    20211    apex_molde_operacion_tipo_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_molde_operacion_tipo_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE desarrollo.apex_molde_operacion_tipo_seq;
    
   desarrollo       postgres    false    10            �            1259    19349    apex_msg    TABLE     �  CREATE TABLE desarrollo.apex_msg (
    msg bigint DEFAULT nextval(('"apex_msg_seq"'::text)::regclass) NOT NULL,
    indice character varying(255) NOT NULL,
    proyecto character varying(15) NOT NULL,
    msg_tipo character varying(20) NOT NULL,
    descripcion_corta character varying(50),
    mensaje_a text,
    mensaje_b text,
    mensaje_c text,
    mensaje_customizable text
);
     DROP TABLE desarrollo.apex_msg;
    
   desarrollo         postgres    false    10            �            1259    19347    apex_msg_seq    SEQUENCE     x   CREATE SEQUENCE desarrollo.apex_msg_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE desarrollo.apex_msg_seq;
    
   desarrollo       postgres    false    10            �            1259    19339    apex_msg_tipo    TABLE     �   CREATE TABLE desarrollo.apex_msg_tipo (
    msg_tipo character varying(20) NOT NULL,
    descripcion text NOT NULL,
    icono character varying(60)
);
 %   DROP TABLE desarrollo.apex_msg_tipo;
    
   desarrollo         postgres    false    10            �            1259    18746    apex_nivel_acceso    TABLE     �   CREATE TABLE desarrollo.apex_nivel_acceso (
    nivel_acceso smallint NOT NULL,
    nombre character varying(80) NOT NULL,
    descripcion text
);
 )   DROP TABLE desarrollo.apex_nivel_acceso;
    
   desarrollo         postgres    false    10                       1259    19422 	   apex_nota    TABLE     �  CREATE TABLE desarrollo.apex_nota (
    nota bigint DEFAULT nextval(('"apex_nota_seq"'::text)::regclass) NOT NULL,
    nota_tipo character varying(20) NOT NULL,
    proyecto character varying(15) NOT NULL,
    usuario_origen character varying(20),
    usuario_destino character varying(20),
    titulo character varying(50),
    texto text,
    leido smallint,
    bl smallint,
    creacion timestamp(0) without time zone DEFAULT now()
);
 !   DROP TABLE desarrollo.apex_nota;
    
   desarrollo         postgres    false    10                       1259    19420    apex_nota_seq    SEQUENCE     y   CREATE SEQUENCE desarrollo.apex_nota_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE desarrollo.apex_nota_seq;
    
   desarrollo       postgres    false    10                       1259    19412    apex_nota_tipo    TABLE     �   CREATE TABLE desarrollo.apex_nota_tipo (
    nota_tipo character varying(20) NOT NULL,
    descripcion text NOT NULL,
    icono character varying(30)
);
 &   DROP TABLE desarrollo.apex_nota_tipo;
    
   desarrollo         postgres    false    10                       1259    19637    apex_obj_ci_pantalla_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_obj_ci_pantalla_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE desarrollo.apex_obj_ci_pantalla_seq;
    
   desarrollo       postgres    false    10                       1259    19710    apex_obj_ei_cuadro_cc_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_obj_ei_cuadro_cc_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE desarrollo.apex_obj_ei_cuadro_cc_seq;
    
   desarrollo       postgres    false    10                       1259    19729    apex_obj_ei_cuadro_col_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_obj_ei_cuadro_col_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE desarrollo.apex_obj_ei_cuadro_col_seq;
    
   desarrollo       postgres    false    10                        1259    19794    apex_obj_ei_form_fila_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_obj_ei_form_fila_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE desarrollo.apex_obj_ei_form_fila_seq;
    
   desarrollo       postgres    false    10            �            1259    19147    apex_objeto    TABLE     Z  CREATE TABLE desarrollo.apex_objeto (
    proyecto character varying(15) NOT NULL,
    objeto bigint DEFAULT nextval(('"apex_objeto_seq"'::text)::regclass) NOT NULL,
    anterior character varying(20),
    identificador text,
    reflexivo smallint,
    clase_proyecto character varying(15) NOT NULL,
    clase character varying(60) NOT NULL,
    punto_montaje bigint,
    subclase character varying(80),
    subclase_archivo text,
    objeto_categoria_proyecto character varying(15),
    objeto_categoria character varying(30),
    nombre text NOT NULL,
    titulo text,
    colapsable smallint,
    descripcion character varying,
    fuente_datos_proyecto character varying(15),
    fuente_datos character varying(20),
    solicitud_registrar smallint,
    solicitud_obj_obs_tipo character varying(20),
    solicitud_obj_observacion text,
    parametro_a text,
    parametro_b text,
    parametro_c text,
    parametro_d text,
    parametro_e text,
    parametro_f text,
    usuario character varying(20),
    creacion timestamp(0) without time zone DEFAULT now(),
    posicion_botonera character varying(10)
);
 #   DROP TABLE desarrollo.apex_objeto;
    
   desarrollo         postgres    false    10                       1259    19639    apex_objeto_ci_pantalla    TABLE     �  CREATE TABLE desarrollo.apex_objeto_ci_pantalla (
    objeto_ci_proyecto character varying(15) NOT NULL,
    objeto_ci bigint NOT NULL,
    pantalla bigint DEFAULT nextval(('"apex_obj_ci_pantalla_seq"'::text)::regclass) NOT NULL,
    identificador character varying(40) NOT NULL,
    orden smallint,
    etiqueta character varying(80),
    descripcion text,
    tip text,
    imagen_recurso_origen character varying(10),
    imagen character varying(60),
    objetos character varying,
    eventos character varying,
    subclase character varying(80),
    subclase_archivo character varying(255),
    template text,
    template_impresion text,
    punto_montaje bigint
);
 /   DROP TABLE desarrollo.apex_objeto_ci_pantalla;
    
   desarrollo         postgres    false    10            *           1259    19945    apex_objeto_codigo    TABLE     �   CREATE TABLE desarrollo.apex_objeto_codigo (
    objeto_codigo_proyecto character varying(15) NOT NULL,
    objeto_codigo bigint NOT NULL,
    descripcion character varying(80),
    ancho character varying(10),
    alto character varying(10)
);
 *   DROP TABLE desarrollo.apex_objeto_codigo;
    
   desarrollo         postgres    false    10                       1259    19695    apex_objeto_cuadro    TABLE     �  CREATE TABLE desarrollo.apex_objeto_cuadro (
    objeto_cuadro_proyecto character varying(15) NOT NULL,
    objeto_cuadro bigint NOT NULL,
    titulo text,
    subtitulo text,
    sql text,
    columnas_clave text,
    columna_descripcion text,
    clave_dbr smallint,
    archivos_callbacks text,
    ancho character varying(10),
    ordenar smallint,
    paginar smallint,
    tamano_pagina smallint,
    tipo_paginado character varying(1),
    mostrar_total_registros smallint DEFAULT 0 NOT NULL,
    eof_invisible smallint,
    eof_customizado character varying,
    siempre_con_titulo smallint DEFAULT 0 NOT NULL,
    exportar_paginado smallint,
    exportar smallint,
    exportar_rtf smallint,
    pdf_propiedades text,
    pdf_respetar_paginacion smallint,
    asociacion_columnas text,
    ev_seleccion smallint,
    ev_eliminar smallint,
    dao_nucleo_proyecto character varying(15),
    dao_nucleo character varying(60),
    dao_metodo character varying(80),
    dao_parametros text,
    desplegable smallint,
    desplegable_activo smallint,
    scroll smallint,
    scroll_alto character varying(10),
    cc_modo character varying(1),
    cc_modo_anidado_colap smallint,
    cc_modo_anidado_totcol smallint,
    cc_modo_anidado_totcua smallint
);
 *   DROP TABLE desarrollo.apex_objeto_cuadro;
    
   desarrollo         postgres    false    10                       1259    19712    apex_objeto_cuadro_cc    TABLE     I  CREATE TABLE desarrollo.apex_objeto_cuadro_cc (
    objeto_cuadro_proyecto character varying(15) NOT NULL,
    objeto_cuadro bigint NOT NULL,
    objeto_cuadro_cc bigint DEFAULT nextval(('"apex_obj_ei_cuadro_cc_seq"'::text)::regclass) NOT NULL,
    identificador text,
    descripcion text,
    orden double precision NOT NULL,
    columnas_id text NOT NULL,
    columnas_descripcion text NOT NULL,
    pie_contar_filas character varying(10),
    pie_mostrar_titular smallint,
    pie_mostrar_titulos smallint,
    imp_paginar smallint,
    modo_inicio_colapsado smallint DEFAULT 0
);
 -   DROP TABLE desarrollo.apex_objeto_cuadro_cc;
    
   desarrollo         postgres    false    10                       1259    19761    apex_objeto_cuadro_col_cc    TABLE     �   CREATE TABLE desarrollo.apex_objeto_cuadro_col_cc (
    objeto_cuadro_cc bigint NOT NULL,
    objeto_cuadro_proyecto character varying(15) NOT NULL,
    objeto_cuadro bigint NOT NULL,
    objeto_cuadro_col bigint NOT NULL,
    total smallint DEFAULT 0
);
 1   DROP TABLE desarrollo.apex_objeto_cuadro_col_cc;
    
   desarrollo         postgres    false    10            9           1259    20120    apex_objeto_datos_rel    TABLE     �  CREATE TABLE desarrollo.apex_objeto_datos_rel (
    proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    debug smallint DEFAULT 0,
    clave character varying(60),
    ap bigint,
    punto_montaje bigint,
    ap_clase character varying(60),
    ap_archivo text,
    sinc_susp_constraints smallint DEFAULT 0,
    sinc_orden_automatico smallint DEFAULT 1,
    sinc_lock_optimista smallint DEFAULT 1
);
 -   DROP TABLE desarrollo.apex_objeto_datos_rel;
    
   desarrollo         postgres    false    10            ;           1259    20149    apex_objeto_datos_rel_asoc    TABLE     �  CREATE TABLE desarrollo.apex_objeto_datos_rel_asoc (
    proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    asoc_id bigint DEFAULT nextval(('"apex_objeto_datos_rel_asoc_seq"'::text)::regclass) NOT NULL,
    identificador character varying(60),
    padre_proyecto character varying(15) NOT NULL,
    padre_objeto bigint NOT NULL,
    padre_id character varying(40) NOT NULL,
    padre_clave character varying(255),
    hijo_proyecto character varying(15) NOT NULL,
    hijo_objeto bigint NOT NULL,
    hijo_id character varying(40) NOT NULL,
    hijo_clave character varying(255),
    cascada smallint,
    orden double precision
);
 2   DROP TABLE desarrollo.apex_objeto_datos_rel_asoc;
    
   desarrollo         postgres    false    10            :           1259    20147    apex_objeto_datos_rel_asoc_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_objeto_datos_rel_asoc_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE desarrollo.apex_objeto_datos_rel_asoc_seq;
    
   desarrollo       postgres    false    10            3           1259    20042    apex_objeto_db_columna_fks    TABLE     �  CREATE TABLE desarrollo.apex_objeto_db_columna_fks (
    id bigint DEFAULT nextval(('"apex_objeto_db_columna_fks_seq"'::text)::regclass) NOT NULL,
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    tabla character varying(200) NOT NULL,
    columna character varying(200) NOT NULL,
    tabla_ext character varying(200) NOT NULL,
    columna_ext character varying(200) NOT NULL
);
 2   DROP TABLE desarrollo.apex_objeto_db_columna_fks;
    
   desarrollo         postgres    false    10            2           1259    20040    apex_objeto_db_columna_fks_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_objeto_db_columna_fks_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE desarrollo.apex_objeto_db_columna_fks_seq;
    
   desarrollo       postgres    false    10            /           1259    19981    apex_objeto_db_registros    TABLE     F  CREATE TABLE desarrollo.apex_objeto_db_registros (
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    max_registros smallint,
    min_registros smallint,
    punto_montaje bigint,
    ap bigint,
    ap_clase character varying(60),
    ap_archivo text,
    tabla text,
    tabla_ext text,
    alias character varying(60),
    modificar_claves smallint,
    fuente_datos_proyecto character varying(15),
    fuente_datos character varying(20),
    permite_actualizacion_automatica smallint DEFAULT 1 NOT NULL,
    esquema text,
    esquema_ext text
);
 0   DROP TABLE desarrollo.apex_objeto_db_registros;
    
   desarrollo         postgres    false    10            1           1259    20019    apex_objeto_db_registros_col    TABLE     �  CREATE TABLE desarrollo.apex_objeto_db_registros_col (
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    col_id bigint DEFAULT nextval(('"apex_objeto_dbr_columna_seq"'::text)::regclass) NOT NULL,
    columna text NOT NULL,
    tipo character varying(1),
    pk smallint,
    secuencia text,
    largo smallint,
    no_nulo smallint,
    no_nulo_db smallint,
    externa smallint,
    tabla character varying(200)
);
 4   DROP TABLE desarrollo.apex_objeto_db_registros_col;
    
   desarrollo         postgres    false    10            5           1259    20058    apex_objeto_db_registros_ext    TABLE     1  CREATE TABLE desarrollo.apex_objeto_db_registros_ext (
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    externa_id bigint DEFAULT nextval(('"apex_objeto_dbr_ext_seq"'::text)::regclass) NOT NULL,
    tipo character varying(3) NOT NULL,
    sincro_continua smallint,
    metodo text,
    clase text,
    include text,
    punto_montaje bigint,
    sql text,
    dato_estricto smallint DEFAULT 1,
    carga_dt bigint,
    carga_consulta_php bigint,
    permite_carga_masiva smallint DEFAULT 0 NOT NULL,
    metodo_masivo text
);
 4   DROP TABLE desarrollo.apex_objeto_db_registros_ext;
    
   desarrollo         postgres    false    10            6           1259    20089     apex_objeto_db_registros_ext_col    TABLE     �   CREATE TABLE desarrollo.apex_objeto_db_registros_ext_col (
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    externa_id bigint NOT NULL,
    col_id bigint NOT NULL,
    es_resultado smallint
);
 8   DROP TABLE desarrollo.apex_objeto_db_registros_ext_col;
    
   desarrollo         postgres    false    10            8           1259    20106    apex_objeto_db_registros_uniq    TABLE     �   CREATE TABLE desarrollo.apex_objeto_db_registros_uniq (
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    uniq_id bigint DEFAULT nextval(('"apex_objeto_dbr_uniq_seq"'::text)::regclass) NOT NULL,
    columnas text
);
 5   DROP TABLE desarrollo.apex_objeto_db_registros_uniq;
    
   desarrollo         postgres    false    10            0           1259    20017    apex_objeto_dbr_columna_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_objeto_dbr_columna_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE desarrollo.apex_objeto_dbr_columna_seq;
    
   desarrollo       postgres    false    10            4           1259    20056    apex_objeto_dbr_ext_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_objeto_dbr_ext_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE desarrollo.apex_objeto_dbr_ext_seq;
    
   desarrollo       postgres    false    10            7           1259    20104    apex_objeto_dbr_uniq_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_objeto_dbr_uniq_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE desarrollo.apex_objeto_dbr_uniq_seq;
    
   desarrollo       postgres    false    10            �            1259    19217    apex_objeto_dep_consumo    TABLE     �  CREATE TABLE desarrollo.apex_objeto_dep_consumo (
    proyecto character varying(15) NOT NULL,
    consumo_id bigint DEFAULT nextval(('"apex_objeto_dep_consumo_seq"'::text)::regclass) NOT NULL,
    objeto_consumidor bigint NOT NULL,
    objeto_proveedor bigint NOT NULL,
    identificador character varying(40) NOT NULL,
    parametros_a text,
    parametros_b text,
    parametros_c text,
    inicializar smallint
);
 /   DROP TABLE desarrollo.apex_objeto_dep_consumo;
    
   desarrollo         postgres    false    10            �            1259    19215    apex_objeto_dep_consumo_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_objeto_dep_consumo_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE desarrollo.apex_objeto_dep_consumo_seq;
    
   desarrollo       postgres    false    10            �            1259    19192    apex_objeto_dep_seq    SEQUENCE        CREATE SEQUENCE desarrollo.apex_objeto_dep_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE desarrollo.apex_objeto_dep_seq;
    
   desarrollo       postgres    false    10            �            1259    19194    apex_objeto_dependencias    TABLE     �  CREATE TABLE desarrollo.apex_objeto_dependencias (
    proyecto character varying(15) NOT NULL,
    dep_id bigint DEFAULT nextval(('"apex_objeto_dep_seq"'::text)::regclass) NOT NULL,
    objeto_consumidor bigint NOT NULL,
    objeto_proveedor bigint NOT NULL,
    identificador character varying(40) NOT NULL,
    parametros_a text,
    parametros_b text,
    parametros_c text,
    inicializar smallint,
    orden smallint
);
 0   DROP TABLE desarrollo.apex_objeto_dependencias;
    
   desarrollo         postgres    false    10                       1259    19731    apex_objeto_ei_cuadro_columna    TABLE     7  CREATE TABLE desarrollo.apex_objeto_ei_cuadro_columna (
    objeto_cuadro_proyecto character varying(15) NOT NULL,
    objeto_cuadro bigint NOT NULL,
    objeto_cuadro_col bigint DEFAULT nextval(('"apex_obj_ei_cuadro_col_seq"'::text)::regclass) NOT NULL,
    clave character varying(80) NOT NULL,
    orden double precision NOT NULL,
    titulo text,
    estilo_titulo text DEFAULT 'ei-cuadro-col-tit'::text,
    estilo text,
    ancho character varying(10),
    formateo bigint,
    vinculo_indice character varying(20),
    no_ordenar smallint,
    mostrar_xls smallint,
    mostrar_pdf smallint,
    pdf_propiedades text,
    desabilitado smallint,
    total smallint,
    total_cc text,
    usar_vinculo smallint,
    vinculo_carpeta character varying(60),
    vinculo_item character varying(60),
    vinculo_popup smallint,
    vinculo_popup_param character varying(100),
    vinculo_target character varying(40),
    vinculo_celda character varying(40),
    vinculo_servicio character varying(100),
    permitir_html smallint,
    grupo text,
    evento_asociado bigint
);
 5   DROP TABLE desarrollo.apex_objeto_ei_cuadro_columna;
    
   desarrollo         postgres    false    10            $           1259    19862    apex_objeto_ei_filtro    TABLE     �   CREATE TABLE desarrollo.apex_objeto_ei_filtro (
    objeto_ei_filtro_proyecto character varying(15) NOT NULL,
    objeto_ei_filtro bigint NOT NULL,
    ancho character varying(10)
);
 -   DROP TABLE desarrollo.apex_objeto_ei_filtro;
    
   desarrollo         postgres    false    10            &           1259    19874    apex_objeto_ei_filtro_col    TABLE     �  CREATE TABLE desarrollo.apex_objeto_ei_filtro_col (
    objeto_ei_filtro_col bigint DEFAULT nextval(('"apex_objeto_ei_filtro_col_seq"'::text)::regclass) NOT NULL,
    objeto_ei_filtro bigint NOT NULL,
    objeto_ei_filtro_proyecto character varying(15) NOT NULL,
    tipo character varying(30) NOT NULL,
    nombre text NOT NULL,
    expresion text NOT NULL,
    etiqueta text,
    descripcion text,
    obligatorio smallint DEFAULT 0 NOT NULL,
    inicial smallint DEFAULT 0 NOT NULL,
    orden smallint DEFAULT 0 NOT NULL,
    estado_defecto text,
    opciones_es_multiple smallint,
    opciones_ef character varying(50),
    carga_metodo text,
    carga_clase text,
    carga_include text,
    carga_dt bigint,
    carga_consulta_php bigint,
    carga_sql text,
    carga_fuente character varying(30),
    carga_lista text,
    carga_col_clave text,
    carga_col_desc text,
    carga_permite_no_seteado smallint DEFAULT 0 NOT NULL,
    carga_no_seteado text,
    carga_no_seteado_ocultar smallint,
    carga_maestros text,
    edit_tamano smallint,
    edit_maximo smallint,
    edit_mascara text,
    edit_unidad text,
    edit_rango text,
    edit_expreg text,
    estilo text,
    popup_item character varying(60),
    popup_proyecto character varying(15),
    popup_editable smallint,
    popup_ventana character varying(50),
    popup_carga_desc_metodo text,
    popup_carga_desc_clase text,
    popup_carga_desc_include text,
    popup_puede_borrar_estado smallint,
    punto_montaje bigint,
    check_valor_si character varying(40),
    check_valor_no character varying(40),
    check_desc_si character varying(100),
    check_desc_no character varying(100),
    selec_cant_minima smallint,
    selec_cant_maxima smallint,
    selec_utilidades smallint,
    selec_tamano smallint,
    selec_ancho character varying(30),
    selec_serializar smallint,
    selec_cant_columnas smallint,
    placeholder text
);
 1   DROP TABLE desarrollo.apex_objeto_ei_filtro_col;
    
   desarrollo         postgres    false    10            %           1259    19872    apex_objeto_ei_filtro_col_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_objeto_ei_filtro_col_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE desarrollo.apex_objeto_ei_filtro_col_seq;
    
   desarrollo       postgres    false    10            #           1259    19852    apex_objeto_ei_filtro_tipo_col    TABLE     �   CREATE TABLE desarrollo.apex_objeto_ei_filtro_tipo_col (
    tipo_col character varying(30) NOT NULL,
    descripcion character varying(50) NOT NULL,
    proyecto character varying(15) NOT NULL
);
 6   DROP TABLE desarrollo.apex_objeto_ei_filtro_tipo_col;
    
   desarrollo         postgres    false    10            +           1259    19955    apex_objeto_ei_firma    TABLE     �   CREATE TABLE desarrollo.apex_objeto_ei_firma (
    objeto_ei_firma_proyecto character varying(15) NOT NULL,
    objeto_ei_firma bigint NOT NULL,
    ancho character varying(10),
    alto character varying(10)
);
 ,   DROP TABLE desarrollo.apex_objeto_ei_firma;
    
   desarrollo         postgres    false    10            !           1259    19796    apex_objeto_ei_formulario_ef    TABLE     P
  CREATE TABLE desarrollo.apex_objeto_ei_formulario_ef (
    objeto_ei_formulario_fila bigint DEFAULT nextval(('"apex_obj_ei_form_fila_seq"'::text)::regclass) NOT NULL,
    objeto_ei_formulario bigint NOT NULL,
    objeto_ei_formulario_proyecto character varying(15) NOT NULL,
    identificador character varying(40) NOT NULL,
    elemento_formulario character varying(30) NOT NULL,
    columnas text NOT NULL,
    obligatorio smallint,
    oculto_relaja_obligatorio smallint,
    orden double precision NOT NULL,
    etiqueta text,
    etiqueta_estilo text,
    descripcion text,
    colapsado smallint,
    desactivado smallint,
    estilo text,
    total smallint,
    inicializacion text,
    permitir_html smallint,
    deshabilitar_rest_func smallint,
    estado_defecto text,
    solo_lectura smallint,
    solo_lectura_modificacion smallint DEFAULT 0 NOT NULL,
    carga_metodo text,
    carga_clase text,
    carga_include text,
    carga_dt bigint,
    carga_consulta_php bigint,
    carga_sql text,
    carga_fuente character varying(30),
    carga_lista text,
    carga_col_clave text,
    carga_col_desc text,
    carga_maestros text,
    carga_cascada_relaj smallint,
    cascada_mantiene_estado smallint DEFAULT 0 NOT NULL,
    carga_permite_no_seteado smallint DEFAULT 0 NOT NULL,
    carga_no_seteado text,
    carga_no_seteado_ocultar smallint,
    edit_tamano smallint,
    edit_maximo smallint,
    edit_mascara text,
    edit_unidad text,
    edit_rango text,
    edit_filas smallint,
    edit_columnas smallint,
    edit_wrap character varying(20),
    edit_resaltar smallint,
    edit_ajustable smallint,
    edit_confirmar_clave smallint,
    edit_expreg text,
    popup_item character varying(60),
    popup_proyecto character varying(15),
    popup_editable smallint,
    popup_ventana text,
    popup_carga_desc_metodo text,
    popup_carga_desc_clase text,
    popup_carga_desc_include text,
    popup_puede_borrar_estado smallint,
    fieldset_fin smallint,
    check_valor_si character varying(40),
    check_valor_no character varying(40),
    check_desc_si character varying(100),
    check_desc_no character varying(100),
    check_ml_toggle smallint,
    fijo_sin_estado smallint,
    editor_ancho character varying(10),
    editor_alto character varying(10),
    editor_botonera character varying(50),
    selec_cant_minima smallint,
    selec_cant_maxima smallint,
    selec_utilidades smallint,
    selec_tamano smallint,
    selec_ancho character varying(30),
    selec_serializar smallint,
    selec_cant_columnas smallint,
    upload_extensiones text,
    punto_montaje bigint,
    placeholder text
);
 4   DROP TABLE desarrollo.apex_objeto_ei_formulario_ef;
    
   desarrollo         postgres    false    10            "           1259    19838    apex_objeto_esquema    TABLE       CREATE TABLE desarrollo.apex_objeto_esquema (
    objeto_esquema_proyecto character varying(15) NOT NULL,
    objeto_esquema bigint NOT NULL,
    parser character varying(30),
    descripcion character varying(80),
    dot text,
    debug smallint,
    formato character varying(15),
    modelo_ejecucion character varying(15),
    modelo_ejecucion_cache smallint,
    tipo_incrustacion character varying(15),
    ancho character varying(10),
    alto character varying(10),
    dirigido smallint DEFAULT 1,
    sql text
);
 +   DROP TABLE desarrollo.apex_objeto_esquema;
    
   desarrollo         postgres    false    10            �            1259    19240    apex_objeto_eventos    TABLE     �  CREATE TABLE desarrollo.apex_objeto_eventos (
    proyecto character varying(15) NOT NULL,
    evento_id bigint DEFAULT nextval(('"apex_objeto_eventos_seq"'::text)::regclass) NOT NULL,
    objeto bigint NOT NULL,
    identificador character varying(40) NOT NULL,
    etiqueta text,
    maneja_datos smallint DEFAULT 1,
    sobre_fila smallint,
    confirmacion text,
    estilo character varying(40),
    imagen_recurso_origen character varying(10),
    imagen character varying(60),
    en_botonera smallint DEFAULT 1,
    ayuda text,
    orden smallint,
    ci_predep smallint,
    implicito smallint,
    defecto smallint,
    display_datos_cargados smallint,
    grupo character varying(80),
    accion character varying(20),
    accion_imphtml_debug smallint,
    accion_vinculo_carpeta character varying(60),
    accion_vinculo_item character varying(60),
    accion_vinculo_objeto bigint,
    accion_vinculo_popup smallint,
    accion_vinculo_popup_param text,
    accion_vinculo_target character varying(40),
    accion_vinculo_celda character varying(40),
    accion_vinculo_servicio text,
    es_seleccion_multiple smallint DEFAULT 0 NOT NULL,
    es_autovinculo smallint DEFAULT 0 NOT NULL
);
 +   DROP TABLE desarrollo.apex_objeto_eventos;
    
   desarrollo         postgres    false    10            �            1259    19238    apex_objeto_eventos_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_objeto_eventos_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE desarrollo.apex_objeto_eventos_seq;
    
   desarrollo       postgres    false    10            )           1259    19930    apex_objeto_grafico    TABLE     $  CREATE TABLE desarrollo.apex_objeto_grafico (
    objeto_grafico_proyecto character varying(15) NOT NULL,
    objeto_grafico bigint NOT NULL,
    descripcion character varying(80),
    grafico character varying(20) NOT NULL,
    ancho character varying(10),
    alto character varying(10)
);
 +   DROP TABLE desarrollo.apex_objeto_grafico;
    
   desarrollo         postgres    false    10            �            1259    19179    apex_objeto_info    TABLE     �   CREATE TABLE desarrollo.apex_objeto_info (
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    descripcion_breve text,
    descripcion_larga text
);
 (   DROP TABLE desarrollo.apex_objeto_info;
    
   desarrollo         postgres    false    10            '           1259    19912    apex_objeto_mapa    TABLE     �   CREATE TABLE desarrollo.apex_objeto_mapa (
    objeto_mapa_proyecto character varying(15) NOT NULL,
    objeto_mapa bigint NOT NULL,
    mapfile_path character varying(200)
);
 (   DROP TABLE desarrollo.apex_objeto_mapa;
    
   desarrollo         postgres    false    10                       1259    19393    apex_objeto_msg    TABLE     �  CREATE TABLE desarrollo.apex_objeto_msg (
    objeto_msg bigint DEFAULT nextval(('"apex_objeto_msg_seq"'::text)::regclass) NOT NULL,
    msg_tipo character varying(20) NOT NULL,
    indice character varying(255) NOT NULL,
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    descripcion_corta character varying(50),
    mensaje_a text,
    mensaje_b text,
    mensaje_c text,
    mensaje_customizable text,
    parametro_clase text
);
 '   DROP TABLE desarrollo.apex_objeto_msg;
    
   desarrollo         postgres    false    10                       1259    19391    apex_objeto_msg_seq    SEQUENCE        CREATE SEQUENCE desarrollo.apex_objeto_msg_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE desarrollo.apex_objeto_msg_seq;
    
   desarrollo       postgres    false    10                       1259    19619    apex_objeto_mt_me    TABLE     !  CREATE TABLE desarrollo.apex_objeto_mt_me (
    objeto_mt_me_proyecto character varying(15) NOT NULL,
    objeto_mt_me bigint NOT NULL,
    ev_procesar_etiq character varying(30),
    ev_cancelar_etiq character varying(30),
    ancho character varying(20),
    alto character varying(20),
    posicion_botonera character varying(10),
    tipo_navegacion character varying(10),
    botonera_barra_item smallint,
    con_toc smallint,
    incremental smallint,
    debug_eventos smallint,
    activacion_procesar character varying(40),
    activacion_cancelar character varying(40),
    ev_procesar smallint,
    ev_cancelar smallint,
    objetos character varying(255),
    post_procesar character varying(40),
    metodo_despachador character varying(40),
    metodo_opciones character varying(40)
);
 )   DROP TABLE desarrollo.apex_objeto_mt_me;
    
   desarrollo         postgres    false    10                       1259    19614    apex_objeto_mt_me_tipo_nav    TABLE     �   CREATE TABLE desarrollo.apex_objeto_mt_me_tipo_nav (
    tipo_navegacion character varying(10) NOT NULL,
    descripcion character varying(30) NOT NULL
);
 2   DROP TABLE desarrollo.apex_objeto_mt_me_tipo_nav;
    
   desarrollo         postgres    false    10            	           1259    19486    apex_objeto_nota    TABLE     �  CREATE TABLE desarrollo.apex_objeto_nota (
    objeto_nota bigint DEFAULT nextval(('"apex_objeto_nota_seq"'::text)::regclass) NOT NULL,
    nota_tipo character varying(20) NOT NULL,
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    usuario_origen character varying(20),
    usuario_destino character varying(20),
    titulo character varying(50),
    texto text,
    bl smallint,
    leido smallint,
    creacion timestamp(0) without time zone DEFAULT now()
);
 (   DROP TABLE desarrollo.apex_objeto_nota;
    
   desarrollo         postgres    false    10                       1259    19484    apex_objeto_nota_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_objeto_nota_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE desarrollo.apex_objeto_nota_seq;
    
   desarrollo       postgres    false    10            <           1259    20173    apex_objeto_rel_columnas_asoc    TABLE     $  CREATE TABLE desarrollo.apex_objeto_rel_columnas_asoc (
    proyecto character varying(15) NOT NULL,
    objeto bigint NOT NULL,
    asoc_id bigint NOT NULL,
    padre_objeto bigint NOT NULL,
    padre_clave bigint NOT NULL,
    hijo_objeto bigint NOT NULL,
    hijo_clave bigint NOT NULL
);
 5   DROP TABLE desarrollo.apex_objeto_rel_columnas_asoc;
    
   desarrollo         postgres    false    10            �            1259    19145    apex_objeto_seq    SEQUENCE     {   CREATE SEQUENCE desarrollo.apex_objeto_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE desarrollo.apex_objeto_seq;
    
   desarrollo       postgres    false    10                       1259    19777    apex_objeto_ut_formulario    TABLE     j  CREATE TABLE desarrollo.apex_objeto_ut_formulario (
    objeto_ut_formulario_proyecto character varying(15) NOT NULL,
    objeto_ut_formulario bigint NOT NULL,
    tabla text,
    titulo text,
    ev_agregar smallint,
    ev_agregar_etiq character varying(30),
    ev_mod_modificar smallint,
    ev_mod_modificar_etiq character varying(30),
    ev_mod_eliminar smallint,
    ev_mod_eliminar_etiq character varying(30),
    ev_mod_limpiar smallint,
    ev_mod_limpiar_etiq character varying(30),
    ev_mod_clave smallint,
    clase_proyecto character varying(15),
    clase character varying(60),
    auto_reset smallint,
    ancho character varying(10),
    ancho_etiqueta character varying(10),
    expandir_descripcion smallint,
    campo_bl character varying(40),
    scroll smallint,
    filas smallint,
    filas_agregar smallint,
    filas_agregar_online smallint DEFAULT 1,
    filas_agregar_abajo smallint DEFAULT 0,
    filas_agregar_texto text,
    filas_borrar_en_linea smallint DEFAULT 0,
    filas_undo smallint,
    filas_ordenar smallint,
    filas_ordenar_en_linea smallint DEFAULT 0,
    columna_orden text,
    filas_numerar smallint,
    ev_seleccion smallint,
    alto character varying(10),
    analisis_cambios character varying(10),
    no_imprimir_efs_sin_estado smallint,
    resaltar_efs_con_estado smallint,
    template text,
    template_impresion text
);
 1   DROP TABLE desarrollo.apex_objeto_ut_formulario;
    
   desarrollo         postgres    false    10                       1259    19665    apex_objetos_pantalla    TABLE     �   CREATE TABLE desarrollo.apex_objetos_pantalla (
    proyecto character varying(15) NOT NULL,
    pantalla bigint NOT NULL,
    objeto_ci bigint NOT NULL,
    orden smallint,
    dep_id bigint NOT NULL
);
 -   DROP TABLE desarrollo.apex_objetos_pantalla;
    
   desarrollo         postgres    false    10            �            1259    18796    apex_pagina_tipo    TABLE     d  CREATE TABLE desarrollo.apex_pagina_tipo (
    proyecto character varying(15) NOT NULL,
    pagina_tipo character varying(20) NOT NULL,
    descripcion text NOT NULL,
    clase_nombre character varying(40),
    clase_archivo text,
    include_arriba text,
    include_abajo text,
    exclusivo_toba smallint,
    contexto text,
    punto_montaje bigint
);
 (   DROP TABLE desarrollo.apex_pagina_tipo;
    
   desarrollo         postgres    false    10            �            1259    18912    apex_perfil_datos_set_prueba    TABLE     �   CREATE TABLE desarrollo.apex_perfil_datos_set_prueba (
    proyecto character varying(15) NOT NULL,
    fuente_datos character varying(20) NOT NULL,
    lote text,
    seleccionados text,
    parametros text
);
 4   DROP TABLE desarrollo.apex_perfil_datos_set_prueba;
    
   desarrollo         postgres    false    10            M           1259    20399    apex_permiso    TABLE     �   CREATE TABLE desarrollo.apex_permiso (
    permiso bigint DEFAULT nextval(('"apex_permiso_seq"'::text)::regclass) NOT NULL,
    proyecto character varying(15) NOT NULL,
    nombre text NOT NULL,
    descripcion text,
    mensaje_particular text
);
 $   DROP TABLE desarrollo.apex_permiso;
    
   desarrollo         postgres    false    10            U           1259    20486    apex_permiso_grupo_acc    TABLE     �   CREATE TABLE desarrollo.apex_permiso_grupo_acc (
    proyecto character varying(15) NOT NULL,
    usuario_grupo_acc character varying(30) NOT NULL,
    permiso bigint NOT NULL
);
 .   DROP TABLE desarrollo.apex_permiso_grupo_acc;
    
   desarrollo         postgres    false    10            L           1259    20397    apex_permiso_seq    SEQUENCE     |   CREATE SEQUENCE desarrollo.apex_permiso_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE desarrollo.apex_permiso_seq;
    
   desarrollo       postgres    false    10            �            1259    18619    apex_proyecto    TABLE     ^  CREATE TABLE desarrollo.apex_proyecto (
    proyecto character varying(15) NOT NULL,
    descripcion text NOT NULL,
    descripcion_corta text NOT NULL,
    estilo character varying(30) NOT NULL,
    con_frames smallint DEFAULT 1,
    frames_clase character varying(40),
    frames_archivo text,
    pm_impresion bigint,
    salida_impr_html_c character varying(40),
    salida_impr_html_a text,
    menu character varying(15),
    path_includes text,
    path_browser text,
    administrador character varying(60),
    listar_multiproyecto smallint,
    orden double precision,
    palabra_vinculo_std character varying(30),
    version_toba character varying(15),
    requiere_validacion smallint,
    usuario_anonimo character varying(60),
    usuario_anonimo_desc character varying(60),
    usuario_anonimo_grupos_acc text,
    validacion_intentos smallint,
    validacion_intentos_min smallint DEFAULT 5,
    validacion_bloquear_usuario smallint DEFAULT 1,
    validacion_debug smallint,
    sesion_tiempo_no_interac_min smallint,
    sesion_tiempo_maximo_min smallint,
    pm_sesion bigint,
    sesion_subclase character varying(60),
    sesion_subclase_archivo text,
    pm_contexto bigint,
    contexto_ejecucion_subclase character varying(60),
    contexto_ejecucion_subclase_archivo text,
    pm_usuario bigint,
    usuario_subclase character varying(60),
    usuario_subclase_archivo text,
    encriptar_qs smallint,
    registrar_solicitud character varying(1),
    registrar_cronometro character varying(1),
    item_inicio_sesion character varying(60),
    item_pre_sesion character varying(60),
    item_pre_sesion_popup smallint,
    item_set_sesion character varying(60),
    log_archivo smallint,
    log_archivo_nivel smallint,
    fuente_datos character varying(20),
    pagina_tipo character varying(20),
    version character varying(20),
    version_fecha date,
    version_detalle character varying,
    version_link text,
    tiempo_espera_ms integer,
    navegacion_ajax smallint,
    codigo_ga_tracker character varying(20),
    extension_toba boolean DEFAULT false,
    extension_proyecto boolean DEFAULT false
);
 %   DROP TABLE desarrollo.apex_proyecto;
    
   desarrollo         postgres    false    10            �            1259    18841    apex_ptos_control    TABLE     �   CREATE TABLE desarrollo.apex_ptos_control (
    proyecto character varying(15) NOT NULL,
    pto_control character varying(30) NOT NULL,
    descripcion text
);
 )   DROP TABLE desarrollo.apex_ptos_control;
    
   desarrollo         postgres    false    10            �            1259    18859    apex_ptos_control_ctrl    TABLE     �  CREATE TABLE desarrollo.apex_ptos_control_ctrl (
    proyecto character varying(15) NOT NULL,
    pto_control character varying(30) NOT NULL,
    clase character varying(60) NOT NULL,
    archivo text,
    actua_como character(1) DEFAULT 'M'::bpchar NOT NULL,
    CONSTRAINT apex_ptos_control_ctrl_actua_como_check CHECK ((actua_como = ANY (ARRAY['E'::bpchar, 'A'::bpchar, 'M'::bpchar])))
);
 .   DROP TABLE desarrollo.apex_ptos_control_ctrl;
    
   desarrollo         postgres    false    10            �            1259    18849    apex_ptos_control_param    TABLE     �   CREATE TABLE desarrollo.apex_ptos_control_param (
    proyecto character varying(15) NOT NULL,
    pto_control character varying(30) NOT NULL,
    parametro character varying(60) NOT NULL
);
 /   DROP TABLE desarrollo.apex_ptos_control_param;
    
   desarrollo         postgres    false    10            �            1259    19270    apex_ptos_control_x_evento    TABLE     �   CREATE TABLE desarrollo.apex_ptos_control_x_evento (
    proyecto character varying(15) NOT NULL,
    pto_control character varying(20) NOT NULL,
    evento_id integer NOT NULL,
    objeto bigint NOT NULL
);
 2   DROP TABLE desarrollo.apex_ptos_control_x_evento;
    
   desarrollo         postgres    false    10            �            1259    18674    apex_puntos_montaje    TABLE     c  CREATE TABLE desarrollo.apex_puntos_montaje (
    id bigint DEFAULT nextval(('"apex_puntos_montaje_seq"'::text)::regclass) NOT NULL,
    etiqueta character varying(50) NOT NULL,
    proyecto character varying(15) NOT NULL,
    proyecto_ref character varying(15),
    descripcion text,
    path_pm text NOT NULL,
    tipo character varying(20) NOT NULL
);
 +   DROP TABLE desarrollo.apex_puntos_montaje;
    
   desarrollo         postgres    false    10            �            1259    18672    apex_puntos_montaje_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_puntos_montaje_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE desarrollo.apex_puntos_montaje_seq;
    
   desarrollo       postgres    false    10            �            1259    18738    apex_recurso_origen    TABLE     �   CREATE TABLE desarrollo.apex_recurso_origen (
    recurso_origen character varying(30) NOT NULL,
    descripcion text NOT NULL
);
 +   DROP TABLE desarrollo.apex_recurso_origen;
    
   desarrollo         postgres    false    10                       1259    19518    apex_relacion_tablas    TABLE     �  CREATE TABLE desarrollo.apex_relacion_tablas (
    fuente_datos_proyecto character varying(15) NOT NULL,
    fuente_datos character varying(20) NOT NULL,
    proyecto character varying(15) NOT NULL,
    relacion_tablas bigint DEFAULT nextval(('"apex_relacion_tablas_seq"'::text)::regclass) NOT NULL,
    tabla_1 character varying(80) NOT NULL,
    tabla_1_cols text NOT NULL,
    tabla_2 character varying(80) NOT NULL,
    tabla_2_cols text NOT NULL
);
 ,   DROP TABLE desarrollo.apex_relacion_tablas;
    
   desarrollo         postgres    false    10            
           1259    19516    apex_relacion_tablas_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_relacion_tablas_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE desarrollo.apex_relacion_tablas_seq;
    
   desarrollo       postgres    false    10            W           1259    20503    apex_restriccion_funcional    TABLE       CREATE TABLE desarrollo.apex_restriccion_funcional (
    proyecto character varying(15) NOT NULL,
    restriccion_funcional bigint DEFAULT nextval(('"apex_restriccion_funcional_seq"'::text)::regclass) NOT NULL,
    descripcion text,
    permite_edicion smallint DEFAULT 1 NOT NULL
);
 2   DROP TABLE desarrollo.apex_restriccion_funcional;
    
   desarrollo         postgres    false    10            ]           1259    20608    apex_restriccion_funcional_cols    TABLE        CREATE TABLE desarrollo.apex_restriccion_funcional_cols (
    proyecto character varying(15) NOT NULL,
    restriccion_funcional bigint NOT NULL,
    item character varying(60) NOT NULL,
    objeto_cuadro bigint NOT NULL,
    objeto_cuadro_col bigint NOT NULL,
    no_visible smallint
);
 7   DROP TABLE desarrollo.apex_restriccion_funcional_cols;
    
   desarrollo         postgres    false    10            Y           1259    20528    apex_restriccion_funcional_ef    TABLE     G  CREATE TABLE desarrollo.apex_restriccion_funcional_ef (
    proyecto character varying(15) NOT NULL,
    restriccion_funcional bigint NOT NULL,
    item character varying(60) NOT NULL,
    objeto_ei_formulario_fila bigint NOT NULL,
    objeto_ei_formulario bigint NOT NULL,
    no_visible smallint,
    no_editable smallint
);
 5   DROP TABLE desarrollo.apex_restriccion_funcional_ef;
    
   desarrollo         postgres    false    10            \           1259    20588    apex_restriccion_funcional_ei    TABLE     �   CREATE TABLE desarrollo.apex_restriccion_funcional_ei (
    proyecto character varying(15) NOT NULL,
    restriccion_funcional bigint NOT NULL,
    item character varying(60) NOT NULL,
    objeto bigint NOT NULL,
    no_visible smallint
);
 5   DROP TABLE desarrollo.apex_restriccion_funcional_ei;
    
   desarrollo         postgres    false    10            [           1259    20568    apex_restriccion_funcional_evt    TABLE     �   CREATE TABLE desarrollo.apex_restriccion_funcional_evt (
    proyecto character varying(15) NOT NULL,
    restriccion_funcional bigint NOT NULL,
    item character varying(60) NOT NULL,
    evento_id bigint NOT NULL,
    no_visible smallint
);
 6   DROP TABLE desarrollo.apex_restriccion_funcional_evt;
    
   desarrollo         postgres    false    10            ^           1259    20628 &   apex_restriccion_funcional_filtro_cols    TABLE     -  CREATE TABLE desarrollo.apex_restriccion_funcional_filtro_cols (
    proyecto character varying(15) NOT NULL,
    restriccion_funcional bigint NOT NULL,
    item character varying(60) NOT NULL,
    objeto_ei_filtro_col bigint NOT NULL,
    objeto_ei_filtro bigint NOT NULL,
    no_visible smallint
);
 >   DROP TABLE desarrollo.apex_restriccion_funcional_filtro_cols;
    
   desarrollo         postgres    false    10            Z           1259    20548 #   apex_restriccion_funcional_pantalla    TABLE       CREATE TABLE desarrollo.apex_restriccion_funcional_pantalla (
    proyecto character varying(15) NOT NULL,
    restriccion_funcional bigint NOT NULL,
    item character varying(60) NOT NULL,
    pantalla bigint NOT NULL,
    objeto_ci bigint NOT NULL,
    no_visible smallint
);
 ;   DROP TABLE desarrollo.apex_restriccion_funcional_pantalla;
    
   desarrollo         postgres    false    10            V           1259    20501    apex_restriccion_funcional_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_restriccion_funcional_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE desarrollo.apex_restriccion_funcional_seq;
    
   desarrollo       postgres    false    10            �            1259    18606    apex_revision    TABLE     �   CREATE TABLE desarrollo.apex_revision (
    revision character varying(20) NOT NULL,
    proyecto character varying(15),
    creacion timestamp(0) without time zone DEFAULT now() NOT NULL
);
 %   DROP TABLE desarrollo.apex_revision;
    
   desarrollo         postgres    false    10            d           1259    20726    apex_servicio_web    TABLE       CREATE TABLE desarrollo.apex_servicio_web (
    proyecto character varying(15) NOT NULL,
    servicio_web character varying(50) NOT NULL,
    descripcion text,
    tipo text DEFAULT 'soap'::text NOT NULL,
    param_to text,
    param_wsa smallint DEFAULT 0 NOT NULL
);
 )   DROP TABLE desarrollo.apex_servicio_web;
    
   desarrollo         postgres    false    10            e           1259    20741    apex_servicio_web_param    TABLE     �   CREATE TABLE desarrollo.apex_servicio_web_param (
    proyecto character varying(15) NOT NULL,
    servicio_web character varying(50) NOT NULL,
    parametro text NOT NULL,
    valor text NOT NULL
);
 /   DROP TABLE desarrollo.apex_servicio_web_param;
    
   desarrollo         postgres    false    10            �            1259    18783    apex_solicitud_obs_tipo    TABLE     �   CREATE TABLE desarrollo.apex_solicitud_obs_tipo (
    proyecto character varying(15) NOT NULL,
    solicitud_obs_tipo character varying(20) NOT NULL,
    descripcion text NOT NULL,
    criterio character varying(20) NOT NULL
);
 /   DROP TABLE desarrollo.apex_solicitud_obs_tipo;
    
   desarrollo         postgres    false    10            �            1259    18754    apex_solicitud_tipo    TABLE     �   CREATE TABLE desarrollo.apex_solicitud_tipo (
    solicitud_tipo character varying(20) NOT NULL,
    descripcion text NOT NULL,
    descripcion_corta character varying(40),
    icono character varying(30)
);
 +   DROP TABLE desarrollo.apex_solicitud_tipo;
    
   desarrollo         postgres    false    10            �            1259    18897 
   apex_tarea    TABLE     g  CREATE TABLE desarrollo.apex_tarea (
    proyecto character varying(15) NOT NULL,
    tarea bigint DEFAULT nextval(('"apex_tarea_seq"'::text)::regclass) NOT NULL,
    nombre text,
    tarea_clase character varying(120) NOT NULL,
    tarea_objeto bytea NOT NULL,
    ejecucion_proxima timestamp without time zone NOT NULL,
    intervalo_repeticion interval
);
 "   DROP TABLE desarrollo.apex_tarea;
    
   desarrollo         postgres    false    10            �            1259    18895    apex_tarea_seq    SEQUENCE     z   CREATE SEQUENCE desarrollo.apex_tarea_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE desarrollo.apex_tarea_seq;
    
   desarrollo       postgres    false    10            .           1259    19976    apex_tipo_datos    TABLE     �   CREATE TABLE desarrollo.apex_tipo_datos (
    tipo character varying(1) NOT NULL,
    descripcion character varying(50) NOT NULL
);
 '   DROP TABLE desarrollo.apex_tipo_datos;
    
   desarrollo         postgres    false    10            �            1259    18930    apex_usuario    TABLE       CREATE TABLE desarrollo.apex_usuario (
    usuario character varying(60) NOT NULL,
    clave character varying(128) NOT NULL,
    nombre text,
    email text,
    autentificacion character varying(10) DEFAULT 'plano'::character varying,
    bloqueado smallint DEFAULT 0,
    parametro_a text,
    parametro_b text,
    parametro_c text,
    solicitud_registrar smallint,
    solicitud_obs_tipo_proyecto character varying(15),
    solicitud_obs_tipo character varying(20),
    solicitud_observacion text,
    usuario_tipodoc character varying(10),
    pre character varying(2),
    ciu character varying(18),
    suf character varying(1),
    telefono character varying(30),
    vencimiento date,
    dias smallint,
    hora_entrada time(0) without time zone,
    hora_salida time(0) without time zone,
    ip_permitida character varying(20),
    forzar_cambio_pwd smallint DEFAULT 0 NOT NULL
);
 $   DROP TABLE desarrollo.apex_usuario;
    
   desarrollo         postgres    false    10            R           1259    20447    apex_usuario_grupo_acc    TABLE     �  CREATE TABLE desarrollo.apex_usuario_grupo_acc (
    proyecto character varying(15) NOT NULL,
    usuario_grupo_acc character varying(30) NOT NULL,
    nombre character varying(80) NOT NULL,
    nivel_acceso smallint,
    descripcion text,
    vencimiento date,
    dias smallint,
    hora_entrada time(0) without time zone,
    hora_salida time(0) without time zone,
    listar smallint,
    permite_edicion smallint DEFAULT 1 NOT NULL,
    menu_usuario character varying(50)
);
 .   DROP TABLE desarrollo.apex_usuario_grupo_acc;
    
   desarrollo         postgres    false    10            T           1259    20471    apex_usuario_grupo_acc_item    TABLE     �   CREATE TABLE desarrollo.apex_usuario_grupo_acc_item (
    proyecto character varying(15) NOT NULL,
    usuario_grupo_acc character varying(30) NOT NULL,
    item_id bigint,
    item character varying(60) NOT NULL
);
 3   DROP TABLE desarrollo.apex_usuario_grupo_acc_item;
    
   desarrollo         postgres    false    10            S           1259    20456    apex_usuario_grupo_acc_miembros    TABLE     �   CREATE TABLE desarrollo.apex_usuario_grupo_acc_miembros (
    proyecto character varying(15) NOT NULL,
    usuario_grupo_acc character varying(30) NOT NULL,
    usuario_grupo_acc_pertenece character varying(30) NOT NULL
);
 7   DROP TABLE desarrollo.apex_usuario_grupo_acc_miembros;
    
   desarrollo         postgres    false    10            O           1259    20412    apex_usuario_perfil_datos    TABLE     (  CREATE TABLE desarrollo.apex_usuario_perfil_datos (
    proyecto character varying(15) NOT NULL,
    usuario_perfil_datos bigint DEFAULT nextval(('"apex_usuario_perfil_datos_seq"'::text)::regclass) NOT NULL,
    nombre character varying(80) NOT NULL,
    descripcion text,
    listar smallint
);
 1   DROP TABLE desarrollo.apex_usuario_perfil_datos;
    
   desarrollo         postgres    false    10            Q           1259    20428    apex_usuario_perfil_datos_dims    TABLE     )  CREATE TABLE desarrollo.apex_usuario_perfil_datos_dims (
    proyecto character varying(15) NOT NULL,
    usuario_perfil_datos bigint NOT NULL,
    dimension bigint NOT NULL,
    elemento bigint DEFAULT nextval(('"apex_usuario_perfil_datos_dims_seq"'::text)::regclass) NOT NULL,
    clave text
);
 6   DROP TABLE desarrollo.apex_usuario_perfil_datos_dims;
    
   desarrollo         postgres    false    10            P           1259    20426 "   apex_usuario_perfil_datos_dims_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_usuario_perfil_datos_dims_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE desarrollo.apex_usuario_perfil_datos_dims_seq;
    
   desarrollo       postgres    false    10            N           1259    20410    apex_usuario_perfil_datos_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_usuario_perfil_datos_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE desarrollo.apex_usuario_perfil_datos_seq;
    
   desarrollo       postgres    false    10            �            1259    18958    apex_usuario_pregunta_secreta    TABLE     :  CREATE TABLE desarrollo.apex_usuario_pregunta_secreta (
    cod_pregunta_secreta bigint DEFAULT nextval(('"apex_usuario_pregunta_secreta_seq"'::text)::regclass) NOT NULL,
    usuario character varying(60) NOT NULL,
    pregunta text NOT NULL,
    respuesta text NOT NULL,
    activa smallint DEFAULT 1 NOT NULL
);
 5   DROP TABLE desarrollo.apex_usuario_pregunta_secreta;
    
   desarrollo         postgres    false    10            �            1259    18956 !   apex_usuario_pregunta_secreta_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_usuario_pregunta_secreta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE desarrollo.apex_usuario_pregunta_secreta_seq;
    
   desarrollo       postgres    false    10            b           1259    20693    apex_usuario_proyecto    TABLE     �   CREATE TABLE desarrollo.apex_usuario_proyecto (
    proyecto character varying(15) NOT NULL,
    usuario_grupo_acc character varying(30) NOT NULL,
    usuario character varying(60) NOT NULL,
    usuario_perfil_datos text
);
 -   DROP TABLE desarrollo.apex_usuario_proyecto;
    
   desarrollo         postgres    false    10                       1259    19592    apex_usuario_proyecto_gadgets    TABLE       CREATE TABLE desarrollo.apex_usuario_proyecto_gadgets (
    usuario character varying(60) NOT NULL,
    proyecto character varying(15) NOT NULL,
    gadget integer NOT NULL,
    orden integer DEFAULT 1 NOT NULL,
    eliminable character(1) DEFAULT 'S'::bpchar NOT NULL
);
 5   DROP TABLE desarrollo.apex_usuario_proyecto_gadgets;
    
   desarrollo         postgres    false    10            c           1259    20711 "   apex_usuario_proyecto_perfil_datos    TABLE     �   CREATE TABLE desarrollo.apex_usuario_proyecto_perfil_datos (
    proyecto character varying(15) NOT NULL,
    usuario_perfil_datos bigint NOT NULL,
    usuario character varying(60) NOT NULL
);
 :   DROP TABLE desarrollo.apex_usuario_proyecto_perfil_datos;
    
   desarrollo         postgres    false    10            �            1259    18946    apex_usuario_pwd_reset    TABLE       CREATE TABLE desarrollo.apex_usuario_pwd_reset (
    usuario character varying(60) NOT NULL,
    random character varying(128) NOT NULL,
    email text,
    validez timestamp without time zone DEFAULT now() NOT NULL,
    bloqueado smallint DEFAULT 0 NOT NULL
);
 .   DROP TABLE desarrollo.apex_usuario_pwd_reset;
    
   desarrollo         postgres    false    10            �            1259    18975    apex_usuario_pwd_usados    TABLE     ]  CREATE TABLE desarrollo.apex_usuario_pwd_usados (
    cod_pwd_pasados bigint DEFAULT nextval(('"apex_usuario_pwd_usados_seq"'::text)::regclass) NOT NULL,
    usuario character varying(60) NOT NULL,
    clave character varying(128) NOT NULL,
    algoritmo character varying(10) NOT NULL,
    fecha_cambio date DEFAULT ('now'::text)::date NOT NULL
);
 /   DROP TABLE desarrollo.apex_usuario_pwd_usados;
    
   desarrollo         postgres    false    10            �            1259    18973    apex_usuario_pwd_usados_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo.apex_usuario_pwd_usados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE desarrollo.apex_usuario_pwd_usados_seq;
    
   desarrollo       postgres    false    10            �            1259    18925    apex_usuario_tipodoc    TABLE     �   CREATE TABLE desarrollo.apex_usuario_tipodoc (
    usuario_tipodoc character varying(10) NOT NULL,
    descripcion character varying(40) NOT NULL
);
 ,   DROP TABLE desarrollo.apex_usuario_tipodoc;
    
   desarrollo         postgres    false    10            r           1259    20909    apex_log_error_login    TABLE     ]  CREATE TABLE desarrollo_logs.apex_log_error_login (
    log_error_login bigint DEFAULT nextval(('desarrollo_logs."apex_log_error_login_seq"'::text)::regclass) NOT NULL,
    momento timestamp(0) without time zone DEFAULT now() NOT NULL,
    usuario text,
    clave text,
    ip text,
    gravedad smallint,
    mensaje text,
    punto_acceso text
);
 1   DROP TABLE desarrollo_logs.apex_log_error_login;
       desarrollo_logs         postgres    false    7            q           1259    20907    apex_log_error_login_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo_logs.apex_log_error_login_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE desarrollo_logs.apex_log_error_login_seq;
       desarrollo_logs       postgres    false    7            s           1259    20919    apex_log_ip_rechazada    TABLE     �   CREATE TABLE desarrollo_logs.apex_log_ip_rechazada (
    ip character varying(255) NOT NULL,
    momento timestamp(0) without time zone DEFAULT now() NOT NULL
);
 2   DROP TABLE desarrollo_logs.apex_log_ip_rechazada;
       desarrollo_logs         postgres    false    7            w           1259    20938    apex_log_objeto    TABLE     �  CREATE TABLE desarrollo_logs.apex_log_objeto (
    log_objeto bigint DEFAULT nextval(('desarrollo_logs."apex_log_objeto_seq"'::text)::regclass) NOT NULL,
    momento timestamp(0) without time zone DEFAULT now() NOT NULL,
    usuario character varying(60),
    objeto_proyecto character varying(15) NOT NULL,
    objeto bigint,
    item character varying(60),
    observacion character varying
);
 ,   DROP TABLE desarrollo_logs.apex_log_objeto;
       desarrollo_logs         postgres    false    7            v           1259    20936    apex_log_objeto_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo_logs.apex_log_objeto_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE desarrollo_logs.apex_log_objeto_seq;
       desarrollo_logs       postgres    false    7            p           1259    20897    apex_log_sistema    TABLE     R  CREATE TABLE desarrollo_logs.apex_log_sistema (
    log_sistema bigint DEFAULT nextval(('desarrollo_logs."apex_log_sistema_seq"'::text)::regclass) NOT NULL,
    momento timestamp(0) without time zone DEFAULT now() NOT NULL,
    usuario character varying(60),
    log_sistema_tipo character varying(20) NOT NULL,
    observaciones text
);
 -   DROP TABLE desarrollo_logs.apex_log_sistema;
       desarrollo_logs         postgres    false    7            o           1259    20895    apex_log_sistema_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo_logs.apex_log_sistema_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE desarrollo_logs.apex_log_sistema_seq;
       desarrollo_logs       postgres    false    7            u           1259    20927    apex_log_tarea    TABLE     x  CREATE TABLE desarrollo_logs.apex_log_tarea (
    proyecto character varying(15) NOT NULL,
    log_tarea bigint DEFAULT nextval(('desarrollo_logs."apex_log_tarea_seq"'::text)::regclass) NOT NULL,
    tarea bigint NOT NULL,
    nombre text,
    tarea_clase character varying(120) NOT NULL,
    tarea_objeto bytea NOT NULL,
    ejecucion timestamp without time zone NOT NULL
);
 +   DROP TABLE desarrollo_logs.apex_log_tarea;
       desarrollo_logs         postgres    false    7            t           1259    20925    apex_log_tarea_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo_logs.apex_log_tarea_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE desarrollo_logs.apex_log_tarea_seq;
       desarrollo_logs       postgres    false    7            i           1259    20828    apex_sesion_browser    TABLE     �  CREATE TABLE desarrollo_logs.apex_sesion_browser (
    sesion_browser bigint DEFAULT nextval(('desarrollo_logs."apex_sesion_browser_seq"'::text)::regclass) NOT NULL,
    proyecto character varying(15) NOT NULL,
    usuario character varying(60) NOT NULL,
    ingreso timestamp(0) without time zone DEFAULT now() NOT NULL,
    egreso timestamp(0) without time zone,
    observaciones text,
    php_id text NOT NULL,
    ip character varying(20),
    punto_acceso character varying(80)
);
 0   DROP TABLE desarrollo_logs.apex_sesion_browser;
       desarrollo_logs         postgres    false    7            h           1259    20826    apex_sesion_browser_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo_logs.apex_sesion_browser_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE desarrollo_logs.apex_sesion_browser_seq;
       desarrollo_logs       postgres    false    7            g           1259    20819    apex_solicitud    TABLE     �  CREATE TABLE desarrollo_logs.apex_solicitud (
    proyecto character varying(15) NOT NULL,
    solicitud bigint DEFAULT nextval(('desarrollo_logs."apex_solicitud_seq"'::text)::regclass) NOT NULL,
    solicitud_tipo character varying(20) NOT NULL,
    item_proyecto character varying(15) NOT NULL,
    item character varying(60) NOT NULL,
    item_id bigint,
    momento timestamp(0) without time zone DEFAULT now() NOT NULL,
    tiempo_respuesta double precision
);
 +   DROP TABLE desarrollo_logs.apex_solicitud;
       desarrollo_logs         postgres    false    7            j           1259    20838    apex_solicitud_browser    TABLE     �   CREATE TABLE desarrollo_logs.apex_solicitud_browser (
    proyecto character varying(15),
    sesion_browser bigint NOT NULL,
    solicitud_proyecto character varying(15) NOT NULL,
    solicitud_browser bigint NOT NULL,
    ip character varying(20)
);
 3   DROP TABLE desarrollo_logs.apex_solicitud_browser;
       desarrollo_logs         postgres    false    7            k           1259    20853    apex_solicitud_consola    TABLE     �   CREATE TABLE desarrollo_logs.apex_solicitud_consola (
    proyecto character varying(15) NOT NULL,
    solicitud_consola bigint NOT NULL,
    usuario character varying(60) NOT NULL,
    ip character varying(20),
    llamada text,
    entorno text
);
 3   DROP TABLE desarrollo_logs.apex_solicitud_consola;
       desarrollo_logs         postgres    false    7            l           1259    20866    apex_solicitud_cronometro    TABLE       CREATE TABLE desarrollo_logs.apex_solicitud_cronometro (
    proyecto character varying(15) NOT NULL,
    solicitud bigint NOT NULL,
    marca smallint NOT NULL,
    nivel_ejecucion character varying(15) NOT NULL,
    texto text,
    tiempo double precision
);
 6   DROP TABLE desarrollo_logs.apex_solicitud_cronometro;
       desarrollo_logs         postgres    false    7            n           1259    20881    apex_solicitud_observacion    TABLE     {  CREATE TABLE desarrollo_logs.apex_solicitud_observacion (
    proyecto character varying(15),
    solicitud bigint NOT NULL,
    solicitud_observacion bigint DEFAULT nextval(('desarrollo_logs."apex_solicitud_observacion_seq"'::text)::regclass) NOT NULL,
    solicitud_obs_tipo_proyecto character varying(15),
    solicitud_obs_tipo character varying(20),
    observacion text
);
 7   DROP TABLE desarrollo_logs.apex_solicitud_observacion;
       desarrollo_logs         postgres    false    7            m           1259    20879    apex_solicitud_observacion_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo_logs.apex_solicitud_observacion_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE desarrollo_logs.apex_solicitud_observacion_seq;
       desarrollo_logs       postgres    false    7            f           1259    20817    apex_solicitud_seq    SEQUENCE     �   CREATE SEQUENCE desarrollo_logs.apex_solicitud_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE desarrollo_logs.apex_solicitud_seq;
       desarrollo_logs       postgres    false    7            x           1259    20948    apex_solicitud_web_service    TABLE     �   CREATE TABLE desarrollo_logs.apex_solicitud_web_service (
    proyecto character varying(15) NOT NULL,
    solicitud bigint NOT NULL,
    metodo text,
    ip character varying(20)
);
 7   DROP TABLE desarrollo_logs.apex_solicitud_web_service;
       desarrollo_logs         postgres    false    7            �           1259    21004    iso_countries    TABLE     g  CREATE TABLE referencia.iso_countries (
    rowid integer NOT NULL,
    countryid integer NOT NULL,
    locale character varying(10) DEFAULT 'en'::character varying NOT NULL,
    countrycode character(2) NOT NULL,
    countryname character varying(200) DEFAULT NULL::character varying,
    phoneprefix character varying(50) DEFAULT NULL::character varying
);
 %   DROP TABLE referencia.iso_countries;
    
   referencia         postgres    false    11            z           1259    20964    ref_deportes    TABLE     �   CREATE TABLE referencia.ref_deportes (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    descripcion character varying(255),
    fecha_inicio date
);
 $   DROP TABLE referencia.ref_deportes;
    
   referencia         postgres    false    11            �           0    0    TABLE ref_deportes    COMMENT     8   COMMENT ON TABLE referencia.ref_deportes IS 'Deportes';
         
   referencia       postgres    false    378            �           0    0    COLUMN ref_deportes.id    COMMENT     9   COMMENT ON COLUMN referencia.ref_deportes.id IS 'Clave';
         
   referencia       postgres    false    378            �           0    0    COLUMN ref_deportes.nombre    COMMENT     >   COMMENT ON COLUMN referencia.ref_deportes.nombre IS 'Nombre';
         
   referencia       postgres    false    378            �           0    0    COLUMN ref_deportes.descripcion    COMMENT     I   COMMENT ON COLUMN referencia.ref_deportes.descripcion IS 'Descripción';
         
   referencia       postgres    false    378            �           0    0     COLUMN ref_deportes.fecha_inicio    COMMENT     M   COMMENT ON COLUMN referencia.ref_deportes.fecha_inicio IS 'Fecha de inicio';
         
   referencia       postgres    false    378            y           1259    20962    ref_deportes_id_seq    SEQUENCE     �   CREATE SEQUENCE referencia.ref_deportes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE referencia.ref_deportes_id_seq;
    
   referencia       postgres    false    378    11            �           0    0    ref_deportes_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE referencia.ref_deportes_id_seq OWNED BY referencia.ref_deportes.id;
         
   referencia       postgres    false    377            |           1259    20970 
   ref_juegos    TABLE     �   CREATE TABLE referencia.ref_juegos (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(255),
    de_mesa boolean DEFAULT false NOT NULL
);
 "   DROP TABLE referencia.ref_juegos;
    
   referencia         postgres    false    11            �           0    0    TABLE ref_juegos    COMMENT     4   COMMENT ON TABLE referencia.ref_juegos IS 'Juegos';
         
   referencia       postgres    false    380            �           0    0    COLUMN ref_juegos.id    COMMENT     7   COMMENT ON COLUMN referencia.ref_juegos.id IS 'Clave';
         
   referencia       postgres    false    380            �           0    0    COLUMN ref_juegos.nombre    COMMENT     <   COMMENT ON COLUMN referencia.ref_juegos.nombre IS 'Nombre';
         
   referencia       postgres    false    380            �           0    0    COLUMN ref_juegos.descripcion    COMMENT     G   COMMENT ON COLUMN referencia.ref_juegos.descripcion IS 'Descripción';
         
   referencia       postgres    false    380            �           0    0    COLUMN ref_juegos.de_mesa    COMMENT     J   COMMENT ON COLUMN referencia.ref_juegos.de_mesa IS 'Es un juego de mesa';
         
   referencia       postgres    false    380            {           1259    20968    ref_juegos_id_seq    SEQUENCE     ~   CREATE SEQUENCE referencia.ref_juegos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE referencia.ref_juegos_id_seq;
    
   referencia       postgres    false    380    11            �           0    0    ref_juegos_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE referencia.ref_juegos_id_seq OWNED BY referencia.ref_juegos.id;
         
   referencia       postgres    false    379            ~           1259    20977    ref_juegos_oferta    TABLE     �   CREATE TABLE referencia.ref_juegos_oferta (
    id integer NOT NULL,
    juego integer NOT NULL,
    jugador integer NOT NULL,
    publicacion timestamp(0) without time zone DEFAULT ('now'::text)::timestamp(6) with time zone
);
 )   DROP TABLE referencia.ref_juegos_oferta;
    
   referencia         postgres    false    11            �           0    0    TABLE ref_juegos_oferta    COMMENT     F   COMMENT ON TABLE referencia.ref_juegos_oferta IS 'Ofertas de Juegos';
         
   referencia       postgres    false    382            �           0    0    COLUMN ref_juegos_oferta.id    COMMENT     >   COMMENT ON COLUMN referencia.ref_juegos_oferta.id IS 'Clave';
         
   referencia       postgres    false    382            �           0    0    COLUMN ref_juegos_oferta.juego    COMMENT     A   COMMENT ON COLUMN referencia.ref_juegos_oferta.juego IS 'Juego';
         
   referencia       postgres    false    382            �           0    0     COLUMN ref_juegos_oferta.jugador    COMMENT     E   COMMENT ON COLUMN referencia.ref_juegos_oferta.jugador IS 'Jugador';
         
   referencia       postgres    false    382            }           1259    20975    ref_juegos_oferta_id_seq    SEQUENCE     �   CREATE SEQUENCE referencia.ref_juegos_oferta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE referencia.ref_juegos_oferta_id_seq;
    
   referencia       postgres    false    382    11            �           0    0    ref_juegos_oferta_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE referencia.ref_juegos_oferta_id_seq OWNED BY referencia.ref_juegos_oferta.id;
         
   referencia       postgres    false    381            �           1259    20984    ref_persona    TABLE     �   CREATE TABLE referencia.ref_persona (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    fecha_nac date,
    imagen bytea,
    planilla_pdf bytea,
    planilla_pdf_firmada smallint DEFAULT 0 NOT NULL
);
 #   DROP TABLE referencia.ref_persona;
    
   referencia         postgres    false    11            �           0    0    TABLE ref_persona    COMMENT     7   COMMENT ON TABLE referencia.ref_persona IS 'Personas';
         
   referencia       postgres    false    384            �           0    0    COLUMN ref_persona.id    COMMENT     8   COMMENT ON COLUMN referencia.ref_persona.id IS 'Clave';
         
   referencia       postgres    false    384            �           0    0    COLUMN ref_persona.nombre    COMMENT     =   COMMENT ON COLUMN referencia.ref_persona.nombre IS 'Nombre';
         
   referencia       postgres    false    384            �           0    0    COLUMN ref_persona.fecha_nac    COMMENT     M   COMMENT ON COLUMN referencia.ref_persona.fecha_nac IS 'Fecha de nacimiento';
         
   referencia       postgres    false    384            �           0    0    COLUMN ref_persona.imagen    COMMENT     ;   COMMENT ON COLUMN referencia.ref_persona.imagen IS 'Foto';
         
   referencia       postgres    false    384            �           0    0    COLUMN ref_persona.planilla_pdf    COMMENT     I   COMMENT ON COLUMN referencia.ref_persona.planilla_pdf IS 'Planilla PDF';
         
   referencia       postgres    false    384            �           1259    20994    ref_persona_deportes    TABLE     �   CREATE TABLE referencia.ref_persona_deportes (
    id integer NOT NULL,
    persona integer NOT NULL,
    deporte integer NOT NULL,
    dia_semana integer,
    hora_inicio time without time zone,
    hora_fin time without time zone
);
 ,   DROP TABLE referencia.ref_persona_deportes;
    
   referencia         postgres    false    11            �           0    0    TABLE ref_persona_deportes    COMMENT     L   COMMENT ON TABLE referencia.ref_persona_deportes IS 'Deportes de personas';
         
   referencia       postgres    false    386            �           0    0    COLUMN ref_persona_deportes.id    COMMENT     A   COMMENT ON COLUMN referencia.ref_persona_deportes.id IS 'Clave';
         
   referencia       postgres    false    386            �           0    0 #   COLUMN ref_persona_deportes.persona    COMMENT     H   COMMENT ON COLUMN referencia.ref_persona_deportes.persona IS 'Persona';
         
   referencia       postgres    false    386            �           0    0 #   COLUMN ref_persona_deportes.deporte    COMMENT     H   COMMENT ON COLUMN referencia.ref_persona_deportes.deporte IS 'Deporte';
         
   referencia       postgres    false    386            �           0    0 &   COLUMN ref_persona_deportes.dia_semana    COMMENT     U   COMMENT ON COLUMN referencia.ref_persona_deportes.dia_semana IS 'Día de la semana';
         
   referencia       postgres    false    386            �           0    0 '   COLUMN ref_persona_deportes.hora_inicio    COMMENT     S   COMMENT ON COLUMN referencia.ref_persona_deportes.hora_inicio IS 'Hora de inicio';
         
   referencia       postgres    false    386            �           0    0 $   COLUMN ref_persona_deportes.hora_fin    COMMENT     M   COMMENT ON COLUMN referencia.ref_persona_deportes.hora_fin IS 'Hora de fin';
         
   referencia       postgres    false    386            �           1259    20992    ref_persona_deportes_id_seq    SEQUENCE     �   CREATE SEQUENCE referencia.ref_persona_deportes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE referencia.ref_persona_deportes_id_seq;
    
   referencia       postgres    false    386    11            �           0    0    ref_persona_deportes_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE referencia.ref_persona_deportes_id_seq OWNED BY referencia.ref_persona_deportes.id;
         
   referencia       postgres    false    385                       1259    20982    ref_persona_id_seq    SEQUENCE        CREATE SEQUENCE referencia.ref_persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE referencia.ref_persona_id_seq;
    
   referencia       postgres    false    384    11            �           0    0    ref_persona_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE referencia.ref_persona_id_seq OWNED BY referencia.ref_persona.id;
         
   referencia       postgres    false    383            �           1259    21000    ref_persona_juegos    TABLE     �   CREATE TABLE referencia.ref_persona_juegos (
    id integer NOT NULL,
    persona integer NOT NULL,
    juego integer NOT NULL,
    dia_semana integer,
    hora_inicio integer,
    hora_fin integer
);
 *   DROP TABLE referencia.ref_persona_juegos;
    
   referencia         postgres    false    11            �           0    0    TABLE ref_persona_juegos    COMMENT     H   COMMENT ON TABLE referencia.ref_persona_juegos IS 'Juegos de personas';
         
   referencia       postgres    false    388            �           0    0    COLUMN ref_persona_juegos.id    COMMENT     ?   COMMENT ON COLUMN referencia.ref_persona_juegos.id IS 'Clave';
         
   referencia       postgres    false    388            �           0    0 !   COLUMN ref_persona_juegos.persona    COMMENT     F   COMMENT ON COLUMN referencia.ref_persona_juegos.persona IS 'Persona';
         
   referencia       postgres    false    388            �           0    0    COLUMN ref_persona_juegos.juego    COMMENT     D   COMMENT ON COLUMN referencia.ref_persona_juegos.juego IS 'Deporte';
         
   referencia       postgres    false    388            �           0    0 $   COLUMN ref_persona_juegos.dia_semana    COMMENT     S   COMMENT ON COLUMN referencia.ref_persona_juegos.dia_semana IS 'Día de la semana';
         
   referencia       postgres    false    388            �           0    0 %   COLUMN ref_persona_juegos.hora_inicio    COMMENT     Q   COMMENT ON COLUMN referencia.ref_persona_juegos.hora_inicio IS 'Hora de inicio';
         
   referencia       postgres    false    388            �           0    0 "   COLUMN ref_persona_juegos.hora_fin    COMMENT     K   COMMENT ON COLUMN referencia.ref_persona_juegos.hora_fin IS 'Hora de fin';
         
   referencia       postgres    false    388            �           1259    20998    ref_persona_juegos_id_seq    SEQUENCE     �   CREATE SEQUENCE referencia.ref_persona_juegos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE referencia.ref_persona_juegos_id_seq;
    
   referencia       postgres    false    11    388            �           0    0    ref_persona_juegos_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE referencia.ref_persona_juegos_id_seq OWNED BY referencia.ref_persona_juegos.id;
         
   referencia       postgres    false    387            X           2604    20967    ref_deportes id    DEFAULT     z   ALTER TABLE ONLY referencia.ref_deportes ALTER COLUMN id SET DEFAULT nextval('referencia.ref_deportes_id_seq'::regclass);
 B   ALTER TABLE referencia.ref_deportes ALTER COLUMN id DROP DEFAULT;
    
   referencia       postgres    false    378    377    378            Y           2604    20973    ref_juegos id    DEFAULT     v   ALTER TABLE ONLY referencia.ref_juegos ALTER COLUMN id SET DEFAULT nextval('referencia.ref_juegos_id_seq'::regclass);
 @   ALTER TABLE referencia.ref_juegos ALTER COLUMN id DROP DEFAULT;
    
   referencia       postgres    false    379    380    380            [           2604    20980    ref_juegos_oferta id    DEFAULT     �   ALTER TABLE ONLY referencia.ref_juegos_oferta ALTER COLUMN id SET DEFAULT nextval('referencia.ref_juegos_oferta_id_seq'::regclass);
 G   ALTER TABLE referencia.ref_juegos_oferta ALTER COLUMN id DROP DEFAULT;
    
   referencia       postgres    false    382    381    382            ]           2604    20987    ref_persona id    DEFAULT     x   ALTER TABLE ONLY referencia.ref_persona ALTER COLUMN id SET DEFAULT nextval('referencia.ref_persona_id_seq'::regclass);
 A   ALTER TABLE referencia.ref_persona ALTER COLUMN id DROP DEFAULT;
    
   referencia       postgres    false    383    384    384            _           2604    20997    ref_persona_deportes id    DEFAULT     �   ALTER TABLE ONLY referencia.ref_persona_deportes ALTER COLUMN id SET DEFAULT nextval('referencia.ref_persona_deportes_id_seq'::regclass);
 J   ALTER TABLE referencia.ref_persona_deportes ALTER COLUMN id DROP DEFAULT;
    
   referencia       postgres    false    385    386    386            `           2604    21003    ref_persona_juegos id    DEFAULT     �   ALTER TABLE ONLY referencia.ref_persona_juegos ALTER COLUMN id SET DEFAULT nextval('referencia.ref_persona_juegos_id_seq'::regclass);
 H   ALTER TABLE referencia.ref_persona_juegos ALTER COLUMN id DROP DEFAULT;
    
   referencia       postgres    false    388    387    388            8          0    19313    apex_admin_album_fotos 
   TABLE DATA               �   COPY desarrollo.apex_admin_album_fotos (proyecto, usuario, foto_tipo, foto_nombre, foto_nodos_visibles, foto_opciones, predeterminada) FROM stdin;
 
   desarrollo       postgres    false    249   �      9          0    19321 !   apex_admin_param_previsualizazion 
   TABLE DATA               |   COPY desarrollo.apex_admin_param_previsualizazion (proyecto, usuario, grupo_acceso, punto_acceso, perfil_datos) FROM stdin;
 
   desarrollo       postgres    false    250   0�      l          0    19967    apex_admin_persistencia 
   TABLE DATA               a   COPY desarrollo.apex_admin_persistencia (ap, clase, archivo, descripcion, categoria) FROM stdin;
 
   desarrollo       postgres    false    301   ��      �           0    0    apex_admin_persistencia_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('desarrollo.apex_admin_persistencia_seq', 4, true);
         
   desarrollo       postgres    false    300            7          0    19305    apex_arbol_items_fotos 
   TABLE DATA               x   COPY desarrollo.apex_arbol_items_fotos (proyecto, usuario, foto_nombre, foto_nodos_visibles, foto_opciones) FROM stdin;
 
   desarrollo       postgres    false    248   p�                 0    18632    apex_checksum_proyectos 
   TABLE DATA               I   COPY desarrollo.apex_checksum_proyectos (checksum, proyecto) FROM stdin;
 
   desarrollo       postgres    false    193   ��      )          0    19107 
   apex_clase 
   TABLE DATA               �  COPY desarrollo.apex_clase (proyecto, clase, clase_tipo, archivo, descripcion, icono, descripcion_corta, editor_proyecto, editor_item, objeto_dr_proyecto, objeto_dr, utiliza_fuente_datos, screenshot, ancestro_proyecto, ancestro, instanciador_id, instanciador_proyecto, instanciador_item, editor_id, editor_ancestro_proyecto, editor_ancestro, plan_dump_objeto, sql_info, doc_clase, doc_db, doc_sql, vinculos, autodoc, parametro_a, parametro_b, parametro_c, exclusivo_toba, solicitud_tipo) FROM stdin;
 
   desarrollo       postgres    false    234   �      +          0    19129    apex_clase_relacion 
   TABLE DATA               o   COPY desarrollo.apex_clase_relacion (proyecto, clase_relacion, clase_contenedora, clase_contenida) FROM stdin;
 
   desarrollo       postgres    false    236   Y�      �           0    0    apex_clase_relacion_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('desarrollo.apex_clase_relacion_seq', 18, true);
         
   desarrollo       postgres    false    235            (          0    19098    apex_clase_tipo 
   TABLE DATA               t   COPY desarrollo.apex_clase_tipo (clase_tipo, descripcion_corta, descripcion, icono, orden, metodologia) FROM stdin;
 
   desarrollo       postgres    false    233   (�      �           0    0    apex_clase_tipo_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('desarrollo.apex_clase_tipo_seq', 10, true);
         
   desarrollo       postgres    false    232                      0    18816    apex_columna_estilo 
   TABLE DATA               f   COPY desarrollo.apex_columna_estilo (columna_estilo, css, descripcion, descripcion_corta) FROM stdin;
 
   desarrollo       postgres    false    209   ӧ      �           0    0    apex_columna_estilo_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('desarrollo.apex_columna_estilo_seq', 11, true);
         
   desarrollo       postgres    false    208                      0    18827    apex_columna_formato 
   TABLE DATA               �   COPY desarrollo.apex_columna_formato (columna_formato, funcion, archivo, descripcion, descripcion_corta, parametros, estilo_defecto) FROM stdin;
 
   desarrollo       postgres    false    211   ��      �           0    0    apex_columna_formato_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('desarrollo.apex_columna_formato_seq', 18, true);
         
   desarrollo       postgres    false    210                      0    18876    apex_consulta_php 
   TABLE DATA               �   COPY desarrollo.apex_consulta_php (proyecto, consulta_php, clase, archivo_clase, archivo, descripcion, punto_montaje) FROM stdin;
 
   desarrollo       postgres    false    216   ��      �           0    0    apex_consulta_php_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('desarrollo.apex_consulta_php_seq', 2, true);
         
   desarrollo       postgres    false    215            :          0    19329    apex_conversion 
   TABLE DATA               S   COPY desarrollo.apex_conversion (proyecto, conversion_aplicada, fecha) FROM stdin;
 
   desarrollo       postgres    false    251   S�      L          0    19539    apex_dimension 
   TABLE DATA               �   COPY desarrollo.apex_dimension (proyecto, dimension, nombre, descripcion, schema, tabla, col_id, col_desc, col_desc_separador, multitabla_col_tabla, multitabla_id_tabla, fuente_datos_proyecto, fuente_datos) FROM stdin;
 
   desarrollo       postgres    false    269   ��      N          0    19560    apex_dimension_gatillo 
   TABLE DATA               �   COPY desarrollo.apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) FROM stdin;
 
   desarrollo       postgres    false    271   =�      �           0    0    apex_dimension_gatillo_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('desarrollo.apex_dimension_gatillo_seq', 18, true);
         
   desarrollo       postgres    false    270            �           0    0    apex_dimension_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('desarrollo.apex_dimension_seq', 12, true);
         
   desarrollo       postgres    false    268                      0    18762    apex_elemento_formulario 
   TABLE DATA               �   COPY desarrollo.apex_elemento_formulario (elemento_formulario, padre, descripcion, parametros, proyecto, exclusivo_toba, obsoleto, es_seleccion, es_seleccion_multiple) FROM stdin;
 
   desarrollo       postgres    false    205   լ                0    18650    apex_estilo 
   TABLE DATA               Y   COPY desarrollo.apex_estilo (estilo, descripcion, proyecto, es_css3, paleta) FROM stdin;
 
   desarrollo       postgres    false    195   ۱      W          0    19680    apex_eventos_pantalla 
   TABLE DATA               ]   COPY desarrollo.apex_eventos_pantalla (pantalla, objeto_ci, evento_id, proyecto) FROM stdin;
 
   desarrollo       postgres    false    280   Z�                0    18698    apex_fuente_datos 
   TABLE DATA               :  COPY desarrollo.apex_fuente_datos (proyecto, fuente_datos, descripcion, descripcion_corta, fuente_datos_motor, host, punto_montaje, subclase_archivo, subclase_nombre, orden, schema, instancia_id, administrador, link_instancia, tiene_auditoria, parsea_errores, permisos_por_tabla, usuario, clave, base) FROM stdin;
 
   desarrollo       postgres    false    200   ӻ                0    18690    apex_fuente_datos_motor 
   TABLE DATA               Z   COPY desarrollo.apex_fuente_datos_motor (fuente_datos_motor, nombre, version) FROM stdin;
 
   desarrollo       postgres    false    199   ]�                0    18724    apex_fuente_datos_schemas 
   TABLE DATA               b   COPY desarrollo.apex_fuente_datos_schemas (proyecto, fuente_datos, nombre, principal) FROM stdin;
 
   desarrollo       postgres    false    201   �      P          0    19578    apex_gadgets 
   TABLE DATA               �   COPY desarrollo.apex_gadgets (gadget, proyecto, gadget_url, titulo, descripcion, tipo_gadget, subclase, subclase_archivo) FROM stdin;
 
   desarrollo       postgres    false    273   G�      �           0    0    apex_gadgets_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('desarrollo.apex_gadgets_seq', 4, true);
         
   desarrollo       postgres    false    272            g          0    19922    apex_grafico 
   TABLE DATA               _   COPY desarrollo.apex_grafico (grafico, descripcion_corta, descripcion, parametros) FROM stdin;
 
   desarrollo       postgres    false    296   �      �          0    20518 $   apex_grupo_acc_restriccion_funcional 
   TABLE DATA               v   COPY desarrollo.apex_grupo_acc_restriccion_funcional (proyecto, usuario_grupo_acc, restriccion_funcional) FROM stdin;
 
   desarrollo       postgres    false    344   N�      �          0    18610    apex_instancia 
   TABLE DATA               �   COPY desarrollo.apex_instancia (instancia, version, institucion, observaciones, administrador_1, administrador_2, administrador_3, creacion) FROM stdin;
 
   desarrollo       postgres    false    191   k�      $          0    19009 	   apex_item 
   TABLE DATA               �  COPY desarrollo.apex_item (item_id, proyecto, item, padre_id, padre_proyecto, padre, carpeta, nivel_acceso, solicitud_tipo, pagina_tipo_proyecto, pagina_tipo, actividad_buffer_proyecto, actividad_buffer, actividad_patron_proyecto, actividad_patron, nombre, descripcion, punto_montaje, actividad_accion, menu, orden, solicitud_registrar, solicitud_obs_tipo_proyecto, solicitud_obs_tipo, solicitud_observacion, solicitud_registrar_cron, prueba_directorios, zona_proyecto, zona, zona_orden, zona_listar, imagen_recurso_origen, imagen, parametro_a, parametro_b, parametro_c, publico, redirecciona, usuario, exportable, creacion, retrasar_headers) FROM stdin;
 
   desarrollo       postgres    false    229   ��      %          0    19065    apex_item_info 
   TABLE DATA               p   COPY desarrollo.apex_item_info (item_id, item_proyecto, item, descripcion_breve, descripcion_larga) FROM stdin;
 
   desarrollo       postgres    false    230   ��      ?          0    19370    apex_item_msg 
   TABLE DATA               �   COPY desarrollo.apex_item_msg (item_msg, msg_tipo, indice, item_id, item_proyecto, item, descripcion_corta, mensaje_a, mensaje_b, mensaje_c, mensaje_customizable, parametro_patron) FROM stdin;
 
   desarrollo       postgres    false    256   �      �           0    0    apex_item_msg_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('desarrollo.apex_item_msg_seq', 1, true);
         
   desarrollo       postgres    false    255            F          0    19454    apex_item_nota 
   TABLE DATA               �   COPY desarrollo.apex_item_nota (item_nota, nota_tipo, item_id, item_proyecto, item, usuario_origen, usuario_destino, titulo, texto, leido, bl, creacion) FROM stdin;
 
   desarrollo       postgres    false    263   ,�      �           0    0    apex_item_nota_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('desarrollo.apex_item_nota_seq', 1, true);
         
   desarrollo       postgres    false    262            6          0    19290    apex_item_objeto 
   TABLE DATA               c   COPY desarrollo.apex_item_objeto (item_id, proyecto, item, objeto, orden, inicializar) FROM stdin;
 
   desarrollo       postgres    false    247   I�      &          0    19078    apex_item_permisos_tablas 
   TABLE DATA               o   COPY desarrollo.apex_item_permisos_tablas (proyecto, item, fuente_datos, esquema, tabla, permisos) FROM stdin;
 
   desarrollo       postgres    false    231   ��                  0    0    apex_item_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('desarrollo.apex_item_seq', 4359, true);
         
   desarrollo       postgres    false    228            "          0    18989    apex_item_zona 
   TABLE DATA               �   COPY desarrollo.apex_item_zona (proyecto, zona, nombre, clave_editable, archivo, descripcion, consulta_archivo, consulta_clase, consulta_metodo, punto_montaje) FROM stdin;
 
   desarrollo       postgres    false    227   �                0    18664    apex_log_sistema_tipo 
   TABLE DATA               R   COPY desarrollo.apex_log_sistema_tipo (log_sistema_tipo, descripcion) FROM stdin;
 
   desarrollo       postgres    false    196   ��      �          0    20648 	   apex_menu 
   TABLE DATA               R   COPY desarrollo.apex_menu (proyecto, menu_id, descripcion, tipo_menu) FROM stdin;
 
   desarrollo       postgres    false    351   	�      �          0    20668    apex_menu_operaciones 
   TABLE DATA               x   COPY desarrollo.apex_menu_operaciones (proyecto, menu_id, menu_elemento, item, padre, descripcion, carpeta) FROM stdin;
 
   desarrollo       postgres    false    353   Q�                 0    0    apex_menu_operaciones_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('desarrollo.apex_menu_operaciones_seq', 38, true);
         
   desarrollo       postgres    false    352                      0    18642    apex_menu_tipos 
   TABLE DATA               Y   COPY desarrollo.apex_menu_tipos (menu, descripcion, archivo, soporta_frames) FROM stdin;
 
   desarrollo       postgres    false    194   �      |          0    20193    apex_molde_opciones_generacion 
   TABLE DATA               �   COPY desarrollo.apex_molde_opciones_generacion (proyecto, uso_autoload, origen_datos_cuadro, punto_montaje, carga_php_include, carga_php_clase) FROM stdin;
 
   desarrollo       postgres    false    317   ��      �          0    20255    apex_molde_operacion 
   TABLE DATA               �   COPY desarrollo.apex_molde_operacion (proyecto, molde, operacion_tipo, nombre, item, carpeta_archivos, prefijo_clases, fuente, punto_montaje) FROM stdin;
 
   desarrollo       postgres    false    323   ��      �          0    20321    apex_molde_operacion_abms 
   TABLE DATA               z  COPY desarrollo.apex_molde_operacion_abms (proyecto, molde, tabla, gen_usa_filtro, gen_separar_pantallas, filtro_comprobar_parametros, cuadro_eof, cuadro_eliminar_filas, cuadro_id, cuadro_forzar_filtro, cuadro_carga_origen, cuadro_carga_sql, cuadro_carga_php_include, cuadro_carga_php_clase, cuadro_carga_php_metodo, datos_tabla_validacion, apdb_pre, punto_montaje) FROM stdin;
 
   desarrollo       postgres    false    328   ��      �          0    20341    apex_molde_operacion_abms_fila 
   TABLE DATA               �  COPY desarrollo.apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) FROM stdin;
 
   desarrollo       postgres    false    330   Z�                 0    0 "   apex_molde_operacion_abms_fila_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('desarrollo.apex_molde_operacion_abms_fila_seq', 54, true);
         
   desarrollo       postgres    false    329            �          0    20387     apex_molde_operacion_importacion 
   TABLE DATA               m   COPY desarrollo.apex_molde_operacion_importacion (proyecto, molde, origen_item, origen_proyecto) FROM stdin;
 
   desarrollo       postgres    false    331   -      �          0    20293    apex_molde_operacion_log 
   TABLE DATA               \   COPY desarrollo.apex_molde_operacion_log (proyecto, molde, generacion, momento) FROM stdin;
 
   desarrollo       postgres    false    325   J      �          0    20307 "   apex_molde_operacion_log_elementos 
   TABLE DATA               n   COPY desarrollo.apex_molde_operacion_log_elementos (generacion, molde, id, tipo, proyecto, clave) FROM stdin;
 
   desarrollo       postgres    false    327   �                 0    0 &   apex_molde_operacion_log_elementos_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('desarrollo.apex_molde_operacion_log_elementos_seq', 9, true);
         
   desarrollo       postgres    false    326                       0    0    apex_molde_operacion_log_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('desarrollo.apex_molde_operacion_log_seq', 2, true);
         
   desarrollo       postgres    false    324                       0    0    apex_molde_operacion_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('desarrollo.apex_molde_operacion_seq', 6, true);
         
   desarrollo       postgres    false    322            ~          0    20213    apex_molde_operacion_tipo 
   TABLE DATA               �   COPY desarrollo.apex_molde_operacion_tipo (operacion_tipo, descripcion_corta, descripcion, clase, ci, icono, vista_previa, orden) FROM stdin;
 
   desarrollo       postgres    false    319   3      �          0    20224    apex_molde_operacion_tipo_dato 
   TABLE DATA               �   COPY desarrollo.apex_molde_operacion_tipo_dato (tipo_dato, descripcion_corta, descripcion, dt_tipo_dato, elemento_formulario, cuadro_estilo, cuadro_formato, orden, filtro_operador) FROM stdin;
 
   desarrollo       postgres    false    321   <                 0    0 "   apex_molde_operacion_tipo_dato_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('desarrollo.apex_molde_operacion_tipo_dato_seq', 1, true);
         
   desarrollo       postgres    false    320                       0    0    apex_molde_operacion_tipo_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('desarrollo.apex_molde_operacion_tipo_seq', 12, true);
         
   desarrollo       postgres    false    318            =          0    19349    apex_msg 
   TABLE DATA               �   COPY desarrollo.apex_msg (msg, indice, proyecto, msg_tipo, descripcion_corta, mensaje_a, mensaje_b, mensaje_c, mensaje_customizable) FROM stdin;
 
   desarrollo       postgres    false    254   y                 0    0    apex_msg_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('desarrollo.apex_msg_seq', 183, true);
         
   desarrollo       postgres    false    253            ;          0    19339    apex_msg_tipo 
   TABLE DATA               I   COPY desarrollo.apex_msg_tipo (msg_tipo, descripcion, icono) FROM stdin;
 
   desarrollo       postgres    false    252   ,V      
          0    18746    apex_nivel_acceso 
   TABLE DATA               R   COPY desarrollo.apex_nivel_acceso (nivel_acceso, nombre, descripcion) FROM stdin;
 
   desarrollo       postgres    false    203   gV      D          0    19422 	   apex_nota 
   TABLE DATA               �   COPY desarrollo.apex_nota (nota, nota_tipo, proyecto, usuario_origen, usuario_destino, titulo, texto, leido, bl, creacion) FROM stdin;
 
   desarrollo       postgres    false    261   �V      	           0    0    apex_nota_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('desarrollo.apex_nota_seq', 1, true);
         
   desarrollo       postgres    false    260            B          0    19412    apex_nota_tipo 
   TABLE DATA               K   COPY desarrollo.apex_nota_tipo (nota_tipo, descripcion, icono) FROM stdin;
 
   desarrollo       postgres    false    259   �V      
           0    0    apex_obj_ci_pantalla_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('desarrollo.apex_obj_ci_pantalla_seq', 1985, true);
         
   desarrollo       postgres    false    277                       0    0    apex_obj_ei_cuadro_cc_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('desarrollo.apex_obj_ei_cuadro_cc_seq', 29, true);
         
   desarrollo       postgres    false    282                       0    0    apex_obj_ei_cuadro_col_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('desarrollo.apex_obj_ei_cuadro_col_seq', 3633, true);
         
   desarrollo       postgres    false    284                       0    0    apex_obj_ei_form_fila_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('desarrollo.apex_obj_ei_form_fila_seq', 10654, true);
         
   desarrollo       postgres    false    288            -          0    19147    apex_objeto 
   TABLE DATA               �  COPY desarrollo.apex_objeto (proyecto, objeto, anterior, identificador, reflexivo, clase_proyecto, clase, punto_montaje, subclase, subclase_archivo, objeto_categoria_proyecto, objeto_categoria, nombre, titulo, colapsable, descripcion, fuente_datos_proyecto, fuente_datos, solicitud_registrar, solicitud_obj_obs_tipo, solicitud_obj_observacion, parametro_a, parametro_b, parametro_c, parametro_d, parametro_e, parametro_f, usuario, creacion, posicion_botonera) FROM stdin;
 
   desarrollo       postgres    false    238    W      U          0    19639    apex_objeto_ci_pantalla 
   TABLE DATA               
  COPY desarrollo.apex_objeto_ci_pantalla (objeto_ci_proyecto, objeto_ci, pantalla, identificador, orden, etiqueta, descripcion, tip, imagen_recurso_origen, imagen, objetos, eventos, subclase, subclase_archivo, template, template_impresion, punto_montaje) FROM stdin;
 
   desarrollo       postgres    false    278   8�      i          0    19945    apex_objeto_codigo 
   TABLE DATA               q   COPY desarrollo.apex_objeto_codigo (objeto_codigo_proyecto, objeto_codigo, descripcion, ancho, alto) FROM stdin;
 
   desarrollo       postgres    false    298   �      X          0    19695    apex_objeto_cuadro 
   TABLE DATA                 COPY desarrollo.apex_objeto_cuadro (objeto_cuadro_proyecto, objeto_cuadro, titulo, subtitulo, sql, columnas_clave, columna_descripcion, clave_dbr, archivos_callbacks, ancho, ordenar, paginar, tamano_pagina, tipo_paginado, mostrar_total_registros, eof_invisible, eof_customizado, siempre_con_titulo, exportar_paginado, exportar, exportar_rtf, pdf_propiedades, pdf_respetar_paginacion, asociacion_columnas, ev_seleccion, ev_eliminar, dao_nucleo_proyecto, dao_nucleo, dao_metodo, dao_parametros, desplegable, desplegable_activo, scroll, scroll_alto, cc_modo, cc_modo_anidado_colap, cc_modo_anidado_totcol, cc_modo_anidado_totcua) FROM stdin;
 
   desarrollo       postgres    false    281   A�      Z          0    19712    apex_objeto_cuadro_cc 
   TABLE DATA                 COPY desarrollo.apex_objeto_cuadro_cc (objeto_cuadro_proyecto, objeto_cuadro, objeto_cuadro_cc, identificador, descripcion, orden, columnas_id, columnas_descripcion, pie_contar_filas, pie_mostrar_titular, pie_mostrar_titulos, imp_paginar, modo_inicio_colapsado) FROM stdin;
 
   desarrollo       postgres    false    283   :      ]          0    19761    apex_objeto_cuadro_col_cc 
   TABLE DATA               �   COPY desarrollo.apex_objeto_cuadro_col_cc (objeto_cuadro_cc, objeto_cuadro_proyecto, objeto_cuadro, objeto_cuadro_col, total) FROM stdin;
 
   desarrollo       postgres    false    286   �      x          0    20120    apex_objeto_datos_rel 
   TABLE DATA               �   COPY desarrollo.apex_objeto_datos_rel (proyecto, objeto, debug, clave, ap, punto_montaje, ap_clase, ap_archivo, sinc_susp_constraints, sinc_orden_automatico, sinc_lock_optimista) FROM stdin;
 
   desarrollo       postgres    false    313   }      z          0    20149    apex_objeto_datos_rel_asoc 
   TABLE DATA               �   COPY desarrollo.apex_objeto_datos_rel_asoc (proyecto, objeto, asoc_id, identificador, padre_proyecto, padre_objeto, padre_id, padre_clave, hijo_proyecto, hijo_objeto, hijo_id, hijo_clave, cascada, orden) FROM stdin;
 
   desarrollo       postgres    false    315   B                 0    0    apex_objeto_datos_rel_asoc_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('desarrollo.apex_objeto_datos_rel_asoc_seq', 43, true);
         
   desarrollo       postgres    false    314            r          0    20042    apex_objeto_db_columna_fks 
   TABLE DATA               }   COPY desarrollo.apex_objeto_db_columna_fks (id, objeto_proyecto, objeto, tabla, columna, tabla_ext, columna_ext) FROM stdin;
 
   desarrollo       postgres    false    307   �                 0    0    apex_objeto_db_columna_fks_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('desarrollo.apex_objeto_db_columna_fks_seq', 1, true);
         
   desarrollo       postgres    false    306            n          0    19981    apex_objeto_db_registros 
   TABLE DATA                 COPY desarrollo.apex_objeto_db_registros (objeto_proyecto, objeto, max_registros, min_registros, punto_montaje, ap, ap_clase, ap_archivo, tabla, tabla_ext, alias, modificar_claves, fuente_datos_proyecto, fuente_datos, permite_actualizacion_automatica, esquema, esquema_ext) FROM stdin;
 
   desarrollo       postgres    false    303   �      p          0    20019    apex_objeto_db_registros_col 
   TABLE DATA               �   COPY desarrollo.apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) FROM stdin;
 
   desarrollo       postgres    false    305   |      t          0    20058    apex_objeto_db_registros_ext 
   TABLE DATA               �   COPY desarrollo.apex_objeto_db_registros_ext (objeto_proyecto, objeto, externa_id, tipo, sincro_continua, metodo, clase, include, punto_montaje, sql, dato_estricto, carga_dt, carga_consulta_php, permite_carga_masiva, metodo_masivo) FROM stdin;
 
   desarrollo       postgres    false    309   <      u          0    20089     apex_objeto_db_registros_ext_col 
   TABLE DATA               y   COPY desarrollo.apex_objeto_db_registros_ext_col (objeto_proyecto, objeto, externa_id, col_id, es_resultado) FROM stdin;
 
   desarrollo       postgres    false    310   �=      w          0    20106    apex_objeto_db_registros_uniq 
   TABLE DATA               g   COPY desarrollo.apex_objeto_db_registros_uniq (objeto_proyecto, objeto, uniq_id, columnas) FROM stdin;
 
   desarrollo       postgres    false    312   �>                 0    0    apex_objeto_dbr_columna_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('desarrollo.apex_objeto_dbr_columna_seq', 2838, true);
         
   desarrollo       postgres    false    304                       0    0    apex_objeto_dbr_ext_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('desarrollo.apex_objeto_dbr_ext_seq', 8, true);
         
   desarrollo       postgres    false    308                       0    0    apex_objeto_dbr_uniq_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('desarrollo.apex_objeto_dbr_uniq_seq', 11, true);
         
   desarrollo       postgres    false    311            2          0    19217    apex_objeto_dep_consumo 
   TABLE DATA               �   COPY desarrollo.apex_objeto_dep_consumo (proyecto, consumo_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar) FROM stdin;
 
   desarrollo       postgres    false    243   �?                 0    0    apex_objeto_dep_consumo_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('desarrollo.apex_objeto_dep_consumo_seq', 1, true);
         
   desarrollo       postgres    false    242                       0    0    apex_objeto_dep_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('desarrollo.apex_objeto_dep_seq', 3273, true);
         
   desarrollo       postgres    false    240            0          0    19194    apex_objeto_dependencias 
   TABLE DATA               �   COPY desarrollo.apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) FROM stdin;
 
   desarrollo       postgres    false    241   �?      \          0    19731    apex_objeto_ei_cuadro_columna 
   TABLE DATA               �  COPY desarrollo.apex_objeto_ei_cuadro_columna (objeto_cuadro_proyecto, objeto_cuadro, objeto_cuadro_col, clave, orden, titulo, estilo_titulo, estilo, ancho, formateo, vinculo_indice, no_ordenar, mostrar_xls, mostrar_pdf, pdf_propiedades, desabilitado, total, total_cc, usar_vinculo, vinculo_carpeta, vinculo_item, vinculo_popup, vinculo_popup_param, vinculo_target, vinculo_celda, vinculo_servicio, permitir_html, grupo, evento_asociado) FROM stdin;
 
   desarrollo       postgres    false    285   �\      c          0    19862    apex_objeto_ei_filtro 
   TABLE DATA               g   COPY desarrollo.apex_objeto_ei_filtro (objeto_ei_filtro_proyecto, objeto_ei_filtro, ancho) FROM stdin;
 
   desarrollo       postgres    false    292   Gs      e          0    19874    apex_objeto_ei_filtro_col 
   TABLE DATA               �  COPY desarrollo.apex_objeto_ei_filtro_col (objeto_ei_filtro_col, objeto_ei_filtro, objeto_ei_filtro_proyecto, tipo, nombre, expresion, etiqueta, descripcion, obligatorio, inicial, orden, estado_defecto, opciones_es_multiple, opciones_ef, carga_metodo, carga_clase, carga_include, carga_dt, carga_consulta_php, carga_sql, carga_fuente, carga_lista, carga_col_clave, carga_col_desc, carga_permite_no_seteado, carga_no_seteado, carga_no_seteado_ocultar, carga_maestros, edit_tamano, edit_maximo, edit_mascara, edit_unidad, edit_rango, edit_expreg, estilo, popup_item, popup_proyecto, popup_editable, popup_ventana, popup_carga_desc_metodo, popup_carga_desc_clase, popup_carga_desc_include, popup_puede_borrar_estado, punto_montaje, check_valor_si, check_valor_no, check_desc_si, check_desc_no, selec_cant_minima, selec_cant_maxima, selec_utilidades, selec_tamano, selec_ancho, selec_serializar, selec_cant_columnas, placeholder) FROM stdin;
 
   desarrollo       postgres    false    294   �s                 0    0    apex_objeto_ei_filtro_col_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('desarrollo.apex_objeto_ei_filtro_col_seq', 9, true);
         
   desarrollo       postgres    false    293            b          0    19852    apex_objeto_ei_filtro_tipo_col 
   TABLE DATA               ]   COPY desarrollo.apex_objeto_ei_filtro_tipo_col (tipo_col, descripcion, proyecto) FROM stdin;
 
   desarrollo       postgres    false    291   sx      j          0    19955    apex_objeto_ei_firma 
   TABLE DATA               j   COPY desarrollo.apex_objeto_ei_firma (objeto_ei_firma_proyecto, objeto_ei_firma, ancho, alto) FROM stdin;
 
   desarrollo       postgres    false    299   �x      `          0    19796    apex_objeto_ei_formulario_ef 
   TABLE DATA               G  COPY desarrollo.apex_objeto_ei_formulario_ef (objeto_ei_formulario_fila, objeto_ei_formulario, objeto_ei_formulario_proyecto, identificador, elemento_formulario, columnas, obligatorio, oculto_relaja_obligatorio, orden, etiqueta, etiqueta_estilo, descripcion, colapsado, desactivado, estilo, total, inicializacion, permitir_html, deshabilitar_rest_func, estado_defecto, solo_lectura, solo_lectura_modificacion, carga_metodo, carga_clase, carga_include, carga_dt, carga_consulta_php, carga_sql, carga_fuente, carga_lista, carga_col_clave, carga_col_desc, carga_maestros, carga_cascada_relaj, cascada_mantiene_estado, carga_permite_no_seteado, carga_no_seteado, carga_no_seteado_ocultar, edit_tamano, edit_maximo, edit_mascara, edit_unidad, edit_rango, edit_filas, edit_columnas, edit_wrap, edit_resaltar, edit_ajustable, edit_confirmar_clave, edit_expreg, popup_item, popup_proyecto, popup_editable, popup_ventana, popup_carga_desc_metodo, popup_carga_desc_clase, popup_carga_desc_include, popup_puede_borrar_estado, fieldset_fin, check_valor_si, check_valor_no, check_desc_si, check_desc_no, check_ml_toggle, fijo_sin_estado, editor_ancho, editor_alto, editor_botonera, selec_cant_minima, selec_cant_maxima, selec_utilidades, selec_tamano, selec_ancho, selec_serializar, selec_cant_columnas, upload_extensiones, punto_montaje, placeholder) FROM stdin;
 
   desarrollo       postgres    false    289   2y      a          0    19838    apex_objeto_esquema 
   TABLE DATA               �   COPY desarrollo.apex_objeto_esquema (objeto_esquema_proyecto, objeto_esquema, parser, descripcion, dot, debug, formato, modelo_ejecucion, modelo_ejecucion_cache, tipo_incrustacion, ancho, alto, dirigido, sql) FROM stdin;
 
   desarrollo       postgres    false    290   Bd      4          0    19240    apex_objeto_eventos 
   TABLE DATA                 COPY desarrollo.apex_objeto_eventos (proyecto, evento_id, objeto, identificador, etiqueta, maneja_datos, sobre_fila, confirmacion, estilo, imagen_recurso_origen, imagen, en_botonera, ayuda, orden, ci_predep, implicito, defecto, display_datos_cargados, grupo, accion, accion_imphtml_debug, accion_vinculo_carpeta, accion_vinculo_item, accion_vinculo_objeto, accion_vinculo_popup, accion_vinculo_popup_param, accion_vinculo_target, accion_vinculo_celda, accion_vinculo_servicio, es_seleccion_multiple, es_autovinculo) FROM stdin;
 
   desarrollo       postgres    false    245   �d                 0    0    apex_objeto_eventos_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('desarrollo.apex_objeto_eventos_seq', 171225, true);
         
   desarrollo       postgres    false    244            h          0    19930    apex_objeto_grafico 
   TABLE DATA               }   COPY desarrollo.apex_objeto_grafico (objeto_grafico_proyecto, objeto_grafico, descripcion, grafico, ancho, alto) FROM stdin;
 
   desarrollo       postgres    false    297   p�      .          0    19179    apex_objeto_info 
   TABLE DATA               m   COPY desarrollo.apex_objeto_info (objeto_proyecto, objeto, descripcion_breve, descripcion_larga) FROM stdin;
 
   desarrollo       postgres    false    239   ̛      f          0    19912    apex_objeto_mapa 
   TABLE DATA               _   COPY desarrollo.apex_objeto_mapa (objeto_mapa_proyecto, objeto_mapa, mapfile_path) FROM stdin;
 
   desarrollo       postgres    false    295   �      A          0    19393    apex_objeto_msg 
   TABLE DATA               �   COPY desarrollo.apex_objeto_msg (objeto_msg, msg_tipo, indice, objeto_proyecto, objeto, descripcion_corta, mensaje_a, mensaje_b, mensaje_c, mensaje_customizable, parametro_clase) FROM stdin;
 
   desarrollo       postgres    false    258   :�                 0    0    apex_objeto_msg_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('desarrollo.apex_objeto_msg_seq', 5, true);
         
   desarrollo       postgres    false    257            S          0    19619    apex_objeto_mt_me 
   TABLE DATA               d  COPY desarrollo.apex_objeto_mt_me (objeto_mt_me_proyecto, objeto_mt_me, ev_procesar_etiq, ev_cancelar_etiq, ancho, alto, posicion_botonera, tipo_navegacion, botonera_barra_item, con_toc, incremental, debug_eventos, activacion_procesar, activacion_cancelar, ev_procesar, ev_cancelar, objetos, post_procesar, metodo_despachador, metodo_opciones) FROM stdin;
 
   desarrollo       postgres    false    276   �      R          0    19614    apex_objeto_mt_me_tipo_nav 
   TABLE DATA               V   COPY desarrollo.apex_objeto_mt_me_tipo_nav (tipo_navegacion, descripcion) FROM stdin;
 
   desarrollo       postgres    false    275   W�      H          0    19486    apex_objeto_nota 
   TABLE DATA               �   COPY desarrollo.apex_objeto_nota (objeto_nota, nota_tipo, objeto_proyecto, objeto, usuario_origen, usuario_destino, titulo, texto, bl, leido, creacion) FROM stdin;
 
   desarrollo       postgres    false    265   ��                 0    0    apex_objeto_nota_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('desarrollo.apex_objeto_nota_seq', 1, true);
         
   desarrollo       postgres    false    264            {          0    20173    apex_objeto_rel_columnas_asoc 
   TABLE DATA               �   COPY desarrollo.apex_objeto_rel_columnas_asoc (proyecto, objeto, asoc_id, padre_objeto, padre_clave, hijo_objeto, hijo_clave) FROM stdin;
 
   desarrollo       postgres    false    316   ��                 0    0    apex_objeto_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('desarrollo.apex_objeto_seq', 4476, true);
         
   desarrollo       postgres    false    237            ^          0    19777    apex_objeto_ut_formulario 
   TABLE DATA               �  COPY desarrollo.apex_objeto_ut_formulario (objeto_ut_formulario_proyecto, objeto_ut_formulario, tabla, titulo, ev_agregar, ev_agregar_etiq, ev_mod_modificar, ev_mod_modificar_etiq, ev_mod_eliminar, ev_mod_eliminar_etiq, ev_mod_limpiar, ev_mod_limpiar_etiq, ev_mod_clave, clase_proyecto, clase, auto_reset, ancho, ancho_etiqueta, expandir_descripcion, campo_bl, scroll, filas, filas_agregar, filas_agregar_online, filas_agregar_abajo, filas_agregar_texto, filas_borrar_en_linea, filas_undo, filas_ordenar, filas_ordenar_en_linea, columna_orden, filas_numerar, ev_seleccion, alto, analisis_cambios, no_imprimir_efs_sin_estado, resaltar_efs_con_estado, template, template_impresion) FROM stdin;
 
   desarrollo       postgres    false    287   6�      V          0    19665    apex_objetos_pantalla 
   TABLE DATA               a   COPY desarrollo.apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) FROM stdin;
 
   desarrollo       postgres    false    279   �                0    18796    apex_pagina_tipo 
   TABLE DATA               �   COPY desarrollo.apex_pagina_tipo (proyecto, pagina_tipo, descripcion, clase_nombre, clase_archivo, include_arriba, include_abajo, exclusivo_toba, contexto, punto_montaje) FROM stdin;
 
   desarrollo       postgres    false    207   s�                0    18912    apex_perfil_datos_set_prueba 
   TABLE DATA               s   COPY desarrollo.apex_perfil_datos_set_prueba (proyecto, fuente_datos, lote, seleccionados, parametros) FROM stdin;
 
   desarrollo       postgres    false    219   c�      �          0    20399    apex_permiso 
   TABLE DATA               f   COPY desarrollo.apex_permiso (permiso, proyecto, nombre, descripcion, mensaje_particular) FROM stdin;
 
   desarrollo       postgres    false    333   ��      �          0    20486    apex_permiso_grupo_acc 
   TABLE DATA               Z   COPY desarrollo.apex_permiso_grupo_acc (proyecto, usuario_grupo_acc, permiso) FROM stdin;
 
   desarrollo       postgres    false    341   �                 0    0    apex_permiso_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('desarrollo.apex_permiso_seq', 13, true);
         
   desarrollo       postgres    false    332            �          0    18619    apex_proyecto 
   TABLE DATA               *  COPY desarrollo.apex_proyecto (proyecto, descripcion, descripcion_corta, estilo, con_frames, frames_clase, frames_archivo, pm_impresion, salida_impr_html_c, salida_impr_html_a, menu, path_includes, path_browser, administrador, listar_multiproyecto, orden, palabra_vinculo_std, version_toba, requiere_validacion, usuario_anonimo, usuario_anonimo_desc, usuario_anonimo_grupos_acc, validacion_intentos, validacion_intentos_min, validacion_bloquear_usuario, validacion_debug, sesion_tiempo_no_interac_min, sesion_tiempo_maximo_min, pm_sesion, sesion_subclase, sesion_subclase_archivo, pm_contexto, contexto_ejecucion_subclase, contexto_ejecucion_subclase_archivo, pm_usuario, usuario_subclase, usuario_subclase_archivo, encriptar_qs, registrar_solicitud, registrar_cronometro, item_inicio_sesion, item_pre_sesion, item_pre_sesion_popup, item_set_sesion, log_archivo, log_archivo_nivel, fuente_datos, pagina_tipo, version, version_fecha, version_detalle, version_link, tiempo_espera_ms, navegacion_ajax, codigo_ga_tracker, extension_toba, extension_proyecto) FROM stdin;
 
   desarrollo       postgres    false    192   F�                0    18841    apex_ptos_control 
   TABLE DATA               S   COPY desarrollo.apex_ptos_control (proyecto, pto_control, descripcion) FROM stdin;
 
   desarrollo       postgres    false    212   ��                0    18859    apex_ptos_control_ctrl 
   TABLE DATA               g   COPY desarrollo.apex_ptos_control_ctrl (proyecto, pto_control, clase, archivo, actua_como) FROM stdin;
 
   desarrollo       postgres    false    214   f�                0    18849    apex_ptos_control_param 
   TABLE DATA               W   COPY desarrollo.apex_ptos_control_param (proyecto, pto_control, parametro) FROM stdin;
 
   desarrollo       postgres    false    213   ��      5          0    19270    apex_ptos_control_x_evento 
   TABLE DATA               b   COPY desarrollo.apex_ptos_control_x_evento (proyecto, pto_control, evento_id, objeto) FROM stdin;
 
   desarrollo       postgres    false    246   }�                0    18674    apex_puntos_montaje 
   TABLE DATA               s   COPY desarrollo.apex_puntos_montaje (id, etiqueta, proyecto, proyecto_ref, descripcion, path_pm, tipo) FROM stdin;
 
   desarrollo       postgres    false    198   ��                 0    0    apex_puntos_montaje_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('desarrollo.apex_puntos_montaje_seq', 14, true);
         
   desarrollo       postgres    false    197            	          0    18738    apex_recurso_origen 
   TABLE DATA               N   COPY desarrollo.apex_recurso_origen (recurso_origen, descripcion) FROM stdin;
 
   desarrollo       postgres    false    202   ��      J          0    19518    apex_relacion_tablas 
   TABLE DATA               �   COPY desarrollo.apex_relacion_tablas (fuente_datos_proyecto, fuente_datos, proyecto, relacion_tablas, tabla_1, tabla_1_cols, tabla_2, tabla_2_cols) FROM stdin;
 
   desarrollo       postgres    false    267   ��                 0    0    apex_relacion_tablas_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('desarrollo.apex_relacion_tablas_seq', 18, true);
         
   desarrollo       postgres    false    266            �          0    20503    apex_restriccion_funcional 
   TABLE DATA               w   COPY desarrollo.apex_restriccion_funcional (proyecto, restriccion_funcional, descripcion, permite_edicion) FROM stdin;
 
   desarrollo       postgres    false    343   n�      �          0    20608    apex_restriccion_funcional_cols 
   TABLE DATA               �   COPY desarrollo.apex_restriccion_funcional_cols (proyecto, restriccion_funcional, item, objeto_cuadro, objeto_cuadro_col, no_visible) FROM stdin;
 
   desarrollo       postgres    false    349   ��      �          0    20528    apex_restriccion_funcional_ef 
   TABLE DATA               �   COPY desarrollo.apex_restriccion_funcional_ef (proyecto, restriccion_funcional, item, objeto_ei_formulario_fila, objeto_ei_formulario, no_visible, no_editable) FROM stdin;
 
   desarrollo       postgres    false    345   ��      �          0    20588    apex_restriccion_funcional_ei 
   TABLE DATA               v   COPY desarrollo.apex_restriccion_funcional_ei (proyecto, restriccion_funcional, item, objeto, no_visible) FROM stdin;
 
   desarrollo       postgres    false    348   �      �          0    20568    apex_restriccion_funcional_evt 
   TABLE DATA               z   COPY desarrollo.apex_restriccion_funcional_evt (proyecto, restriccion_funcional, item, evento_id, no_visible) FROM stdin;
 
   desarrollo       postgres    false    347   $�      �          0    20628 &   apex_restriccion_funcional_filtro_cols 
   TABLE DATA               �   COPY desarrollo.apex_restriccion_funcional_filtro_cols (proyecto, restriccion_funcional, item, objeto_ei_filtro_col, objeto_ei_filtro, no_visible) FROM stdin;
 
   desarrollo       postgres    false    350   A�      �          0    20548 #   apex_restriccion_funcional_pantalla 
   TABLE DATA               �   COPY desarrollo.apex_restriccion_funcional_pantalla (proyecto, restriccion_funcional, item, pantalla, objeto_ci, no_visible) FROM stdin;
 
   desarrollo       postgres    false    346   ��                 0    0    apex_restriccion_funcional_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('desarrollo.apex_restriccion_funcional_seq', 1, true);
         
   desarrollo       postgres    false    342            �          0    18606    apex_revision 
   TABLE DATA               I   COPY desarrollo.apex_revision (revision, proyecto, creacion) FROM stdin;
 
   desarrollo       postgres    false    190   ��      �          0    20726    apex_servicio_web 
   TABLE DATA               o   COPY desarrollo.apex_servicio_web (proyecto, servicio_web, descripcion, tipo, param_to, param_wsa) FROM stdin;
 
   desarrollo       postgres    false    356   ��      �          0    20741    apex_servicio_web_param 
   TABLE DATA               _   COPY desarrollo.apex_servicio_web_param (proyecto, servicio_web, parametro, valor) FROM stdin;
 
   desarrollo       postgres    false    357   ��                0    18783    apex_solicitud_obs_tipo 
   TABLE DATA               j   COPY desarrollo.apex_solicitud_obs_tipo (proyecto, solicitud_obs_tipo, descripcion, criterio) FROM stdin;
 
   desarrollo       postgres    false    206   ��                0    18754    apex_solicitud_tipo 
   TABLE DATA               h   COPY desarrollo.apex_solicitud_tipo (solicitud_tipo, descripcion, descripcion_corta, icono) FROM stdin;
 
   desarrollo       postgres    false    204   {�                0    18897 
   apex_tarea 
   TABLE DATA               �   COPY desarrollo.apex_tarea (proyecto, tarea, nombre, tarea_clase, tarea_objeto, ejecucion_proxima, intervalo_repeticion) FROM stdin;
 
   desarrollo       postgres    false    218   ��                 0    0    apex_tarea_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('desarrollo.apex_tarea_seq', 1, true);
         
   desarrollo       postgres    false    217            m          0    19976    apex_tipo_datos 
   TABLE DATA               @   COPY desarrollo.apex_tipo_datos (tipo, descripcion) FROM stdin;
 
   desarrollo       postgres    false    302   ��                0    18930    apex_usuario 
   TABLE DATA               b  COPY desarrollo.apex_usuario (usuario, clave, nombre, email, autentificacion, bloqueado, parametro_a, parametro_b, parametro_c, solicitud_registrar, solicitud_obs_tipo_proyecto, solicitud_obs_tipo, solicitud_observacion, usuario_tipodoc, pre, ciu, suf, telefono, vencimiento, dias, hora_entrada, hora_salida, ip_permitida, forzar_cambio_pwd) FROM stdin;
 
   desarrollo       postgres    false    221   �      �          0    20447    apex_usuario_grupo_acc 
   TABLE DATA               �   COPY desarrollo.apex_usuario_grupo_acc (proyecto, usuario_grupo_acc, nombre, nivel_acceso, descripcion, vencimiento, dias, hora_entrada, hora_salida, listar, permite_edicion, menu_usuario) FROM stdin;
 
   desarrollo       postgres    false    338   ��      �          0    20471    apex_usuario_grupo_acc_item 
   TABLE DATA               e   COPY desarrollo.apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) FROM stdin;
 
   desarrollo       postgres    false    340   ��      �          0    20456    apex_usuario_grupo_acc_miembros 
   TABLE DATA               w   COPY desarrollo.apex_usuario_grupo_acc_miembros (proyecto, usuario_grupo_acc, usuario_grupo_acc_pertenece) FROM stdin;
 
   desarrollo       postgres    false    339   c�      �          0    20412    apex_usuario_perfil_datos 
   TABLE DATA               t   COPY desarrollo.apex_usuario_perfil_datos (proyecto, usuario_perfil_datos, nombre, descripcion, listar) FROM stdin;
 
   desarrollo       postgres    false    335   ��      �          0    20428    apex_usuario_perfil_datos_dims 
   TABLE DATA               x   COPY desarrollo.apex_usuario_perfil_datos_dims (proyecto, usuario_perfil_datos, dimension, elemento, clave) FROM stdin;
 
   desarrollo       postgres    false    337   ��                 0    0 "   apex_usuario_perfil_datos_dims_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('desarrollo.apex_usuario_perfil_datos_dims_seq', 26, true);
         
   desarrollo       postgres    false    336                        0    0    apex_usuario_perfil_datos_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('desarrollo.apex_usuario_perfil_datos_seq', 6, true);
         
   desarrollo       postgres    false    334                      0    18958    apex_usuario_pregunta_secreta 
   TABLE DATA               w   COPY desarrollo.apex_usuario_pregunta_secreta (cod_pregunta_secreta, usuario, pregunta, respuesta, activa) FROM stdin;
 
   desarrollo       postgres    false    224   )�      !           0    0 !   apex_usuario_pregunta_secreta_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('desarrollo.apex_usuario_pregunta_secreta_seq', 1, false);
         
   desarrollo       postgres    false    223            �          0    20693    apex_usuario_proyecto 
   TABLE DATA               o   COPY desarrollo.apex_usuario_proyecto (proyecto, usuario_grupo_acc, usuario, usuario_perfil_datos) FROM stdin;
 
   desarrollo       postgres    false    354   F�      Q          0    19592    apex_usuario_proyecto_gadgets 
   TABLE DATA               i   COPY desarrollo.apex_usuario_proyecto_gadgets (usuario, proyecto, gadget, orden, eliminable) FROM stdin;
 
   desarrollo       postgres    false    274   ��      �          0    20711 "   apex_usuario_proyecto_perfil_datos 
   TABLE DATA               i   COPY desarrollo.apex_usuario_proyecto_perfil_datos (proyecto, usuario_perfil_datos, usuario) FROM stdin;
 
   desarrollo       postgres    false    355   ��                0    18946    apex_usuario_pwd_reset 
   TABLE DATA               `   COPY desarrollo.apex_usuario_pwd_reset (usuario, random, email, validez, bloqueado) FROM stdin;
 
   desarrollo       postgres    false    222   ��      !          0    18975    apex_usuario_pwd_usados 
   TABLE DATA               o   COPY desarrollo.apex_usuario_pwd_usados (cod_pwd_pasados, usuario, clave, algoritmo, fecha_cambio) FROM stdin;
 
   desarrollo       postgres    false    226   ��      "           0    0    apex_usuario_pwd_usados_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('desarrollo.apex_usuario_pwd_usados_seq', 1, false);
         
   desarrollo       postgres    false    225                      0    18925    apex_usuario_tipodoc 
   TABLE DATA               P   COPY desarrollo.apex_usuario_tipodoc (usuario_tipodoc, descripcion) FROM stdin;
 
   desarrollo       postgres    false    220   �      �          0    20909    apex_log_error_login 
   TABLE DATA               �   COPY desarrollo_logs.apex_log_error_login (log_error_login, momento, usuario, clave, ip, gravedad, mensaje, punto_acceso) FROM stdin;
    desarrollo_logs       postgres    false    370   S�      #           0    0    apex_log_error_login_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('desarrollo_logs.apex_log_error_login_seq', 5, true);
            desarrollo_logs       postgres    false    369            �          0    20919    apex_log_ip_rechazada 
   TABLE DATA               E   COPY desarrollo_logs.apex_log_ip_rechazada (ip, momento) FROM stdin;
    desarrollo_logs       postgres    false    371   ��      �          0    20938    apex_log_objeto 
   TABLE DATA               |   COPY desarrollo_logs.apex_log_objeto (log_objeto, momento, usuario, objeto_proyecto, objeto, item, observacion) FROM stdin;
    desarrollo_logs       postgres    false    375   �      $           0    0    apex_log_objeto_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('desarrollo_logs.apex_log_objeto_seq', 43, true);
            desarrollo_logs       postgres    false    374            �          0    20897    apex_log_sistema 
   TABLE DATA               s   COPY desarrollo_logs.apex_log_sistema (log_sistema, momento, usuario, log_sistema_tipo, observaciones) FROM stdin;
    desarrollo_logs       postgres    false    368   ��      %           0    0    apex_log_sistema_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('desarrollo_logs.apex_log_sistema_seq', 1, true);
            desarrollo_logs       postgres    false    367            �          0    20927    apex_log_tarea 
   TABLE DATA               {   COPY desarrollo_logs.apex_log_tarea (proyecto, log_tarea, tarea, nombre, tarea_clase, tarea_objeto, ejecucion) FROM stdin;
    desarrollo_logs       postgres    false    373   ��      &           0    0    apex_log_tarea_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('desarrollo_logs.apex_log_tarea_seq', 1, true);
            desarrollo_logs       postgres    false    372            �          0    20828    apex_sesion_browser 
   TABLE DATA               �   COPY desarrollo_logs.apex_sesion_browser (sesion_browser, proyecto, usuario, ingreso, egreso, observaciones, php_id, ip, punto_acceso) FROM stdin;
    desarrollo_logs       postgres    false    361   ��      '           0    0    apex_sesion_browser_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('desarrollo_logs.apex_sesion_browser_seq', 25, true);
            desarrollo_logs       postgres    false    360            �          0    20819    apex_solicitud 
   TABLE DATA               �   COPY desarrollo_logs.apex_solicitud (proyecto, solicitud, solicitud_tipo, item_proyecto, item, item_id, momento, tiempo_respuesta) FROM stdin;
    desarrollo_logs       postgres    false    359   $�      �          0    20838    apex_solicitud_browser 
   TABLE DATA               ~   COPY desarrollo_logs.apex_solicitud_browser (proyecto, sesion_browser, solicitud_proyecto, solicitud_browser, ip) FROM stdin;
    desarrollo_logs       postgres    false    362   ��      �          0    20853    apex_solicitud_consola 
   TABLE DATA               u   COPY desarrollo_logs.apex_solicitud_consola (proyecto, solicitud_consola, usuario, ip, llamada, entorno) FROM stdin;
    desarrollo_logs       postgres    false    363   ��      �          0    20866    apex_solicitud_cronometro 
   TABLE DATA               x   COPY desarrollo_logs.apex_solicitud_cronometro (proyecto, solicitud, marca, nivel_ejecucion, texto, tiempo) FROM stdin;
    desarrollo_logs       postgres    false    364    �      �          0    20881    apex_solicitud_observacion 
   TABLE DATA               �   COPY desarrollo_logs.apex_solicitud_observacion (proyecto, solicitud, solicitud_observacion, solicitud_obs_tipo_proyecto, solicitud_obs_tipo, observacion) FROM stdin;
    desarrollo_logs       postgres    false    366   ��      (           0    0    apex_solicitud_observacion_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('desarrollo_logs.apex_solicitud_observacion_seq', 1, true);
            desarrollo_logs       postgres    false    365            )           0    0    apex_solicitud_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('desarrollo_logs.apex_solicitud_seq', 569, true);
            desarrollo_logs       postgres    false    358            �          0    20948    apex_solicitud_web_service 
   TABLE DATA               ^   COPY desarrollo_logs.apex_solicitud_web_service (proyecto, solicitud, metodo, ip) FROM stdin;
    desarrollo_logs       postgres    false    376   ��      �          0    21004    iso_countries 
   TABLE DATA               l   COPY referencia.iso_countries (rowid, countryid, locale, countrycode, countryname, phoneprefix) FROM stdin;
 
   referencia       postgres    false    389   �      �          0    20964    ref_deportes 
   TABLE DATA               Q   COPY referencia.ref_deportes (id, nombre, descripcion, fecha_inicio) FROM stdin;
 
   referencia       postgres    false    378   0	      *           0    0    ref_deportes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('referencia.ref_deportes_id_seq', 8, true);
         
   referencia       postgres    false    377            �          0    20970 
   ref_juegos 
   TABLE DATA               J   COPY referencia.ref_juegos (id, nombre, descripcion, de_mesa) FROM stdin;
 
   referencia       postgres    false    380   �	      +           0    0    ref_juegos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('referencia.ref_juegos_id_seq', 5, true);
         
   referencia       postgres    false    379            �          0    20977    ref_juegos_oferta 
   TABLE DATA               P   COPY referencia.ref_juegos_oferta (id, juego, jugador, publicacion) FROM stdin;
 
   referencia       postgres    false    382   �	      ,           0    0    ref_juegos_oferta_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('referencia.ref_juegos_oferta_id_seq', 1, false);
         
   referencia       postgres    false    381            �          0    20984    ref_persona 
   TABLE DATA               l   COPY referencia.ref_persona (id, nombre, fecha_nac, imagen, planilla_pdf, planilla_pdf_firmada) FROM stdin;
 
   referencia       postgres    false    384   	      �          0    20994    ref_persona_deportes 
   TABLE DATA               k   COPY referencia.ref_persona_deportes (id, persona, deporte, dia_semana, hora_inicio, hora_fin) FROM stdin;
 
   referencia       postgres    false    386   W	      -           0    0    ref_persona_deportes_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('referencia.ref_persona_deportes_id_seq', 3, true);
         
   referencia       postgres    false    385            .           0    0    ref_persona_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('referencia.ref_persona_id_seq', 2, true);
         
   referencia       postgres    false    383            �          0    21000    ref_persona_juegos 
   TABLE DATA               g   COPY referencia.ref_persona_juegos (id, persona, juego, dia_semana, hora_inicio, hora_fin) FROM stdin;
 
   referencia       postgres    false    388   �	      /           0    0    ref_persona_juegos_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('referencia.ref_persona_juegos_id_seq', 3, true);
         
   referencia       postgres    false    387            �           2606    19320 0   apex_admin_album_fotos apex_admin_album_fotos_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_admin_album_fotos
    ADD CONSTRAINT apex_admin_album_fotos_pk PRIMARY KEY (proyecto, usuario, foto_nombre, foto_tipo);
 ^   ALTER TABLE ONLY desarrollo.apex_admin_album_fotos DROP CONSTRAINT apex_admin_album_fotos_pk;
    
   desarrollo         postgres    false    249    249    249    249    249            �           2606    19328 :   apex_admin_param_previsualizazion apex_admin_param_prev_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_admin_param_previsualizazion
    ADD CONSTRAINT apex_admin_param_prev_pk PRIMARY KEY (proyecto, usuario);
 h   ALTER TABLE ONLY desarrollo.apex_admin_param_previsualizazion DROP CONSTRAINT apex_admin_param_prev_pk;
    
   desarrollo         postgres    false    250    250    250                       2606    19975 2   apex_admin_persistencia apex_admin_persistencia_pk 
   CONSTRAINT     t   ALTER TABLE ONLY desarrollo.apex_admin_persistencia
    ADD CONSTRAINT apex_admin_persistencia_pk PRIMARY KEY (ap);
 `   ALTER TABLE ONLY desarrollo.apex_admin_persistencia DROP CONSTRAINT apex_admin_persistencia_pk;
    
   desarrollo         postgres    false    301    301            �           2606    19312 0   apex_arbol_items_fotos apex_arbol_items_fotos_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_arbol_items_fotos
    ADD CONSTRAINT apex_arbol_items_fotos_pk PRIMARY KEY (proyecto, usuario, foto_nombre);
 ^   ALTER TABLE ONLY desarrollo.apex_arbol_items_fotos DROP CONSTRAINT apex_arbol_items_fotos_pk;
    
   desarrollo         postgres    false    248    248    248    248            i           2606    18636 2   apex_checksum_proyectos apex_checksum_proyectos_pk 
   CONSTRAINT     z   ALTER TABLE ONLY desarrollo.apex_checksum_proyectos
    ADD CONSTRAINT apex_checksum_proyectos_pk PRIMARY KEY (proyecto);
 `   ALTER TABLE ONLY desarrollo.apex_checksum_proyectos DROP CONSTRAINT apex_checksum_proyectos_pk;
    
   desarrollo         postgres    false    193    193            �           2606    19114    apex_clase apex_clase_pk 
   CONSTRAINT     g   ALTER TABLE ONLY desarrollo.apex_clase
    ADD CONSTRAINT apex_clase_pk PRIMARY KEY (proyecto, clase);
 F   ALTER TABLE ONLY desarrollo.apex_clase DROP CONSTRAINT apex_clase_pk;
    
   desarrollo         postgres    false    234    234    234            �           2606    19134 %   apex_clase_relacion apex_clase_rel_pk 
   CONSTRAINT     s   ALTER TABLE ONLY desarrollo.apex_clase_relacion
    ADD CONSTRAINT apex_clase_rel_pk PRIMARY KEY (clase_relacion);
 S   ALTER TABLE ONLY desarrollo.apex_clase_relacion DROP CONSTRAINT apex_clase_rel_pk;
    
   desarrollo         postgres    false    236    236            �           2606    19106 "   apex_clase_tipo apex_clase_tipo_pk 
   CONSTRAINT     l   ALTER TABLE ONLY desarrollo.apex_clase_tipo
    ADD CONSTRAINT apex_clase_tipo_pk PRIMARY KEY (clase_tipo);
 P   ALTER TABLE ONLY desarrollo.apex_clase_tipo DROP CONSTRAINT apex_clase_tipo_pk;
    
   desarrollo         postgres    false    233    233            �           2606    19116    apex_clase apex_clase_uq 
   CONSTRAINT     X   ALTER TABLE ONLY desarrollo.apex_clase
    ADD CONSTRAINT apex_clase_uq UNIQUE (clase);
 F   ALTER TABLE ONLY desarrollo.apex_clase DROP CONSTRAINT apex_clase_uq;
    
   desarrollo         postgres    false    234    234            �           2606    18824 *   apex_columna_estilo apex_columna_estilo_pk 
   CONSTRAINT     x   ALTER TABLE ONLY desarrollo.apex_columna_estilo
    ADD CONSTRAINT apex_columna_estilo_pk PRIMARY KEY (columna_estilo);
 X   ALTER TABLE ONLY desarrollo.apex_columna_estilo DROP CONSTRAINT apex_columna_estilo_pk;
    
   desarrollo         postgres    false    209    209            �           2606    18835 ,   apex_columna_formato apex_columna_formato_pk 
   CONSTRAINT     {   ALTER TABLE ONLY desarrollo.apex_columna_formato
    ADD CONSTRAINT apex_columna_formato_pk PRIMARY KEY (columna_formato);
 Z   ALTER TABLE ONLY desarrollo.apex_columna_formato DROP CONSTRAINT apex_columna_formato_pk;
    
   desarrollo         postgres    false    211    211            �           2606    18884 &   apex_consulta_php apex_consulta_php_pk 
   CONSTRAINT     |   ALTER TABLE ONLY desarrollo.apex_consulta_php
    ADD CONSTRAINT apex_consulta_php_pk PRIMARY KEY (consulta_php, proyecto);
 T   ALTER TABLE ONLY desarrollo.apex_consulta_php DROP CONSTRAINT apex_consulta_php_pk;
    
   desarrollo         postgres    false    216    216    216            �           2606    19333 "   apex_conversion apex_conversion_pk 
   CONSTRAINT        ALTER TABLE ONLY desarrollo.apex_conversion
    ADD CONSTRAINT apex_conversion_pk PRIMARY KEY (proyecto, conversion_aplicada);
 P   ALTER TABLE ONLY desarrollo.apex_conversion DROP CONSTRAINT apex_conversion_pk;
    
   desarrollo         postgres    false    251    251    251            �           2606    19568 0   apex_dimension_gatillo apex_dimension_gatillo_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_dimension_gatillo
    ADD CONSTRAINT apex_dimension_gatillo_pk PRIMARY KEY (proyecto, gatillo);
 ^   ALTER TABLE ONLY desarrollo.apex_dimension_gatillo DROP CONSTRAINT apex_dimension_gatillo_pk;
    
   desarrollo         postgres    false    271    271    271            �           2606    19570 6   apex_dimension_gatillo apex_dimension_gatillo_uq_tabla 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_dimension_gatillo
    ADD CONSTRAINT apex_dimension_gatillo_uq_tabla UNIQUE (proyecto, dimension, tabla_rel_dim);
 d   ALTER TABLE ONLY desarrollo.apex_dimension_gatillo DROP CONSTRAINT apex_dimension_gatillo_uq_tabla;
    
   desarrollo         postgres    false    271    271    271    271            �           2606    19547     apex_dimension apex_dimension_pk 
   CONSTRAINT     s   ALTER TABLE ONLY desarrollo.apex_dimension
    ADD CONSTRAINT apex_dimension_pk PRIMARY KEY (proyecto, dimension);
 N   ALTER TABLE ONLY desarrollo.apex_dimension DROP CONSTRAINT apex_dimension_pk;
    
   desarrollo         postgres    false    269    269    269                       2606    19807 ,   apex_objeto_ei_formulario_ef apex_ei_f_ef_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef
    ADD CONSTRAINT apex_ei_f_ef_pk PRIMARY KEY (objeto_ei_formulario_fila, objeto_ei_formulario, objeto_ei_formulario_proyecto);
 Z   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef DROP CONSTRAINT apex_ei_f_ef_pk;
    
   desarrollo         postgres    false    289    289    289    289                       2606    19886 /   apex_objeto_ei_filtro_col apex_ei_filtro_col_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col
    ADD CONSTRAINT apex_ei_filtro_col_pk PRIMARY KEY (objeto_ei_filtro_col, objeto_ei_filtro, objeto_ei_filtro_proyecto);
 ]   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col DROP CONSTRAINT apex_ei_filtro_col_pk;
    
   desarrollo         postgres    false    294    294    294    294                       2606    19866 '   apex_objeto_ei_filtro apex_ei_filtro_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro
    ADD CONSTRAINT apex_ei_filtro_pk PRIMARY KEY (objeto_ei_filtro_proyecto, objeto_ei_filtro);
 U   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro DROP CONSTRAINT apex_ei_filtro_pk;
    
   desarrollo         postgres    false    292    292    292                       2606    19856 9   apex_objeto_ei_filtro_tipo_col apex_ei_filtro_tipo_col_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_tipo_col
    ADD CONSTRAINT apex_ei_filtro_tipo_col_pk PRIMARY KEY (tipo_col);
 g   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_tipo_col DROP CONSTRAINT apex_ei_filtro_tipo_col_pk;
    
   desarrollo         postgres    false    291    291            �           2606    18772 '   apex_elemento_formulario apex_elform_pk 
   CONSTRAINT     z   ALTER TABLE ONLY desarrollo.apex_elemento_formulario
    ADD CONSTRAINT apex_elform_pk PRIMARY KEY (elemento_formulario);
 U   ALTER TABLE ONLY desarrollo.apex_elemento_formulario DROP CONSTRAINT apex_elform_pk;
    
   desarrollo         postgres    false    205    205            m           2606    18658    apex_estilo apex_estilo_pk 
   CONSTRAINT     j   ALTER TABLE ONLY desarrollo.apex_estilo
    ADD CONSTRAINT apex_estilo_pk PRIMARY KEY (estilo, proyecto);
 H   ALTER TABLE ONLY desarrollo.apex_estilo DROP CONSTRAINT apex_estilo_pk;
    
   desarrollo         postgres    false    195    195    195            �           2606    19684 .   apex_eventos_pantalla apex_eventos_pantalla_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_eventos_pantalla
    ADD CONSTRAINT apex_eventos_pantalla_pk PRIMARY KEY (pantalla, objeto_ci, proyecto, evento_id);
 \   ALTER TABLE ONLY desarrollo.apex_eventos_pantalla DROP CONSTRAINT apex_eventos_pantalla_pk;
    
   desarrollo         postgres    false    280    280    280    280    280            u           2606    18697 2   apex_fuente_datos_motor apex_fuente_datos_motor_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_fuente_datos_motor
    ADD CONSTRAINT apex_fuente_datos_motor_pk PRIMARY KEY (fuente_datos_motor);
 `   ALTER TABLE ONLY desarrollo.apex_fuente_datos_motor DROP CONSTRAINT apex_fuente_datos_motor_pk;
    
   desarrollo         postgres    false    199    199            w           2606    18708 &   apex_fuente_datos apex_fuente_datos_pk 
   CONSTRAINT     |   ALTER TABLE ONLY desarrollo.apex_fuente_datos
    ADD CONSTRAINT apex_fuente_datos_pk PRIMARY KEY (proyecto, fuente_datos);
 T   ALTER TABLE ONLY desarrollo.apex_fuente_datos DROP CONSTRAINT apex_fuente_datos_pk;
    
   desarrollo         postgres    false    200    200    200            y           2606    18732 6   apex_fuente_datos_schemas apex_fuente_datos_schemas_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_fuente_datos_schemas
    ADD CONSTRAINT apex_fuente_datos_schemas_pk PRIMARY KEY (proyecto, fuente_datos, nombre);
 d   ALTER TABLE ONLY desarrollo.apex_fuente_datos_schemas DROP CONSTRAINT apex_fuente_datos_schemas_pk;
    
   desarrollo         postgres    false    201    201    201    201            �           2606    19586    apex_gadgets apex_gadget_pk 
   CONSTRAINT     k   ALTER TABLE ONLY desarrollo.apex_gadgets
    ADD CONSTRAINT apex_gadget_pk PRIMARY KEY (proyecto, gadget);
 I   ALTER TABLE ONLY desarrollo.apex_gadgets DROP CONSTRAINT apex_gadget_pk;
    
   desarrollo         postgres    false    273    273    273            ^           2606    20522 L   apex_grupo_acc_restriccion_funcional apex_grupo_acc_restriccion_funcional_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_grupo_acc_restriccion_funcional
    ADD CONSTRAINT apex_grupo_acc_restriccion_funcional_pk PRIMARY KEY (usuario_grupo_acc, restriccion_funcional, proyecto);
 z   ALTER TABLE ONLY desarrollo.apex_grupo_acc_restriccion_funcional DROP CONSTRAINT apex_grupo_acc_restriccion_funcional_pk;
    
   desarrollo         postgres    false    344    344    344    344            e           2606    18618     apex_instancia apex_instancia_pk 
   CONSTRAINT     i   ALTER TABLE ONLY desarrollo.apex_instancia
    ADD CONSTRAINT apex_instancia_pk PRIMARY KEY (instancia);
 N   ALTER TABLE ONLY desarrollo.apex_instancia DROP CONSTRAINT apex_instancia_pk;
    
   desarrollo         postgres    false    191    191            �           2606    19294 )   apex_item_objeto apex_item_consumo_obj_pk 
   CONSTRAINT        ALTER TABLE ONLY desarrollo.apex_item_objeto
    ADD CONSTRAINT apex_item_consumo_obj_pk PRIMARY KEY (proyecto, item, objeto);
 W   ALTER TABLE ONLY desarrollo.apex_item_objeto DROP CONSTRAINT apex_item_consumo_obj_pk;
    
   desarrollo         postgres    false    247    247    247    247            �           2606    19072     apex_item_info apex_item_info_pk 
   CONSTRAINT     s   ALTER TABLE ONLY desarrollo.apex_item_info
    ADD CONSTRAINT apex_item_info_pk PRIMARY KEY (item_proyecto, item);
 N   ALTER TABLE ONLY desarrollo.apex_item_info DROP CONSTRAINT apex_item_info_pk;
    
   desarrollo         postgres    false    230    230    230            �           2606    19378    apex_item_msg apex_item_msg_pk 
   CONSTRAINT     u   ALTER TABLE ONLY desarrollo.apex_item_msg
    ADD CONSTRAINT apex_item_msg_pk PRIMARY KEY (item_msg, item_proyecto);
 L   ALTER TABLE ONLY desarrollo.apex_item_msg DROP CONSTRAINT apex_item_msg_pk;
    
   desarrollo         postgres    false    256    256    256            �           2606    19380    apex_item_msg apex_item_msg_uk 
   CONSTRAINT     _   ALTER TABLE ONLY desarrollo.apex_item_msg
    ADD CONSTRAINT apex_item_msg_uk UNIQUE (indice);
 L   ALTER TABLE ONLY desarrollo.apex_item_msg DROP CONSTRAINT apex_item_msg_uk;
    
   desarrollo         postgres    false    256    256            �           2606    19463     apex_item_nota apex_item_nota_pk 
   CONSTRAINT     i   ALTER TABLE ONLY desarrollo.apex_item_nota
    ADD CONSTRAINT apex_item_nota_pk PRIMARY KEY (item_nota);
 N   ALTER TABLE ONLY desarrollo.apex_item_nota DROP CONSTRAINT apex_item_nota_pk;
    
   desarrollo         postgres    false    263    263            �           2606    19085 6   apex_item_permisos_tablas apex_item_permisos_tablas_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_permisos_tablas
    ADD CONSTRAINT apex_item_permisos_tablas_pk PRIMARY KEY (proyecto, item, fuente_datos, tabla);
 d   ALTER TABLE ONLY desarrollo.apex_item_permisos_tablas DROP CONSTRAINT apex_item_permisos_tablas_pk;
    
   desarrollo         postgres    false    231    231    231    231    231            �           2606    19019    apex_item apex_item_pk 
   CONSTRAINT     d   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_pk PRIMARY KEY (item, proyecto);
 D   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_pk;
    
   desarrollo         postgres    false    229    229    229            �           2606    18996     apex_item_zona apex_item_zona_pk 
   CONSTRAINT     n   ALTER TABLE ONLY desarrollo.apex_item_zona
    ADD CONSTRAINT apex_item_zona_pk PRIMARY KEY (proyecto, zona);
 N   ALTER TABLE ONLY desarrollo.apex_item_zona DROP CONSTRAINT apex_item_zona_pk;
    
   desarrollo         postgres    false    227    227    227            o           2606    18671 .   apex_log_sistema_tipo apex_log_sistema_tipo_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY desarrollo.apex_log_sistema_tipo
    ADD CONSTRAINT apex_log_sistema_tipo_pk PRIMARY KEY (log_sistema_tipo);
 \   ALTER TABLE ONLY desarrollo.apex_log_sistema_tipo DROP CONSTRAINT apex_log_sistema_tipo_pk;
    
   desarrollo         postgres    false    196    196            n           2606    20677 .   apex_menu_operaciones apex_menu_operaciones_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_menu_operaciones
    ADD CONSTRAINT apex_menu_operaciones_pk PRIMARY KEY (proyecto, menu_id, menu_elemento);
 \   ALTER TABLE ONLY desarrollo.apex_menu_operaciones DROP CONSTRAINT apex_menu_operaciones_pk;
    
   desarrollo         postgres    false    353    353    353    353            l           2606    20655    apex_menu apex_menu_pk 
   CONSTRAINT     g   ALTER TABLE ONLY desarrollo.apex_menu
    ADD CONSTRAINT apex_menu_pk PRIMARY KEY (proyecto, menu_id);
 D   ALTER TABLE ONLY desarrollo.apex_menu DROP CONSTRAINT apex_menu_pk;
    
   desarrollo         postgres    false    351    351    351            k           2606    18649 "   apex_menu_tipos apex_menu_tipos_pk 
   CONSTRAINT     f   ALTER TABLE ONLY desarrollo.apex_menu_tipos
    ADD CONSTRAINT apex_menu_tipos_pk PRIMARY KEY (menu);
 P   ALTER TABLE ONLY desarrollo.apex_menu_tipos DROP CONSTRAINT apex_menu_tipos_pk;
    
   desarrollo         postgres    false    194    194            6           2606    20200 @   apex_molde_opciones_generacion apex_molde_opciones_generacion_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_opciones_generacion
    ADD CONSTRAINT apex_molde_opciones_generacion_pk PRIMARY KEY (proyecto);
 n   ALTER TABLE ONLY desarrollo.apex_molde_opciones_generacion DROP CONSTRAINT apex_molde_opciones_generacion_pk;
    
   desarrollo         postgres    false    317    317            F           2606    20349 @   apex_molde_operacion_abms_fila apex_molde_operacion_abms_fila_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila
    ADD CONSTRAINT apex_molde_operacion_abms_fila_pk PRIMARY KEY (fila, molde, proyecto);
 n   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila DROP CONSTRAINT apex_molde_operacion_abms_fila_pk;
    
   desarrollo         postgres    false    330    330    330    330            H           2606    20351 @   apex_molde_operacion_abms_fila apex_molde_operacion_abms_fila_uq 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila
    ADD CONSTRAINT apex_molde_operacion_abms_fila_uq UNIQUE (proyecto, molde, columna);
 n   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila DROP CONSTRAINT apex_molde_operacion_abms_fila_uq;
    
   desarrollo         postgres    false    330    330    330    330            D           2606    20328 6   apex_molde_operacion_abms apex_molde_operacion_abms_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms
    ADD CONSTRAINT apex_molde_operacion_abms_pk PRIMARY KEY (proyecto, molde);
 d   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms DROP CONSTRAINT apex_molde_operacion_abms_pk;
    
   desarrollo         postgres    false    328    328    328            J           2606    20391 <   apex_molde_operacion_importacion apex_molde_operacion_imp_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_importacion
    ADD CONSTRAINT apex_molde_operacion_imp_pk PRIMARY KEY (proyecto, molde);
 j   ALTER TABLE ONLY desarrollo.apex_molde_operacion_importacion DROP CONSTRAINT apex_molde_operacion_imp_pk;
    
   desarrollo         postgres    false    331    331    331            <           2606    20265 .   apex_molde_operacion apex_molde_operacion_item 
   CONSTRAINT     w   ALTER TABLE ONLY desarrollo.apex_molde_operacion
    ADD CONSTRAINT apex_molde_operacion_item UNIQUE (proyecto, item);
 \   ALTER TABLE ONLY desarrollo.apex_molde_operacion DROP CONSTRAINT apex_molde_operacion_item;
    
   desarrollo         postgres    false    323    323    323            B           2606    20315 @   apex_molde_operacion_log_elementos apex_molde_operacion_log_e_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_log_elementos
    ADD CONSTRAINT apex_molde_operacion_log_e_pk PRIMARY KEY (id);
 n   ALTER TABLE ONLY desarrollo.apex_molde_operacion_log_elementos DROP CONSTRAINT apex_molde_operacion_log_e_pk;
    
   desarrollo         postgres    false    327    327            @           2606    20299 4   apex_molde_operacion_log apex_molde_operacion_log_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY desarrollo.apex_molde_operacion_log
    ADD CONSTRAINT apex_molde_operacion_log_pk PRIMARY KEY (generacion);
 b   ALTER TABLE ONLY desarrollo.apex_molde_operacion_log DROP CONSTRAINT apex_molde_operacion_log_pk;
    
   desarrollo         postgres    false    325    325            >           2606    20263 ,   apex_molde_operacion apex_molde_operacion_pk 
   CONSTRAINT     {   ALTER TABLE ONLY desarrollo.apex_molde_operacion
    ADD CONSTRAINT apex_molde_operacion_pk PRIMARY KEY (molde, proyecto);
 Z   ALTER TABLE ONLY desarrollo.apex_molde_operacion DROP CONSTRAINT apex_molde_operacion_pk;
    
   desarrollo         postgres    false    323    323    323            :           2606    20232 @   apex_molde_operacion_tipo_dato apex_molde_operacion_tipo_dato_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato
    ADD CONSTRAINT apex_molde_operacion_tipo_dato_pk PRIMARY KEY (tipo_dato);
 n   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato DROP CONSTRAINT apex_molde_operacion_tipo_dato_pk;
    
   desarrollo         postgres    false    321    321            8           2606    20221 6   apex_molde_operacion_tipo apex_molde_operacion_tipo_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo
    ADD CONSTRAINT apex_molde_operacion_tipo_pk PRIMARY KEY (operacion_tipo);
 d   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo DROP CONSTRAINT apex_molde_operacion_tipo_pk;
    
   desarrollo         postgres    false    319    319            �           2606    19357    apex_msg apex_msg_pk 
   CONSTRAINT     a   ALTER TABLE ONLY desarrollo.apex_msg
    ADD CONSTRAINT apex_msg_pk PRIMARY KEY (msg, proyecto);
 B   ALTER TABLE ONLY desarrollo.apex_msg DROP CONSTRAINT apex_msg_pk;
    
   desarrollo         postgres    false    254    254    254            �           2606    19346    apex_msg_tipo apex_msg_tipo_pk 
   CONSTRAINT     f   ALTER TABLE ONLY desarrollo.apex_msg_tipo
    ADD CONSTRAINT apex_msg_tipo_pk PRIMARY KEY (msg_tipo);
 L   ALTER TABLE ONLY desarrollo.apex_msg_tipo DROP CONSTRAINT apex_msg_tipo_pk;
    
   desarrollo         postgres    false    252    252            }           2606    18753 &   apex_nivel_acceso apex_nivel_acceso_pk 
   CONSTRAINT     r   ALTER TABLE ONLY desarrollo.apex_nivel_acceso
    ADD CONSTRAINT apex_nivel_acceso_pk PRIMARY KEY (nivel_acceso);
 T   ALTER TABLE ONLY desarrollo.apex_nivel_acceso DROP CONSTRAINT apex_nivel_acceso_pk;
    
   desarrollo         postgres    false    203    203            �           2606    19431    apex_nota apex_nota_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY desarrollo.apex_nota
    ADD CONSTRAINT apex_nota_pk PRIMARY KEY (nota);
 D   ALTER TABLE ONLY desarrollo.apex_nota DROP CONSTRAINT apex_nota_pk;
    
   desarrollo         postgres    false    261    261            �           2606    19419     apex_nota_tipo apex_nota_tipo_pk 
   CONSTRAINT     i   ALTER TABLE ONLY desarrollo.apex_nota_tipo
    ADD CONSTRAINT apex_nota_tipo_pk PRIMARY KEY (nota_tipo);
 N   ALTER TABLE ONLY desarrollo.apex_nota_tipo DROP CONSTRAINT apex_nota_tipo_pk;
    
   desarrollo         postgres    false    259    259            �           2606    19647 +   apex_objeto_ci_pantalla apex_obj_ci_pan__pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla
    ADD CONSTRAINT apex_obj_ci_pan__pk PRIMARY KEY (pantalla, objeto_ci, objeto_ci_proyecto);
 Y   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla DROP CONSTRAINT apex_obj_ci_pan__pk;
    
   desarrollo         postgres    false    278    278    278    278            �           2606    19649 +   apex_objeto_ci_pantalla apex_obj_ci_pan__uk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla
    ADD CONSTRAINT apex_obj_ci_pan__uk UNIQUE (objeto_ci_proyecto, objeto_ci, identificador);
 Y   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla DROP CONSTRAINT apex_obj_ci_pan__uk;
    
   desarrollo         postgres    false    278    278    278    278            �           2606    19721 +   apex_objeto_cuadro_cc apex_obj_cuadro_cc_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_cc
    ADD CONSTRAINT apex_obj_cuadro_cc_pk PRIMARY KEY (objeto_cuadro_cc, objeto_cuadro_proyecto, objeto_cuadro);
 Y   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_cc DROP CONSTRAINT apex_obj_cuadro_cc_pk;
    
   desarrollo         postgres    false    283    283    283    283                        2606    19723 +   apex_objeto_cuadro_cc apex_obj_cuadro_cc_uq 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_cc
    ADD CONSTRAINT apex_obj_cuadro_cc_uq UNIQUE (objeto_cuadro_proyecto, objeto_cuadro, identificador);
 Y   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_cc DROP CONSTRAINT apex_obj_cuadro_cc_uq;
    
   desarrollo         postgres    false    283    283    283    283            2           2606    20157 5   apex_objeto_datos_rel_asoc apex_obj_datos_rel_asoc_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel_asoc
    ADD CONSTRAINT apex_obj_datos_rel_asoc_pk PRIMARY KEY (asoc_id, objeto, proyecto);
 c   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel_asoc DROP CONSTRAINT apex_obj_datos_rel_asoc_pk;
    
   desarrollo         postgres    false    315    315    315    315            (           2606    20050 1   apex_objeto_db_columna_fks apex_obj_db_col_fks_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_columna_fks
    ADD CONSTRAINT apex_obj_db_col_fks_pk PRIMARY KEY (id, objeto, objeto_proyecto);
 _   ALTER TABLE ONLY desarrollo.apex_objeto_db_columna_fks DROP CONSTRAINT apex_obj_db_col_fks_pk;
    
   desarrollo         postgres    false    307    307    307    307            $           2606    20027 0   apex_objeto_db_registros_col apex_obj_dbr_col_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_col
    ADD CONSTRAINT apex_obj_dbr_col_pk PRIMARY KEY (col_id, objeto, objeto_proyecto);
 ^   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_col DROP CONSTRAINT apex_obj_dbr_col_pk;
    
   desarrollo         postgres    false    305    305    305    305            ,           2606    20093 8   apex_objeto_db_registros_ext_col apex_obj_dbr_ext_col_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext_col
    ADD CONSTRAINT apex_obj_dbr_ext_col_pk PRIMARY KEY (externa_id, col_id, objeto, objeto_proyecto);
 f   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext_col DROP CONSTRAINT apex_obj_dbr_ext_col_pk;
    
   desarrollo         postgres    false    310    310    310    310    310            *           2606    20068 0   apex_objeto_db_registros_ext apex_obj_dbr_ext_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext
    ADD CONSTRAINT apex_obj_dbr_ext_pk PRIMARY KEY (externa_id, objeto, objeto_proyecto);
 ^   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext DROP CONSTRAINT apex_obj_dbr_ext_pk;
    
   desarrollo         postgres    false    309    309    309    309            .           2606    20114 2   apex_objeto_db_registros_uniq apex_obj_dbr_uniq_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_uniq
    ADD CONSTRAINT apex_obj_dbr_uniq_pk PRIMARY KEY (uniq_id, objeto, objeto_proyecto);
 `   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_uniq DROP CONSTRAINT apex_obj_dbr_uniq_pk;
    
   desarrollo         postgres    false    312    312    312    312            &           2606    20029 0   apex_objeto_db_registros_col apex_obj_dbr_uq_col 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_col
    ADD CONSTRAINT apex_obj_dbr_uq_col UNIQUE (objeto_proyecto, objeto, columna);
 ^   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_col DROP CONSTRAINT apex_obj_dbr_uq_col;
    
   desarrollo         postgres    false    305    305    305    305                       2606    19740 3   apex_objeto_ei_cuadro_columna apex_obj_ei_cuadro_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna
    ADD CONSTRAINT apex_obj_ei_cuadro_pk PRIMARY KEY (objeto_cuadro_col, objeto_cuadro, objeto_cuadro_proyecto);
 a   ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna DROP CONSTRAINT apex_obj_ei_cuadro_pk;
    
   desarrollo         postgres    false    285    285    285    285                       2606    19949 (   apex_objeto_codigo apex_objeto_codigo_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_codigo
    ADD CONSTRAINT apex_objeto_codigo_pk PRIMARY KEY (objeto_codigo_proyecto, objeto_codigo);
 V   ALTER TABLE ONLY desarrollo.apex_objeto_codigo DROP CONSTRAINT apex_objeto_codigo_pk;
    
   desarrollo         postgres    false    298    298    298            �           2606    19225 4   apex_objeto_dep_consumo apex_objeto_consumo_depen_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY desarrollo.apex_objeto_dep_consumo
    ADD CONSTRAINT apex_objeto_consumo_depen_pk PRIMARY KEY (consumo_id);
 b   ALTER TABLE ONLY desarrollo.apex_objeto_dep_consumo DROP CONSTRAINT apex_objeto_consumo_depen_pk;
    
   desarrollo         postgres    false    243    243            �           2606    19227 4   apex_objeto_dep_consumo apex_objeto_consumo_depen_uq 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_dep_consumo
    ADD CONSTRAINT apex_objeto_consumo_depen_uq UNIQUE (proyecto, objeto_consumidor, identificador);
 b   ALTER TABLE ONLY desarrollo.apex_objeto_dep_consumo DROP CONSTRAINT apex_objeto_consumo_depen_uq;
    
   desarrollo         postgres    false    243    243    243    243                       2606    19766 6   apex_objeto_cuadro_col_cc apex_objeto_cuadro_col_cc_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_col_cc
    ADD CONSTRAINT apex_objeto_cuadro_col_cc_pk PRIMARY KEY (objeto_cuadro_cc, objeto_cuadro_proyecto, objeto_cuadro, objeto_cuadro_col);
 d   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_col_cc DROP CONSTRAINT apex_objeto_cuadro_col_cc_pk;
    
   desarrollo         postgres    false    286    286    286    286    286            �           2606    19704 (   apex_objeto_cuadro apex_objeto_cuadro_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro
    ADD CONSTRAINT apex_objeto_cuadro_pk PRIMARY KEY (objeto_cuadro, objeto_cuadro_proyecto);
 V   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro DROP CONSTRAINT apex_objeto_cuadro_pk;
    
   desarrollo         postgres    false    281    281    281            0           2606    20131 .   apex_objeto_datos_rel apex_objeto_datos_rel_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel
    ADD CONSTRAINT apex_objeto_datos_rel_pk PRIMARY KEY (objeto, proyecto);
 \   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel DROP CONSTRAINT apex_objeto_datos_rel_pk;
    
   desarrollo         postgres    false    313    313    313                        2606    19989 +   apex_objeto_db_registros apex_objeto_dbr_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros
    ADD CONSTRAINT apex_objeto_dbr_pk PRIMARY KEY (objeto, objeto_proyecto);
 Y   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros DROP CONSTRAINT apex_objeto_dbr_pk;
    
   desarrollo         postgres    false    303    303    303            "           2606    19991 1   apex_objeto_db_registros apex_objeto_dbr_uq_tabla 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros
    ADD CONSTRAINT apex_objeto_dbr_uq_tabla UNIQUE (fuente_datos_proyecto, fuente_datos, tabla);
 _   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros DROP CONSTRAINT apex_objeto_dbr_uq_tabla;
    
   desarrollo         postgres    false    303    303    303    303            �           2606    19202 -   apex_objeto_dependencias apex_objeto_depen_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_dependencias
    ADD CONSTRAINT apex_objeto_depen_pk PRIMARY KEY (dep_id, proyecto, objeto_consumidor);
 [   ALTER TABLE ONLY desarrollo.apex_objeto_dependencias DROP CONSTRAINT apex_objeto_depen_pk;
    
   desarrollo         postgres    false    241    241    241    241            �           2606    19204 -   apex_objeto_dependencias apex_objeto_depen_uq 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_dependencias
    ADD CONSTRAINT apex_objeto_depen_uq UNIQUE (proyecto, objeto_consumidor, identificador);
 [   ALTER TABLE ONLY desarrollo.apex_objeto_dependencias DROP CONSTRAINT apex_objeto_depen_uq;
    
   desarrollo         postgres    false    241    241    241    241                       2606    19959 ,   apex_objeto_ei_firma apex_objeto_ei_firma_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_firma
    ADD CONSTRAINT apex_objeto_ei_firma_pk PRIMARY KEY (objeto_ei_firma_proyecto, objeto_ei_firma);
 Z   ALTER TABLE ONLY desarrollo.apex_objeto_ei_firma DROP CONSTRAINT apex_objeto_ei_firma_pk;
    
   desarrollo         postgres    false    299    299    299            
           2606    19846 *   apex_objeto_esquema apex_objeto_esquema_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_esquema
    ADD CONSTRAINT apex_objeto_esquema_pk PRIMARY KEY (objeto_esquema_proyecto, objeto_esquema);
 X   ALTER TABLE ONLY desarrollo.apex_objeto_esquema DROP CONSTRAINT apex_objeto_esquema_pk;
    
   desarrollo         postgres    false    290    290    290            �           2606    19252 *   apex_objeto_eventos apex_objeto_eventos_pk 
   CONSTRAINT     }   ALTER TABLE ONLY desarrollo.apex_objeto_eventos
    ADD CONSTRAINT apex_objeto_eventos_pk PRIMARY KEY (evento_id, proyecto);
 X   ALTER TABLE ONLY desarrollo.apex_objeto_eventos DROP CONSTRAINT apex_objeto_eventos_pk;
    
   desarrollo         postgres    false    245    245    245            �           2606    19254 *   apex_objeto_eventos apex_objeto_eventos_uq 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_eventos
    ADD CONSTRAINT apex_objeto_eventos_uq UNIQUE (proyecto, objeto, identificador);
 X   ALTER TABLE ONLY desarrollo.apex_objeto_eventos DROP CONSTRAINT apex_objeto_eventos_uq;
    
   desarrollo         postgres    false    245    245    245    245                       2606    19934 *   apex_objeto_grafico apex_objeto_grafico_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_grafico
    ADD CONSTRAINT apex_objeto_grafico_pk PRIMARY KEY (objeto_grafico_proyecto, objeto_grafico);
 X   ALTER TABLE ONLY desarrollo.apex_objeto_grafico DROP CONSTRAINT apex_objeto_grafico_pk;
    
   desarrollo         postgres    false    297    297    297            �           2606    19158 (   apex_objeto apex_objeto_identificador_uq 
   CONSTRAINT     z   ALTER TABLE ONLY desarrollo.apex_objeto
    ADD CONSTRAINT apex_objeto_identificador_uq UNIQUE (proyecto, identificador);
 V   ALTER TABLE ONLY desarrollo.apex_objeto DROP CONSTRAINT apex_objeto_identificador_uq;
    
   desarrollo         postgres    false    238    238    238            �           2606    19186 $   apex_objeto_info apex_objeto_info_pk 
   CONSTRAINT     {   ALTER TABLE ONLY desarrollo.apex_objeto_info
    ADD CONSTRAINT apex_objeto_info_pk PRIMARY KEY (objeto_proyecto, objeto);
 R   ALTER TABLE ONLY desarrollo.apex_objeto_info DROP CONSTRAINT apex_objeto_info_pk;
    
   desarrollo         postgres    false    239    239    239                       2606    19916 $   apex_objeto_mapa apex_objeto_mapa_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_mapa
    ADD CONSTRAINT apex_objeto_mapa_pk PRIMARY KEY (objeto_mapa_proyecto, objeto_mapa);
 R   ALTER TABLE ONLY desarrollo.apex_objeto_mapa DROP CONSTRAINT apex_objeto_mapa_pk;
    
   desarrollo         postgres    false    295    295    295            �           2606    19401 "   apex_objeto_msg apex_objeto_msg_pk 
   CONSTRAINT     }   ALTER TABLE ONLY desarrollo.apex_objeto_msg
    ADD CONSTRAINT apex_objeto_msg_pk PRIMARY KEY (objeto_msg, objeto_proyecto);
 P   ALTER TABLE ONLY desarrollo.apex_objeto_msg DROP CONSTRAINT apex_objeto_msg_pk;
    
   desarrollo         postgres    false    258    258    258            �           2606    19626 &   apex_objeto_mt_me apex_objeto_mt_me_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_mt_me
    ADD CONSTRAINT apex_objeto_mt_me_pk PRIMARY KEY (objeto_mt_me_proyecto, objeto_mt_me);
 T   ALTER TABLE ONLY desarrollo.apex_objeto_mt_me DROP CONSTRAINT apex_objeto_mt_me_pk;
    
   desarrollo         postgres    false    276    276    276            �           2606    19618 2   apex_objeto_mt_me_tipo_nav apex_objeto_mt_me_tn_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_mt_me_tipo_nav
    ADD CONSTRAINT apex_objeto_mt_me_tn_pk PRIMARY KEY (tipo_navegacion);
 `   ALTER TABLE ONLY desarrollo.apex_objeto_mt_me_tipo_nav DROP CONSTRAINT apex_objeto_mt_me_tn_pk;
    
   desarrollo         postgres    false    275    275            �           2606    19495 $   apex_objeto_nota apex_objeto_nota_pk 
   CONSTRAINT     o   ALTER TABLE ONLY desarrollo.apex_objeto_nota
    ADD CONSTRAINT apex_objeto_nota_pk PRIMARY KEY (objeto_nota);
 R   ALTER TABLE ONLY desarrollo.apex_objeto_nota DROP CONSTRAINT apex_objeto_nota_pk;
    
   desarrollo         postgres    false    265    265            �           2606    19156    apex_objeto apex_objeto_pk 
   CONSTRAINT     j   ALTER TABLE ONLY desarrollo.apex_objeto
    ADD CONSTRAINT apex_objeto_pk PRIMARY KEY (objeto, proyecto);
 H   ALTER TABLE ONLY desarrollo.apex_objeto DROP CONSTRAINT apex_objeto_pk;
    
   desarrollo         postgres    false    238    238    238            4           2606    20177 >   apex_objeto_rel_columnas_asoc apex_objeto_rel_columnas_asoc_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_rel_columnas_asoc
    ADD CONSTRAINT apex_objeto_rel_columnas_asoc_pk PRIMARY KEY (asoc_id, objeto, proyecto, padre_objeto, hijo_objeto, padre_clave, hijo_clave);
 l   ALTER TABLE ONLY desarrollo.apex_objeto_rel_columnas_asoc DROP CONSTRAINT apex_objeto_rel_columnas_asoc_pk;
    
   desarrollo         postgres    false    316    316    316    316    316    316    316    316                       2606    19788 -   apex_objeto_ut_formulario apex_objeto_ut_f_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ut_formulario
    ADD CONSTRAINT apex_objeto_ut_f_pk PRIMARY KEY (objeto_ut_formulario, objeto_ut_formulario_proyecto);
 [   ALTER TABLE ONLY desarrollo.apex_objeto_ut_formulario DROP CONSTRAINT apex_objeto_ut_f_pk;
    
   desarrollo         postgres    false    287    287    287            �           2606    19669 .   apex_objetos_pantalla apex_objetos_pantalla_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objetos_pantalla
    ADD CONSTRAINT apex_objetos_pantalla_pk PRIMARY KEY (proyecto, objeto_ci, pantalla, dep_id);
 \   ALTER TABLE ONLY desarrollo.apex_objetos_pantalla DROP CONSTRAINT apex_objetos_pantalla_pk;
    
   desarrollo         postgres    false    279    279    279    279    279            �           2606    18803 $   apex_pagina_tipo apex_pagina_tipo_pk 
   CONSTRAINT     y   ALTER TABLE ONLY desarrollo.apex_pagina_tipo
    ADD CONSTRAINT apex_pagina_tipo_pk PRIMARY KEY (proyecto, pagina_tipo);
 R   ALTER TABLE ONLY desarrollo.apex_pagina_tipo DROP CONSTRAINT apex_pagina_tipo_pk;
    
   desarrollo         postgres    false    207    207    207            Z           2606    20490 ,   apex_permiso_grupo_acc apex_per_grupo_acc_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_permiso_grupo_acc
    ADD CONSTRAINT apex_per_grupo_acc_pk PRIMARY KEY (usuario_grupo_acc, permiso, proyecto);
 Z   ALTER TABLE ONLY desarrollo.apex_permiso_grupo_acc DROP CONSTRAINT apex_per_grupo_acc_pk;
    
   desarrollo         postgres    false    341    341    341    341            L           2606    20407    apex_permiso apex_per_pk 
   CONSTRAINT     i   ALTER TABLE ONLY desarrollo.apex_permiso
    ADD CONSTRAINT apex_per_pk PRIMARY KEY (permiso, proyecto);
 F   ALTER TABLE ONLY desarrollo.apex_permiso DROP CONSTRAINT apex_per_pk;
    
   desarrollo         postgres    false    333    333    333            N           2606    20409    apex_permiso apex_per_uq_nombre 
   CONSTRAINT     j   ALTER TABLE ONLY desarrollo.apex_permiso
    ADD CONSTRAINT apex_per_uq_nombre UNIQUE (proyecto, nombre);
 M   ALTER TABLE ONLY desarrollo.apex_permiso DROP CONSTRAINT apex_per_uq_nombre;
    
   desarrollo         postgres    false    333    333    333            �           2606    18919 <   apex_perfil_datos_set_prueba apex_perfil_datos_set_prueba_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_perfil_datos_set_prueba
    ADD CONSTRAINT apex_perfil_datos_set_prueba_pk PRIMARY KEY (proyecto, fuente_datos);
 j   ALTER TABLE ONLY desarrollo.apex_perfil_datos_set_prueba DROP CONSTRAINT apex_perfil_datos_set_prueba_pk;
    
   desarrollo         postgres    false    219    219    219            g           2606    18631    apex_proyecto apex_proyecto_pk 
   CONSTRAINT     f   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_proyecto_pk PRIMARY KEY (proyecto);
 L   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_proyecto_pk;
    
   desarrollo         postgres    false    192    192            �           2606    18848 '   apex_ptos_control apex_ptos_control__pk 
   CONSTRAINT     |   ALTER TABLE ONLY desarrollo.apex_ptos_control
    ADD CONSTRAINT apex_ptos_control__pk PRIMARY KEY (proyecto, pto_control);
 U   ALTER TABLE ONLY desarrollo.apex_ptos_control DROP CONSTRAINT apex_ptos_control__pk;
    
   desarrollo         postgres    false    212    212    212            �           2606    18868 .   apex_ptos_control_ctrl apex_ptos_ctrl_ctrl__pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_ptos_control_ctrl
    ADD CONSTRAINT apex_ptos_ctrl_ctrl__pk PRIMARY KEY (proyecto, pto_control, clase);
 \   ALTER TABLE ONLY desarrollo.apex_ptos_control_ctrl DROP CONSTRAINT apex_ptos_ctrl_ctrl__pk;
    
   desarrollo         postgres    false    214    214    214    214            �           2606    18853 0   apex_ptos_control_param apex_ptos_ctrl_param__pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_ptos_control_param
    ADD CONSTRAINT apex_ptos_ctrl_param__pk PRIMARY KEY (proyecto, pto_control, parametro);
 ^   ALTER TABLE ONLY desarrollo.apex_ptos_control_param DROP CONSTRAINT apex_ptos_ctrl_param__pk;
    
   desarrollo         postgres    false    213    213    213    213            �           2606    19274 3   apex_ptos_control_x_evento apex_ptos_ctrl_x_evt__pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_ptos_control_x_evento
    ADD CONSTRAINT apex_ptos_ctrl_x_evt__pk PRIMARY KEY (proyecto, pto_control, evento_id);
 a   ALTER TABLE ONLY desarrollo.apex_ptos_control_x_evento DROP CONSTRAINT apex_ptos_ctrl_x_evt__pk;
    
   desarrollo         postgres    false    246    246    246    246            q           2606    18682 )   apex_puntos_montaje apex_punto_montaje_pk 
   CONSTRAINT     u   ALTER TABLE ONLY desarrollo.apex_puntos_montaje
    ADD CONSTRAINT apex_punto_montaje_pk PRIMARY KEY (id, proyecto);
 W   ALTER TABLE ONLY desarrollo.apex_puntos_montaje DROP CONSTRAINT apex_punto_montaje_pk;
    
   desarrollo         postgres    false    198    198    198            s           2606    18684 =   apex_puntos_montaje apex_puntos_montaje_etiqueta_proyecto_key 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_puntos_montaje
    ADD CONSTRAINT apex_puntos_montaje_etiqueta_proyecto_key UNIQUE (etiqueta, proyecto);
 k   ALTER TABLE ONLY desarrollo.apex_puntos_montaje DROP CONSTRAINT apex_puntos_montaje_etiqueta_proyecto_key;
    
   desarrollo         postgres    false    198    198    198            {           2606    18745 &   apex_recurso_origen apex_rec_origen_pk 
   CONSTRAINT     t   ALTER TABLE ONLY desarrollo.apex_recurso_origen
    ADD CONSTRAINT apex_rec_origen_pk PRIMARY KEY (recurso_origen);
 T   ALTER TABLE ONLY desarrollo.apex_recurso_origen DROP CONSTRAINT apex_rec_origen_pk;
    
   desarrollo         postgres    false    202    202            �           2606    19526 ,   apex_relacion_tablas apex_relacion_tablas_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_relacion_tablas
    ADD CONSTRAINT apex_relacion_tablas_pk PRIMARY KEY (proyecto, relacion_tablas);
 Z   ALTER TABLE ONLY desarrollo.apex_relacion_tablas DROP CONSTRAINT apex_relacion_tablas_pk;
    
   desarrollo         postgres    false    267    267    267            h           2606    20612 B   apex_restriccion_funcional_cols apex_restriccion_funcional_cols_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_cols
    ADD CONSTRAINT apex_restriccion_funcional_cols_pk PRIMARY KEY (proyecto, restriccion_funcional, item, objeto_cuadro_col);
 p   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_cols DROP CONSTRAINT apex_restriccion_funcional_cols_pk;
    
   desarrollo         postgres    false    349    349    349    349    349            `           2606    20532 >   apex_restriccion_funcional_ef apex_restriccion_funcional_ef_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ef
    ADD CONSTRAINT apex_restriccion_funcional_ef_pk PRIMARY KEY (proyecto, restriccion_funcional, item, objeto_ei_formulario_fila);
 l   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ef DROP CONSTRAINT apex_restriccion_funcional_ef_pk;
    
   desarrollo         postgres    false    345    345    345    345    345            f           2606    20592 >   apex_restriccion_funcional_ei apex_restriccion_funcional_ei_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ei
    ADD CONSTRAINT apex_restriccion_funcional_ei_pk PRIMARY KEY (proyecto, restriccion_funcional, item, objeto);
 l   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ei DROP CONSTRAINT apex_restriccion_funcional_ei_pk;
    
   desarrollo         postgres    false    348    348    348    348    348            d           2606    20572 @   apex_restriccion_funcional_evt apex_restriccion_funcional_evt_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_evt
    ADD CONSTRAINT apex_restriccion_funcional_evt_pk PRIMARY KEY (proyecto, restriccion_funcional, item, evento_id);
 n   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_evt DROP CONSTRAINT apex_restriccion_funcional_evt_pk;
    
   desarrollo         postgres    false    347    347    347    347    347            j           2606    20632 O   apex_restriccion_funcional_filtro_cols apex_restriccion_funcional_filtro_col_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_filtro_cols
    ADD CONSTRAINT apex_restriccion_funcional_filtro_col_pk PRIMARY KEY (proyecto, restriccion_funcional, item, objeto_ei_filtro_col);
 }   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_filtro_cols DROP CONSTRAINT apex_restriccion_funcional_filtro_col_pk;
    
   desarrollo         postgres    false    350    350    350    350    350            b           2606    20552 J   apex_restriccion_funcional_pantalla apex_restriccion_funcional_pantalla_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_pantalla
    ADD CONSTRAINT apex_restriccion_funcional_pantalla_pk PRIMARY KEY (proyecto, restriccion_funcional, item, pantalla);
 x   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_pantalla DROP CONSTRAINT apex_restriccion_funcional_pantalla_pk;
    
   desarrollo         postgres    false    346    346    346    346    346            v           2606    20748 2   apex_servicio_web_param apex_servicio_web_param_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_servicio_web_param
    ADD CONSTRAINT apex_servicio_web_param_pk PRIMARY KEY (proyecto, servicio_web, parametro);
 `   ALTER TABLE ONLY desarrollo.apex_servicio_web_param DROP CONSTRAINT apex_servicio_web_param_pk;
    
   desarrollo         postgres    false    357    357    357    357            t           2606    20735 &   apex_servicio_web apex_servicio_web_pk 
   CONSTRAINT     |   ALTER TABLE ONLY desarrollo.apex_servicio_web
    ADD CONSTRAINT apex_servicio_web_pk PRIMARY KEY (proyecto, servicio_web);
 T   ALTER TABLE ONLY desarrollo.apex_servicio_web DROP CONSTRAINT apex_servicio_web_pk;
    
   desarrollo         postgres    false    356    356    356            �           2606    18790 ,   apex_solicitud_obs_tipo apex_sol_obs_tipo_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_solicitud_obs_tipo
    ADD CONSTRAINT apex_sol_obs_tipo_pk PRIMARY KEY (proyecto, solicitud_obs_tipo);
 Z   ALTER TABLE ONLY desarrollo.apex_solicitud_obs_tipo DROP CONSTRAINT apex_sol_obs_tipo_pk;
    
   desarrollo         postgres    false    206    206    206                       2606    18761 $   apex_solicitud_tipo apex_sol_tipo_pk 
   CONSTRAINT     r   ALTER TABLE ONLY desarrollo.apex_solicitud_tipo
    ADD CONSTRAINT apex_sol_tipo_pk PRIMARY KEY (solicitud_tipo);
 R   ALTER TABLE ONLY desarrollo.apex_solicitud_tipo DROP CONSTRAINT apex_sol_tipo_pk;
    
   desarrollo         postgres    false    204    204            �           2606    18905    apex_tarea apex_tarea_pk 
   CONSTRAINT     g   ALTER TABLE ONLY desarrollo.apex_tarea
    ADD CONSTRAINT apex_tarea_pk PRIMARY KEY (tarea, proyecto);
 F   ALTER TABLE ONLY desarrollo.apex_tarea DROP CONSTRAINT apex_tarea_pk;
    
   desarrollo         postgres    false    218    218    218                       2606    19980 "   apex_tipo_datos apex_tipo_datos_pk 
   CONSTRAINT     f   ALTER TABLE ONLY desarrollo.apex_tipo_datos
    ADD CONSTRAINT apex_tipo_datos_pk PRIMARY KEY (tipo);
 P   ALTER TABLE ONLY desarrollo.apex_tipo_datos DROP CONSTRAINT apex_tipo_datos_pk;
    
   desarrollo         postgres    false    302    302                       2606    19929 !   apex_grafico apex_tipo_grafico_pk 
   CONSTRAINT     h   ALTER TABLE ONLY desarrollo.apex_grafico
    ADD CONSTRAINT apex_tipo_grafico_pk PRIMARY KEY (grafico);
 O   ALTER TABLE ONLY desarrollo.apex_grafico DROP CONSTRAINT apex_tipo_grafico_pk;
    
   desarrollo         postgres    false    296    296            V           2606    20460 :   apex_usuario_grupo_acc_miembros apex_usu_g_acc_miembros_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_miembros
    ADD CONSTRAINT apex_usu_g_acc_miembros_pk PRIMARY KEY (proyecto, usuario_grupo_acc, usuario_grupo_acc_pertenece);
 h   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_miembros DROP CONSTRAINT apex_usu_g_acc_miembros_pk;
    
   desarrollo         postgres    false    339    339    339    339            T           2606    20455 (   apex_usuario_grupo_acc apex_usu_g_acc_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc
    ADD CONSTRAINT apex_usu_g_acc_pk PRIMARY KEY (proyecto, usuario_grupo_acc);
 V   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc DROP CONSTRAINT apex_usu_g_acc_pk;
    
   desarrollo         postgres    false    338    338    338            X           2606    20475 ,   apex_usuario_grupo_acc_item apex_usu_item_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_item
    ADD CONSTRAINT apex_usu_item_pk PRIMARY KEY (proyecto, usuario_grupo_acc, item);
 Z   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_item DROP CONSTRAINT apex_usu_item_pk;
    
   desarrollo         postgres    false    340    340    340    340            r           2606    20715 6   apex_usuario_proyecto_perfil_datos apex_usu_proy_pd_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_perfil_datos
    ADD CONSTRAINT apex_usu_proy_pd_pk PRIMARY KEY (proyecto, usuario_perfil_datos, usuario);
 d   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_perfil_datos DROP CONSTRAINT apex_usu_proy_pd_pk;
    
   desarrollo         postgres    false    355    355    355    355            p           2606    20700 &   apex_usuario_proyecto apex_usu_proy_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto
    ADD CONSTRAINT apex_usu_proy_pk PRIMARY KEY (proyecto, usuario_grupo_acc, usuario);
 T   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto DROP CONSTRAINT apex_usu_proy_pk;
    
   desarrollo         postgres    false    354    354    354    354            R           2606    20436 @   apex_usuario_perfil_datos_dims apex_usuario_perfil_datos_dims_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos_dims
    ADD CONSTRAINT apex_usuario_perfil_datos_dims_pk PRIMARY KEY (proyecto, elemento);
 n   ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos_dims DROP CONSTRAINT apex_usuario_perfil_datos_dims_pk;
    
   desarrollo         postgres    false    337    337    337            P           2606    20420 6   apex_usuario_perfil_datos apex_usuario_perfil_datos_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos
    ADD CONSTRAINT apex_usuario_perfil_datos_pk PRIMARY KEY (proyecto, usuario_perfil_datos);
 d   ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos DROP CONSTRAINT apex_usuario_perfil_datos_pk;
    
   desarrollo         postgres    false    335    335    335            �           2606    18940    apex_usuario apex_usuario_pk 
   CONSTRAINT     c   ALTER TABLE ONLY desarrollo.apex_usuario
    ADD CONSTRAINT apex_usuario_pk PRIMARY KEY (usuario);
 J   ALTER TABLE ONLY desarrollo.apex_usuario DROP CONSTRAINT apex_usuario_pk;
    
   desarrollo         postgres    false    221    221            �           2606    18967 >   apex_usuario_pregunta_secreta apex_usuario_pregunta_secreta_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_pregunta_secreta
    ADD CONSTRAINT apex_usuario_pregunta_secreta_pk PRIMARY KEY (cod_pregunta_secreta);
 l   ALTER TABLE ONLY desarrollo.apex_usuario_pregunta_secreta DROP CONSTRAINT apex_usuario_pregunta_secreta_pk;
    
   desarrollo         postgres    false    224    224            �           2606    19598 >   apex_usuario_proyecto_gadgets apex_usuario_proyecto_gadgets_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_gadgets
    ADD CONSTRAINT apex_usuario_proyecto_gadgets_pk PRIMARY KEY (usuario, proyecto, gadget);
 l   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_gadgets DROP CONSTRAINT apex_usuario_proyecto_gadgets_pk;
    
   desarrollo         postgres    false    274    274    274    274            �           2606    18955 *   apex_usuario_pwd_reset apex_usuario_pwd_pk 
   CONSTRAINT     y   ALTER TABLE ONLY desarrollo.apex_usuario_pwd_reset
    ADD CONSTRAINT apex_usuario_pwd_pk PRIMARY KEY (usuario, random);
 X   ALTER TABLE ONLY desarrollo.apex_usuario_pwd_reset DROP CONSTRAINT apex_usuario_pwd_pk;
    
   desarrollo         postgres    false    222    222    222            �           2606    18981 2   apex_usuario_pwd_usados apex_usuario_pwd_usados_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_pwd_usados
    ADD CONSTRAINT apex_usuario_pwd_usados_pk PRIMARY KEY (cod_pwd_pasados);
 `   ALTER TABLE ONLY desarrollo.apex_usuario_pwd_usados DROP CONSTRAINT apex_usuario_pwd_usados_pk;
    
   desarrollo         postgres    false    226    226            �           2606    18983 2   apex_usuario_pwd_usados apex_usuario_pwd_usados_uk 
   CONSTRAINT     {   ALTER TABLE ONLY desarrollo.apex_usuario_pwd_usados
    ADD CONSTRAINT apex_usuario_pwd_usados_uk UNIQUE (usuario, clave);
 `   ALTER TABLE ONLY desarrollo.apex_usuario_pwd_usados DROP CONSTRAINT apex_usuario_pwd_usados_uk;
    
   desarrollo         postgres    false    226    226    226            �           2606    18929 ,   apex_usuario_tipodoc apex_usuario_tipodoc_pk 
   CONSTRAINT     {   ALTER TABLE ONLY desarrollo.apex_usuario_tipodoc
    ADD CONSTRAINT apex_usuario_tipodoc_pk PRIMARY KEY (usuario_tipodoc);
 Z   ALTER TABLE ONLY desarrollo.apex_usuario_tipodoc DROP CONSTRAINT apex_usuario_tipodoc_pk;
    
   desarrollo         postgres    false    220    220            \           2606    20512 3   apex_restriccion_funcional restriccion_funcional_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional
    ADD CONSTRAINT restriccion_funcional_pk PRIMARY KEY (proyecto, restriccion_funcional);
 a   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional DROP CONSTRAINT restriccion_funcional_pk;
    
   desarrollo         postgres    false    343    343    343            �           2606    20924 *   apex_log_ip_rechazada apex_ip_rechazada_pk 
   CONSTRAINT     q   ALTER TABLE ONLY desarrollo_logs.apex_log_ip_rechazada
    ADD CONSTRAINT apex_ip_rechazada_pk PRIMARY KEY (ip);
 ]   ALTER TABLE ONLY desarrollo_logs.apex_log_ip_rechazada DROP CONSTRAINT apex_ip_rechazada_pk;
       desarrollo_logs         postgres    false    371    371            �           2606    20918 ,   apex_log_error_login apex_log_error_login_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_log_error_login
    ADD CONSTRAINT apex_log_error_login_pk PRIMARY KEY (log_error_login);
 _   ALTER TABLE ONLY desarrollo_logs.apex_log_error_login DROP CONSTRAINT apex_log_error_login_pk;
       desarrollo_logs         postgres    false    370    370            �           2606    20947 "   apex_log_objeto apex_log_objeto_pk 
   CONSTRAINT     q   ALTER TABLE ONLY desarrollo_logs.apex_log_objeto
    ADD CONSTRAINT apex_log_objeto_pk PRIMARY KEY (log_objeto);
 U   ALTER TABLE ONLY desarrollo_logs.apex_log_objeto DROP CONSTRAINT apex_log_objeto_pk;
       desarrollo_logs         postgres    false    375    375            �           2606    20906     apex_log_sistema apex_log_sis_pk 
   CONSTRAINT     p   ALTER TABLE ONLY desarrollo_logs.apex_log_sistema
    ADD CONSTRAINT apex_log_sis_pk PRIMARY KEY (log_sistema);
 S   ALTER TABLE ONLY desarrollo_logs.apex_log_sistema DROP CONSTRAINT apex_log_sis_pk;
       desarrollo_logs         postgres    false    368    368            x           2606    20825    apex_solicitud apex_log_sol_pk 
   CONSTRAINT     v   ALTER TABLE ONLY desarrollo_logs.apex_solicitud
    ADD CONSTRAINT apex_log_sol_pk PRIMARY KEY (solicitud, proyecto);
 Q   ALTER TABLE ONLY desarrollo_logs.apex_solicitud DROP CONSTRAINT apex_log_sol_pk;
       desarrollo_logs         postgres    false    359    359    359            �           2606    20935     apex_log_tarea apex_log_tarea_pk 
   CONSTRAINT     x   ALTER TABLE ONLY desarrollo_logs.apex_log_tarea
    ADD CONSTRAINT apex_log_tarea_pk PRIMARY KEY (log_tarea, proyecto);
 S   ALTER TABLE ONLY desarrollo_logs.apex_log_tarea DROP CONSTRAINT apex_log_tarea_pk;
       desarrollo_logs         postgres    false    373    373    373            z           2606    20837 #   apex_sesion_browser apex_ses_brw_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_sesion_browser
    ADD CONSTRAINT apex_ses_brw_pk PRIMARY KEY (sesion_browser, proyecto);
 V   ALTER TABLE ONLY desarrollo_logs.apex_sesion_browser DROP CONSTRAINT apex_ses_brw_pk;
       desarrollo_logs         postgres    false    361    361    361            |           2606    20842 &   apex_solicitud_browser apex_sol_brw_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_browser
    ADD CONSTRAINT apex_sol_brw_pk PRIMARY KEY (solicitud_proyecto, solicitud_browser);
 Y   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_browser DROP CONSTRAINT apex_sol_brw_pk;
       desarrollo_logs         postgres    false    362    362    362            ~           2606    20860 *   apex_solicitud_consola apex_sol_consola_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_consola
    ADD CONSTRAINT apex_sol_consola_pk PRIMARY KEY (solicitud_consola, proyecto);
 ]   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_consola DROP CONSTRAINT apex_sol_consola_pk;
       desarrollo_logs         postgres    false    363    363    363            �           2606    20873 *   apex_solicitud_cronometro apex_sol_cron_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_cronometro
    ADD CONSTRAINT apex_sol_cron_pk PRIMARY KEY (solicitud, proyecto, marca);
 ]   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_cronometro DROP CONSTRAINT apex_sol_cron_pk;
       desarrollo_logs         postgres    false    364    364    364    364            �           2606    20889 *   apex_solicitud_observacion apex_sol_obs_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_observacion
    ADD CONSTRAINT apex_sol_obs_pk PRIMARY KEY (solicitud_observacion);
 ]   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_observacion DROP CONSTRAINT apex_sol_obs_pk;
       desarrollo_logs         postgres    false    366    366            �           2606    20955 8   apex_solicitud_web_service apex_solicitud_web_service_pk 
   CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_web_service
    ADD CONSTRAINT apex_solicitud_web_service_pk PRIMARY KEY (solicitud, proyecto);
 k   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_web_service DROP CONSTRAINT apex_solicitud_web_service_pk;
       desarrollo_logs         postgres    false    376    376    376            �           2606    21011     iso_countries iso_countries_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY referencia.iso_countries
    ADD CONSTRAINT iso_countries_pkey PRIMARY KEY (rowid);
 N   ALTER TABLE ONLY referencia.iso_countries DROP CONSTRAINT iso_countries_pkey;
    
   referencia         postgres    false    389    389            �           2606    21013    ref_deportes ref_deportes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY referencia.ref_deportes
    ADD CONSTRAINT ref_deportes_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY referencia.ref_deportes DROP CONSTRAINT ref_deportes_pkey;
    
   referencia         postgres    false    378    378            �           2606    21015 (   ref_juegos_oferta ref_juegos_oferta_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY referencia.ref_juegos_oferta
    ADD CONSTRAINT ref_juegos_oferta_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY referencia.ref_juegos_oferta DROP CONSTRAINT ref_juegos_oferta_pkey;
    
   referencia         postgres    false    382    382            �           2606    21017    ref_juegos ref_juegos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY referencia.ref_juegos
    ADD CONSTRAINT ref_juegos_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY referencia.ref_juegos DROP CONSTRAINT ref_juegos_pkey;
    
   referencia         postgres    false    380    380            �           2606    21019 .   ref_persona_deportes ref_persona_deportes_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY referencia.ref_persona_deportes
    ADD CONSTRAINT ref_persona_deportes_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY referencia.ref_persona_deportes DROP CONSTRAINT ref_persona_deportes_pkey;
    
   referencia         postgres    false    386    386            �           2606    21021 *   ref_persona_juegos ref_persona_juegos_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY referencia.ref_persona_juegos
    ADD CONSTRAINT ref_persona_juegos_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY referencia.ref_persona_juegos DROP CONSTRAINT ref_persona_juegos_pkey;
    
   referencia         postgres    false    388    388            �           2606    21023    ref_persona ref_persona_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY referencia.ref_persona
    ADD CONSTRAINT ref_persona_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY referencia.ref_persona DROP CONSTRAINT ref_persona_pkey;
    
   referencia         postgres    false    384    384            �           1259    18911 "   index_apex_tarea_proxima_ejecucion    INDEX     j   CREATE INDEX index_apex_tarea_proxima_ejecucion ON desarrollo.apex_tarea USING btree (ejecucion_proxima);
 :   DROP INDEX desarrollo.index_apex_tarea_proxima_ejecucion;
    
   desarrollo         postgres    false    218            �           1259    21024 	   new_index    INDEX     a   CREATE UNIQUE INDEX new_index ON referencia.ref_persona_deportes USING btree (persona, deporte);
 !   DROP INDEX referencia.new_index;
    
   referencia         postgres    false    386    386            �           1259    21025 $   ref_persona_juegos_persona_juego_key    INDEX     x   CREATE UNIQUE INDEX ref_persona_juegos_persona_juego_key ON referencia.ref_persona_juegos USING btree (persona, juego);
 <   DROP INDEX referencia.ref_persona_juegos_persona_juego_key;
    
   referencia         postgres    false    388    388            �           2620    20815 !   apex_usuario tusuario_pwd_pasados    TRIGGER     �   CREATE TRIGGER tusuario_pwd_pasados AFTER UPDATE ON desarrollo.apex_usuario FOR EACH ROW EXECUTE PROCEDURE desarrollo.sp_old_pwd_copy();
 >   DROP TRIGGER tusuario_pwd_pasados ON desarrollo.apex_usuario;
    
   desarrollo       postgres    false    221    390                       2606    19857 C   apex_objeto_ei_filtro_tipo_col apex__ei_filtro_tipo_col_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_tipo_col
    ADD CONSTRAINT apex__ei_filtro_tipo_col_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 q   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_tipo_col DROP CONSTRAINT apex__ei_filtro_tipo_col_fk_proyecto;
    
   desarrollo       postgres    false    2919    291    192            �           2606    18637 2   apex_checksum_proyectos apex_checksum_proyectos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_checksum_proyectos
    ADD CONSTRAINT apex_checksum_proyectos_fk FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 `   ALTER TABLE ONLY desarrollo.apex_checksum_proyectos DROP CONSTRAINT apex_checksum_proyectos_fk;
    
   desarrollo       postgres    false    192    193    2919            �           2606    19117 !   apex_clase apex_clase_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_clase
    ADD CONSTRAINT apex_clase_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 O   ALTER TABLE ONLY desarrollo.apex_clase DROP CONSTRAINT apex_clase_fk_proyecto;
    
   desarrollo       postgres    false    234    2919    192            �           2606    19122    apex_clase apex_clase_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_clase
    ADD CONSTRAINT apex_clase_fk_tipo FOREIGN KEY (clase_tipo) REFERENCES desarrollo.apex_clase_tipo(clase_tipo) DEFERRABLE;
 K   ALTER TABLE ONLY desarrollo.apex_clase DROP CONSTRAINT apex_clase_fk_tipo;
    
   desarrollo       postgres    false    2988    234    233            �           2606    19140 0   apex_clase_relacion apex_clase_rel_fk_clase_hijo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_clase_relacion
    ADD CONSTRAINT apex_clase_rel_fk_clase_hijo FOREIGN KEY (proyecto, clase_contenida) REFERENCES desarrollo.apex_clase(proyecto, clase) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 ^   ALTER TABLE ONLY desarrollo.apex_clase_relacion DROP CONSTRAINT apex_clase_rel_fk_clase_hijo;
    
   desarrollo       postgres    false    234    234    236    236    2990            �           2606    19135 1   apex_clase_relacion apex_clase_rel_fk_clase_padre    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_clase_relacion
    ADD CONSTRAINT apex_clase_rel_fk_clase_padre FOREIGN KEY (proyecto, clase_contenedora) REFERENCES desarrollo.apex_clase(proyecto, clase) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_clase_relacion DROP CONSTRAINT apex_clase_rel_fk_clase_padre;
    
   desarrollo       postgres    false    236    234    2990    234    236                       2606    19756 <   apex_objeto_ei_cuadro_columna apex_col_cuadro_evento_asoc_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna
    ADD CONSTRAINT apex_col_cuadro_evento_asoc_fk FOREIGN KEY (objeto_cuadro_proyecto, evento_asociado) REFERENCES desarrollo.apex_objeto_eventos(proyecto, evento_id) DEFERRABLE;
 j   ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna DROP CONSTRAINT apex_col_cuadro_evento_asoc_fk;
    
   desarrollo       postgres    false    3010    245    285    245    285            �           2606    18836 3   apex_columna_formato apex_columna_formato_fk_estilo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_columna_formato
    ADD CONSTRAINT apex_columna_formato_fk_estilo FOREIGN KEY (estilo_defecto) REFERENCES desarrollo.apex_columna_estilo(columna_estilo) DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo.apex_columna_formato DROP CONSTRAINT apex_columna_formato_fk_estilo;
    
   desarrollo       postgres    false    211    209    2951            9           2606    20178 9   apex_objeto_rel_columnas_asoc apex_columna_objeto_hijo_fk    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objeto_rel_columnas_asoc
    ADD CONSTRAINT apex_columna_objeto_hijo_fk FOREIGN KEY (hijo_clave, hijo_objeto, proyecto) REFERENCES desarrollo.apex_objeto_db_registros_col(col_id, objeto, objeto_proyecto) ON DELETE CASCADE DEFERRABLE;
 g   ALTER TABLE ONLY desarrollo.apex_objeto_rel_columnas_asoc DROP CONSTRAINT apex_columna_objeto_hijo_fk;
    
   desarrollo       postgres    false    305    316    305    316    316    3108    305            8           2606    20183 :   apex_objeto_rel_columnas_asoc apex_columna_objeto_padre_fk    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objeto_rel_columnas_asoc
    ADD CONSTRAINT apex_columna_objeto_padre_fk FOREIGN KEY (padre_objeto, padre_clave, proyecto) REFERENCES desarrollo.apex_objeto_db_registros_col(objeto, col_id, objeto_proyecto) ON DELETE CASCADE DEFERRABLE;
 h   ALTER TABLE ONLY desarrollo.apex_objeto_rel_columnas_asoc DROP CONSTRAINT apex_columna_objeto_padre_fk;
    
   desarrollo       postgres    false    305    3108    305    305    316    316    316            �           2606    18885 /   apex_consulta_php apex_consulta_php_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_consulta_php
    ADD CONSTRAINT apex_consulta_php_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 ]   ALTER TABLE ONLY desarrollo.apex_consulta_php DROP CONSTRAINT apex_consulta_php_fk_proyecto;
    
   desarrollo       postgres    false    192    216    2919            �           2606    19334 $   apex_conversion apex_conversion_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_conversion
    ADD CONSTRAINT apex_conversion_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 R   ALTER TABLE ONLY desarrollo.apex_conversion DROP CONSTRAINT apex_conversion_proy;
    
   desarrollo       postgres    false    251    192    2919            �           2606    19553 %   apex_dimension apex_dimension_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_dimension
    ADD CONSTRAINT apex_dimension_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 S   ALTER TABLE ONLY desarrollo.apex_dimension DROP CONSTRAINT apex_dimension_fk_proy;
    
   desarrollo       postgres    false    269    192    2919            �           2606    19571 4   apex_dimension_gatillo apex_dimension_gatillo_fk_dim    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_dimension_gatillo
    ADD CONSTRAINT apex_dimension_gatillo_fk_dim FOREIGN KEY (proyecto, dimension) REFERENCES desarrollo.apex_dimension(proyecto, dimension) DEFERRABLE;
 b   ALTER TABLE ONLY desarrollo.apex_dimension_gatillo DROP CONSTRAINT apex_dimension_gatillo_fk_dim;
    
   desarrollo       postgres    false    269    271    271    269    3046                       2606    19828 ;   apex_objeto_ei_formulario_ef apex_ei_f_ef_fk_accion_vinculo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef
    ADD CONSTRAINT apex_ei_f_ef_fk_accion_vinculo FOREIGN KEY (popup_proyecto, popup_item) REFERENCES desarrollo.apex_item(proyecto, item) ON DELETE CASCADE DEFERRABLE;
 i   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef DROP CONSTRAINT apex_ei_f_ef_fk_accion_vinculo;
    
   desarrollo       postgres    false    289    289    2982    229    229                       2606    19823 9   apex_objeto_ei_formulario_ef apex_ei_f_ef_fk_consulta_php    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef
    ADD CONSTRAINT apex_ei_f_ef_fk_consulta_php FOREIGN KEY (objeto_ei_formulario_proyecto, carga_consulta_php) REFERENCES desarrollo.apex_consulta_php(proyecto, consulta_php) DEFERRABLE;
 g   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef DROP CONSTRAINT apex_ei_f_ef_fk_consulta_php;
    
   desarrollo       postgres    false    216    289    2961    289    216                       2606    19818 8   apex_objeto_ei_formulario_ef apex_ei_f_ef_fk_datos_tabla    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef
    ADD CONSTRAINT apex_ei_f_ef_fk_datos_tabla FOREIGN KEY (objeto_ei_formulario_proyecto, carga_dt) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 f   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef DROP CONSTRAINT apex_ei_f_ef_fk_datos_tabla;
    
   desarrollo       postgres    false    289    2998    238    238    289                       2606    19813 /   apex_objeto_ei_formulario_ef apex_ei_f_ef_fk_ef    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef
    ADD CONSTRAINT apex_ei_f_ef_fk_ef FOREIGN KEY (elemento_formulario) REFERENCES desarrollo.apex_elemento_formulario(elemento_formulario) DEFERRABLE;
 ]   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef DROP CONSTRAINT apex_ei_f_ef_fk_ef;
    
   desarrollo       postgres    false    205    289    2945                       2606    19808 2   apex_objeto_ei_formulario_ef apex_ei_f_ef_fk_padre    FK CONSTRAINT     '  ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef
    ADD CONSTRAINT apex_ei_f_ef_fk_padre FOREIGN KEY (objeto_ei_formulario, objeto_ei_formulario_proyecto) REFERENCES desarrollo.apex_objeto_ut_formulario(objeto_ut_formulario, objeto_ut_formulario_proyecto) ON DELETE CASCADE DEFERRABLE;
 `   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef DROP CONSTRAINT apex_ei_f_ef_fk_padre;
    
   desarrollo       postgres    false    287    289    289    287    3078                       2606    19902 >   apex_objeto_ei_filtro_col apex_ei_filtro_col_fk_accion_vinculo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col
    ADD CONSTRAINT apex_ei_filtro_col_fk_accion_vinculo FOREIGN KEY (popup_proyecto, popup_item) REFERENCES desarrollo.apex_item(proyecto, item) ON DELETE CASCADE DEFERRABLE;
 l   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col DROP CONSTRAINT apex_ei_filtro_col_fk_accion_vinculo;
    
   desarrollo       postgres    false    229    294    294    2982    229                       2606    19897 2   apex_objeto_ei_filtro_col apex_ei_filtro_col_fk_ef    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col
    ADD CONSTRAINT apex_ei_filtro_col_fk_ef FOREIGN KEY (opciones_ef) REFERENCES desarrollo.apex_elemento_formulario(elemento_formulario) ON DELETE CASCADE DEFERRABLE;
 `   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col DROP CONSTRAINT apex_ei_filtro_col_fk_ef;
    
   desarrollo       postgres    false    294    2945    205                       2606    19887 5   apex_objeto_ei_filtro_col apex_ei_filtro_col_fk_padre    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col
    ADD CONSTRAINT apex_ei_filtro_col_fk_padre FOREIGN KEY (objeto_ei_filtro, objeto_ei_filtro_proyecto) REFERENCES desarrollo.apex_objeto_ei_filtro(objeto_ei_filtro, objeto_ei_filtro_proyecto) ON DELETE CASCADE DEFERRABLE;
 c   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col DROP CONSTRAINT apex_ei_filtro_col_fk_padre;
    
   desarrollo       postgres    false    292    3086    294    294    292                       2606    19907 >   apex_objeto_ei_filtro_col apex_ei_filtro_col_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col
    ADD CONSTRAINT apex_ei_filtro_col_fk_puntos_montaje FOREIGN KEY (objeto_ei_filtro_proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 l   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col DROP CONSTRAINT apex_ei_filtro_col_fk_puntos_montaje;
    
   desarrollo       postgres    false    198    198    294    294    2929                       2606    19892 4   apex_objeto_ei_filtro_col apex_ei_filtro_col_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col
    ADD CONSTRAINT apex_ei_filtro_col_fk_tipo FOREIGN KEY (tipo) REFERENCES desarrollo.apex_objeto_ei_filtro_tipo_col(tipo_col) ON DELETE CASCADE DEFERRABLE;
 b   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro_col DROP CONSTRAINT apex_ei_filtro_col_fk_tipo;
    
   desarrollo       postgres    false    294    291    3084                       2606    19867 .   apex_objeto_ei_filtro apex_ei_filtro_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro
    ADD CONSTRAINT apex_ei_filtro_fk_objeto FOREIGN KEY (objeto_ei_filtro, objeto_ei_filtro_proyecto) REFERENCES desarrollo.apex_objeto(objeto, proyecto) ON DELETE CASCADE DEFERRABLE;
 \   ALTER TABLE ONLY desarrollo.apex_objeto_ei_filtro DROP CONSTRAINT apex_ei_filtro_fk_objeto;
    
   desarrollo       postgres    false    238    292    292    238    2998            �           2606    18773 -   apex_elemento_formulario apex_elform_fk_padre    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_elemento_formulario
    ADD CONSTRAINT apex_elform_fk_padre FOREIGN KEY (padre) REFERENCES desarrollo.apex_elemento_formulario(elemento_formulario) DEFERRABLE;
 [   ALTER TABLE ONLY desarrollo.apex_elemento_formulario DROP CONSTRAINT apex_elform_fk_padre;
    
   desarrollo       postgres    false    205    2945    205            �           2606    18778 0   apex_elemento_formulario apex_elform_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_elemento_formulario
    ADD CONSTRAINT apex_elform_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 ^   ALTER TABLE ONLY desarrollo.apex_elemento_formulario DROP CONSTRAINT apex_elform_fk_proyecto;
    
   desarrollo       postgres    false    192    205    2919            �           2606    18659 #   apex_estilo apex_estilo_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_estilo
    ADD CONSTRAINT apex_estilo_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 Q   ALTER TABLE ONLY desarrollo.apex_estilo DROP CONSTRAINT apex_estilo_fk_proyecto;
    
   desarrollo       postgres    false    2919    195    192                       2606    19685 F   apex_eventos_pantalla apex_eventos_pantalla_apex_objeto_ci_pantalla_fk    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_eventos_pantalla
    ADD CONSTRAINT apex_eventos_pantalla_apex_objeto_ci_pantalla_fk FOREIGN KEY (pantalla, objeto_ci, proyecto) REFERENCES desarrollo.apex_objeto_ci_pantalla(pantalla, objeto_ci, objeto_ci_proyecto) DEFERRABLE;
 t   ALTER TABLE ONLY desarrollo.apex_eventos_pantalla DROP CONSTRAINT apex_eventos_pantalla_apex_objeto_ci_pantalla_fk;
    
   desarrollo       postgres    false    3060    278    278    278    280    280    280                       2606    19690 B   apex_eventos_pantalla apex_eventos_pantalla_apex_objeto_eventos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_eventos_pantalla
    ADD CONSTRAINT apex_eventos_pantalla_apex_objeto_eventos_fk FOREIGN KEY (evento_id, proyecto) REFERENCES desarrollo.apex_objeto_eventos(evento_id, proyecto) DEFERRABLE;
 p   ALTER TABLE ONLY desarrollo.apex_eventos_pantalla DROP CONSTRAINT apex_eventos_pantalla_apex_objeto_eventos_fk;
    
   desarrollo       postgres    false    245    3010    280    245    280            �           2606    18709 ,   apex_fuente_datos apex_fuente_datos_fk_motor    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_fuente_datos
    ADD CONSTRAINT apex_fuente_datos_fk_motor FOREIGN KEY (fuente_datos_motor) REFERENCES desarrollo.apex_fuente_datos_motor(fuente_datos_motor) DEFERRABLE;
 Z   ALTER TABLE ONLY desarrollo.apex_fuente_datos DROP CONSTRAINT apex_fuente_datos_fk_motor;
    
   desarrollo       postgres    false    2933    199    200            �           2606    18714 /   apex_fuente_datos apex_fuente_datos_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_fuente_datos
    ADD CONSTRAINT apex_fuente_datos_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 ]   ALTER TABLE ONLY desarrollo.apex_fuente_datos DROP CONSTRAINT apex_fuente_datos_fk_proyecto;
    
   desarrollo       postgres    false    192    2919    200            �           2606    18719 4   apex_fuente_datos apex_fuente_datos_fk_punto_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_fuente_datos
    ADD CONSTRAINT apex_fuente_datos_fk_punto_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 b   ALTER TABLE ONLY desarrollo.apex_fuente_datos DROP CONSTRAINT apex_fuente_datos_fk_punto_montaje;
    
   desarrollo       postgres    false    198    200    200    198    2929            �           2606    18733 =   apex_fuente_datos_schemas apex_fuente_datos_schemas_fk_fuente    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_fuente_datos_schemas
    ADD CONSTRAINT apex_fuente_datos_schemas_fk_fuente FOREIGN KEY (proyecto, fuente_datos) REFERENCES desarrollo.apex_fuente_datos(proyecto, fuente_datos) DEFERRABLE;
 k   ALTER TABLE ONLY desarrollo.apex_fuente_datos_schemas DROP CONSTRAINT apex_fuente_datos_schemas_fk_fuente;
    
   desarrollo       postgres    false    2935    200    201    201    200            ]           2606    20523 O   apex_grupo_acc_restriccion_funcional apex_grupo_acc_restriccion_funcional_rf_fk    FK CONSTRAINT     /  ALTER TABLE ONLY desarrollo.apex_grupo_acc_restriccion_funcional
    ADD CONSTRAINT apex_grupo_acc_restriccion_funcional_rf_fk FOREIGN KEY (proyecto, restriccion_funcional) REFERENCES desarrollo.apex_restriccion_funcional(proyecto, restriccion_funcional) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 }   ALTER TABLE ONLY desarrollo.apex_grupo_acc_restriccion_funcional DROP CONSTRAINT apex_grupo_acc_restriccion_funcional_rf_fk;
    
   desarrollo       postgres    false    343    3164    344    343    344            �           2606    19295 .   apex_item_objeto apex_item_consumo_obj_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_objeto
    ADD CONSTRAINT apex_item_consumo_obj_fk_item FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 \   ALTER TABLE ONLY desarrollo.apex_item_objeto DROP CONSTRAINT apex_item_consumo_obj_fk_item;
    
   desarrollo       postgres    false    229    247    247    229    2982            �           2606    19300 0   apex_item_objeto apex_item_consumo_obj_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_objeto
    ADD CONSTRAINT apex_item_consumo_obj_fk_objeto FOREIGN KEY (proyecto, objeto) REFERENCES desarrollo.apex_objeto(proyecto, objeto) ON DELETE CASCADE DEFERRABLE;
 ^   ALTER TABLE ONLY desarrollo.apex_item_objeto DROP CONSTRAINT apex_item_consumo_obj_fk_objeto;
    
   desarrollo       postgres    false    238    247    238    247    2998            �           2606    19040    apex_item apex_item_fk_niv_acc    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_fk_niv_acc FOREIGN KEY (nivel_acceso) REFERENCES desarrollo.apex_nivel_acceso(nivel_acceso) DEFERRABLE;
 L   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_fk_niv_acc;
    
   desarrollo       postgres    false    203    229    2941            �           2606    19025    apex_item apex_item_fk_padre    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_fk_padre FOREIGN KEY (padre_proyecto, padre) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE DEFERRABLE;
 J   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_fk_padre;
    
   desarrollo       postgres    false    229    229    2982    229    229            �           2606    19045    apex_item apex_item_fk_pag_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_fk_pag_tipo FOREIGN KEY (pagina_tipo_proyecto, pagina_tipo) REFERENCES desarrollo.apex_pagina_tipo(proyecto, pagina_tipo) DEFERRABLE;
 M   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_fk_pag_tipo;
    
   desarrollo       postgres    false    207    229    229    207    2949            �           2606    19020    apex_item apex_item_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 M   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_fk_proyecto;
    
   desarrollo       postgres    false    229    2919    192            �           2606    19055 %   apex_item apex_item_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 S   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_fk_puntos_montaje;
    
   desarrollo       postgres    false    229    198    198    2929    229            �           2606    19060    apex_item apex_item_fk_rec_orig    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_fk_rec_orig FOREIGN KEY (imagen_recurso_origen) REFERENCES desarrollo.apex_recurso_origen(recurso_origen) DEFERRABLE;
 M   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_fk_rec_orig;
    
   desarrollo       postgres    false    2939    202    229            �           2606    19035    apex_item apex_item_fk_solic_ot    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_fk_solic_ot FOREIGN KEY (solicitud_obs_tipo_proyecto, solicitud_obs_tipo) REFERENCES desarrollo.apex_solicitud_obs_tipo(proyecto, solicitud_obs_tipo) DEFERRABLE;
 M   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_fk_solic_ot;
    
   desarrollo       postgres    false    2947    229    229    206    206            �           2606    19030 !   apex_item apex_item_fk_solic_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_fk_solic_tipo FOREIGN KEY (solicitud_tipo) REFERENCES desarrollo.apex_solicitud_tipo(solicitud_tipo) DEFERRABLE;
 O   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_fk_solic_tipo;
    
   desarrollo       postgres    false    2943    204    229            �           2606    19050    apex_item apex_item_fk_zona    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item
    ADD CONSTRAINT apex_item_fk_zona FOREIGN KEY (zona_proyecto, zona) REFERENCES desarrollo.apex_item_zona(proyecto, zona) DEFERRABLE;
 I   ALTER TABLE ONLY desarrollo.apex_item DROP CONSTRAINT apex_item_fk_zona;
    
   desarrollo       postgres    false    229    229    227    227    2980            �           2606    19073 %   apex_item_info apex_item_info_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_info
    ADD CONSTRAINT apex_item_info_fk_item FOREIGN KEY (item_proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 S   ALTER TABLE ONLY desarrollo.apex_item_info DROP CONSTRAINT apex_item_info_fk_item;
    
   desarrollo       postgres    false    230    229    230    229    2982            �           2606    19381 #   apex_item_msg apex_item_msg_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_msg
    ADD CONSTRAINT apex_item_msg_fk_item FOREIGN KEY (item, item_proyecto) REFERENCES desarrollo.apex_item(item, proyecto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 Q   ALTER TABLE ONLY desarrollo.apex_item_msg DROP CONSTRAINT apex_item_msg_fk_item;
    
   desarrollo       postgres    false    229    2982    229    256    256            �           2606    19386 #   apex_item_msg apex_item_msg_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_msg
    ADD CONSTRAINT apex_item_msg_fk_tipo FOREIGN KEY (msg_tipo) REFERENCES desarrollo.apex_msg_tipo(msg_tipo) DEFERRABLE;
 Q   ALTER TABLE ONLY desarrollo.apex_item_msg DROP CONSTRAINT apex_item_msg_fk_tipo;
    
   desarrollo       postgres    false    256    252    3026            �           2606    19474 %   apex_item_nota apex_item_nota_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_nota
    ADD CONSTRAINT apex_item_nota_fk_item FOREIGN KEY (item_proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE DEFERRABLE;
 S   ALTER TABLE ONLY desarrollo.apex_item_nota DROP CONSTRAINT apex_item_nota_fk_item;
    
   desarrollo       postgres    false    2982    263    263    229    229            �           2606    19479 %   apex_item_nota apex_item_nota_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_nota
    ADD CONSTRAINT apex_item_nota_fk_tipo FOREIGN KEY (nota_tipo) REFERENCES desarrollo.apex_nota_tipo(nota_tipo) DEFERRABLE;
 S   ALTER TABLE ONLY desarrollo.apex_item_nota DROP CONSTRAINT apex_item_nota_fk_tipo;
    
   desarrollo       postgres    false    263    259    3036            �           2606    19469 %   apex_item_nota apex_item_nota_fk_usud    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_nota
    ADD CONSTRAINT apex_item_nota_fk_usud FOREIGN KEY (usuario_destino) REFERENCES desarrollo.apex_usuario(usuario) DEFERRABLE;
 S   ALTER TABLE ONLY desarrollo.apex_item_nota DROP CONSTRAINT apex_item_nota_fk_usud;
    
   desarrollo       postgres    false    263    221    2970            �           2606    19464 %   apex_item_nota apex_item_nota_fk_usuo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_nota
    ADD CONSTRAINT apex_item_nota_fk_usuo FOREIGN KEY (usuario_origen) REFERENCES desarrollo.apex_usuario(usuario) DEFERRABLE;
 S   ALTER TABLE ONLY desarrollo.apex_item_nota DROP CONSTRAINT apex_item_nota_fk_usuo;
    
   desarrollo       postgres    false    263    221    2970            �           2606    19091 :   apex_item_permisos_tablas apex_item_permisos_tablas_fuente    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_permisos_tablas
    ADD CONSTRAINT apex_item_permisos_tablas_fuente FOREIGN KEY (proyecto, fuente_datos) REFERENCES desarrollo.apex_fuente_datos(proyecto, fuente_datos) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 h   ALTER TABLE ONLY desarrollo.apex_item_permisos_tablas DROP CONSTRAINT apex_item_permisos_tablas_fuente;
    
   desarrollo       postgres    false    231    231    200    200    2935            �           2606    19086 8   apex_item_permisos_tablas apex_item_permisos_tablas_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_permisos_tablas
    ADD CONSTRAINT apex_item_permisos_tablas_item FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 f   ALTER TABLE ONLY desarrollo.apex_item_permisos_tablas DROP CONSTRAINT apex_item_permisos_tablas_item;
    
   desarrollo       postgres    false    2982    231    231    229    229            �           2606    18997 %   apex_item_zona apex_item_zona_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_zona
    ADD CONSTRAINT apex_item_zona_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 S   ALTER TABLE ONLY desarrollo.apex_item_zona DROP CONSTRAINT apex_item_zona_fk_proy;
    
   desarrollo       postgres    false    192    2919    227            p           2606    20661 !   apex_menu apex_menu_menu_tipos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_menu
    ADD CONSTRAINT apex_menu_menu_tipos_fk FOREIGN KEY (tipo_menu) REFERENCES desarrollo.apex_menu_tipos(menu) DEFERRABLE;
 O   ALTER TABLE ONLY desarrollo.apex_menu DROP CONSTRAINT apex_menu_menu_tipos_fk;
    
   desarrollo       postgres    false    351    194    2923            t           2606    20678 <   apex_menu_operaciones apex_menu_operaciones_apex_proyecto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_menu_operaciones
    ADD CONSTRAINT apex_menu_operaciones_apex_proyecto_fk FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 j   ALTER TABLE ONLY desarrollo.apex_menu_operaciones DROP CONSTRAINT apex_menu_operaciones_apex_proyecto_fk;
    
   desarrollo       postgres    false    192    2919    353            r           2606    20688 3   apex_menu_operaciones apex_menu_operaciones_auto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_menu_operaciones
    ADD CONSTRAINT apex_menu_operaciones_auto_fk FOREIGN KEY (proyecto, menu_id, menu_elemento) REFERENCES desarrollo.apex_menu_operaciones(proyecto, menu_id, menu_elemento) DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo.apex_menu_operaciones DROP CONSTRAINT apex_menu_operaciones_auto_fk;
    
   desarrollo       postgres    false    3182    353    353    353    353    353    353            s           2606    20683 3   apex_menu_operaciones apex_menu_operaciones_item_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_menu_operaciones
    ADD CONSTRAINT apex_menu_operaciones_item_fk FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo.apex_menu_operaciones DROP CONSTRAINT apex_menu_operaciones_item_fk;
    
   desarrollo       postgres    false    229    2982    229    353    353            q           2606    20656    apex_menu apex_menu_proyecto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_menu
    ADD CONSTRAINT apex_menu_proyecto_fk FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 M   ALTER TABLE ONLY desarrollo.apex_menu DROP CONSTRAINT apex_menu_proyecto_fk;
    
   desarrollo       postgres    false    351    192    2919            ;           2606    20201 E   apex_molde_opciones_generacion apex_molde_opciones_generacion_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_opciones_generacion
    ADD CONSTRAINT apex_molde_opciones_generacion_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 s   ALTER TABLE ONLY desarrollo.apex_molde_opciones_generacion DROP CONSTRAINT apex_molde_opciones_generacion_fk_proy;
    
   desarrollo       postgres    false    317    192    2919            :           2606    20206 O   apex_molde_opciones_generacion apex_molde_opciones_generacion_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_opciones_generacion
    ADD CONSTRAINT apex_molde_opciones_generacion_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 }   ALTER TABLE ONLY desarrollo.apex_molde_opciones_generacion DROP CONSTRAINT apex_molde_opciones_generacion_fk_puntos_montaje;
    
   desarrollo       postgres    false    2929    317    317    198    198            N           2606    20357 =   apex_molde_operacion_abms_fila apex_molde_operacion_abms_fila    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila
    ADD CONSTRAINT apex_molde_operacion_abms_fila FOREIGN KEY (asistente_tipo_dato) REFERENCES desarrollo.apex_molde_operacion_tipo_dato(tipo_dato) DEFERRABLE;
 k   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila DROP CONSTRAINT apex_molde_operacion_abms_fila;
    
   desarrollo       postgres    false    3130    330    321            M           2606    20362 C   apex_molde_operacion_abms_fila apex_molde_operacion_abms_fila_fk_ef    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila
    ADD CONSTRAINT apex_molde_operacion_abms_fila_fk_ef FOREIGN KEY (elemento_formulario) REFERENCES desarrollo.apex_elemento_formulario(elemento_formulario) DEFERRABLE;
 q   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila DROP CONSTRAINT apex_molde_operacion_abms_fila_fk_ef;
    
   desarrollo       postgres    false    330    205    2945            L           2606    20367 G   apex_molde_operacion_abms_fila apex_molde_operacion_abms_fila_fk_estilo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila
    ADD CONSTRAINT apex_molde_operacion_abms_fila_fk_estilo FOREIGN KEY (cuadro_estilo) REFERENCES desarrollo.apex_columna_estilo(columna_estilo) DEFERRABLE;
 u   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila DROP CONSTRAINT apex_molde_operacion_abms_fila_fk_estilo;
    
   desarrollo       postgres    false    330    2951    209            K           2606    20372 H   apex_molde_operacion_abms_fila apex_molde_operacion_abms_fila_fk_formato    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila
    ADD CONSTRAINT apex_molde_operacion_abms_fila_fk_formato FOREIGN KEY (cuadro_formato) REFERENCES desarrollo.apex_columna_formato(columna_formato) DEFERRABLE;
 v   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila DROP CONSTRAINT apex_molde_operacion_abms_fila_fk_formato;
    
   desarrollo       postgres    false    2953    211    330            O           2606    20352 F   apex_molde_operacion_abms_fila apex_molde_operacion_abms_fila_fk_molde    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila
    ADD CONSTRAINT apex_molde_operacion_abms_fila_fk_molde FOREIGN KEY (molde, proyecto) REFERENCES desarrollo.apex_molde_operacion(molde, proyecto) ON DELETE CASCADE DEFERRABLE;
 t   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila DROP CONSTRAINT apex_molde_operacion_abms_fila_fk_molde;
    
   desarrollo       postgres    false    3134    323    323    330    330            I           2606    20382 O   apex_molde_operacion_abms_fila apex_molde_operacion_abms_fila_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila
    ADD CONSTRAINT apex_molde_operacion_abms_fila_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 }   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila DROP CONSTRAINT apex_molde_operacion_abms_fila_fk_puntos_montaje;
    
   desarrollo       postgres    false    330    330    2929    198    198            J           2606    20377 K   apex_molde_operacion_abms_fila apex_molde_operacion_abms_fila_fk_tipo_datos    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila
    ADD CONSTRAINT apex_molde_operacion_abms_fila_fk_tipo_datos FOREIGN KEY (dt_tipo_dato) REFERENCES desarrollo.apex_tipo_datos(tipo) ON DELETE CASCADE DEFERRABLE;
 y   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms_fila DROP CONSTRAINT apex_molde_operacion_abms_fila_fk_tipo_datos;
    
   desarrollo       postgres    false    3102    302    330            A           2606    20281 8   apex_molde_operacion apex_molde_operacion_abms_fk_fuente    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion
    ADD CONSTRAINT apex_molde_operacion_abms_fk_fuente FOREIGN KEY (proyecto, fuente) REFERENCES desarrollo.apex_fuente_datos(proyecto, fuente_datos) DEFERRABLE;
 f   ALTER TABLE ONLY desarrollo.apex_molde_operacion DROP CONSTRAINT apex_molde_operacion_abms_fk_fuente;
    
   desarrollo       postgres    false    323    323    2935    200    200            H           2606    20329 <   apex_molde_operacion_abms apex_molde_operacion_abms_fk_molde    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms
    ADD CONSTRAINT apex_molde_operacion_abms_fk_molde FOREIGN KEY (molde, proyecto) REFERENCES desarrollo.apex_molde_operacion(molde, proyecto) ON DELETE CASCADE DEFERRABLE;
 j   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms DROP CONSTRAINT apex_molde_operacion_abms_fk_molde;
    
   desarrollo       postgres    false    3134    328    328    323    323            G           2606    20334 E   apex_molde_operacion_abms apex_molde_operacion_abms_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms
    ADD CONSTRAINT apex_molde_operacion_abms_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 s   ALTER TABLE ONLY desarrollo.apex_molde_operacion_abms DROP CONSTRAINT apex_molde_operacion_abms_fk_puntos_montaje;
    
   desarrollo       postgres    false    198    328    2929    328    198            C           2606    20271 1   apex_molde_operacion apex_molde_operacion_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion
    ADD CONSTRAINT apex_molde_operacion_fk_item FOREIGN KEY (item, proyecto) REFERENCES desarrollo.apex_item(item, proyecto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_molde_operacion DROP CONSTRAINT apex_molde_operacion_fk_item;
    
   desarrollo       postgres    false    229    323    323    229    2982            @           2606    20286 ;   apex_molde_operacion apex_molde_operacion_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion
    ADD CONSTRAINT apex_molde_operacion_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 i   ALTER TABLE ONLY desarrollo.apex_molde_operacion DROP CONSTRAINT apex_molde_operacion_fk_puntos_montaje;
    
   desarrollo       postgres    false    323    323    198    198    2929            B           2606    20276 1   apex_molde_operacion apex_molde_operacion_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion
    ADD CONSTRAINT apex_molde_operacion_fk_tipo FOREIGN KEY (operacion_tipo) REFERENCES desarrollo.apex_molde_operacion_tipo(operacion_tipo) ON DELETE CASCADE DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_molde_operacion DROP CONSTRAINT apex_molde_operacion_fk_tipo;
    
   desarrollo       postgres    false    3128    323    319            P           2606    20392 B   apex_molde_operacion_importacion apex_molde_operacion_imp_fk_molde    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_importacion
    ADD CONSTRAINT apex_molde_operacion_imp_fk_molde FOREIGN KEY (molde, proyecto) REFERENCES desarrollo.apex_molde_operacion(molde, proyecto) ON DELETE CASCADE DEFERRABLE;
 p   ALTER TABLE ONLY desarrollo.apex_molde_operacion_importacion DROP CONSTRAINT apex_molde_operacion_imp_fk_molde;
    
   desarrollo       postgres    false    323    331    331    323    3134            F           2606    20316 @   apex_molde_operacion_log_elementos apex_molde_operacion_log_e_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_log_elementos
    ADD CONSTRAINT apex_molde_operacion_log_e_fk FOREIGN KEY (generacion) REFERENCES desarrollo.apex_molde_operacion_log(generacion) ON DELETE CASCADE DEFERRABLE;
 n   ALTER TABLE ONLY desarrollo.apex_molde_operacion_log_elementos DROP CONSTRAINT apex_molde_operacion_log_e_fk;
    
   desarrollo       postgres    false    325    327    3136            E           2606    20300 4   apex_molde_operacion_log apex_molde_operacion_log_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_log
    ADD CONSTRAINT apex_molde_operacion_log_fk FOREIGN KEY (molde, proyecto) REFERENCES desarrollo.apex_molde_operacion(molde, proyecto) ON DELETE CASCADE DEFERRABLE;
 b   ALTER TABLE ONLY desarrollo.apex_molde_operacion_log DROP CONSTRAINT apex_molde_operacion_log_fk;
    
   desarrollo       postgres    false    325    325    323    323    3134            D           2606    20266 .   apex_molde_operacion apex_molde_operacion_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion
    ADD CONSTRAINT apex_molde_operacion_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 \   ALTER TABLE ONLY desarrollo.apex_molde_operacion DROP CONSTRAINT apex_molde_operacion_proy;
    
   desarrollo       postgres    false    192    2919    323            ?           2606    20233 C   apex_molde_operacion_tipo_dato apex_molde_operacion_tipo_dato_fk_ef    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato
    ADD CONSTRAINT apex_molde_operacion_tipo_dato_fk_ef FOREIGN KEY (elemento_formulario) REFERENCES desarrollo.apex_elemento_formulario(elemento_formulario) DEFERRABLE;
 q   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato DROP CONSTRAINT apex_molde_operacion_tipo_dato_fk_ef;
    
   desarrollo       postgres    false    321    205    2945            >           2606    20238 G   apex_molde_operacion_tipo_dato apex_molde_operacion_tipo_dato_fk_estilo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato
    ADD CONSTRAINT apex_molde_operacion_tipo_dato_fk_estilo FOREIGN KEY (cuadro_estilo) REFERENCES desarrollo.apex_columna_estilo(columna_estilo) DEFERRABLE;
 u   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato DROP CONSTRAINT apex_molde_operacion_tipo_dato_fk_estilo;
    
   desarrollo       postgres    false    209    2951    321            =           2606    20243 H   apex_molde_operacion_tipo_dato apex_molde_operacion_tipo_dato_fk_formato    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato
    ADD CONSTRAINT apex_molde_operacion_tipo_dato_fk_formato FOREIGN KEY (cuadro_formato) REFERENCES desarrollo.apex_columna_formato(columna_formato) DEFERRABLE;
 v   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato DROP CONSTRAINT apex_molde_operacion_tipo_dato_fk_formato;
    
   desarrollo       postgres    false    321    211    2953            <           2606    20248 K   apex_molde_operacion_tipo_dato apex_molde_operacion_tipo_dato_fk_tipo_datos    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato
    ADD CONSTRAINT apex_molde_operacion_tipo_dato_fk_tipo_datos FOREIGN KEY (dt_tipo_dato) REFERENCES desarrollo.apex_tipo_datos(tipo) ON DELETE CASCADE DEFERRABLE;
 y   ALTER TABLE ONLY desarrollo.apex_molde_operacion_tipo_dato DROP CONSTRAINT apex_molde_operacion_tipo_dato_fk_tipo_datos;
    
   desarrollo       postgres    false    321    3102    302            �           2606    19358    apex_msg apex_msg_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_msg
    ADD CONSTRAINT apex_msg_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 G   ALTER TABLE ONLY desarrollo.apex_msg DROP CONSTRAINT apex_msg_fk_proy;
    
   desarrollo       postgres    false    2919    254    192            �           2606    19363    apex_msg apex_msg_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_msg
    ADD CONSTRAINT apex_msg_fk_tipo FOREIGN KEY (msg_tipo) REFERENCES desarrollo.apex_msg_tipo(msg_tipo) DEFERRABLE;
 G   ALTER TABLE ONLY desarrollo.apex_msg DROP CONSTRAINT apex_msg_fk_tipo;
    
   desarrollo       postgres    false    3026    252    254            �           2606    19442    apex_nota apex_nota_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_nota
    ADD CONSTRAINT apex_nota_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 I   ALTER TABLE ONLY desarrollo.apex_nota DROP CONSTRAINT apex_nota_fk_proy;
    
   desarrollo       postgres    false    2919    192    261            �           2606    19447    apex_nota apex_nota_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_nota
    ADD CONSTRAINT apex_nota_fk_tipo FOREIGN KEY (nota_tipo) REFERENCES desarrollo.apex_nota_tipo(nota_tipo) DEFERRABLE;
 I   ALTER TABLE ONLY desarrollo.apex_nota DROP CONSTRAINT apex_nota_fk_tipo;
    
   desarrollo       postgres    false    259    3036    261            �           2606    19437    apex_nota apex_nota_fk_usud    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_nota
    ADD CONSTRAINT apex_nota_fk_usud FOREIGN KEY (usuario_destino) REFERENCES desarrollo.apex_usuario(usuario) DEFERRABLE;
 I   ALTER TABLE ONLY desarrollo.apex_nota DROP CONSTRAINT apex_nota_fk_usud;
    
   desarrollo       postgres    false    2970    221    261            �           2606    19432    apex_nota apex_nota_fk_usuo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_nota
    ADD CONSTRAINT apex_nota_fk_usuo FOREIGN KEY (usuario_origen) REFERENCES desarrollo.apex_usuario(usuario) DEFERRABLE;
 I   ALTER TABLE ONLY desarrollo.apex_nota DROP CONSTRAINT apex_nota_fk_usuo;
    
   desarrollo       postgres    false    221    2970    261                       2606    19650 1   apex_objeto_ci_pantalla apex_obj_ci_pan__fk_padre    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla
    ADD CONSTRAINT apex_obj_ci_pan__fk_padre FOREIGN KEY (objeto_ci_proyecto, objeto_ci) REFERENCES desarrollo.apex_objeto_mt_me(objeto_mt_me_proyecto, objeto_mt_me) ON DELETE CASCADE DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla DROP CONSTRAINT apex_obj_ci_pan__fk_padre;
    
   desarrollo       postgres    false    3058    278    278    276    276                        2606    19655 3   apex_objeto_ci_pantalla apex_obj_ci_pan_fk_rec_orig    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla
    ADD CONSTRAINT apex_obj_ci_pan_fk_rec_orig FOREIGN KEY (imagen_recurso_origen) REFERENCES desarrollo.apex_recurso_origen(recurso_origen) DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla DROP CONSTRAINT apex_obj_ci_pan_fk_rec_orig;
    
   desarrollo       postgres    false    2939    278    202                       2606    19724 9   apex_objeto_cuadro_cc apex_obj_cuadro_cc_fk_objeto_cuadro    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_cc
    ADD CONSTRAINT apex_obj_cuadro_cc_fk_objeto_cuadro FOREIGN KEY (objeto_cuadro, objeto_cuadro_proyecto) REFERENCES desarrollo.apex_objeto_cuadro(objeto_cuadro, objeto_cuadro_proyecto) ON DELETE CASCADE DEFERRABLE;
 g   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_cc DROP CONSTRAINT apex_obj_cuadro_cc_fk_objeto_cuadro;
    
   desarrollo       postgres    false    283    283    3068    281    281            7           2606    20188 8   apex_objeto_rel_columnas_asoc apex_obj_datos_rel_asoc_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_rel_columnas_asoc
    ADD CONSTRAINT apex_obj_datos_rel_asoc_fk FOREIGN KEY (asoc_id, objeto, proyecto) REFERENCES desarrollo.apex_objeto_datos_rel_asoc(asoc_id, objeto, proyecto) ON DELETE CASCADE DEFERRABLE;
 f   ALTER TABLE ONLY desarrollo.apex_objeto_rel_columnas_asoc DROP CONSTRAINT apex_obj_datos_rel_asoc_fk;
    
   desarrollo       postgres    false    315    315    316    315    316    3122    316            4           2606    20168 :   apex_objeto_datos_rel_asoc apex_obj_datos_rel_asoc_fk_hijo    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel_asoc
    ADD CONSTRAINT apex_obj_datos_rel_asoc_fk_hijo FOREIGN KEY (proyecto, objeto, hijo_id) REFERENCES desarrollo.apex_objeto_dependencias(proyecto, objeto_consumidor, identificador) ON DELETE CASCADE DEFERRABLE;
 h   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel_asoc DROP CONSTRAINT apex_obj_datos_rel_asoc_fk_hijo;
    
   desarrollo       postgres    false    241    3004    241    241    315    315    315            6           2606    20158 <   apex_objeto_datos_rel_asoc apex_obj_datos_rel_asoc_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel_asoc
    ADD CONSTRAINT apex_obj_datos_rel_asoc_fk_objeto FOREIGN KEY (objeto, proyecto) REFERENCES desarrollo.apex_objeto_datos_rel(objeto, proyecto) ON DELETE CASCADE DEFERRABLE;
 j   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel_asoc DROP CONSTRAINT apex_obj_datos_rel_asoc_fk_objeto;
    
   desarrollo       postgres    false    315    3120    313    313    315            5           2606    20163 ;   apex_objeto_datos_rel_asoc apex_obj_datos_rel_asoc_fk_padre    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel_asoc
    ADD CONSTRAINT apex_obj_datos_rel_asoc_fk_padre FOREIGN KEY (proyecto, objeto, padre_id) REFERENCES desarrollo.apex_objeto_dependencias(proyecto, objeto_consumidor, identificador) ON DELETE CASCADE DEFERRABLE;
 i   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel_asoc DROP CONSTRAINT apex_obj_datos_rel_asoc_fk_padre;
    
   desarrollo       postgres    false    315    3004    241    241    241    315    315            )           2606    20051 2   apex_objeto_db_columna_fks apex_obj_db_col_fks_reg    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_columna_fks
    ADD CONSTRAINT apex_obj_db_col_fks_reg FOREIGN KEY (objeto_proyecto, objeto) REFERENCES desarrollo.apex_objeto_db_registros(objeto_proyecto, objeto) ON DELETE CASCADE DEFERRABLE;
 `   ALTER TABLE ONLY desarrollo.apex_objeto_db_columna_fks DROP CONSTRAINT apex_obj_db_col_fks_reg;
    
   desarrollo       postgres    false    303    307    307    303    3104            '           2606    20035 ;   apex_objeto_db_registros_col apex_obj_dbr_col_fk_objeto_dbr    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_col
    ADD CONSTRAINT apex_obj_dbr_col_fk_objeto_dbr FOREIGN KEY (objeto, objeto_proyecto) REFERENCES desarrollo.apex_objeto_db_registros(objeto, objeto_proyecto) ON DELETE CASCADE DEFERRABLE;
 i   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_col DROP CONSTRAINT apex_obj_dbr_col_fk_objeto_dbr;
    
   desarrollo       postgres    false    303    303    305    3104    305            (           2606    20030 5   apex_objeto_db_registros_col apex_obj_dbr_col_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_col
    ADD CONSTRAINT apex_obj_dbr_col_fk_tipo FOREIGN KEY (tipo) REFERENCES desarrollo.apex_tipo_datos(tipo) ON DELETE CASCADE DEFERRABLE;
 c   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_col DROP CONSTRAINT apex_obj_dbr_col_fk_tipo;
    
   desarrollo       postgres    false    302    3102    305            .           2606    20099 <   apex_objeto_db_registros_ext_col apex_obj_dbr_ext_col_fk_col    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext_col
    ADD CONSTRAINT apex_obj_dbr_ext_col_fk_col FOREIGN KEY (col_id, objeto, objeto_proyecto) REFERENCES desarrollo.apex_objeto_db_registros_col(col_id, objeto, objeto_proyecto) ON DELETE CASCADE DEFERRABLE;
 j   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext_col DROP CONSTRAINT apex_obj_dbr_ext_col_fk_col;
    
   desarrollo       postgres    false    305    310    310    310    305    305    3108            /           2606    20094 <   apex_objeto_db_registros_ext_col apex_obj_dbr_ext_col_fk_ext    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext_col
    ADD CONSTRAINT apex_obj_dbr_ext_col_fk_ext FOREIGN KEY (externa_id, objeto, objeto_proyecto) REFERENCES desarrollo.apex_objeto_db_registros_ext(externa_id, objeto, objeto_proyecto) ON DELETE CASCADE DEFERRABLE;
 j   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext_col DROP CONSTRAINT apex_obj_dbr_ext_col_fk_ext;
    
   desarrollo       postgres    false    3114    309    310    309    309    310    310            +           2606    20079 =   apex_objeto_db_registros_ext apex_obj_dbr_ext_fk_consulta_php    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext
    ADD CONSTRAINT apex_obj_dbr_ext_fk_consulta_php FOREIGN KEY (objeto_proyecto, carga_consulta_php) REFERENCES desarrollo.apex_consulta_php(proyecto, consulta_php) DEFERRABLE;
 k   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext DROP CONSTRAINT apex_obj_dbr_ext_fk_consulta_php;
    
   desarrollo       postgres    false    216    309    309    2961    216            ,           2606    20074 <   apex_objeto_db_registros_ext apex_obj_dbr_ext_fk_datos_tabla    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext
    ADD CONSTRAINT apex_obj_dbr_ext_fk_datos_tabla FOREIGN KEY (objeto_proyecto, carga_dt) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 j   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext DROP CONSTRAINT apex_obj_dbr_ext_fk_datos_tabla;
    
   desarrollo       postgres    false    238    309    238    309    2998            -           2606    20069 ;   apex_objeto_db_registros_ext apex_obj_dbr_ext_fk_objeto_dbr    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext
    ADD CONSTRAINT apex_obj_dbr_ext_fk_objeto_dbr FOREIGN KEY (objeto, objeto_proyecto) REFERENCES desarrollo.apex_objeto_db_registros(objeto, objeto_proyecto) ON DELETE CASCADE DEFERRABLE;
 i   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext DROP CONSTRAINT apex_obj_dbr_ext_fk_objeto_dbr;
    
   desarrollo       postgres    false    309    303    303    309    3104            *           2606    20084 >   apex_objeto_db_registros_ext apex_obj_dbr_ext_fk_punto_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext
    ADD CONSTRAINT apex_obj_dbr_ext_fk_punto_montaje FOREIGN KEY (objeto_proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 l   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_ext DROP CONSTRAINT apex_obj_dbr_ext_fk_punto_montaje;
    
   desarrollo       postgres    false    309    309    198    198    2929            0           2606    20115 =   apex_objeto_db_registros_uniq apex_obj_dbr_uniq_fk_objeto_dbr    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_uniq
    ADD CONSTRAINT apex_obj_dbr_uniq_fk_objeto_dbr FOREIGN KEY (objeto, objeto_proyecto) REFERENCES desarrollo.apex_objeto_db_registros(objeto, objeto_proyecto) ON DELETE CASCADE DEFERRABLE;
 k   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros_uniq DROP CONSTRAINT apex_obj_dbr_uniq_fk_objeto_dbr;
    
   desarrollo       postgres    false    303    303    312    312    3104            	           2606    19751 B   apex_objeto_ei_cuadro_columna apex_obj_ei_cuadro_fk_accion_vinculo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna
    ADD CONSTRAINT apex_obj_ei_cuadro_fk_accion_vinculo FOREIGN KEY (objeto_cuadro_proyecto, vinculo_item) REFERENCES desarrollo.apex_item(proyecto, item) ON DELETE CASCADE DEFERRABLE;
 p   ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna DROP CONSTRAINT apex_obj_ei_cuadro_fk_accion_vinculo;
    
   desarrollo       postgres    false    229    2982    285    285    229            
           2606    19746 ;   apex_objeto_ei_cuadro_columna apex_obj_ei_cuadro_fk_formato    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna
    ADD CONSTRAINT apex_obj_ei_cuadro_fk_formato FOREIGN KEY (formateo) REFERENCES desarrollo.apex_columna_formato(columna_formato) DEFERRABLE;
 i   ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna DROP CONSTRAINT apex_obj_ei_cuadro_fk_formato;
    
   desarrollo       postgres    false    211    2953    285                       2606    19741 A   apex_objeto_ei_cuadro_columna apex_obj_ei_cuadro_fk_objeto_cuadro    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna
    ADD CONSTRAINT apex_obj_ei_cuadro_fk_objeto_cuadro FOREIGN KEY (objeto_cuadro, objeto_cuadro_proyecto) REFERENCES desarrollo.apex_objeto_cuadro(objeto_cuadro, objeto_cuadro_proyecto) ON DELETE CASCADE DEFERRABLE;
 o   ALTER TABLE ONLY desarrollo.apex_objeto_ei_cuadro_columna DROP CONSTRAINT apex_obj_ei_cuadro_fk_objeto_cuadro;
    
   desarrollo       postgres    false    281    281    285    285    3068                        2606    19950 /   apex_objeto_codigo apex_objeto_codigo_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_codigo
    ADD CONSTRAINT apex_objeto_codigo_fk_objeto FOREIGN KEY (objeto_codigo_proyecto, objeto_codigo) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 ]   ALTER TABLE ONLY desarrollo.apex_objeto_codigo DROP CONSTRAINT apex_objeto_codigo_fk_objeto;
    
   desarrollo       postgres    false    298    298    238    238    2998            �           2606    19228 =   apex_objeto_dep_consumo apex_objeto_consumo_depen_fk_objeto_c    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_dep_consumo
    ADD CONSTRAINT apex_objeto_consumo_depen_fk_objeto_c FOREIGN KEY (proyecto, objeto_consumidor) REFERENCES desarrollo.apex_objeto(proyecto, objeto) ON DELETE CASCADE DEFERRABLE;
 k   ALTER TABLE ONLY desarrollo.apex_objeto_dep_consumo DROP CONSTRAINT apex_objeto_consumo_depen_fk_objeto_c;
    
   desarrollo       postgres    false    238    2998    238    243    243            �           2606    19233 =   apex_objeto_dep_consumo apex_objeto_consumo_depen_fk_objeto_p    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_dep_consumo
    ADD CONSTRAINT apex_objeto_consumo_depen_fk_objeto_p FOREIGN KEY (proyecto, objeto_proveedor) REFERENCES desarrollo.apex_objeto(proyecto, objeto) ON DELETE CASCADE DEFERRABLE;
 k   ALTER TABLE ONLY desarrollo.apex_objeto_dep_consumo DROP CONSTRAINT apex_objeto_consumo_depen_fk_objeto_p;
    
   desarrollo       postgres    false    238    243    2998    243    238                       2606    19767 L   apex_objeto_cuadro_col_cc apex_objeto_cuadro_col_cc_fk_apex_objeto_cuadro_cc    FK CONSTRAINT     3  ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_col_cc
    ADD CONSTRAINT apex_objeto_cuadro_col_cc_fk_apex_objeto_cuadro_cc FOREIGN KEY (objeto_cuadro_cc, objeto_cuadro_proyecto, objeto_cuadro) REFERENCES desarrollo.apex_objeto_cuadro_cc(objeto_cuadro_cc, objeto_cuadro_proyecto, objeto_cuadro) DEFERRABLE;
 z   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_col_cc DROP CONSTRAINT apex_objeto_cuadro_col_cc_fk_apex_objeto_cuadro_cc;
    
   desarrollo       postgres    false    283    283    286    286    286    3070    283                       2606    19772 T   apex_objeto_cuadro_col_cc apex_objeto_cuadro_col_cc_fk_apex_objeto_ei_cuadro_columna    FK CONSTRAINT     E  ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_col_cc
    ADD CONSTRAINT apex_objeto_cuadro_col_cc_fk_apex_objeto_ei_cuadro_columna FOREIGN KEY (objeto_cuadro_col, objeto_cuadro, objeto_cuadro_proyecto) REFERENCES desarrollo.apex_objeto_ei_cuadro_columna(objeto_cuadro_col, objeto_cuadro, objeto_cuadro_proyecto) DEFERRABLE;
 �   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro_col_cc DROP CONSTRAINT apex_objeto_cuadro_col_cc_fk_apex_objeto_ei_cuadro_columna;
    
   desarrollo       postgres    false    286    285    3074    286    285    285    286                       2606    19705 /   apex_objeto_cuadro apex_objeto_cuadro_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro
    ADD CONSTRAINT apex_objeto_cuadro_fk_objeto FOREIGN KEY (objeto_cuadro, objeto_cuadro_proyecto) REFERENCES desarrollo.apex_objeto(objeto, proyecto) ON DELETE CASCADE DEFERRABLE;
 ]   ALTER TABLE ONLY desarrollo.apex_objeto_cuadro DROP CONSTRAINT apex_objeto_cuadro_fk_objeto;
    
   desarrollo       postgres    false    281    2998    238    238    281            3           2606    20132 1   apex_objeto_datos_rel apex_objeto_datos_rel_fk_ap    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel
    ADD CONSTRAINT apex_objeto_datos_rel_fk_ap FOREIGN KEY (ap) REFERENCES desarrollo.apex_admin_persistencia(ap) DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel DROP CONSTRAINT apex_objeto_datos_rel_fk_ap;
    
   desarrollo       postgres    false    3100    301    313            2           2606    20137 5   apex_objeto_datos_rel apex_objeto_datos_rel_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel
    ADD CONSTRAINT apex_objeto_datos_rel_fk_objeto FOREIGN KEY (objeto, proyecto) REFERENCES desarrollo.apex_objeto(objeto, proyecto) DEFERRABLE;
 c   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel DROP CONSTRAINT apex_objeto_datos_rel_fk_objeto;
    
   desarrollo       postgres    false    238    313    313    238    2998            &           2606    19992 .   apex_objeto_db_registros apex_objeto_dbr_fk_ap    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros
    ADD CONSTRAINT apex_objeto_dbr_fk_ap FOREIGN KEY (ap) REFERENCES desarrollo.apex_admin_persistencia(ap) DEFERRABLE;
 \   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros DROP CONSTRAINT apex_objeto_dbr_fk_ap;
    
   desarrollo       postgres    false    3100    301    303            $           2606    20002 2   apex_objeto_db_registros apex_objeto_dbr_fk_fuente    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros
    ADD CONSTRAINT apex_objeto_dbr_fk_fuente FOREIGN KEY (fuente_datos_proyecto, fuente_datos) REFERENCES desarrollo.apex_fuente_datos(proyecto, fuente_datos) DEFERRABLE;
 `   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros DROP CONSTRAINT apex_objeto_dbr_fk_fuente;
    
   desarrollo       postgres    false    2935    200    200    303    303            %           2606    19997 2   apex_objeto_db_registros apex_objeto_dbr_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros
    ADD CONSTRAINT apex_objeto_dbr_fk_objeto FOREIGN KEY (objeto, objeto_proyecto) REFERENCES desarrollo.apex_objeto(objeto, proyecto) ON DELETE CASCADE DEFERRABLE;
 `   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros DROP CONSTRAINT apex_objeto_dbr_fk_objeto;
    
   desarrollo       postgres    false    303    2998    238    238    303            �           2606    19205 6   apex_objeto_dependencias apex_objeto_depen_fk_objeto_c    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_dependencias
    ADD CONSTRAINT apex_objeto_depen_fk_objeto_c FOREIGN KEY (proyecto, objeto_consumidor) REFERENCES desarrollo.apex_objeto(proyecto, objeto) ON DELETE CASCADE DEFERRABLE;
 d   ALTER TABLE ONLY desarrollo.apex_objeto_dependencias DROP CONSTRAINT apex_objeto_depen_fk_objeto_c;
    
   desarrollo       postgres    false    241    241    238    238    2998            �           2606    19210 6   apex_objeto_dependencias apex_objeto_depen_fk_objeto_p    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_dependencias
    ADD CONSTRAINT apex_objeto_depen_fk_objeto_p FOREIGN KEY (proyecto, objeto_proveedor) REFERENCES desarrollo.apex_objeto(proyecto, objeto) ON DELETE CASCADE DEFERRABLE;
 d   ALTER TABLE ONLY desarrollo.apex_objeto_dependencias DROP CONSTRAINT apex_objeto_depen_fk_objeto_p;
    
   desarrollo       postgres    false    241    238    238    2998    241            !           2606    19960 3   apex_objeto_ei_firma apex_objeto_ei_firma_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_firma
    ADD CONSTRAINT apex_objeto_ei_firma_fk_objeto FOREIGN KEY (objeto_ei_firma_proyecto, objeto_ei_firma) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo.apex_objeto_ei_firma DROP CONSTRAINT apex_objeto_ei_firma_fk_objeto;
    
   desarrollo       postgres    false    238    2998    299    299    238                       2606    19847 1   apex_objeto_esquema apex_objeto_esquema_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_esquema
    ADD CONSTRAINT apex_objeto_esquema_fk_objeto FOREIGN KEY (objeto_esquema_proyecto, objeto_esquema) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_objeto_esquema DROP CONSTRAINT apex_objeto_esquema_fk_objeto;
    
   desarrollo       postgres    false    290    290    238    238    2998            �           2606    19265 9   apex_objeto_eventos apex_objeto_eventos_fk_accion_vinculo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_eventos
    ADD CONSTRAINT apex_objeto_eventos_fk_accion_vinculo FOREIGN KEY (proyecto, accion_vinculo_item) REFERENCES desarrollo.apex_item(proyecto, item) ON DELETE CASCADE DEFERRABLE;
 g   ALTER TABLE ONLY desarrollo.apex_objeto_eventos DROP CONSTRAINT apex_objeto_eventos_fk_accion_vinculo;
    
   desarrollo       postgres    false    229    2982    229    245    245            �           2606    19260 1   apex_objeto_eventos apex_objeto_eventos_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_eventos
    ADD CONSTRAINT apex_objeto_eventos_fk_objeto FOREIGN KEY (proyecto, objeto) REFERENCES desarrollo.apex_objeto(proyecto, objeto) ON DELETE CASCADE DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_objeto_eventos DROP CONSTRAINT apex_objeto_eventos_fk_objeto;
    
   desarrollo       postgres    false    245    2998    238    238    245            �           2606    19255 3   apex_objeto_eventos apex_objeto_eventos_fk_rec_orig    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_eventos
    ADD CONSTRAINT apex_objeto_eventos_fk_rec_orig FOREIGN KEY (imagen_recurso_origen) REFERENCES desarrollo.apex_recurso_origen(recurso_origen) DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo.apex_objeto_eventos DROP CONSTRAINT apex_objeto_eventos_fk_rec_orig;
    
   desarrollo       postgres    false    2939    245    202            �           2606    19159     apex_objeto apex_objeto_fk_clase    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto
    ADD CONSTRAINT apex_objeto_fk_clase FOREIGN KEY (clase_proyecto, clase) REFERENCES desarrollo.apex_clase(proyecto, clase) DEFERRABLE;
 N   ALTER TABLE ONLY desarrollo.apex_objeto DROP CONSTRAINT apex_objeto_fk_clase;
    
   desarrollo       postgres    false    234    234    238    238    2990            �           2606    19164 '   apex_objeto apex_objeto_fk_fuente_datos    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto
    ADD CONSTRAINT apex_objeto_fk_fuente_datos FOREIGN KEY (fuente_datos_proyecto, fuente_datos) REFERENCES desarrollo.apex_fuente_datos(proyecto, fuente_datos) DEFERRABLE;
 U   ALTER TABLE ONLY desarrollo.apex_objeto DROP CONSTRAINT apex_objeto_fk_fuente_datos;
    
   desarrollo       postgres    false    200    2935    238    238    200            �           2606    19527 0   apex_relacion_tablas apex_objeto_fk_fuente_datos    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_relacion_tablas
    ADD CONSTRAINT apex_objeto_fk_fuente_datos FOREIGN KEY (fuente_datos_proyecto, fuente_datos) REFERENCES desarrollo.apex_fuente_datos(proyecto, fuente_datos) DEFERRABLE;
 ^   ALTER TABLE ONLY desarrollo.apex_relacion_tablas DROP CONSTRAINT apex_objeto_fk_fuente_datos;
    
   desarrollo       postgres    false    267    267    200    200    2935            �           2606    19548 *   apex_dimension apex_objeto_fk_fuente_datos    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_dimension
    ADD CONSTRAINT apex_objeto_fk_fuente_datos FOREIGN KEY (fuente_datos_proyecto, fuente_datos) REFERENCES desarrollo.apex_fuente_datos(proyecto, fuente_datos) DEFERRABLE;
 X   ALTER TABLE ONLY desarrollo.apex_dimension DROP CONSTRAINT apex_objeto_fk_fuente_datos;
    
   desarrollo       postgres    false    200    269    269    200    2935            "           2606    20012 6   apex_objeto_db_registros apex_objeto_fk_fuente_schemas    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros
    ADD CONSTRAINT apex_objeto_fk_fuente_schemas FOREIGN KEY (objeto_proyecto, fuente_datos, esquema) REFERENCES desarrollo.apex_fuente_datos_schemas(proyecto, fuente_datos, nombre) DEFERRABLE;
 d   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros DROP CONSTRAINT apex_objeto_fk_fuente_schemas;
    
   desarrollo       postgres    false    201    303    303    303    201    201    2937            �           2606    20794 (   apex_proyecto apex_objeto_fk_pm_contexto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_objeto_fk_pm_contexto FOREIGN KEY (proyecto, pm_contexto) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 V   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_objeto_fk_pm_contexto;
    
   desarrollo       postgres    false    198    192    192    2929    198            �           2606    20809 )   apex_proyecto apex_objeto_fk_pm_impresion    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_objeto_fk_pm_impresion FOREIGN KEY (proyecto, pm_impresion) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 W   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_objeto_fk_pm_impresion;
    
   desarrollo       postgres    false    2929    192    192    198    198            �           2606    20799 &   apex_proyecto apex_objeto_fk_pm_sesion    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_objeto_fk_pm_sesion FOREIGN KEY (proyecto, pm_sesion) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 T   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_objeto_fk_pm_sesion;
    
   desarrollo       postgres    false    2929    192    192    198    198            �           2606    20804 '   apex_proyecto apex_objeto_fk_pm_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_objeto_fk_pm_usuario FOREIGN KEY (proyecto, pm_usuario) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 U   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_objeto_fk_pm_usuario;
    
   desarrollo       postgres    false    192    198    198    192    2929            �           2606    19169 #   apex_objeto apex_objeto_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto
    ADD CONSTRAINT apex_objeto_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 Q   ALTER TABLE ONLY desarrollo.apex_objeto DROP CONSTRAINT apex_objeto_fk_proyecto;
    
   desarrollo       postgres    false    192    2919    238            �           2606    18809 .   apex_pagina_tipo apex_objeto_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_pagina_tipo
    ADD CONSTRAINT apex_objeto_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 \   ALTER TABLE ONLY desarrollo.apex_pagina_tipo DROP CONSTRAINT apex_objeto_fk_puntos_montaje;
    
   desarrollo       postgres    false    2929    198    207    207    198            �           2606    18890 /   apex_consulta_php apex_objeto_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_consulta_php
    ADD CONSTRAINT apex_objeto_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 ]   ALTER TABLE ONLY desarrollo.apex_consulta_php DROP CONSTRAINT apex_objeto_fk_puntos_montaje;
    
   desarrollo       postgres    false    198    216    216    198    2929            �           2606    19002 ,   apex_item_zona apex_objeto_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_item_zona
    ADD CONSTRAINT apex_objeto_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 Z   ALTER TABLE ONLY desarrollo.apex_item_zona DROP CONSTRAINT apex_objeto_fk_puntos_montaje;
    
   desarrollo       postgres    false    198    198    227    2929    227            �           2606    19174 )   apex_objeto apex_objeto_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto
    ADD CONSTRAINT apex_objeto_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 W   ALTER TABLE ONLY desarrollo.apex_objeto DROP CONSTRAINT apex_objeto_fk_puntos_montaje;
    
   desarrollo       postgres    false    238    198    2929    198    238            �           2606    19660 5   apex_objeto_ci_pantalla apex_objeto_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla
    ADD CONSTRAINT apex_objeto_fk_puntos_montaje FOREIGN KEY (objeto_ci_proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 c   ALTER TABLE ONLY desarrollo.apex_objeto_ci_pantalla DROP CONSTRAINT apex_objeto_fk_puntos_montaje;
    
   desarrollo       postgres    false    2929    278    278    198    198                       2606    19833 :   apex_objeto_ei_formulario_ef apex_objeto_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef
    ADD CONSTRAINT apex_objeto_fk_puntos_montaje FOREIGN KEY (objeto_ei_formulario_proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 h   ALTER TABLE ONLY desarrollo.apex_objeto_ei_formulario_ef DROP CONSTRAINT apex_objeto_fk_puntos_montaje;
    
   desarrollo       postgres    false    198    198    2929    289    289            #           2606    20007 6   apex_objeto_db_registros apex_objeto_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros
    ADD CONSTRAINT apex_objeto_fk_puntos_montaje FOREIGN KEY (objeto_proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 d   ALTER TABLE ONLY desarrollo.apex_objeto_db_registros DROP CONSTRAINT apex_objeto_fk_puntos_montaje;
    
   desarrollo       postgres    false    303    303    198    198    2929            1           2606    20142 3   apex_objeto_datos_rel apex_objeto_fk_puntos_montaje    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel
    ADD CONSTRAINT apex_objeto_fk_puntos_montaje FOREIGN KEY (proyecto, punto_montaje) REFERENCES desarrollo.apex_puntos_montaje(proyecto, id) DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo.apex_objeto_datos_rel DROP CONSTRAINT apex_objeto_fk_puntos_montaje;
    
   desarrollo       postgres    false    2929    198    313    198    313                       2606    19940 2   apex_objeto_grafico apex_objeto_grafico_fk_grafico    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_grafico
    ADD CONSTRAINT apex_objeto_grafico_fk_grafico FOREIGN KEY (grafico) REFERENCES desarrollo.apex_grafico(grafico) DEFERRABLE;
 `   ALTER TABLE ONLY desarrollo.apex_objeto_grafico DROP CONSTRAINT apex_objeto_grafico_fk_grafico;
    
   desarrollo       postgres    false    296    297    3092                       2606    19935 1   apex_objeto_grafico apex_objeto_grafico_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_grafico
    ADD CONSTRAINT apex_objeto_grafico_fk_objeto FOREIGN KEY (objeto_grafico_proyecto, objeto_grafico) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_objeto_grafico DROP CONSTRAINT apex_objeto_grafico_fk_objeto;
    
   desarrollo       postgres    false    2998    238    238    297    297            �           2606    19187 +   apex_objeto_info apex_objeto_info_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_info
    ADD CONSTRAINT apex_objeto_info_fk_objeto FOREIGN KEY (objeto_proyecto, objeto) REFERENCES desarrollo.apex_objeto(proyecto, objeto) ON DELETE CASCADE DEFERRABLE;
 Y   ALTER TABLE ONLY desarrollo.apex_objeto_info DROP CONSTRAINT apex_objeto_info_fk_objeto;
    
   desarrollo       postgres    false    239    2998    238    238    239                       2606    19917 +   apex_objeto_mapa apex_objeto_mapa_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_mapa
    ADD CONSTRAINT apex_objeto_mapa_fk_objeto FOREIGN KEY (objeto_mapa_proyecto, objeto_mapa) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 Y   ALTER TABLE ONLY desarrollo.apex_objeto_mapa DROP CONSTRAINT apex_objeto_mapa_fk_objeto;
    
   desarrollo       postgres    false    238    295    295    238    2998            �           2606    19402 )   apex_objeto_msg apex_objeto_msg_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_msg
    ADD CONSTRAINT apex_objeto_msg_fk_objeto FOREIGN KEY (objeto, objeto_proyecto) REFERENCES desarrollo.apex_objeto(objeto, proyecto) ON DELETE CASCADE DEFERRABLE;
 W   ALTER TABLE ONLY desarrollo.apex_objeto_msg DROP CONSTRAINT apex_objeto_msg_fk_objeto;
    
   desarrollo       postgres    false    238    238    2998    258    258            �           2606    19407 '   apex_objeto_msg apex_objeto_msg_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_msg
    ADD CONSTRAINT apex_objeto_msg_fk_tipo FOREIGN KEY (msg_tipo) REFERENCES desarrollo.apex_msg_tipo(msg_tipo) DEFERRABLE;
 U   ALTER TABLE ONLY desarrollo.apex_objeto_msg DROP CONSTRAINT apex_objeto_msg_fk_tipo;
    
   desarrollo       postgres    false    3026    252    258            �           2606    19506 +   apex_objeto_nota apex_objeto_nota_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_nota
    ADD CONSTRAINT apex_objeto_nota_fk_objeto FOREIGN KEY (objeto_proyecto, objeto) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 Y   ALTER TABLE ONLY desarrollo.apex_objeto_nota DROP CONSTRAINT apex_objeto_nota_fk_objeto;
    
   desarrollo       postgres    false    265    265    238    238    2998            �           2606    19511 )   apex_objeto_nota apex_objeto_nota_fk_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_nota
    ADD CONSTRAINT apex_objeto_nota_fk_tipo FOREIGN KEY (nota_tipo) REFERENCES desarrollo.apex_nota_tipo(nota_tipo) DEFERRABLE;
 W   ALTER TABLE ONLY desarrollo.apex_objeto_nota DROP CONSTRAINT apex_objeto_nota_fk_tipo;
    
   desarrollo       postgres    false    259    3036    265            �           2606    19501 )   apex_objeto_nota apex_objeto_nota_fk_usud    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_nota
    ADD CONSTRAINT apex_objeto_nota_fk_usud FOREIGN KEY (usuario_destino) REFERENCES desarrollo.apex_usuario(usuario) DEFERRABLE;
 W   ALTER TABLE ONLY desarrollo.apex_objeto_nota DROP CONSTRAINT apex_objeto_nota_fk_usud;
    
   desarrollo       postgres    false    265    221    2970            �           2606    19496 )   apex_objeto_nota apex_objeto_nota_fk_usuo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_nota
    ADD CONSTRAINT apex_objeto_nota_fk_usuo FOREIGN KEY (usuario_origen) REFERENCES desarrollo.apex_usuario(usuario) DEFERRABLE;
 W   ALTER TABLE ONLY desarrollo.apex_objeto_nota DROP CONSTRAINT apex_objeto_nota_fk_usuo;
    
   desarrollo       postgres    false    265    221    2970                       2606    19789 4   apex_objeto_ut_formulario apex_objeto_ut_f_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_ut_formulario
    ADD CONSTRAINT apex_objeto_ut_f_fk_objeto FOREIGN KEY (objeto_ut_formulario, objeto_ut_formulario_proyecto) REFERENCES desarrollo.apex_objeto(objeto, proyecto) ON DELETE CASCADE DEFERRABLE;
 b   ALTER TABLE ONLY desarrollo.apex_objeto_ut_formulario DROP CONSTRAINT apex_objeto_ut_f_fk_objeto;
    
   desarrollo       postgres    false    287    2998    238    238    287                       2606    19670 F   apex_objetos_pantalla apex_objetos_pantalla_apex_objeto_ci_pantalla_fk    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objetos_pantalla
    ADD CONSTRAINT apex_objetos_pantalla_apex_objeto_ci_pantalla_fk FOREIGN KEY (pantalla, objeto_ci, proyecto) REFERENCES desarrollo.apex_objeto_ci_pantalla(pantalla, objeto_ci, objeto_ci_proyecto) ON DELETE CASCADE DEFERRABLE;
 t   ALTER TABLE ONLY desarrollo.apex_objetos_pantalla DROP CONSTRAINT apex_objetos_pantalla_apex_objeto_ci_pantalla_fk;
    
   desarrollo       postgres    false    279    278    278    278    3060    279    279                       2606    19675 G   apex_objetos_pantalla apex_objetos_pantalla_apex_objeto_dependencias_fk    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_objetos_pantalla
    ADD CONSTRAINT apex_objetos_pantalla_apex_objeto_dependencias_fk FOREIGN KEY (dep_id, proyecto, objeto_ci) REFERENCES desarrollo.apex_objeto_dependencias(dep_id, proyecto, objeto_consumidor) ON DELETE CASCADE DEFERRABLE;
 u   ALTER TABLE ONLY desarrollo.apex_objetos_pantalla DROP CONSTRAINT apex_objetos_pantalla_apex_objeto_dependencias_fk;
    
   desarrollo       postgres    false    279    3002    241    241    241    279    279            �           2606    18804 )   apex_pagina_tipo apex_pagina_tipo_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_pagina_tipo
    ADD CONSTRAINT apex_pagina_tipo_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 W   ALTER TABLE ONLY desarrollo.apex_pagina_tipo DROP CONSTRAINT apex_pagina_tipo_fk_proy;
    
   desarrollo       postgres    false    2919    192    207            Z           2606    20496 2   apex_permiso_grupo_acc apex_per_grupo_acc_grupo_fk    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_permiso_grupo_acc
    ADD CONSTRAINT apex_per_grupo_acc_grupo_fk FOREIGN KEY (proyecto, usuario_grupo_acc) REFERENCES desarrollo.apex_usuario_grupo_acc(proyecto, usuario_grupo_acc) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 `   ALTER TABLE ONLY desarrollo.apex_permiso_grupo_acc DROP CONSTRAINT apex_per_grupo_acc_grupo_fk;
    
   desarrollo       postgres    false    341    341    338    338    3156            [           2606    20491 0   apex_permiso_grupo_acc apex_per_grupo_acc_per_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_permiso_grupo_acc
    ADD CONSTRAINT apex_per_grupo_acc_per_fk FOREIGN KEY (permiso, proyecto) REFERENCES desarrollo.apex_permiso(permiso, proyecto) DEFERRABLE;
 ^   ALTER TABLE ONLY desarrollo.apex_permiso_grupo_acc DROP CONSTRAINT apex_per_grupo_acc_per_fk;
    
   desarrollo       postgres    false    333    341    341    333    3148            �           2606    18920 C   apex_perfil_datos_set_prueba apex_perfil_datos_set_prueba_fk_fuente    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_perfil_datos_set_prueba
    ADD CONSTRAINT apex_perfil_datos_set_prueba_fk_fuente FOREIGN KEY (proyecto, fuente_datos) REFERENCES desarrollo.apex_fuente_datos(proyecto, fuente_datos) DEFERRABLE;
 q   ALTER TABLE ONLY desarrollo.apex_perfil_datos_set_prueba DROP CONSTRAINT apex_perfil_datos_set_prueba_fk_fuente;
    
   desarrollo       postgres    false    200    219    219    200    2935            �           2606    20769 )   apex_proyecto apex_proyecto_fk_menu_tipos    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_proyecto_fk_menu_tipos FOREIGN KEY (menu) REFERENCES desarrollo.apex_menu_tipos(menu) DEFERRABLE;
 W   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_proyecto_fk_menu_tipos;
    
   desarrollo       postgres    false    2923    192    194            �           2606    20774 *   apex_proyecto apex_proyecto_fk_pagina_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_proyecto_fk_pagina_tipo FOREIGN KEY (proyecto, pagina_tipo) REFERENCES desarrollo.apex_pagina_tipo(proyecto, pagina_tipo) DEFERRABLE;
 X   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_proyecto_fk_pagina_tipo;
    
   desarrollo       postgres    false    192    207    207    2949    192            �           2606    18685 )   apex_puntos_montaje apex_proyecto_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_puntos_montaje
    ADD CONSTRAINT apex_proyecto_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 W   ALTER TABLE ONLY desarrollo.apex_puntos_montaje DROP CONSTRAINT apex_proyecto_fk_proy;
    
   desarrollo       postgres    false    198    192    2919            �           2606    19275 5   apex_ptos_control_x_evento apex_proyecto_fk_ptos_ctrl    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_ptos_control_x_evento
    ADD CONSTRAINT apex_proyecto_fk_ptos_ctrl FOREIGN KEY (proyecto, pto_control) REFERENCES desarrollo.apex_ptos_control(proyecto, pto_control) DEFERRABLE;
 c   ALTER TABLE ONLY desarrollo.apex_ptos_control_x_evento DROP CONSTRAINT apex_proyecto_fk_ptos_ctrl;
    
   desarrollo       postgres    false    2955    246    246    212    212            �           2606    20754 #   apex_proyecto apex_proyecto_item_is    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_proyecto_item_is FOREIGN KEY (proyecto, item_inicio_sesion) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 Q   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_proyecto_item_is;
    
   desarrollo       postgres    false    2982    229    192    192    229            �           2606    20759 #   apex_proyecto apex_proyecto_item_ps    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_proyecto_item_ps FOREIGN KEY (proyecto, item_pre_sesion) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 Q   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_proyecto_item_ps;
    
   desarrollo       postgres    false    229    192    192    229    2982            �           2606    20764 #   apex_proyecto apex_proyecto_item_ss    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_proyecto
    ADD CONSTRAINT apex_proyecto_item_ss FOREIGN KEY (proyecto, item_set_sesion) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 Q   ALTER TABLE ONLY desarrollo.apex_proyecto DROP CONSTRAINT apex_proyecto_item_ss;
    
   desarrollo       postgres    false    192    192    2982    229    229            �           2606    18869 7   apex_ptos_control_ctrl apex_ptos_ctrl_ctrl_fk_ptos_ctrl    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_ptos_control_ctrl
    ADD CONSTRAINT apex_ptos_ctrl_ctrl_fk_ptos_ctrl FOREIGN KEY (proyecto, pto_control) REFERENCES desarrollo.apex_ptos_control(proyecto, pto_control) DEFERRABLE;
 e   ALTER TABLE ONLY desarrollo.apex_ptos_control_ctrl DROP CONSTRAINT apex_ptos_ctrl_ctrl_fk_ptos_ctrl;
    
   desarrollo       postgres    false    212    214    214    212    2955            �           2606    18854 9   apex_ptos_control_param apex_ptos_ctrl_param_fk_ptos_ctrl    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_ptos_control_param
    ADD CONSTRAINT apex_ptos_ctrl_param_fk_ptos_ctrl FOREIGN KEY (proyecto, pto_control) REFERENCES desarrollo.apex_ptos_control(proyecto, pto_control) DEFERRABLE;
 g   ALTER TABLE ONLY desarrollo.apex_ptos_control_param DROP CONSTRAINT apex_ptos_ctrl_param_fk_ptos_ctrl;
    
   desarrollo       postgres    false    2955    213    213    212    212            �           2606    19285 9   apex_ptos_control_x_evento apex_ptos_ctrl_x_evt_fk_evento    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_ptos_control_x_evento
    ADD CONSTRAINT apex_ptos_ctrl_x_evt_fk_evento FOREIGN KEY (evento_id, proyecto) REFERENCES desarrollo.apex_objeto_eventos(evento_id, proyecto) DEFERRABLE;
 g   ALTER TABLE ONLY desarrollo.apex_ptos_control_x_evento DROP CONSTRAINT apex_ptos_ctrl_x_evt_fk_evento;
    
   desarrollo       postgres    false    246    246    245    245    3010            �           2606    19280 ;   apex_ptos_control_x_evento apex_ptos_ctrl_x_evt_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_ptos_control_x_evento
    ADD CONSTRAINT apex_ptos_ctrl_x_evt_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 i   ALTER TABLE ONLY desarrollo.apex_ptos_control_x_evento DROP CONSTRAINT apex_ptos_ctrl_x_evt_fk_proyecto;
    
   desarrollo       postgres    false    246    2919    192            �           2606    19532 1   apex_relacion_tablas apex_relacion_tablas_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_relacion_tablas
    ADD CONSTRAINT apex_relacion_tablas_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_relacion_tablas DROP CONSTRAINT apex_relacion_tablas_fk_proy;
    
   desarrollo       postgres    false    267    192    2919            k           2606    20618 F   apex_restriccion_funcional_cols apex_restriccion_funcional_cols_fk_evt    FK CONSTRAINT     )  ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_cols
    ADD CONSTRAINT apex_restriccion_funcional_cols_fk_evt FOREIGN KEY (proyecto, objeto_cuadro, objeto_cuadro_col) REFERENCES desarrollo.apex_objeto_ei_cuadro_columna(objeto_cuadro_proyecto, objeto_cuadro, objeto_cuadro_col) DEFERRABLE;
 t   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_cols DROP CONSTRAINT apex_restriccion_funcional_cols_fk_evt;
    
   desarrollo       postgres    false    285    349    349    349    285    285    3074            l           2606    20613 E   apex_restriccion_funcional_cols apex_restriccion_funcional_cols_fk_pf    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_cols
    ADD CONSTRAINT apex_restriccion_funcional_cols_fk_pf FOREIGN KEY (proyecto, restriccion_funcional) REFERENCES desarrollo.apex_restriccion_funcional(proyecto, restriccion_funcional) DEFERRABLE;
 s   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_cols DROP CONSTRAINT apex_restriccion_funcional_cols_fk_pf;
    
   desarrollo       postgres    false    3164    343    343    349    349            _           2606    20538 A   apex_restriccion_funcional_ef apex_restriccion_funcional_ef_fk_ef    FK CONSTRAINT     H  ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ef
    ADD CONSTRAINT apex_restriccion_funcional_ef_fk_ef FOREIGN KEY (proyecto, objeto_ei_formulario, objeto_ei_formulario_fila) REFERENCES desarrollo.apex_objeto_ei_formulario_ef(objeto_ei_formulario_proyecto, objeto_ei_formulario, objeto_ei_formulario_fila) DEFERRABLE;
 o   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ef DROP CONSTRAINT apex_restriccion_funcional_ef_fk_ef;
    
   desarrollo       postgres    false    289    3080    345    289    289    345    345            `           2606    20533 A   apex_restriccion_funcional_ef apex_restriccion_funcional_ef_fk_pf    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ef
    ADD CONSTRAINT apex_restriccion_funcional_ef_fk_pf FOREIGN KEY (proyecto, restriccion_funcional) REFERENCES desarrollo.apex_restriccion_funcional(proyecto, restriccion_funcional) DEFERRABLE;
 o   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ef DROP CONSTRAINT apex_restriccion_funcional_ef_fk_pf;
    
   desarrollo       postgres    false    345    3164    343    343    345            h           2606    20598 B   apex_restriccion_funcional_ei apex_restriccion_funcional_ei_fk_evt    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ei
    ADD CONSTRAINT apex_restriccion_funcional_ei_fk_evt FOREIGN KEY (proyecto, objeto) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 p   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ei DROP CONSTRAINT apex_restriccion_funcional_ei_fk_evt;
    
   desarrollo       postgres    false    348    348    238    238    2998            i           2606    20593 A   apex_restriccion_funcional_ei apex_restriccion_funcional_ei_fk_pf    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ei
    ADD CONSTRAINT apex_restriccion_funcional_ei_fk_pf FOREIGN KEY (proyecto, restriccion_funcional) REFERENCES desarrollo.apex_restriccion_funcional(proyecto, restriccion_funcional) DEFERRABLE;
 o   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ei DROP CONSTRAINT apex_restriccion_funcional_ei_fk_pf;
    
   desarrollo       postgres    false    348    343    3164    343    348            e           2606    20578 D   apex_restriccion_funcional_evt apex_restriccion_funcional_evt_fk_evt    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_evt
    ADD CONSTRAINT apex_restriccion_funcional_evt_fk_evt FOREIGN KEY (proyecto, evento_id) REFERENCES desarrollo.apex_objeto_eventos(proyecto, evento_id) DEFERRABLE;
 r   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_evt DROP CONSTRAINT apex_restriccion_funcional_evt_fk_evt;
    
   desarrollo       postgres    false    3010    347    245    245    347            f           2606    20573 C   apex_restriccion_funcional_evt apex_restriccion_funcional_evt_fk_pf    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_evt
    ADD CONSTRAINT apex_restriccion_funcional_evt_fk_pf FOREIGN KEY (proyecto, restriccion_funcional) REFERENCES desarrollo.apex_restriccion_funcional(proyecto, restriccion_funcional) DEFERRABLE;
 q   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_evt DROP CONSTRAINT apex_restriccion_funcional_evt_fk_pf;
    
   desarrollo       postgres    false    347    347    343    3164    343            n           2606    20638 S   apex_restriccion_funcional_filtro_cols apex_restriccion_funcional_filtro_col_fk_col    FK CONSTRAINT     A  ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_filtro_cols
    ADD CONSTRAINT apex_restriccion_funcional_filtro_col_fk_col FOREIGN KEY (proyecto, objeto_ei_filtro, objeto_ei_filtro_col) REFERENCES desarrollo.apex_objeto_ei_filtro_col(objeto_ei_filtro_proyecto, objeto_ei_filtro, objeto_ei_filtro_col) DEFERRABLE;
 �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_filtro_cols DROP CONSTRAINT apex_restriccion_funcional_filtro_col_fk_col;
    
   desarrollo       postgres    false    350    350    350    294    294    294    3088            o           2606    20633 R   apex_restriccion_funcional_filtro_cols apex_restriccion_funcional_filtro_col_fk_pf    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_filtro_cols
    ADD CONSTRAINT apex_restriccion_funcional_filtro_col_fk_pf FOREIGN KEY (proyecto, restriccion_funcional) REFERENCES desarrollo.apex_restriccion_funcional(proyecto, restriccion_funcional) DEFERRABLE;
 �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_filtro_cols DROP CONSTRAINT apex_restriccion_funcional_filtro_col_fk_pf;
    
   desarrollo       postgres    false    343    350    350    343    3164            b           2606    20558 S   apex_restriccion_funcional_pantalla apex_restriccion_funcional_pantalla_fk_pantalla    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_pantalla
    ADD CONSTRAINT apex_restriccion_funcional_pantalla_fk_pantalla FOREIGN KEY (proyecto, objeto_ci, pantalla) REFERENCES desarrollo.apex_objeto_ci_pantalla(objeto_ci_proyecto, objeto_ci, pantalla) DEFERRABLE;
 �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_pantalla DROP CONSTRAINT apex_restriccion_funcional_pantalla_fk_pantalla;
    
   desarrollo       postgres    false    278    278    3060    346    346    346    278            c           2606    20553 M   apex_restriccion_funcional_pantalla apex_restriccion_funcional_pantalla_fk_pf    FK CONSTRAINT     	  ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_pantalla
    ADD CONSTRAINT apex_restriccion_funcional_pantalla_fk_pf FOREIGN KEY (proyecto, restriccion_funcional) REFERENCES desarrollo.apex_restriccion_funcional(proyecto, restriccion_funcional) DEFERRABLE;
 {   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_pantalla DROP CONSTRAINT apex_restriccion_funcional_pantalla_fk_pf;
    
   desarrollo       postgres    false    346    3164    343    346    343            z           2606    20736 /   apex_servicio_web apex_servicio_web_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_servicio_web
    ADD CONSTRAINT apex_servicio_web_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 ]   ALTER TABLE ONLY desarrollo.apex_servicio_web DROP CONSTRAINT apex_servicio_web_fk_proyecto;
    
   desarrollo       postgres    false    192    356    2919            {           2606    20749 ;   apex_servicio_web_param apex_servicio_web_param_fk_serv_web    FK CONSTRAINT        ALTER TABLE ONLY desarrollo.apex_servicio_web_param
    ADD CONSTRAINT apex_servicio_web_param_fk_serv_web FOREIGN KEY (proyecto, servicio_web) REFERENCES desarrollo.apex_servicio_web(proyecto, servicio_web) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 i   ALTER TABLE ONLY desarrollo.apex_servicio_web_param DROP CONSTRAINT apex_servicio_web_param_fk_serv_web;
    
   desarrollo       postgres    false    356    357    357    356    3188            �           2606    18791 5   apex_solicitud_obs_tipo apex_sol_obs_tipo_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_solicitud_obs_tipo
    ADD CONSTRAINT apex_sol_obs_tipo_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 c   ALTER TABLE ONLY desarrollo.apex_solicitud_obs_tipo DROP CONSTRAINT apex_sol_obs_tipo_fk_proyecto;
    
   desarrollo       postgres    false    2919    192    206            �           2606    18906 !   apex_tarea apex_tarea_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_tarea
    ADD CONSTRAINT apex_tarea_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 O   ALTER TABLE ONLY desarrollo.apex_tarea DROP CONSTRAINT apex_tarea_fk_proyecto;
    
   desarrollo       postgres    false    218    192    2919            U           2606    20779 -   apex_usuario_grupo_acc apex_usu_g_acc_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc
    ADD CONSTRAINT apex_usu_g_acc_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 [   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc DROP CONSTRAINT apex_usu_g_acc_fk_proy;
    
   desarrollo       postgres    false    192    338    2919            W           2606    20461 <   apex_usuario_grupo_acc_miembros apex_usu_g_acc_fk_us_gru_acc    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_miembros
    ADD CONSTRAINT apex_usu_g_acc_fk_us_gru_acc FOREIGN KEY (proyecto, usuario_grupo_acc) REFERENCES desarrollo.apex_usuario_grupo_acc(proyecto, usuario_grupo_acc) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 j   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_miembros DROP CONSTRAINT apex_usu_g_acc_fk_us_gru_acc;
    
   desarrollo       postgres    false    3156    339    339    338    338            V           2606    20466 F   apex_usuario_grupo_acc_miembros apex_usu_g_acc_fk_us_gru_acc_pertenece    FK CONSTRAINT     $  ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_miembros
    ADD CONSTRAINT apex_usu_g_acc_fk_us_gru_acc_pertenece FOREIGN KEY (proyecto, usuario_grupo_acc_pertenece) REFERENCES desarrollo.apex_usuario_grupo_acc(proyecto, usuario_grupo_acc) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 t   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_miembros DROP CONSTRAINT apex_usu_g_acc_fk_us_gru_acc_pertenece;
    
   desarrollo       postgres    false    338    3156    339    339    338            X           2606    20481 1   apex_usuario_grupo_acc_item apex_usu_item_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_item
    ADD CONSTRAINT apex_usu_item_fk_item FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 _   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_item DROP CONSTRAINT apex_usu_item_fk_item;
    
   desarrollo       postgres    false    340    340    229    2982    229            Y           2606    20476 7   apex_usuario_grupo_acc_item apex_usu_item_fk_us_gru_acc    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_item
    ADD CONSTRAINT apex_usu_item_fk_us_gru_acc FOREIGN KEY (proyecto, usuario_grupo_acc) REFERENCES desarrollo.apex_usuario_grupo_acc(proyecto, usuario_grupo_acc) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 e   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc_item DROP CONSTRAINT apex_usu_item_fk_us_gru_acc;
    
   desarrollo       postgres    false    338    340    340    338    3156            v           2606    20706 0   apex_usuario_proyecto apex_usu_proy_fk_grupo_acc    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_usuario_proyecto
    ADD CONSTRAINT apex_usu_proy_fk_grupo_acc FOREIGN KEY (proyecto, usuario_grupo_acc) REFERENCES desarrollo.apex_usuario_grupo_acc(proyecto, usuario_grupo_acc) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 ^   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto DROP CONSTRAINT apex_usu_proy_fk_grupo_acc;
    
   desarrollo       postgres    false    338    354    354    338    3156            u           2606    20789 /   apex_usuario_proyecto apex_usu_proy_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto
    ADD CONSTRAINT apex_usu_proy_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 ]   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto DROP CONSTRAINT apex_usu_proy_fk_proyecto;
    
   desarrollo       postgres    false    2919    192    354            w           2606    20701 .   apex_usuario_proyecto apex_usu_proy_fk_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto
    ADD CONSTRAINT apex_usu_proy_fk_usuario FOREIGN KEY (usuario) REFERENCES desarrollo.apex_usuario(usuario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 \   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto DROP CONSTRAINT apex_usu_proy_fk_usuario;
    
   desarrollo       postgres    false    221    2970    354            x           2606    20721 ?   apex_usuario_proyecto_perfil_datos apex_usu_proy_pd_fk_perf_dat    FK CONSTRAINT       ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_perfil_datos
    ADD CONSTRAINT apex_usu_proy_pd_fk_perf_dat FOREIGN KEY (proyecto, usuario_perfil_datos) REFERENCES desarrollo.apex_usuario_perfil_datos(proyecto, usuario_perfil_datos) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 m   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_perfil_datos DROP CONSTRAINT apex_usu_proy_pd_fk_perf_dat;
    
   desarrollo       postgres    false    355    335    3152    355    335            y           2606    20716 >   apex_usuario_proyecto_perfil_datos apex_usu_proy_pd_fk_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_perfil_datos
    ADD CONSTRAINT apex_usu_proy_pd_fk_usuario FOREIGN KEY (usuario) REFERENCES desarrollo.apex_usuario(usuario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 l   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_perfil_datos DROP CONSTRAINT apex_usu_proy_pd_fk_usuario;
    
   desarrollo       postgres    false    355    221    2970            �           2606    18941 $   apex_usuario apex_usuario_fk_tipodoc    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario
    ADD CONSTRAINT apex_usuario_fk_tipodoc FOREIGN KEY (usuario_tipodoc) REFERENCES desarrollo.apex_usuario_tipodoc(usuario_tipodoc) DEFERRABLE;
 R   ALTER TABLE ONLY desarrollo.apex_usuario DROP CONSTRAINT apex_usuario_fk_tipodoc;
    
   desarrollo       postgres    false    2968    221    220            T           2606    20784 5   apex_usuario_grupo_acc apex_usuario_grupo_acc_menu_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc
    ADD CONSTRAINT apex_usuario_grupo_acc_menu_fk FOREIGN KEY (proyecto, menu_usuario) REFERENCES desarrollo.apex_menu(proyecto, menu_id) DEFERRABLE;
 c   ALTER TABLE ONLY desarrollo.apex_usuario_grupo_acc DROP CONSTRAINT apex_usuario_grupo_acc_menu_fk;
    
   desarrollo       postgres    false    338    3180    351    351    338            R           2606    20442 D   apex_usuario_perfil_datos_dims apex_usuario_perfil_datos_dims_fk_dim    FK CONSTRAINT        ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos_dims
    ADD CONSTRAINT apex_usuario_perfil_datos_dims_fk_dim FOREIGN KEY (proyecto, dimension) REFERENCES desarrollo.apex_dimension(proyecto, dimension) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 r   ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos_dims DROP CONSTRAINT apex_usuario_perfil_datos_dims_fk_dim;
    
   desarrollo       postgres    false    3046    337    269    269    337            S           2606    20437 G   apex_usuario_perfil_datos_dims apex_usuario_perfil_datos_dims_fk_perfda    FK CONSTRAINT     $  ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos_dims
    ADD CONSTRAINT apex_usuario_perfil_datos_dims_fk_perfda FOREIGN KEY (proyecto, usuario_perfil_datos) REFERENCES desarrollo.apex_usuario_perfil_datos(proyecto, usuario_perfil_datos) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 u   ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos_dims DROP CONSTRAINT apex_usuario_perfil_datos_dims_fk_perfda;
    
   desarrollo       postgres    false    335    3152    337    337    335            Q           2606    20421 ;   apex_usuario_perfil_datos apex_usuario_perfil_datos_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos
    ADD CONSTRAINT apex_usuario_perfil_datos_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 i   ALTER TABLE ONLY desarrollo.apex_usuario_perfil_datos DROP CONSTRAINT apex_usuario_perfil_datos_fk_proy;
    
   desarrollo       postgres    false    335    192    2919            �           2606    18968 F   apex_usuario_pregunta_secreta apex_usuario_pregunta_secreta_fk_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_pregunta_secreta
    ADD CONSTRAINT apex_usuario_pregunta_secreta_fk_usuario FOREIGN KEY (usuario) REFERENCES desarrollo.apex_usuario(usuario) DEFERRABLE;
 t   ALTER TABLE ONLY desarrollo.apex_usuario_pregunta_secreta DROP CONSTRAINT apex_usuario_pregunta_secreta_fk_usuario;
    
   desarrollo       postgres    false    224    221    2970            �           2606    19609 E   apex_usuario_proyecto_gadgets apex_usuario_proyecto_gadgets_fk_gadget    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_gadgets
    ADD CONSTRAINT apex_usuario_proyecto_gadgets_fk_gadget FOREIGN KEY (proyecto, gadget) REFERENCES desarrollo.apex_gadgets(proyecto, gadget) DEFERRABLE;
 s   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_gadgets DROP CONSTRAINT apex_usuario_proyecto_gadgets_fk_gadget;
    
   desarrollo       postgres    false    273    273    3052    274    274            �           2606    19587 6   apex_gadgets apex_usuario_proyecto_gadgets_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_gadgets
    ADD CONSTRAINT apex_usuario_proyecto_gadgets_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 d   ALTER TABLE ONLY desarrollo.apex_gadgets DROP CONSTRAINT apex_usuario_proyecto_gadgets_fk_proyecto;
    
   desarrollo       postgres    false    192    273    2919            �           2606    19604 G   apex_usuario_proyecto_gadgets apex_usuario_proyecto_gadgets_fk_proyecto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_gadgets
    ADD CONSTRAINT apex_usuario_proyecto_gadgets_fk_proyecto FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 u   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_gadgets DROP CONSTRAINT apex_usuario_proyecto_gadgets_fk_proyecto;
    
   desarrollo       postgres    false    192    2919    274            �           2606    19599 F   apex_usuario_proyecto_gadgets apex_usuario_proyecto_gadgets_fk_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_gadgets
    ADD CONSTRAINT apex_usuario_proyecto_gadgets_fk_usuario FOREIGN KEY (usuario) REFERENCES desarrollo.apex_usuario(usuario) DEFERRABLE;
 t   ALTER TABLE ONLY desarrollo.apex_usuario_proyecto_gadgets DROP CONSTRAINT apex_usuario_proyecto_gadgets_fk_usuario;
    
   desarrollo       postgres    false    221    2970    274            �           2606    18984 :   apex_usuario_pwd_usados apex_usuario_pwd_usados_fk_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_usuario_pwd_usados
    ADD CONSTRAINT apex_usuario_pwd_usados_fk_usuario FOREIGN KEY (usuario) REFERENCES desarrollo.apex_usuario(usuario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 h   ALTER TABLE ONLY desarrollo.apex_usuario_pwd_usados DROP CONSTRAINT apex_usuario_pwd_usados_fk_usuario;
    
   desarrollo       postgres    false    221    226    2970            �           2606    19627 ,   apex_objeto_mt_me obj_objeto_mt_me_fk_objeto    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_mt_me
    ADD CONSTRAINT obj_objeto_mt_me_fk_objeto FOREIGN KEY (objeto_mt_me_proyecto, objeto_mt_me) REFERENCES desarrollo.apex_objeto(proyecto, objeto) DEFERRABLE;
 Z   ALTER TABLE ONLY desarrollo.apex_objeto_mt_me DROP CONSTRAINT obj_objeto_mt_me_fk_objeto;
    
   desarrollo       postgres    false    238    276    276    238    2998            �           2606    19632 *   apex_objeto_mt_me obj_objeto_mt_me_fk_tnav    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_objeto_mt_me
    ADD CONSTRAINT obj_objeto_mt_me_fk_tnav FOREIGN KEY (tipo_navegacion) REFERENCES desarrollo.apex_objeto_mt_me_tipo_nav(tipo_navegacion) DEFERRABLE;
 X   ALTER TABLE ONLY desarrollo.apex_objeto_mt_me DROP CONSTRAINT obj_objeto_mt_me_fk_tnav;
    
   desarrollo       postgres    false    3056    276    275            j           2606    20623 B   apex_restriccion_funcional_cols restriccion_funcional_cols_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_cols
    ADD CONSTRAINT restriccion_funcional_cols_fk_item FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 p   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_cols DROP CONSTRAINT restriccion_funcional_cols_fk_item;
    
   desarrollo       postgres    false    349    349    229    229    2982            ^           2606    20543 >   apex_restriccion_funcional_ef restriccion_funcional_ef_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ef
    ADD CONSTRAINT restriccion_funcional_ef_fk_item FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 l   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ef DROP CONSTRAINT restriccion_funcional_ef_fk_item;
    
   desarrollo       postgres    false    229    345    345    2982    229            g           2606    20603 >   apex_restriccion_funcional_ei restriccion_funcional_ei_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ei
    ADD CONSTRAINT restriccion_funcional_ei_fk_item FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 l   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_ei DROP CONSTRAINT restriccion_funcional_ei_fk_item;
    
   desarrollo       postgres    false    348    348    229    229    2982            d           2606    20583 @   apex_restriccion_funcional_evt restriccion_funcional_evt_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_evt
    ADD CONSTRAINT restriccion_funcional_evt_fk_item FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 n   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_evt DROP CONSTRAINT restriccion_funcional_evt_fk_item;
    
   desarrollo       postgres    false    229    2982    347    347    229            m           2606    20643 O   apex_restriccion_funcional_filtro_cols restriccion_funcional_filtro_col_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_filtro_cols
    ADD CONSTRAINT restriccion_funcional_filtro_col_fk_item FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 }   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_filtro_cols DROP CONSTRAINT restriccion_funcional_filtro_col_fk_item;
    
   desarrollo       postgres    false    229    350    350    229    2982            \           2606    20513 8   apex_restriccion_funcional restriccion_funcional_fk_proy    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional
    ADD CONSTRAINT restriccion_funcional_fk_proy FOREIGN KEY (proyecto) REFERENCES desarrollo.apex_proyecto(proyecto) DEFERRABLE;
 f   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional DROP CONSTRAINT restriccion_funcional_fk_proy;
    
   desarrollo       postgres    false    192    2919    343            a           2606    20563 J   apex_restriccion_funcional_pantalla restriccion_funcional_pantalla_fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_pantalla
    ADD CONSTRAINT restriccion_funcional_pantalla_fk_item FOREIGN KEY (proyecto, item) REFERENCES desarrollo.apex_item(proyecto, item) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 x   ALTER TABLE ONLY desarrollo.apex_restriccion_funcional_pantalla DROP CONSTRAINT restriccion_funcional_pantalla_fk_item;
    
   desarrollo       postgres    false    229    346    2982    346    229            |           2606    20848 -   apex_solicitud_browser apex_sol_brw_fk_sesion    FK CONSTRAINT       ALTER TABLE ONLY desarrollo_logs.apex_solicitud_browser
    ADD CONSTRAINT apex_sol_brw_fk_sesion FOREIGN KEY (sesion_browser, proyecto) REFERENCES desarrollo_logs.apex_sesion_browser(sesion_browser, proyecto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 `   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_browser DROP CONSTRAINT apex_sol_brw_fk_sesion;
       desarrollo_logs       postgres    false    362    362    3194    361    361            }           2606    20843 *   apex_solicitud_browser apex_sol_brw_fk_sol    FK CONSTRAINT       ALTER TABLE ONLY desarrollo_logs.apex_solicitud_browser
    ADD CONSTRAINT apex_sol_brw_fk_sol FOREIGN KEY (solicitud_browser, solicitud_proyecto) REFERENCES desarrollo_logs.apex_solicitud(solicitud, proyecto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 ]   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_browser DROP CONSTRAINT apex_sol_brw_fk_sol;
       desarrollo_logs       postgres    false    362    362    359    359    3192            ~           2606    20861 .   apex_solicitud_consola apex_sol_consola_fk_sol    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_consola
    ADD CONSTRAINT apex_sol_consola_fk_sol FOREIGN KEY (solicitud_consola, proyecto) REFERENCES desarrollo_logs.apex_solicitud(solicitud, proyecto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_consola DROP CONSTRAINT apex_sol_consola_fk_sol;
       desarrollo_logs       postgres    false    359    359    3192    363    363                       2606    20874 .   apex_solicitud_cronometro apex_sol_cron_fk_sol    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_cronometro
    ADD CONSTRAINT apex_sol_cron_fk_sol FOREIGN KEY (solicitud, proyecto) REFERENCES desarrollo_logs.apex_solicitud(solicitud, proyecto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_cronometro DROP CONSTRAINT apex_sol_cron_fk_sol;
       desarrollo_logs       postgres    false    359    359    364    364    3192            �           2606    20890 .   apex_solicitud_observacion apex_sol_obs_fk_sol    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_observacion
    ADD CONSTRAINT apex_sol_obs_fk_sol FOREIGN KEY (solicitud, proyecto) REFERENCES desarrollo_logs.apex_solicitud(solicitud, proyecto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 a   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_observacion DROP CONSTRAINT apex_sol_obs_fk_sol;
       desarrollo_logs       postgres    false    359    366    3192    359    366            �           2606    20956 <   apex_solicitud_web_service apex_sol_web_service_solicitud_fk    FK CONSTRAINT     �   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_web_service
    ADD CONSTRAINT apex_sol_web_service_solicitud_fk FOREIGN KEY (solicitud, proyecto) REFERENCES desarrollo_logs.apex_solicitud(solicitud, proyecto) DEFERRABLE;
 o   ALTER TABLE ONLY desarrollo_logs.apex_solicitud_web_service DROP CONSTRAINT apex_sol_web_service_solicitud_fk;
       desarrollo_logs       postgres    false    376    376    359    359    3192            �           2606    21026    ref_persona_juegos $1    FK CONSTRAINT     �   ALTER TABLE ONLY referencia.ref_persona_juegos
    ADD CONSTRAINT "$1" FOREIGN KEY (persona) REFERENCES referencia.ref_persona(id) ON DELETE CASCADE DEFERRABLE;
 E   ALTER TABLE ONLY referencia.ref_persona_juegos DROP CONSTRAINT "$1";
    
   referencia       postgres    false    384    388    3222            �           2606    21031    ref_persona_deportes $1    FK CONSTRAINT     �   ALTER TABLE ONLY referencia.ref_persona_deportes
    ADD CONSTRAINT "$1" FOREIGN KEY (persona) REFERENCES referencia.ref_persona(id) ON DELETE CASCADE DEFERRABLE;
 G   ALTER TABLE ONLY referencia.ref_persona_deportes DROP CONSTRAINT "$1";
    
   referencia       postgres    false    384    386    3222            �           2606    21036    ref_juegos_oferta $1    FK CONSTRAINT     �   ALTER TABLE ONLY referencia.ref_juegos_oferta
    ADD CONSTRAINT "$1" FOREIGN KEY (juego, jugador) REFERENCES referencia.ref_persona_juegos(persona, juego) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;
 D   ALTER TABLE ONLY referencia.ref_juegos_oferta DROP CONSTRAINT "$1";
    
   referencia       postgres    false    382    382    388    388    3226            �           2606    21041    ref_persona_juegos $2    FK CONSTRAINT     �   ALTER TABLE ONLY referencia.ref_persona_juegos
    ADD CONSTRAINT "$2" FOREIGN KEY (juego) REFERENCES referencia.ref_juegos(id) ON DELETE CASCADE DEFERRABLE;
 E   ALTER TABLE ONLY referencia.ref_persona_juegos DROP CONSTRAINT "$2";
    
   referencia       postgres    false    388    3218    380            �           2606    21046    ref_persona_deportes $2    FK CONSTRAINT     �   ALTER TABLE ONLY referencia.ref_persona_deportes
    ADD CONSTRAINT "$2" FOREIGN KEY (deporte) REFERENCES referencia.ref_deportes(id);
 G   ALTER TABLE ONLY referencia.ref_persona_deportes DROP CONSTRAINT "$2";
    
   referencia       postgres    false    3216    378    386            8      x������ � �      9   n   x�e�A
�0��us�֙����D%�����:Bq����{&#�D�]�øqr����u}wR�I)M�o���ɑT���O��y�lR�>��ѝ4Kµr%�z 'Z;K�      l   �   x����
�0E��Wd�.�}}���B��)�LH���
"n
¬��{����~�&��I��4�" ����tma����#�����͌A[(�:h7�S�xT�P͔�l}t8��:�m)�՝�e9��	2&oR�
2*30e�T�E-o��ky�8{�/�y�~����?')�`��      7      x������ � �          ~   x��I
�0 �s��"[����%+!P����4�9MD���J�b��cx����ɰ��	�x��
x���\��;��x�4nNқ6�(u2	&�	ݛ�
���֥{ꘜ��K��k�[��Q��R��*�      )   .  x�ŗ�n�6�����>I>�қ�A�
gQ���X����&��ԫ}�}�)J�����qk�E͐��CI#��ـf�Pa���&��%��� 	%{*���I��zw��fiƩ��gP�0����Vn�0#�l?a�m6^��ýk��Oj�}<�;0G���q߃�^��ޮ_�j�?h1���cN�(�i&���#��j1y�a���R%9$RY����G�Gi��P�l`�m�it�:��˷Tv�hz�3��1E0;�)�^bB<�p�.�w_���uA&�M�Ѭ�2�^��� �Q��y\�ʨ*&l�`tīN�����#����nW�7�k��"���$v6i%6��T��	[a`���$z�r�������]�����6q��Ĕm@m%=ji�@�r��� �_�� ;�R�S��,e�Q�H���4�G�w�DA
�'��`;�����Ʃb��!���	$T 1$vT����eW�O�D�a�v�չ�l:�Zsj���S,({��'�Q��:���F�$a��4k{���ڝ[���Z��<����/�����G�WN�t��є�8f_��=/����.�� @W�Ժ��Bj��(Z�e�8�,2a���8�z��r!Z�ˢ�
W&�-^uҿXv��Q�� B�����E��|j�Iϱ���`XO�d�s:䂬���%�+��*E�p��}
'��|s#��~r�6T#V
}��捒�W�Â`�%�m��V�=��>W2�n^�r���_�[�V�3�����(�󯸯���:�Q��-=��Mt�N�����q�������b_���ˊ��_����5*eS�'�ʷL�����ܟ|�ŷ�A��ɫ<\�4ST��ݿ�ᥫ��(TQ��[��0~7��vZ�ci}5��ݏ)�I{�NN�+NS�v:�Tq����X��46��:�:��v��2�G��y��>p�{(�(M� � ݭ.����lu)^L�Z�:ޝ��.��`�6`j���.ݴK7=�M^S����l���ݺ��|���k�Y�yN���[�Zg���M�7a�=�0� qX�      +   �   x�}�[� E�e1���c/M�h'i���i�P�!�9Ⴗ=����	��\o5{��*��v�&\�V��65�.ҖP5?e �#�j��O�Zg�=��ct&���2/�u	�ΝS�):<�x�u� �r����sb�s~7i��H�4K��D�(b��)��1����t�S^���~׋      (   �   x�u��
�0Dϛ���V(�Y<x)��^B:J�͖l���Z+D�m��y�[S�'[�z���K��Ѩm�*�d�hD��c��,������0_9W����=ҙ}ܛ�C��\,�+ᔷ��I����"��BY��dF�	ѐ��C��9^�����B)�˼i�         �   x�Uν� ����������]�2�PP����=�S�'��NC�����)��F��B�#}G���ɸd�!�DV�����j�x{����9�O�|_��-��Fw�
x��4X�&AZ�S��U��G,k(W?���m!Pu�|ϳ��R�S�m�           x�}Sao�0����S�IL� -[5MB@W$�>L���:�9qd�����v
[�(������w/I6��OH"A!��*`�ȸԤۅ��-�n�%��)d�9uh*�GT�+��U2�MH�w���^����K�)�a��^P}N�O~l��f9I�Z�TC|�:
.	/s��5�63���|2��^������Ka��v5���ߞ�4&�*�]�ٛ¾��ޅU��9^,���oƽ
����W�F��	u��}������S�x���g�#��wV#@%5g���#+��u�vñ�dC[{��οm��*��G��bX��ܻc :�!�o�jF+���y�`JeiFA4$l��w&�·m�Ѷ�Kc�.�ɪG�E?Y5-���b����-AX��1����]�*_2���OA݃uMAb�52�/<tԵ���ӯZR��Y=�c��c��X]bL��B�`��j������;��uC�GkK�ւSg��u|�6�C�D�M����M/o�%:�3�{A�?�>�         �   x�m���0D��):!��  ����(��$�P����w��D�`�DQh��~��,�N�4�#�u������d��5"�����%S@g��.����㐗7��0Co�]���D� �X$<0���s�n�M��o�ƛ�H,��J��dJ�s8�?��.�JJ�Rt4      :   X   x�+�OJ�/JMK-J�K�L�4г�3�4200�54�50T0��24�22�373�*��Z�S�������i�%�ŘzL�v�Xr��qqq x&`      L   r   x���A
�@E��aJ�]/�	��L���x��`%����K�3b��M�^���6��#���PNTd��\��{z���N�v�(c���Z����_���$���3 u^V�      N   �   x�u��
�0E�ӏTen?�/J]�tFb��Y-j�Bn���
�֠�Bo��<�WhI��q8N�4�e�$|���ʏ���b��u~H�E?���� ��*�f��p������ºݘ��,�v��YmJ�?<�r�         �  x��W�r7�����RP���4L%��DY�D�+s�ā"p��8�'/�2��i�b���x�1bTd$�p��b��_��@�'V�*x'r%��]%>ʨBـ����!�� W����RS5�6�@h��둨TI�r���
�����p��Β����Ӓ*�u����ZP� *w��(Cº@�&�Z�J#�r}�6������jp�_�Wj���{�r�ԕ�Ćn퀲e�<��Y�L�:�̨����.%�"�B�?f���K2�O�;~0nP����*�\Ț,,���Bb��q�}G�_@�d���.I-�Qw:
�uU���{�t��E�����S�RSq�;ُ˙��V�hw�]�Z�Z�={{q�=�.�T�M�6Ůׁ
�0�l�  ��Y�j��g���朤چ��]@�~�{eU1�k�5bX�c��z�%q����j��u㚽�GU�yvJ�HH+j+Z��ꃙ��_/�%�Z��,��P�,K��8�2�d�=<���I*J(�C��!<6H�%M���2�uR��a=�Z������\m_�v�a�)׷x��I�7i�f��<K�,�q�)�u��4'(|ZS����r�D&�˘�P��8<<�3�L����r���fFW���oAyU�ЈbW��%ޥ�(E���JST�C¬��J�bYG�X�a���#�����x����FHc�&d�r�ss�k܋�'�醑{�Ԣtx�"�"/ i�����!	dtE���By��-�M5���)��Ǔ��q�ʋ�&�z�?i�Z�e���z����%2<�I�0L�d�P��#M$�)Ƒ~P���Z\�AD&��q���Ɓ/:��Bɭ�6�Z�����)UZ�08��F�s�SW�Y�"�*6PC�I'��7���݌�/��J��p�Uw|�-f��3��� '��w~��;�X�_���qb؜Kfa�fG����3���x7��a��F�jv��UG��,�fڐR�>�.ݑ�|�����!�n��b{��j��ؾ9s�Ei0��.���	�OP���CP:�GPt�nA�qT�P�x�����)`Z}%�hp��GCDUA1v�9$��;��aB1) �����L�(=��I��"Ю��<>E*p�ŊcU4�uw�J��Ͷҕu���E;vޤA/5ߞ��lk�dM'��KiB�W_����%�\d =h��o�A�.�d��C�K�Hp�-�1b����>���cLG�Ңo<�K�(g�f�Sjo�� ,7��         o  x�}��n� ����ި��JOm�M�^71YW`m�݋�������s�g6R��W7I!J��[<t��8E���� �S�Iv 	W�l((���I��$ܵi�$�R�P�
^���6��[�Pid�
֭cJ�0y,dk�!"�ê�j��͇�}m`ա*����Y{�l!pc����؏AN9z}ε֫��:�V�n�}��CƄ졕.��@gx6�'}[�9��D�� ]��n�ZN�J]�=���%�B�Y��T�yWj�y �1d�p�{t�b�;	�+����A;�t�V	�#�0c��{�m�K�����yZ��W����E~vJ6)L�H�D�L/�iZ��H����2y�{����/��'      W   i  x����n�6��O��Dj{�E:��I�̼I[���؝�9���Z(j����x�M�����������K40�t��\���_39<e ��b@����&e�M�+�a�f�-�E�imb�)�1������S7���if���[�6+ƨ+��H�(G�ZA`8(bX����x��S�v�ftE��0=bY�;���t�)�X�r��H�,����X��z�=��H=F�d�� �:��H1`�F���.�XqX�_W0hk{r[��Y�]3:~��1V�2���k�h�b��g��1���W&鹣�s9�O�iA�[�a��F����!�P�(�0�"��/CE9Թ,�u)��=	�s����G!d�"{T/����xA��_�9|{΃l�|/}ԝ�]~X��`�Di�Z�my�%/�@�6f�}������������^�����#W����	����K_��{1��;|��l~{/yj'�\l�ļ�<<����q��G�G��f�E3:�myey�iè�y/�_�8|u���K��f�����|9��8M�b��(R0�6��v��G^~/y�*����^,��dZ�����}}��d���������_C��o	Q��s�,�N�>�V,JK`�O2�	"�mm3��5�\R���9:���8�!r�TIg��������*��5�p��<��XD^�M��"jA.����p��ǝJM�j��B��Eu,x��,1J�N!xB�,
�FŠ�]� �����heCq��ԯ؈FEqd5�GȊ��kP�;�{f��	ht�O�	�D�3"ʑ�y.��qZfB�m�S�n����Exl�Y�"w0x���f>�ӶUT�+����nS�%hW䍖�+E%���,�hd[�l�F*��~�!
J�7�M�2��[L��j������|��+V�TG�Y����JuтH.J���.����RA�=:�86��l�k]�h�]D�����A�N=Hҫ�)-ԑ��)ɺ�u��T٭]jʊ�!�2ֵ�,ϲ캐/
���t�Y�C�d��r��ʴҎ�纞���,dbݼx���P2̳�Ɗ��&�޻a��YG�:z�9��`�����U�W��DiÛs��X-\㡌ye_U*-�3�.�������ƌO6#?�δ����_o�o?�����<��M�+�_��Hq#7Fn}�5Pnq�V�p#Ǟ��I�kߙ�yӼ�Z��F�]W<��x�ǒ�*ƛ=ƛ=ƻ=V����Oi~ub��[\��yn��M�9�׷�:��m~'��i�<�ed�q|7���^r|���� �����t�\����=��/)�>��P/0�8���9v��s��h8#ЋQN���^�O���at$_���|��_���.�h���猘W�#��2�����{�SbI\��W�₈�D�$���K�ʧ�?�U��9���Ec��<�+�k1D��+QACLS�OĪ������&��90�÷�J�����$�g"F��B7:˟{|1?�Kn���Ǩs�3�j�3�yv�vs�=�s �"��>S�}lSuDT�p����h��Q}nk��Smf�6��Ѧ�=�T�r��".K�Q5w2��Q@��g���M5ۼ���8�X�f�6Ռ�M5Gp��f�,`�]%�w�]�F�w�'�ݷg�y��y(5������Dc�(8K���i�ir�M��ӣeQ�EG��z�#�����6�?J��碞��t?�S�n��6��}�xŲ���)�qƢi"%�>s˿�~�~�|�Fs:��9l���9@��O#,mF��ʤ�n܋a�i񉖴V�6���qV�ã��)����Eiuj�/����kUk4Pi�o1s�w9�'m��|�����(r{���L9�"H��|�L�ՙ�R��1�1`�����۠��1�831��tA�v�&��m�C��.��>䰹��n��u�n���1K08mT�W���s���~Lr�y �#��n�
;zrV%������v�n��A���L[Ǚ���(��A�s+y>ȩ����.(�s���

��:��9���������~����RT���i>���`�����R7��s]��O���15r��߷ϯ�����
�
�Jޕ�{yy��t�         z  x��R_O�0�O�O07]��i�2�q	9�m6�^mK���mbB�����]-��	i,�J@�s;�(-2�>�d�F�Ѹ=`5��$^IV�Q�I��,q�'�T��c��_Vlg�
�j��b����w�)ҟ-2#�q����,�X�"c�N�}v<\�����1P����1��~�\X��~&�T��Ԉ���87��n�>T��$�6���!Q����y��_"-����A�xB��A/�,L��&�@{ٿE�n�����Qm��o��#r�J�XN����Ţ4CoG�Eo&\����� -�c3c�5-h�Χ��{K%���EW�/KA�I%l�������t-�����n�����jC�lz�i"ᛡ
�z\�y��؄=         w   x���K�/�ͬ��1����r+�s8}+�}8M�����S��9�R�\K��S���R�K2�2K*9�
�KҋR��9 ,�^s=c=c.�YũEe�E�@�`�����+F��� �8)         S   x�]�K
� ���a�*��(�����j+�^H�6��@�@�(-T��2�/_$�a=6g�h8��(S���:�l���V�����3�      P   �   x�}��!Dk�
� 
�l,lu�M6�"	��5�狘X�L2��3FY�V�����D�T�]����49*��w�)�6ϐ{����(*Bc���X~�g7�����v�!��`^a�u�/�jsv�&��	ο�Ur���pCq      g   Z   x�KJ,�tJ,*J,�t/JL�L�WHIUH��p�d�q�d���\�%E��� �49?/-3��(1)'��� 3�3$��$٨� W� ߫#�      �      x������ � �      �   6   x�KI-N,*�����4�3�34��CAFF�ƺ�
��V&V\1z\\\ �L      $      x��]Ks�H�>ӿGw�-��GtL�,ɽ�,�e���DB2<$�H�����4���mfU,���fw9m
��*���UY���gMF��6���h��#�_��>�U�۾;2���o�g�m�ݭ��x]�ɷp�M����.�&����$ަ�
?�l��Y��|��`~�\��|Ʃ�	��p�L�C�������^�N�`}�I�4�I�3A������SêPl�]��B��*\��(�N��n�Qb<ﲟr��`�*�X'�_Bx�qp������}tW;��I@�h(~(��$���b���7@�z�7����|cdÝ%0|fڈŵT,�Mb[e,��>�KP� .����d��Dw����_1"���A�z�TDʒ�`=�	U���ΈEg�*��� 4��dF�������I�m�U�e �������,`V�s�����<�� ��K���&9��Cy{UEv�[o����]�2�>���s��T(�*���v�+�\�˰`��R�e�,�tn�7�*�iMs�2�e�2�U�q�v#�sv/Άu�Z�%ԈVUU�h�Jֲ�ъғ,�p�M$���5ɖ�L-K�L+To�����7�*d� ��Tp�`�l���v���㞫˚)f�p�:2]�"t�o���/�yh�$���9}i��i�\o�Mq�'���!�q��+�]�L��FXA��7��o�_������7'�.���篋��7�����%z�X@뾄�e�;s�3w<s=UَsX���w�Y�fw�Ƹ_��V!�*+#��-��	�m�>�G�����ޅwaƋ(8.�U��f�M�5�0y��u���?C���0N^ڞa�0Nf΄	��َ�n+�/�����5���6���c��������g���?�X?��,�aMf�=s���a�T>�p��6�f�~�q�����p��sc�aÿ�	�o�tocc����@W�2��X���} 7d `�6X�;x��lfG�$����_�;�X�����F�D�d	|k��"h։`1,�������|F{�̳�����d<�XN�ч�(��}��� S`&���t>r�8Aq��[��E�~�+�8b�¶*ksf�I�xd�e�F��8Nxop�
�0`��;4P
�t�^ܺ�	��w�;��{&�8Y1t1J8a�`t6����X<�k�'��&�A\�u�Tg�m�I�ʇ��IFkd�>*�U�X8=#77��G��^;��K�djğ9�����Ɉ0Z��{G������������57����[@�w�U���$}��d6X4_L;��	���If��g~��p}�]q����t-s�o��fۧ���d���Ks��,sf{��e����D+w~o�_�5 �=h5�B=j}i�9fL:P�F�ѹ���R�[���:���� jۜ�(�B���pM�I6��xW�<t�,`�ޙnk {` �l���k����1p9
��_��u����2&��j~���e#{�)��U�������P�-�B�.zH-
{.�%����,e���K(���Ș�հ��w�e�Z3k:3ы۟P̮ۗ�{�|�KQȰ�&n�;Y���g`y����Ũ� ǝ�hQ8D��v��#Z� s��Ȟ&l�����o!���8`h��n`چ�C�a6�C,�@@�@�([��sʗC¯��Dmh�ɩ�C�`W�8���C����}X77�b9��:�َ ��oLh��0ȍ��t��j��qI.�g�
�1e�?���"�yp �T��DHPN)'ڞ@�m�E�an�Fd��5O;D�=���x��~b&�&���'�Yq����O��`��	~/O��o�`�$�#�q��C��+��U��3ڦl"/�S�`��#R���F�����0�~:��j���l	�\4�mgfb4�q�2��=�[ĵ�W����`��*�/&�[e�����Y�H�Xn�4�Q�ݞ�,bk�/ۣ��N�<�9.���$3���V|��������X|s��m��K�P�@���n�ݥ���T��<����������AN�/�߅�$]ބ[�x��'��m�ˀ=s/����s��6��\��|�&P�*A� Q�5ٶ�*�b�H���4\1ak˜�~��w�Otn�<�a��is#�.�;iQb ���B0	��#xX�y~�}�!�,�@F�-�l��T%�/X�?�k��������B��^���|�=:Aۉ�a4����!�j�
�>�;�hW<�8�8#�Q���8�жͥ��q����=�Ra<���b���	#g�$^�c��.\b��C�0`m)�M�`��+�([�����	�[�ؚ�?��3��!��{�kՕ]"\��,~��~��#o��h�bH�������|r<Dَ�����y&b�8(0�L��� 3��L�{ЇK��ĉ��,b�J�ב���\p~������.L�><����fJ<�If�\SE�����	���V�f��L3��`�
������Y��}}��-(J�E"�+��L#."��"�����
8���%[��¿}jN93���"=�<�3��1j�9�\�]ެ�3N�i��:d
�X��JUx��EQ����xL����=�<�ϛ�z՞=p�Q��=����b؍�@(�%r
dGB�q/'���;���כ8��\�d��x�_��∛$�@B�P	����=|��@p
�k����h��!w��V��Z����tAʭ$>O-d.F��/Bġ<:x�-)�������u����,���.\S讍F3���b��� P���hJ��df�����gW�(�]��}�����y��ΉP|b��;�E�"2���M��m�I�%�A��c�y�*� }Qyh�� !Yf%Q������s�TT�7�,��
H���D�	���#b�e郃�l�/�S��i��H�C���كAn�c�2�i��d{2��X]s\�{��B_z\X޴���m��E��/�r>&=l�@���8G�F�Q����pY����I%����mWh&�(�u�����$�l�XͧM��QvI����T��JIla�7ӝyc��chWE�c��<�ME]����2�A(r�dܳh��{Ќ�ʫQ�5��񈒬A��Ʒ��K!�懏�.�Yx��?���ۭ�~��L?-&�0�Y�	��0��D�Y֘�x�t������z�,@'�-��?�p�9*�b�B�6�.���-��<���-�&�$+��w_ZBi�|8X���s�i,k,��☦,e�abQ#�֯�C�-�h�c!W��ð��1_�ޗ]vX�!��>��/L*kJ�MK��åH�U;�f�%h�_Zc���K\fi�G_m3�ޝ\��H��}jD�
�U����SV���7�6����y,Jv
�LYE�d� (+$�NJ�}0��`@���up%�h2�]��*��X@�ڀ��R�)�2��J��v�D��{nG�L�m�qSG��Vx2� �3�y�+�sT ��?���`�m}��Llmu���ߢ�'�Y�qo�"=��؟t���Xk*hO�x\s���~d������V�#���R���b�7�&�� ���V��jt^*ūOy���?a0ާ�?��j�R�-���b0<��{}��b��E�q��YpI���u�����8Y�,�xؖ��Tl��hr��㟘�Z�u�a��F�m�n�x	�a������]��$�ʱ�e�O�3����e�z�͸}����6���L���t�h�Oł\�!J^�ݷHC�˲�B��-JQ�N���0�77�z�)������]��i��qv+��#E�O��>GX�H����y���d����ZE��B��xe�^���7)�Σ�_�qN߁5(��R�J�����(,��P�S+!��sDpAS��52^�I��,�����z��F�5�ul���a��l�\~���A���ɨ�"צ��ka�o?��g�f�O%=���t5���nf�����X������$�?6~��~��z��r�2X�s    �/��n+���:[\������/Ag���UK'���mV�f�!�'ȡ�T��$�"�)��L�"�z�g��s�J���ٚ���O.�D���T�֣kQG����d������K��m�4cK�<Q2�Ͽ�i����p��RZ���S���#��<ޏǄM��J�?Y�XRT ��_��g{'�ٜ�<{����&��b�}	
F�v+��v�o��Ǹ�%*Xɩ�m}$�Tn!������pk����2��;�}n�ʉ�[un"��=)��qe�*Z��X.�VSSe�6�I.b�����m�&xƪ���ՙ�$�P�B���6h�d6M^��n��mn��N�d�c+����
9���1Nd�c�q�|�kʷ�3�`�H��3���$���,�D���oT�ś�K�'��Q������wQ�§�$kUl��<>�]h=0�2�z�&��h���"���T7�P��ZgW�\;� \��TS�'Yt������aB�-��X9ce ���-��5��4��!,B�"i�sQ" �����w�:���TV�k�Y1Ȇ]�ɲ�V񸄎�.����
4�U�56�6ٗb�iX.<��o�B�,�`�oJJ�znL�R��,l�Ә�m�����	X6����R"Kd�h VO[�N�q�`����L����B����s�9��l�w���2�����T|Nv�R���̱yM�9�s�nJ�#[#57��a�����5+�-�daM�\k���1�o�	�8p���^����m/|L�� ���?�0�a�U�6�$c��QKC~;��{=��I�(q��z>���`�)�s�\G1���8�������l`P�iCb�dr�t|��G��'2uTKyp��M��E�S!ǩ쿀����My7Ȳ���fv�"9^e�uZ�4_�`���'�D
�%���&�'U��J�F���b�F�o�L�zIw�Y$hu�B�T��g����������o�PXЩU�P����fQѳ�*����$�R�4RCoJWAuMy�l^Y~����$e)׈�v���Ń^u~O����m#���	?�(�������a�69Ey�N�/�|�ޠ�V�Ӕ�ש�k^�v`Qp+�3��b0ZK�+��ʏ=yui�����{�����ߊ�_�]�ysr8�rr�FĽ�{����w-go�r�Ox=��:�z�/0Fx᲏�:s�ۃ8ne\8Do�Dq6:�xy�*�a�H��o�$��e�?FB@����}������S��vc*D;������x�	�VW-0a����b�;-��z� �߸��}�W�0�+(�U,�;�Y�Bl�1�r�m6��H�*?�~���q��������
�|�:�Z����}M]e�Ct5��h���$��>�˔R]�Ԭ�E��B>�@.����eA�����Qϐ5-a1+�f.	�Sa��
�V-5�P�H��$Ji����ws")A  ��*�6Ⓥ|�$�zᩡ_�Y쮪���A�4)�O^��P��G`-�_�Y��ӌ��m�$rt6���j�Pt��4��x��k����,���P���P@qQ,t�R<���Q;Ѡ�௻�>ϖ�}al7��ɟ�0dp��?��ՠ�&�U�U��������/[��OE�eŪE�pp����h4k�f)�̝SlZ%�|Kv�V�D��F��I��ؕ����v�	eq�`�[H�>�|��>�Y:ųMy"5aӨ�1��{`���dLvWL�H�&G��4h�àQ�Qʘt��h19�0i��v�B���$:��8���z�I	�H������'��mbG-�����c����<|#L�z�Y��6�h�Ɂ�FE_3(nW(n;(b�5!���N"�1<�&�����QȦ�vJ.�ݹr-u�S�'Z����k�ͮ'sJ���A�;'<�b��a�x�Sґ�1}��@�w�3n�G�4Mɥ���z�$��W��]��_���$&pN��%��4%W��,B�pÚ1����K�v\�h�)���A�ܭ��KV$��v�5m��������.�qrM,IV����j��ҳ�)�jW���69�ڵ E�I=��ՂW���u!����T�-�i di�d�FS�����K�_O��`�p0�XZ���y]i`
?|Ļ`�cg�K��{�nE�{y7�w��l�c�A����~L� %W:b��1s�Hsh��r�F�K����E���ב�����p�,�L�~l�ӯa������d}����#��0Vؚ�`�kee&���OV����D��H
��$Q}�$��'G��˩��tUF�:�����FYH�YB�V�q[����*�);�p�]�-��W�~��4���%!r=��3S�hY3[lƱ}M̮3z��oǮ)��$q�#�5ls�93��bi\�Ԧ'[�^i�*�d�k=HJB%�����4Ť����肪~o�E1s���5���Ndml<f�̣�۬Y�zKeC��I��x��v���ekWk��;��E�B�S����g�/�꘩_���f*3�-;���5�8�J�X��sx�<gۤ�G�Y����xz�8�\ua��5\E��2���� ՅȚ�_�4���� {f�F���å����n�kZ�h��Y���SM��5>p;þ"���.,˫\_׷8փ������r���U:�����T�������
K�G�B�a��e[z������t�Ν�դ܋z�Zm��<��g�.�-X����V���F'�Z��2m�s���A���ҫF$jW��a`<_�~��R�t��7Ɂ�OǞm�)��ڔN��h�ߛ��Ѐe�
��t5�}���q����O�_�J���T֙��u��A�x55��.�U��u85��I�c�i�zUN�䠺`�ðHL�ce<�m�
�z�Pǉ_xWj����ZA�r�G�z��}���x�ZZgc�`	��P����`T��6�)a魺!�ްu���޺���z��UC���%����)��%��kl��7��Ra��+�1%��q:�ZT%�����R�{�
kV�>c.���2�a�?��{5�  d�8]/��j~�ŚH� EQ?�roF=`��?���o�$NB�]z�Dlƣ���#jP4�1���#:V���@ou�Q�x* �����$p�g�CeU��w\B6_i������"'>��ʿ|��H�_�)aQj�+[����FM�_8~H�U��!���_�͒�T����--7���/�:jDO|@WZrA�v��z�r*��煮�Xu�/�,�M
D}����f�e�����\��E�0��q1Dg+�tj�ÄP��k Ny��l��Ս?�}�����S�z��-t(p���!����n�'[�I�f�c}��Y���6=4�4� Фc���׬*B<�͙���v����^ l�]U���W��.��g�&� H��g�=�׬������A�VIL(�a"��c��ݵf���B��k�e�R� �F@m`�T碙�qV�}��-�<�X~;;��ȵ�o9(�V�ٔ�*m�eCR�?Y�a��5t@��9L�tH���~�=:
�!a &��^��-�a�|�����m~�m��UL�	6���֬nML�ϗx��C��~l�>4�˔�?�:�V�GW����
h�ސ�L����M�[v�M�}�9��|��`B���Ƿ�o/a������Ro7�*1ބ��*�ÜJ������V^�E������D��� ��,�@)�Ml��g5I���ɫ���ض��� �?�^��Q��Z�+�o�PVNS��XԨ&\�)����|��v9�2���o����5�����?h���e�|�	
Dg\}��{��/��>|
��{�X�([�4p85���p.�S5�91�X�-[6_մX�ڪ�r�k�{��f���W����W�,+ڞ�ɢ��KzY��gI}�UXmj�׻3b�\�$ha1MX�j�%�.�	�-�Tw=������-��Z�TR��A�~Y�3܂ޘ��9T�����#�þ�!�ߴI�+ �t.��&�zv�Sb\ĬDl�1������Tsap�&� �	  ��NnG�g����U�b�=8u%�t�C�؟�#o�=�
*0��&0]��rk��k�"Xl��#|i
�<ݫl�9�&P��k��g���Ư7���T6͡3iÉ/ZJ������՞Y��"E�m�fT��x�5-%/�5�(��6y9-�s- �f���G{�W*�����I��F�I��v�յ�Uǭ3�{�6��g�p�\fY��������vM��aB�R:í�ݽ�v��B��-�|��3��/�X�����Z�m�A�
'XU*�zM�M �S���-,� �ĳ�˗�y��<��űY��[�f11&��|��V��d��&�U,��=����\'���=̀�oi�~�!��M�
7����
[���Q./q���jv\[X�Ş6����|P�,(>-�5��<O�m"����G��#~N~�[O5
��`��b1���0v� G�S�?�w���ĕ��U��^�L5y��� �R�b�=�nQh���nO�ۣ�bSvD[��J=����KWK%N��ł��u���m���*�M��{*��f���\�h�(����93ǩ��?%>vR����2p|x����!4���!XƱq�<��TZ����L�p�hw�<;�/���%-��8�&/-A86n#ԃ T���0
�o�{C:�J��9�\�M�-[X�������QʽG�7�ώ�k��C6�0e��<i�S�C*lxY���D�̧�}��0�Q�<�Xe�g&�Y�j��հ-�5�_��_p�G^Q�?Cd`�̔3vU�e��:�;��US�0���׻��J+��XY)����[��+e�"��6\Z�)g\]���Uك��:tFE?��	9?hU�}>�C����DR"�������D�7�hw����`��Mq���`��Bc�4�k�ض*�?�p�6`g�o�V�^����l�Q�X���3#���{!��n�3�ٗ1��2f�H��7�*�/�����KU�*���d�Ʌ���x�}]w�!e�cߍ�q,�H{�x�J���|��e�;�"�hߞ�2�kl��Iq��F$7�3v�삘o��UӾaZX����D����0E2spS%��J���U�a��1V06�w�����΋2�u��	�oa�vlj��#1��Y:�(~�*�cڮ�����]�Ov�H��?�Aa�q�Uɤ��a�_~D��4,�_� ,�����緂�nP!���A����@)��(�OA���fU�~��l��3<R:��s|Sg��� ��v������.fq@��@����I�o���@�����`b����}�;3���O!5����� :�$������c��m�7��?+��n?/d�i����;%����F�َ��xs��؄���Rt���	q+a�ٙ��{�r����E��ז�q��X���w�!�d�3�6�2�?�y��͠$��m��Ĭ����4�Ir�Ȧ��+�Ꞃ�j� ,�bC�,���u)�{8��s`"5�$C�	��D"�W�%�ü�u��Es�R�s�S�������&��/o)�/�N7o�J 迺��FboW�8V��k`�W�m0�̼I��/�-�4C�Q�/��PӚ|5��,Y�Q�+J�e
m��	���f�ɳ����H����b���V`��y�j�,������<(��m����1��cd%@���zV3 !P{@�P@׏݂��6 l�<�^�(�O��	<.8^D�҅�f��7�p�g[��b?|:�X>�!��U����	v#ǽ].w2��kӮ��h�<���u?����f�n��\���n�yM
�s�	.f�A&���Ua��
l�H�`�A�����T��,�3�h�U���n��7���S͐8�#��i�jAy�%zq��X3�|W#����B�#����*��s��"��g���RV���N�v�e�U�t((6o�BBQ���PN�mxς	O	��Bqs�O���_I��P�1G�}�tX\<�A�E���c�������f�b��c,y��B:<�̙��K�v)7,�(������Wgf�E��Re��t�ՖEז%0�q�X]�{<���~B���/�"-����*���j�}	0���~�o��˩"��A��]�d�(z������>������}�W�qV(��re�����J��py(̨9���#yq��t���=�<[��k�����OJ��R��q+�p�6B�k"l��c�"��wq���h��j^Mji�B�yɵMS��Ҍ�n����I篕�Z@-F[�ۢ�Ɋ���Ё/۴Y��6l�vyZ�
���'<�y>!ծ��>��gP%�J�U��U.4����ɮ�� }'��TX������ÂŦ8�,�FF7�A���XS��IE�^���d�|�Bp�u[�V�Qi�V$VOhf�͎�8i87mw!��U(��%1�G��]3�M��\+SC�M��%�"�p���1��9�X�i>�>z����A
�      %   R   x����,�OJ�OM�,�/�4400026���)H,J�s-.IUH-V(�S ���RR
�JS�ub�h(m�v W� j\8      ?      x������ � �      F      x������ � �      6   3  x���mn9�;�YH�u�� @�M��@a/�dϿ䈚�JCN��g$�"9���?N����o�����q���*�'wz���G�N����C1ߘt�1	T�;\~�u�k�A�������7�� |1��	�t 1P 3��	�4{��/�>���DO[� �N��v4�� EÌ'f6�pّ�:ɑP"+:k��Z�=$���>���U�8Tˆ����`mAYQ�e$E�@ց�9�- �ɥ2�����V�	�E�F���[$T�n1���wJ�-u��RI��g�~��Qj�~v����2wҽْ�ٸ_7��g��R�B�	���]A)��Z���?b����ٶI�|x�_B�`?V���� @�v��~X��(��8���r�V*24��4$�R���n�����Nm�(vy���/Y�<p'�^��P�fj��9�M�W��D��g5�*�8��t�g�� ��R��l=�OʾH] �)��� �*���fu6����������~=w��]�U�DQ9���E�y�ˢ�����y���z?xw�ɋf�'~��8qI�#?�p��J���<�(�Q�\�����U�7v���<v������`��*nm������*umV�ksa�&�A��^���FN��~6q�UΗ���؆&���c� V�e��JБM,��} �	mG���G��&Ć��i���YH�Kjgg,HI� T9��46�^ʰ�n�I��:i�mS��iRw���Q�l�ħ��nE�a�"(��Ϧ�\םF-
�:��*j��i�uS��Gk�#����nd�Z�8O!���L�NE)AW�Gv���G}7���|��:iD~��h�,$���r5�F�#]��\�������R�OW�z]	Y:�w���~��1���t���4�Un�D�W�YQ�����X�;|?���`S��$���˅� "2a��r#�5�&�Y�/�OƱcb��6���W�+J?��ո���������q{�\�{s��gn?�4:�_����@�G�������џ2���u~\��S蟎ׁ�Ik��L��P,��m.�`���\��6�o���#�[��G����o(#{���_?�ʑ˽��~ ��xK��Ju_�>��2ކ6�t�I�o�3σ>���g3O�*E-�+{�u����F�ty~�9i��������}�~�vY\��y��u�^�����5�7f�k3�X��lT�̠0��jLl�F3�L&L9!RF�,�d=��g�2�䍌�, �r�?����I
���#���n*���ь	TP6�do�h�������y����N7�����������?�4rD      &   w   x����
� �>�t��]�����u{���E�-s�fُf � �i5B7u%���a;��("vL�VA��`C�+dȧp�M�����6P�����^������;���R�o(�      "   n  x����j�0������v?O0�����6�`G�4��������'M�|a�ߑ��9�y���5(֠��j�@�'6�m�r��0_&��6�gL�]SzP1y��~Z� Gi��UX;�Z<�;<)sH��6X{���	��f�v�1�@kt<�6�K�O���,�c�:��/-���������	�U�0�Q{��)�H�Y|��'��s������mS^��?)��|��Γ�oq�h��"υ+N�{*��]��p��cV�*S�[��׵NC$v�U"�� U,+�_���g '>æ��� X�+U��2����;���t [t�Q[ �[���0J��7/�[���t9ɽ0�d�YdY�O���         h   x�=˱�0@�:���WPP���bY26�%�1�AE�'��heʌDq4B:L+U���SYF�@�聇�]9@}�2?�����/m�2q��d'd��`� ��'�      �   8   x�+�OJ�/-.M,��/�,�(��M�+5���
)�
E��I�
�����\1z\\\ ٚ|      �   �   x�}�M
�0�ur��@Ҥ��ĕ� �F(i:�@ �(��)���"���̈́�6U�h����]�0Či�t�ˤ�Jm�u�H���F�?rߺP�`�8z�xA�D����5��9�(nP�S���&�A9�b�H�T�;k�rM���ܛ�o��r�q|�h��0@oX��+����j�            x�K..���,.�M�+U�p���+M�I������'%ƃX����z�\9�I �60���¥��373'?/3��B+h��)�%榢�k�*��( ���UY����R���1z\\\ �0OL      |   ,   x�+�OJ�OM�,�/�4�L��+.�)I�/�(��� �=... 1V�      �   �  x����r� ���y�VM�L�,�M���B3LH�V}�n�b�GV2c�p��p�˝�ZV3ʵl@`
�\(�#�����6��R<*�����&��^x �s��[~fB���z"�S�i�d��[cˆ�\C�1��hqD��6-���0-ajв��b�{���mEɤ���֛���H7Y��ܝ .S@���3��:cm�nF�z.�q���SBͱ=FA$��C�=�hv�����,������4N�k�?��{�<�7޲��(��(jOC�<H�C�m��3*�e����2̖��ڙ|S٣ʻ�R6[�σ�,ls�Q�-���@��+��m��V��bwI��{��������YOb|[��H�FB���:~	���F�%X�upa��������F��CV��߰���$�	��s      �   �  x��X�n#7}�|�?`��I6���]}hw��@Q����d[�x4����W���c���"�(��H���`*o�?���Y5�f����� 	���#g�$�b`I�@���@1�7�F����n�2�)K$��]��_7?����a+�,-��kL�tD��p��b\�����iǉ�����i�Gc����G�5�V����ec���� ~�__>o^?���|�!�w2"�ɒ��B�W��"W�d�j%Gl�^B7ǔ1�i��o"�I)i�K���am�����Z�)%� #p���I�O��N�2ۑ��\)�;ԃ ������U��I0Y�I�,͉aҳ{:�ٽI���D�Rs]�����ZWs��易L���D��\7w/n+��.���HcI^����PJ��xv��˷\4u�7��[�e����=g��z��^�uH����U����	���Σ.�B�(;U|1��R����hc0f��E�)�f��[uS���)��&��ڙe[3Y	Fo���~��b<�lH.�RL;O��
�O���׺+�;IG�w���I5�'���	���&�!�|`������m�M1=ؘ��0Š.]�L&�lX�����VDՠ"\XE��p5�GIjT��٠�2��^5�,�p����d�q<Mq��*1�"�^��kX��,��	��W}}g}�d$&���+�ܶ�3�[/��Y��ő܊���<�hԳUJ��T=�0�H�mP%�I��\��[�Y:�8��\,ͤO:/�����|C5�O�\�N9�D�2E�Aa��i5S�$Q,�ȫa�o�{S�D�~/��>>�'�e|��~�)���u�Ts��Ǚ_�	:��Z���f��{:c�Jݺƞ"�Jۊ�;���@�j���B'pM��N���mB�e���M���WD�=���E���+�O>�3pʔ�2�ư\���i��b|iӪM^���<��l��D�q�6!Y�H��#ҙF��y1�Y�X8�rp칵�_�|��cQո���L����o����H572���A��L�4;��nh3�'�� �m�����w�Z&�\%ޒ��U1����x�T�aY3�נȋ�6��Q%58�Mev��j��(Jg��"���a���J�F��E|n�������K�Қkϯ���7��� ��2�(����vyww�?$K\      �   �  x��ZOo�6?�|
�砰lɖ=xq�k��i�( 0��EO��nߩ�a�]���(�I+NjK.�&��'�����=��!1M��0��>вʖ����EJ�*����>a �.~=� ����K��n�]�͒�i;O*�����2)�u��\�+��?����_X�O�TJ��aP��q�%lu�4��T��9 �����>zj�S����.>��Ț~��,��b~��~�}{v�Z�@n[a����R(��k�L�|t�lE�q��5E�r 8��^��������]9�7+Zp7�&�B4c� GT;�v���o���^@�.i���L��h��r؋�S�}���}�>��]���T�;cK�"퉟����q^z����a�&�H�w�y���Ym�U��9$����C������i&�,}�E�+�����dI�&�\kBQ�!�<cR$������ԃ�1�������e��OA���T�,��k!�¹ʧ^`���^co���������p�������t��/{��w���aOy�ۤv*m�UX��a}ϰ��/���HRm�2��hW�7��-?��S������/�>�'�v��as-���u �&�>�TY�j�;���
TA��4�X�R�걡�c��Lo��i���� �,՚;��"��!^�"NPZ�o���I��s���6��5��Z6���C��U�f|�,����v���zI�;�q刷Ǝy��wl�in��:(a������z(Y�2m0[f)I�t���6ҋhm%=��L
������ٻ�&�7�H����R�;�Jpg��n&����ul%�t��9������Tג<PKU5�)5-�#��:V�B��6Ѐ�Q�ӃJB�X�┮i��<�}hn���c,��}:֔\g�-�C0�:��o�j�+��"%��o,�Bذ�G!6l�F��8vw�X�
x�Y���߃P��ݒ�"�:{�Jd�U�}��S?Nlm7)��6h{E��)��(|DŴU����G�Z�>{��},��q�)U@{K���3Ȥ�Vbv����V��f�[=)���c�����R�j�ӛ���v�+����d���c=��l��!�P�Wn��l]l��A�7=��WCD��l�l��B�m��rb��5��]>�+�R�n�D�} !���^�� ފ��=�޶�kb�H�5r��>��cܻ5?F`��C�G�z�O7|$U����=�V��!#7\Kì�!�w�
ﬦ��3��Aڏ`
�&%k���|vuLS~���]L��,!Fe�
�73�\���kw4���,i�q��ujΊvfm<�&yzL�@(~����+Ȋ��TW���1����Sߌ�T$#�kvP�Vc�G\�����R,���ۇ���t|��4��1�{^R��=O���0b`�E,fQP�K��x��
>�Y�$	-�]��$m��0��2��t�S���@�i�{J>q��;$���¦ܐ"ch��������x��P^pRq��0���E#K#K�5B�pϊ-0>��TK���	��>���z^[7�/8����};m��\��=�u�|@L}�Ƣ��V�h�~�>�S��RH�\���>�{�2�<Pt.���uM-�H����c�r��E]�?���j&�8�j�ۖ3�8��E;��l��x\Ӣd96Tc�vBEgIs1���՟^p�erĉ5)*�\%Z�n��>�>99�fXy�      �      x������ � �      �   .   x�+H-*��K��4�4�4202�50�54R02�22�25����� ��H      �   �   x�m��
�0���cth�ۿJl;TSb��'-8{�=	��D'����y��p�hk]2�G��_�A�(�s��&0Y�S�ߪR�##uG�X��r}v�8�����*�2.�!^� �5ә����o-V}�:�r�bus�٫d��rK{�廑R~�*fo      ~   �   x���AN�0E��S� �ة�ʲl*�*Ecg\ٙ�v*�kq.��RK?���l�`��$��'���7���I�\�,Zǣ�HF\ʑ�r�G��G�l��T�h�Ԣ		��fl�9�ι�9��ct�\��i�5����)���v�ܵ�m��q��i��9�+l�n�1L3F�2Q,����J����[���0,��4_t;,��hr�����צ�xyh�ԝ^C{EK�*�a-�+!�'�x��      �   -  x�m��n�0���S�6�G/�	4�0q�	����e��K�v����Zm9�v��ώ#aIx��6Fd$<��N�q~�6�Y�Þ2�1�	F a ��r5�d��6��P�2��a�w��G���.-����,l.?[Au8�Lr���0k�#X�:b����l
	���cx�6'4�欃JI}����e�M��	l꺭��'ɪ�U2�'���˶V�ڠ�\2��Sn1��:�jx�92Jc�X�J(��'H�����vU#�i(hPrX���:�BY�0�uA��l{���NxT�h�E�/Y���      =      x��}�r#ɑ����Ȭی�)�E��@ Y�i�� ��56fcI ����L*�t���R�^�z�-솇���=�Rό��H,�w���q��7هo��c�MVUe�M��ɊΡ�dy�ˊ}��d�e�;�i�-���[��?�_��ɷ�����*��i��7���J���S��7���l�S��O}b�v�O���޾�V�n�N��U)��cک���S��m�!]�K5���NQ���\���Ŷxz�G��o��|ӗm����b���g?��g��?�#�����W��j�������ήW���m2�g����^<�yYeu�8��_5� ���m��&�;i�t��w(�·Ca�.�îHY�}�u���'5V��Ͱ�ξR-C����>i�6Amþ*�nҽ�&3�T˪����i�?l:j�e��3����ܾ�c���E}���GM4�T�t��x������ل5;�f/�fK3�R��w�ھl��i[��.��)_/���l��Do�js���|m��R���M5�ħC��6���S5���nԙV�׬�u9�]�U���ښ��+��e�W{�Xm�-W�Dm���F��\(���pZ�4���?eEV�-���uS�j�����v����ݕ���v�է�[$�3<X�������g�7�57��k�]�����)�ӝ:5�����&n��6�;���K?��Ȃ��Χ�y��a[� �V��gZ�����T�Afc:�1�Wt�Ru�ZI;w��}�N�,�'���:?|���_9������K�	�K��N
�����du?��3{�~:԰Ɲ�RݔU��M������@^^ɷu��`��)l���^��Wk��֣����<�Znyt��Vꁕ�~ >w<�H�]�V��Yu;����׃��˶��� ������Ff�sp��EO�k�FJ@M=y:�0�Ψ3��-�c�ؿ��~]�+|��x��T~�S6�M/>���y����ww�׋[B���݃�q��im�_���/ސZ�1��Z�+�P�t�V�����]	��s�y�V�xɪ�:t�U�Yӆ��u.���e��mG��j��=�pP��m���AWx�-��<���ϙ䠤�'-2hL\���<�V�ӳ����8��Ň r���Z���9�+\�*#��[��v��P��J�UCk�u%2��`C:�85�{�Q5/�-?��go�b���C0קJ}�Y�|�ϙ~�6�#�m��9��t�L���U_]Ny�����YIGo�jk���샾j���T�c@R0^�;%�G'E� |xh��j�+u�)[�;��.���\�vYH# H�r�:���hM��u*BNi�@^��x[����j+�]��a�%.���%�!�YU�9x�Y[J�X�WG�8d/����_��E�j�q��ZDQ��Ҩ�_WeQ毿=��;�����s��������T?(���B��ǴΜ��oR6jB�!S�x��U;y�v��:B�'6Yk�l��G��$�R������F5埄��ljjJ@<��)ɚC��(�	�`�{���|����Nmj��^��p�7UFj|젶J?����Pr�Y��U����WO�d �wZ�1�}Mo�s�n"�Pꖫ�?����:�b��Y��j1�Y3Iwۘl�#$���Ϣ��g��
sy&�9��@M��/������5��^?��Y�Z��+� o�sK��)�c3!���E����4�{�<����f��ԱV�_�!�8>s����p2��@�v:%���<�ě@��}^IO|l���pZ����:�:�)g���������ȿK��Pb��a��?�J zv��@ᐛ�1K?�j0����vƺ1 <d� _0*��JE���C_ ��Z�Q�n+ԝ�K�߃r6A�x����l�<uS���d|�
Z�Ԭ��ڼzcQ�.��P7��N��9
Zd�o�6�I�`�u´*u9�zXW%dV�)�:�`ث��L]6uf46eœ>폇�����m��zA�����Ͷʴ�W�O�F�V�}A�(7$�����_yw]�.}�w%;� S���Zؔ��Pj��Vt@�T�����h=�@L��0sa�{4A#�����7�9<$���]@]��o���CJ�Kx j�F?�`�3�`�j�ĸ_BEfC�%(�z���]jMӻ�N]��:�_Ug'�~���^)υw�Pb��t[O�_3�B
yAs�>�'-X��q��-�U{�	���/:�@��I�t(��Fp�pT��r�3P9UG8�c@��N
��ť^�g���iu����9�;? ��
ڎ�suf�c��(]�.���p���I�����	!������3��%y�L�ys@��uN/�ju��(S��(��0���l,�n�Ӈ�2Q���������I��á^++���pV�F+k��w���������D�h�~J��_�~��tj��ts���#��Z��j�J�,���K�c��oEI#`�&��IbT�?JpF�R5}�*�?�7o���m�b*I���/�~W�r)`@��c�W�r(�h���[��D�	��)��wj��+3
-���b#"��	0����xSչ����:�Z30`�WZ-�Pg�gO�,ی��~�4�ۀ����IS���c�
�j��q[C5fS�*?e�y��P�ó*S��9�JM�l�A&�w5b?���M1��5�p X��!�c?�\�Ǧ��0-�������Nٽ��v5
��N��07$��H��; !Y�AC�b�T����*��Y%˦�7$�d��9YU��&4�(au��!��t1KHQ���@}�l �;)��S�T�x��e�@�Y��.-�O��l���ΩN�Q,���vF5���CZm���A\�2/�D	��� �ߠ���}�D�����n��V��j���&��~d�|���/��=�<*��1FF-w�9چI�Ӷ�
���:n��-'�V�B޵�8������Q�Տ���^�X��X�1�G��@h:�)ٸ`,��+\:����][(H~�eJ�A�qp`y2���FPˆ��	�S��\��l� �jt;im�'{�8w}A�<�hPkc��V="��Rk�42��?u )��]��r_��'�Y��n����9<�<���O�hD2٨��Y��B�A���:��\��Y�#B� Amg����h�r٩c�{D<�b*SQb�BOl������Ոp��?��_�[�tO�dC�����DNb�Z���L�C3��	n�C����:�Z;�h!��I]8�� �,��~ G���6���5���s����& �f,_0X�jz���:�+=�j.�9���{`?��RÑ�
�c �����"�N;lA0F���:.�:I�+{~�g\o��
�'!�ۧ��,Ǟ���,u���8�p�>�?�?�_�"��^ϛ?��_�נ������G���HA*����t)Η����JM����˂�jN���.�N���;x�$�T�L�~�Y��č�J����}��)mk�W���Y�΀�6ʒ��t�O+n!���K���;�R^���V���]�V���P/����dSА"��|_7g��-�"������Y�;:�.E�]�-��eaƕ��d��N��ޡ��u�g��M���~�<��3%uktA�c�P�3j	ۉX��۷�2�������v��J��e�]�3��[_9���������(-^�u��&pMClLc��TĦOp�;��{��C�L�1F��w�9�s��/>d!�̂
�,��a}�S_��M�+���w���	w߷!�~��/��k�6=�$��p�1��(�4WO�m�s���%��crǨ�\J�jQ�!���YFL�kn�����B
�O�$�LZ|Jw��vz�P�p���ݻ�*���4x��m�\Z�#����Awa�Ҭ�i&�*�	��#%��]G"�ҴIcĮ���$X:�ʚz+�ZD@��{'nc��Z��fތ��l+ND��x��,|m��p���l`�m�ߴG��Թp�CI��U�_g�$�)}9�.S�L �+����3_P�t���    �y����D������.t������O�VM�Q>U��5�v����a"H^�+x?^�=�y��X�`�m����ڲ�:CD�^\w��������3"ͥ��x�!2�7��[:�V�5_Q� ���I��;�����f�](`�7��s�[L�]%s��Z12jV�G��ai�X�AK0��#���a(6H�xT- }�k�a�8z.�+��v�,��[��XJ�5nh������1��AC�g""�[�鋖�wZ�k�fD��/����[��l��iQ8T��H�PG�~y���Ԝ�ۇ�����4>N�9��HY�X�[|F��1,�+D���k��lq�F�g�����O������^6@���.��F%وL ��k�*�m2J�Ν�!��~6�`�Ny��F�����a�9��oCh>kP$�밻/�%���z�~���X8�@ X��c�y���Cme�C���Éx/e0x��1T��):r�g:��F܄M� =Z�Xx����s��e�4��^�p]	�}ۋ����&C���d9�Q0����ϓ���6Y�G��`��J`�_Di��$r��R��06�MM��	N�v�����X;�����:��Ѯ�$���o����36�!�W��8� 뱬6^x�v��84����_.�)�Y�zE6)�{����)w6��"��ɏ����u	�j�ez}64\�x�Um?#����EB+�CoG� �y�p�^�oژ"������bX4�?4�Ś���V��)�V)1��L�	�����s5_L�iW�[�V]��A��&ũ9m~�}b�Cޘ�=d�>{w�-Z��Q���$�.(�^�ӺܘK�z#xe�m>B����j`����A)i���Cv=p���`�%Z�s��X#i��^'�6#�Ȭ�o�v������y_[MZ���(Mؾ;셐��.a^���>ݥJ
�BxM�r�(�����y����͓���}6�5��Q2'#��� �,������x��)5!A�5�!��a�hX�$o/5���Oq�ooL��� j�!PQx]g�m����S�~1�O��������T�����r�q��ϓ^����g�p���v٦���,?x����ǰjƟ�=r2;��/�BnL}~6���}N����׊�9�cj�nX�L�҆]�����ԟ(�4d��0�5��Ī�Q�w����:��HlO��0UE��~E��(�*lQz6��@m���B�Ɗ���w{=u*v�Q<�r'x����E!o�F2���6'�$X;��؁qIЧL�S���d
�l�4����2^J�GN��;�7� �titّ�a�[pAl��Ff`,��RQ�!�T����K��4`k-@�r��'zL��1��0_��-P�]���4�_��,<�0�
$���=�׿�7<�VB�i'�ۄ��
<��딍��F+�����M����0�>����9�5�/K��"x�<ߕ��wj0�G�
2itS����|w��U��*�q��	�qt_	5��W�m���Qu�'tgq1s'=C��^S�ꃗ�����]��.wq1*n��� k6RB�q$����1�7��\M�cY�}B&R%��o�V.�3P�@�,�{�����L�>�Bx�y���i`7��I&S��d���Q�l �@��B��Xzqz��Q�3���pۗ���2�)��G=Y�"?�1�
vEj�t�Sgq��j�@k7�ԍ�-��#�3�|8�~���6�w3�\ dr��\����4��er7YjfNy�]����L�칎#��9��'
ǉ���=�:�eK�X�8`BU�F%����{1��g&3�J�c�ff����UC��m����Z�����Ɣ�Jj�O�H�.���[dș�2q���`D��:xb���7ŋ�ɀ�)���1n
�����4�������:QR� �ҕ�&B4E���m8��)�_�ud��2aMgH����� C�`p�T���Ӎ���d��f���������p5	��}�v�W�R�<+<X�0����Y�����6���G��a��c����(!��p
{h�36O��(���|�,�&`�k��I�u
[a#��#�m��Ѫ�b�Qw�E) #M77�����d�}H$E�G�vf*��{��B�[|DLO���"ud �������T��ZGe=����+���tj��O9x�,��Ǆc]��k)��'�����c4P79rTB�c�1�0�^�����Mdh֘�ސ�⭠W�`�ܮ��˹9�a�o�o0��7����o�o����Yu�9����bC%I%j��)���s�RQא>�5R�_Y�9k�I���5��$�Hn���~�B1J����f1���NV�����!��J&7π��6���xA-
�7iFy��6�e2���d������Q���
3|iN�cj�yǢ6Κ�6³���>(��d��X� �յv��X�2��N
�U���]z29�9I�!5���%�@��qBPK��"��Q�3�6}̊���:�|��t��Hj�@u�=�1���b�L�iaVr�Ĉ�K�c��I'�/��3m[{��5�%���?�Q��i��h�%�m<�6r�gȅ:^�K֙�����?�ޯ�n;�և��
pk�^ח7ߵ�<�r@]JG̬���+�lQ┭�8�� �;�5:�l��4���t�CA�&)���:�◆������V�ш @�?= 4���z�Aul8c�����p��e�y�����\��t��V��Z���u�4��b����[�{|W\V#,~�H��]���O/��PW\УZ�Gca�b.=��믚��U�z�S���C=�C�����u0�'�oi��30}�l0���	_��?��P��f'�6Bߘ˱�>�^�6'n7��0z:l c�1daR�L�L�����sb4Mo,ڤ�M��{4��]#}
�dz�r���4I1�I��ŸhNf���:-(�,��7�f��d� �\6I�I�i��l��uҥN��X-��7��&8�� ����D�y�=%^G���Q���+�#��UӘl������^�N٨#v1pT����� Q���hXZ�|���z�Axy�Y��]x���M���uCL�oD�K����n�`��1��b�	t*<�����]g��j�ߒ1�8�N��H�Hx	O�(�s�s��a��ӧ���h�k�HN_��]�D���{��A�ˍz��6̸��ŘM0��CS�B<��=�=�K���K��W��R�Ő���4�:#S6�Z8�5�P�=�u]E|p%ڎ;#���=o��P	��Q�O,5ͣ�laR2��d�&3�S
����Bڹ{��_OY�}�\HxŔ\�6�C����A���.�I\���a�C��6�qz!�`�����J�s�?|�B%K��ZzY.���:!�'��{�N{"Y�#j].o᷎������������Լ�}������N�o�S)g���a%��;[
�h�Ϻ�ԭ|}���1�	�ow�	l�T�Z��TD�½�fZ�ޣօ�	d�ah#x�&s-��\w�#-������k���sc�O�%�Ņ�!G��ӉYT�]s�y��[��yp-i��;Ð9㭹 � "�1l�ۥ.��>��D� K'�Ξ�<9�)kC�t	f_�L۹��t��"�d��v	X.���""���Ӿf=��x'ݵ4�vk�^������2B��� aK�ccA�Gw�1 ����Մ�?�i��T�k�³v鶲h��xY�n��*#�x��j
��n7Hbo6^.�b}��h|G��-'����&;Z!!��f�ߪ��O��[�xF�G������
�`U',�gP�5K7�9=�E� ����[�h}s ���ay��� so�5r��Y�u.|���M����I~��PYm�n�n��o� ����*]-7T����
	�u��������e_8@�cTw���+��L�F�D-)�}��jR�B�z���̾�=��"&PX��g�~M�OHӓL~~�8E��ȹ]�5z$���6��F    ,�9�QO*��w�Ǜy���'��Ia��:�0~�%=<޴���/��Y��P2��DWc�+g�} 
�V�:�[�`_��%���g��O_	�坳�F��q5�7+�Ku�2��HKRx�c���A���N4��(���uu\	rƙ�a^���sjZ����RGb��%���{h�K@���
	=�Yh� �4����ny}3Y�?b�� ������m���=����&���-;�l�������ѯ]"qx����m�C����8�1
�x�̐v+�d��:�D2�(�`�i�k��ݦ�49�Y'GL�kEi� �V(��xEq�{XJW�a�@1y�}�&%�@���/��,�:!Lb����DC�Vb�S��RK2����[Eɒ�D�q�؆bL��]���?������ܓ�m�}Be����@���G�]68/��w��1[��v��St�H�b'�e��,��sd�]E�Jg���<lnC�T^�%9�$�����;$�dⵈi��pfb��2�91U֬U����18��
������;=�������:%�c���u�a��#��
:��%0EJ�-%��C<&\�(���������bM����0W�85!(��o��f��W�|�j|uu��A'��3l
��,حy2�ء��:b8� �j.�c�Di��]SJ���UO ѷI|d�����|���L+�%�9����Z,	��ߕ��IǪI��؊�T��{AP֗���*hRJ��kW������ ��z��xY�#�����O8�&+�Y�^�2GN$�sxěQT�/F��1��L]�O�_����,�!q��e
�e� �de���ϔ�����ɀ`�t;� ��9��ϛ���X��[�/�O�3�ig�X�X���Giձ��QD��*W�_�Ԡ�x��l���Y�'b�;�'��MǬ�����h	x�1Qtg��Ўp����:�s �^uٍ-&#�L�lHGba�~@N>���$��"fQ=���Ďz4��,�r6Y����e���ȝ�#ٔ����5�'.�MrJ�o���;c�h~�F}�' �d7��]�W2�s�98umm�w�/怺�&x���l\����ltiB��8�f�g�K�o����W���չ���2��8c!߅�*L~q2��GԺ��E*Q�l:�ܣ�OL��i ��y���;�Nj�����Vī;6�;bV��Yg
T��k-ƴ�9u�^����ўNC��a�!e�%�4�%�w���߼�� @Gѣ%
�;&����Й��N�9 ^
�ҥQk)��|1���7K'��ls�j��%�1�� �����l+��1aKv)�Q���{���*�.�H�g~ˆG8��|"��픝(-�I	]sۋ�tǄsRϓrUS�-�u���c�I�����������%�#Jc�w^����;~S�7�kB�`�u�N'd,�U�퇙$��$�c�̹��]g�9��]�+�Ng���ir��c7�)���|+zo̄B�_ի'"{o�$�?���)<ט*�+pn�
6�CL)�{CP���#-�y8ʙK�l����ke�����G��,�굤.W��+�m��G�FCʌ�Rʭ8�X��(�� Q��{�Pq�4u�a$�]Ԗ���� ��5�t �Ŭ�+>��7MP��M�[�!H<�������M�;.���_)2v�>b�I��N+R ���:ו$��7�~<ݱ�#�H4Drڎ�[�W�H�Al!��5��G���ںwʖR>�U���>.�M��C�ј��#f�����\� ��W�d=�1�#HZda2�����9o����e�^�"ɦ6	��`ޘ���zt��J'Bgb1��C�649�����g�tׅ����&8�K"@ۃ�ҩ`'˔�n���h�#f�;��yr����D�%?*y�v��zĲ1�޿�SR�����Ud�t�j����Vz�LFq�İ�B׭$��ˉI�����$�dL8���T����_s @z�ь������A�| �Wc, ��
{eoBڕ`)��v�a���#V��!2�ӻ�^!/��͒+�R������|d2'��ˤJ��v�#h�=��%�}��	F��v`�S�9�E�LU8ϊ������G����`_n4���W ȼF0�2�5z�+�>Z�U�����؁�o�ՠGb �����Z�ɒ�9֣x���(;VG<KeKa����uG��0ƛ،��4��a�VNb�&"xu�W+�e�����LAh��ؙ���� (w*�y�1�W��:+&��*SD3�s1�8F�Xyk�������-<�@m9���(ct�E� #^1�W	X
E#Q����FG���`f��p��&5V�1۵��Kn&�7̓c�Y�A�$��7�á���c�H5��Eݱ)R��袕|^z�+��Ƈ��@�R�!.M�8E��.�3�U��C�m\��/���wH'g������~��_#6#zFL��}��
����y� Pe)z���~�8K �ч�'~��GL�m���y�4�=�k����ޙ׬�V�[����$��H�U	]��
�>��;+���\�ȌF�^t�S��6���Z ��Qt��-�8����A�O\\'d��)��xN��.+]fc�xק(1z��qW���4���(�g4bj~�!{����Yg�pO�P��C9��`G���$�E�i~x��K�5�Q���pF��*�Z# 	����������'�g���f��ֶ
���e�u�m,@�/��kx��A�8����tl��M��Eی�[ǲ����Ft([T����Y��?�{�;e[�F�BuFc!�E~�kn��Q��h#ʝy95�|�{W�%�<�C������K%YFx#�gbS%���_�i�A�ƫ`$ExC�jD�{��L}���7|��^�w�	�u���~F���Fc���Ԛ�/#�!?�٧c�B(ߋ�\=
Md�!UĖr̖���(��?���Pl�h"S��z��p��r�Ӻ&p�Hq��~���Ξ�7��yҰ{��K��<.��߻=О"����Z�����K�}jꐥ��C%��y���B�G��T������Z�.���m ��,��]pH�h��$�ޥ���m���g#�]�XJ�k��[�����	�v)�$�}����$����X���$m�
J�n��6&��^�ms6�p$'� ����Lo�D�7���Gl4=��R�I
���D��w�Oz.�j��y����V�6$0x��2��j�tD�>�݉c�{5�d��9���b��N��t���Б��%�n�o�e����2P ��Rb��m�E��7�ֽ�إ��Io�	Y{�4���:fq�B�<#�T��W��E�~�B��s�^�`����7�S1�)�&�D`��Bbܳ�0��3��,��J4$�0�r����,����p沟 L�����n�S����ti��if��T�Pg�� R��`	��R>��dyFi� ����,���a�5�zjX��O�Ơ%���ī�jb�o�f<"�XM���(��N�:���'�؟���G�K�i�d8Qr
��4�t��S�=9W	�����j{Z�J����	������UW~~���K�Αm��F�Q��Ll����2�4��8s횢�F��U�"�&��ѐ�GAP�Y�Z����bkꭝ/tBW�N`9)p=���C�fBl���9�%�����Κ'���Nu�a>����%n��6k��r�����^!� t�5H�6,hA�K502@{֘f	�B�F3��D^-hL�	��ՙ�ц����b={�4�M[����w*ƽi��䵦��,��.~ŭ����)�<|.�<�������n�6Y]��+"gh��׆�̮��V	�<�����%����ۖ]�J���c6�f�g��<���w���(�����uz��þ/kHx�yY��Xц���}�����ƾ�Rc@�xi����{68f6�}�@߸�j�*��[�,|��4������i2�{�jM�6�C�l\    ��0��Xx��wċ����2�y�%�'V����]�G�ta�ڲ�gAb�bpS���IB�-U��P}j��o�m8�ly�����f[�Y	��Hz�^F)a�ǭ4��+�.-�Ϛ���x�^g8t^RB3{h���w ����FR�G3]VE�J�~�zYЬ�?k~�F �Z���s������E-!��"�p�����^VA_	;6&Yqͷ�Yt�L�'�J�;ĳag���g�h�*)�}#�}%3{�,g^Т>�����k���>FXJ������0�ٿ��^�',��+BB"���b�C�Yʣ���!1~���$B�c�}?r_9����d�v%m���Y��Ć��i�s�%V?)?A�F�$-Q�.�>�� s�}K-����<_=B�D��x�<p�l6eg}�����}u��Bj�/��-FĽ��%?jN��ۜ�6�&��84������9����NK�շ�8�@�t���h�6�F~�S� ��x��3�67o!�z"�́��l��/�ր�m[<��g�C�z���&���O�F	%BJψ斫���=�Ԙ�)�о�M�����oc�!޷�� :��i�hZA'��iz��d�ʞ����{��շ�I�df��������E8٪E��[G��6�!�d���@0V>�;���eݳ��g,6�|Nl�EH]l�f��J���9�7�o��f#��o8�9к#6*��8F�B��˂�k_g�4$E����1�&=�o#����3w�II��n7��mT����z(�S~A?��-@Wi�	V���-��� ��*�b�2h�3�������+�weÖ��t�+����l����������k{}��&"��K^�x�P�Js�&f��� N�
S���-Ɩ#&e�V����^�oC��n�����vu�Xޘ�@��i4��mDM��C��1�۹C�{�8�o�tV��AS�����aoS��R;>]�S֫�����SE���L�dq��=��۠�$��܊����$�٤K6D	�������������س��Ǫ�E�<+��'+S6���"Ql��-�����k�C��u�T����wfCY��,�E{��m��
��C3��i����uu�_^�� ֆ�$�qƧY�P��V11�-Х	9�i6<O���?���'"�;�~��'"��2�i� +?6~%�-2BD��6�e�S4����O?p8�4��A���D0�x�HÝQ����{z1�ܱ�E��L<����_:A����o;xU~-�~i�A�L�{ҷ.W��i�$�3�cO
G����H2�m@˕`v����:I�VȀ�\s���ݷ-W�}��x>wt�,��I��6��J�����a��]��T����(2)��o�K�c��̥~�ӟ�G}�Jl�h}`>�Bk��(�H[j�O��D�^8��� �Fa�i=7G�����:/}�r��M�L�<` `d@%fm��l���J�%�����uL(�Ig�����(�+��׺�Qeǋ�N��i���2�	f��y�n�x,�
�_�	Y��͔�����ʑ�tKHr��A
u�D"�Elڎ>�?�ک�5�@�+�X�Wȳ�h�Nn���wq�����b��9�2nS��Z(�x��u"��<��٧�Ǭ6~�Jd�#�ϻ���,�\WI0_����4�g�U�Ї��#A�t�lJO�[�vA�]Jn�H�#`EsP�咞۸�Ѱ���/B�'(�^xh�8Zu6]�f�Pm����u�?��҄�r��lgūo�m�U�g���6t�t�Lf�i���`}~^��К�w�J��XP���WB��mr�wu�<�-��y��D���Jd{�E�N5���h�x07�����n�0�$ӛ��Mr˰��P\�*#	��z�+�q*
���$�d('���� 0�TaށД�<fǺ�_��؄������ Q����k~�:��6�-֟}bU�!<nZ�B��5��`+vg�h�5]���jj^�秈��7��mLn��P����~u};!$��:s�u=x�d�� �d� <\�&4a3�G�-�R$��H����{�W0��%f�%���m�[t�E���$�������K����>�?����z+qf��R��eaK�~�^d�a��Oo��X���F]�y������۶MH�ȼc�zcjR�l��88��rA�H��=�~�,5�Y�k�I���E���r��Ҋ1}�i<#OcVp+mL�ZA�Ǫ�6d�8������Б1K�>��&Gk��)�c̲�����폘Π�a֧`�1K[�/�nQR���b=t�鰅��7ۗ-iǶ�:O��������0�p�=�,pl,=KkܷcL�(��Qм>��>.�,a��F;�m�Y��`[���BvDJzkyvnۼ|�8�M�K?�dc)e:q�Æ8�!�R�;���{W�u@(Œ��%߆�W�K�L~��#�wT�n�����Q�4��
�{�Y� X"r���k$9��UلGQ c��]�&�h���HNk(��h�15�OQ$c�>>PU�����5�bqMR=[s����!��@/����a�yB;1�8�������nz���h���ս�O�;�;TJ�}F��L�L4��1˾�dM��Mrsw��Ȥ��O�'�t��'RB�a��ǴgU3�L1K��å�$�bYu�QQ����Ԑ߯�WmvV��)�&ژ٘��m���/�TP���`�r�������,xb ue�KEo5�L�~	�B:sEE��d��Z���)f<D5��'}�H��d�2/�G�."W}#;\/�~����JY��>�Č�2���X
�~�B"�_�!4��j�2zZ�2��gP�u�X�'��K�E���c�e�눇M2c��,���B߭�Z$`��~�-���B�!�Z�.�X�.�P�Mn���|fA� �
J���8��2�*8l�c,�Ub<(�ɇ�{�X̓ɭ#ԑ7^[��q�`�1ˉ���Ԏ琌���*u&H�Z���T<)̪8�bZ�,��n��ӂs��pa����a�"P
�ȏ"AK��S��R]��>����,�7�L@j4�p��_�e��8��I���Es��%�]v�BĖ?�1$I��{v���3c�^rmCx�0�)Ff�2j=X��*>4�U�R0��_�H�	Hؕ!����3f���(��H<**(�e�2���}�o�A�*7S�"����`-VI�N���}(�(	��"NT��{ K/��w��3J��m�
q��(������(pe|�� L�mn������><�ܾ}���HZV��K!SEH䌇���e4==:c@� �K)oP�����&��M��W���o�&B�#�_2H��:�h�G8wɎ��Xb����3��';��b��ܥ��	_%3�Vj+h`�.b��;���� &�a�!Ժ�H�fK�[��C���߹C����#`�H]�}H/����JYP�*��c� ���&�6=�����fuqtC��`P(�G>
bjց��G�n%?���-��n��@
a1QVE=裠��~���h&D��.-�Ůdn�g^��.Cܲ���}��5q�%��#hH͕���uY�������&�Rm�g�$�յ�;�W c�d:DPh��3�P�.Jk�d���"��@�����.������ϥ��A��~���$e�b���W��� �!�S>^W�7�/�o����ټ�/���9!��D$�&b��k��/^�Nkhӄ�6c��ksu�"7�>6��&ca�o��s�5ԥ��G�k(i�~���w}x.&ƷCw��BEϦ�����o��Uy`�����6��)����{ښ� �e`v��GA��lL
��n��ƃ|3Ub���s	-�*��i$L�TW�~�U�$9��蹽��|0 Z�EhRX�#V��MZUd�CsB�utw��6L"G�ӜJ
�C]�5@�>t�0�[���7��Q]/�m;��r��|�����A��@I�pZ����pEK{ (����Ť\�&�^c�뜆%�<S�	�Tg{-d �^5�L�����N'Y��,�\-���:�@��R��8+�    �G�}꜋v�2�a��Q��.no�b�dB��m� �(,��.�]�X'�E��������g��VH��#d���P(���@��M�3 ��Ф����B����<PlmBYV����zPX�͸��w�^��A�@�yO�����u��S!q�;b��d�N�ǉCOsMP�����nq����,��MVL���z�I��#������R�Z���m,O�v;��J5^��q}s�̮u
.��i��-qx+>���&c}b� ^H���P)HW&K�ɋ٤	��o롰�������զ�S��O��J�&1�#<(2�πvht�\=;���_#��rN���T���r�X����V���N���2N)0������6Nn���d�r?F���V�ZW�������D���e����L�G��'���B#���9S��'�OO+:�������?��]Bv�y��7�{��ީ���b9��1.%}lV�3q0�ӉZdPrkk�E|~V4Ӿ��>M5���%@m��jp��J�ʠ�HT���\j3X���Z�`G��7YM���:��tv=�2+ohئ��4�I� �y��[X��m���������1|��&[����N�\I\}���~�DV\k��к�������Da`t4��e"��i+(�C������Ͱ0Jc�`c��XNQl���Y�ݏf��%�H@��l�΢���F�0��NX������c�����le�c��}��\��(�-*P�&!oP�0Y�pz����R���}j�V��6Q�a��l84�*u����gCZ��w�����a|Z�Kgݶ����;u�"9������v��ٓQ�ά�R믐g�2啶I"��XW=�B6�s&H�Oɱ��h}��:��� 	sXq�Dl��Ů�A��N���j���I�%�#���ДT0$����������3�X:h0$�ab�ō�#k���8�U�����`H`�DG��
z���=�d�2r0�}"��	x�V�ô�+�g��)�%L�	Z\��?����ϲ(V	y���&�
�6:�>�-[!�"��bF��),?�\
ݨ�z��Lm_�\���q���3��kXt�#�mg�j��Ш��ⶾ �����+��Q6��M_�wj��Ě6}��a5�]Y��7AR_(���f�5J��WR��{�ļ\F�Bt��J`osx��l�Ѽ˃�%V�>�7����1/u�P�N�H��n�P��,�m��\�) �
j��_9_L���ۈ��R;$�+��iIm�JԆm�*d��"k�Z�4d�H�g����Z[՘�i�lz�Ax0���\�`�Dy��d�9ʘ��?`��b�~�� ��"�5<WξJI�Q���h�^�E�����30�/����F�F\0o�v�A��A�`����2�j�U_DZd�C���d�lk�,���m0�ԫ���#���$���gy}&h��Y�З,V
=�k�-�f�y�d�C�BY%��^��C���贼=L����@����3:"4b� �Lj "Uǥ��Jh~���`m"Iڍ��9�]��~��J�j�b�:���!�ݚB�\P���@�U?^��?@�Or�	��z�E>��w(�����z;��	#pQ���1]*i�(/^����m˽\)� �e7fL %+P�#���5�[]�����itT��6&�u��>ni��v�ir�8/�ӥb�t�꘲y�p�V���A}�S�cB/�]���D��n���;S.r������j��.?�}fR�cz,��Ʌ�l���e����h�X������/�d�t��n�~ �!
xu�Y���5�y&Ty�	`�:�8���D��e&��,�d�AP�L&�\olHSpB��u�� e��h��7��L��F�6�F非G_�I1|C@ʴ�BJ9k�&�09[Pψ���P�Z�lZ&wWt|1Ok�SR�IGiz<�ʺk����B�A�/YϗWW��n��j��)+�)�F�:!��� ��Ҿ���37g5O6WU,���=�Y,�9f�>)�k;|CH7���L��A`#�^�C%W�M��!<c��s��L���d��>��O�� ���z��T�0�ցe4�-آ��$�\��p?�M#{H�L�a#�0��F�����q��@2�	`�- �G��WQ4�Sgf���5�~���$�6R�a���-*+`'�xy/.5����]�A�E[r�f�\_�Y)'����/h��)x)B���*R����.X\���c�z����#�~姍�o��}/r� ���  u�L޵����Xo�[)�`��j"#���r6i?:��%kq`Zd�c�v��aI��W(�THA��	&F���i-�p��{)�:�-<C��	���w�~֜Z44b�g�+-u��^�@��T��m"&o�y��"SG@LHw�z�n�v~�,��&K5F��������4��`�%��4��j;-J}n��p�b��� c�=;�mg����ȲA�0���yL>��v��u,:!�;y�f�a�Us&1�f�%\d��@WZ{�J�[�Ak��k"D�}��0]�KW�?���0a�=l(�s�8�-�̙��8�|���Dg�p� K�6'Tv	�&qXn��n��M�	)J����Zg�P�����1�ܰK�v)p.��S q�^J�
��O��T�p��.T6·K�`�0&i���1[R>I\N#a�e�(w0#��_���΢rMi��s���6e(4�C���=�x��������y���|N��n[�/��z�YuU�bq�8����x�ևյBWL�����~�&HX�"J���RU�����e�,�$���q����j���f�TZ[�����̡T]����N^
E���A���.��$��r�u��>���mF�Y��^�����RbN��!߄�/�=Ω����"�$�J���R�ߙeT������%�
�_R�ֲ|��4��9�6��_��k@M=�P磺-��UV��	�h��L�0w*��]���,:L�#6����������(��N��$J��	R��R�+R�ݲ&{�J�%��l�~���7�=��iK��2A9h�F�k�n���U�e�h!]{��SA&b�<��W0�e�Kj�21�i�bJ���ʸY��t�ٙg�q�΍C��56�<���x�z|a���0��z�c_�.OVS�aWڐ�T� �ѡ�V����
Iӳ���G�`������ºPל�n[w�����_�N��l�Qo�R��2�>�6� ����&������T�jeï��Pc����3����`p�^�Dhzl�4h�IJD�rM�⠟@/7V����K�򎨏�Q��	t�;Ԯ
^q���������
�A�H�^�q8nw@�&�N��k��o�K.1u9H:&��9�K����U�8���C�N.�D�	�ư՞tR�'5n��i�/F��h0�w޹�qc�&����%��4��ђ=���������8-d��r,G��6`NzyXsþ��Iw����U7BsB�2�s��~��O4�@�z�irvp"ʎ��DA�����(j�3���A@#�<�LZ���Z�XWeQ毿=��e�mu o�S�᎛�e@h�ܧ>�EK�~t3�;�F�Hiw܈w����u�%]̳��G�3�z�		�k��^hH<�!�s����&���!�s�
�^��#H:�DS��pH����G)}�o�d�*�:W�!���&`��~�G��fz��@$��y�yt���R�0y; h��Ő�-�"�\H6B/�[��%�nhRq8���a�'Yg� S�A/wz	�bz�=
��+8$Lc^�[L�vNq�M�aä�����s���M��Cz@�{��ZS�n¬!��b����&�}����X��1���FF�6�bX�	o��&my�W�Ec3�#���wq r��e���-�֯�����x^�SI�Զ�F
�ɗ��K�\�G���8��X�˼4£fx�#��jJ|ם��SJ��/��L�ʈkտ�p �  �0:�j^*�h#�0h"[Fbx��8����М�g���CW��Ȧ�c!��JQ�2.#nFH��&��ބ���~%Lr/4\���<E���F%��B��:��5$�Æ��JjgL�Ȣp؎�f��2-\j����JP�
i�K�)9����j�K!�JP�"/$����1�ud�cD����$�'��!$ڔ�\O�H�i����2�T����u��/`d������]b��~�]g��_��4fb��m��i�y<�:�B)�!D��������ѧ(�>f��3"�I�F�
k��H�E����	����<��t���o���n�NPU�����ݫ��&�WR}����,.��l��~��ֹ��zM;����������ǟ���?�?�Ok�      ;   +   x�K-*�/�t�
�1~\�yi���@�(7193?$���� #`�      
   ;   x�3�tL����,.)JL�/J-���24�-.M,��W(�OI-�/�	��A�=... �[r      D      x������ � �      B   A   x�K*M�t
u���J��M�+I,���tF0�E��9��A R!%U��$3'�*193?$���� Yu      -      x�սK��F�.���\J�)E�/Heei�O��NV��Ņ� 3���:^�jI��������z[캙;I'i�twzT�4
�L�#�̟�f�}v�?e�|]��Ǜp�o~�Q�;����UqF7�b���M�G�f�/�bS��c�?�6����8j4����A|�m�0X�����	��뿤��ǓW��Ua���E��d�c��˹#�W�pٝ���j�;�������r�V�~7꼗t��ӏ��^�w�������
a�*�a����x|�=e��;��L?O��<?�����4��N���6{'�h��L�$�E2^ē�l��?u%�c�ī�~c�,���Ԙ7�W�NcI�;�y�/�>�Wn��E8_�c�p���Xe�C~�N�1�GRY�����n�W�=�C��a�*��x1�/�D5.�H+:[��������c�ڏ�璸o����|��?��������s�b�����A��t�������0^���UC0�k���S�k�v{��l�4�ۑ�C�j?�E������;��a��0Pl��E4W(�zW��n��ن�\<��Q��<��OZ�>�w���"�Un������wb嫖��F��=<͎biۋ��f���Z�D��3�ꆦ�q��o��Mv*Ng�(��+Ij��aI����-��lyG*�������lU���o�����!�?��htU�w�"a#0S(��ק|��@��b+m,���������mp'��^�٫(
��"��B�t6�/���t��5�^��b�\l�E�^�K��?�z�F��F���7��.��٫q�*��s0TmP����aATSF�rݷ#�3�<|<���{ސ:j��8�+�T�f�W��^gv�%�|��pm��hZ��v#ݗH�?�m�7�rQ<�A�1S|�0&��:&�!�tf�6;���ZtwC��R�p[��l���T��Oz�O��/��Y=z�EC7f������1'�D�@��x�ߌ���#�������3���0 l�&��B�O#q�ڲK3�ZK��r�i޴�~�Wg��>`8�މo�׍���{	��nq���Ą�k��8��nw.v/�ˎ?U�$=>�F���>\�̬������l��s�5��.x���8��x�A+l2�m��g�F�����l7&.�����$-̘��~��{U�,��e_c/���lKb'	y%�'���꒭�}�Q%}�7%f�\!cR��~���s�.�{aڗ��;|�|/�l�Jl6a����ųT?a>����{�5qZ�5���h��t�����Nʰcy<�1��
e��z&=���6��vc1��3U��Gͣ�X�����s_�����ߜ�|��dO���oLzܩ���Qu�~�kd�.�r����dv�����.G�㘈����������g�fN4[�sJ���Z�|�Ι�٩���/u�^n���ڬ��+9����� �Y��8�~W���$�~��K ��������Q�۶� ���vCkg̎]���;X)���z�a�Щ9Y�?j,�P�V���\��rh������~�A�A�w�$B��;i���ԃ�rgj�I~�e�[����5H�=�0ˁ��T䖋.?i�p�H�5V1{r����wN;�o��3�R266�Eb��)�Rؤ�-e�V���4��
'�4Ǥ57�/什���uH1�ڐ��I��`Jv������S�yӪz�\���TO����n�	������*������hnR��h�Z��#?{_O7��1���L.�i�1^�N����F�����R�6߸^K~�vP$�{h:Azw��c�05�lZ�=:5˧}ϸn�A����6�0rg�V�<e��\��khT�S ��?.�6;5���sU�
���?���h[�GF9mw��q��J���G�ǚ[n���㟶\�c�㿹�}N;xj�1��OacNT�4ҟ��S�aW
�{k�!�A`S�zv�RB��Rxi��޿f#?΃�Cf��q
K�:���~B����D������;7��8�/��B�����wo��sp%ڃS.��Z�	�	7=0�����v����_�;����-N����1� `-O���u�/�Ƃ����j�sb�v�:�6͡�`H�2ֻR%>�H��Yط�V��Z�� F��$�t�Md@��{`�HH�L����尯�����Eo6������ �i�Æ���ׇ]m�1F;,��s��\|.X/7{vF5"s�w�nsI�w�� ��qb��2�D��f ��1VO	��
̛�j�"ؓ"�P�y����㰟��Bm[-W@h�]��%���|Uh~/�4��,>t��o�ݔ]\ow
��N��i#� (r3S���y�g���Ԏ��$p�&1 ��.��)7О+��{�C��r֕]~�r	����Ï�nb'�p����z��{�]u��ǒ����A�����Y"]��o�}��Ǐ����*h4�DL�c�%�gL�$=�;��j��"���
��x���ͦ���$�l�j��+�^ˎ��{��e�Q ��n>�A��gwj�o�n�/���������S]�ܝ�zC��A��][����s�Y��y��#k��iG 4�Ccp������l�ۑ[�x~��݇�?����~N���Y�Y����:6������ /7Q�͗�� ��:����)�{Ljq���N+!H�6�޾��u9ty�2u�=���i{���RG�7�6���N������l���)iu�{2+�����}!s��"��ݷ� Nx��-��es�N\�Ŕ7�J|��E�w��#����y��dSl���x��iTc��+^��h�%7G�b������ @�8�_��f��q�:��@��
�~��9��F���SI�?�c��x��^^ ��x� ��c�G�D�*O)v'��y���Q�R�1���;kc���!�Ɍ�/DQ�Gg]��ɧ9�Y�ɨـ�����;)1�S�k�	}�GQϵD��s�}�r�A��U���9O�%�z&�z�Ӡ�V;��#L5O�Ɔ�*#�zL��񒳇�d��x�'�Aʳо��:Ha�1:��5�Ai�.O+�U�����F^��笅b a���繡�Kɤ3�_jN�����N��)��a�q_H���Y�{���0�<u���S�;�5\�I�/D� .mW\�d�A�rD|�H7�X~��R)"�C@��`�
��������5ܳ��#�cJb�����M�:7T�S(�ԛ̒���ب4d�F��J�J��|�?ִ\�	 Ƙn!��ba��<������`��{u��0�3�֤���I�+e�<�8i<��Ã�S��%%Z`Ύ�.����13�ˤ7?�8n�nz>IM��0�a;�ø�ƘB�uB9�8��2fBƆr��G^�C��25��2סo2�9���R7��&A�mx�װ�?9�,��
��f!t�O�c��Av�9�u��/������F&k�*� >�Tx�P��& j�C���w����6;<d��[ۓ�'�F�h��Ř��
��A�?�D��U��F͛b��H�A:����^W�71^z���\	���bUB��������*0T)�"}��	�
�{PR��7���*7�N�,5�����NJ��o�����^T���$\I�"NhK��Y����6X���:��Ø�sB���r�|%Du���md��a4j��!b6��ED�;�sm�	R_=�b+�'�ȉ��U��,C-i	�5 ��GÔ�v�ܯ��~�ZY�2��q�V�RxE�OKژ������g!4��;������c��aK[�61��D@�"�MWTҴ�{[�����uz��b�K�xg�"C�"���AR���sJ��L%�r�}I	�qbӈɋ�u6�=/"j�iRFz���~�3�q��Hi���� ��HJ�=)�4��x,|���aƋ�;3'4��x��<X�Uv���q��������F�S��pFC�z.4%��U����G��'!ĭ;rҀ(��(���|��t�t˚w���#'�#'�dN��3�;!��*��U<�; fʷśO��*�Ĥ�_    ;���q��^��N��A|�Y�=���cKG���/�n w���`�e,�twu�q؟>�?�����	���\��o>X�c����!N�*f2DPD�B��x	�3�APE��`����18S�I0��,����:8;�-2[��y!�cb
�m��;�.��`�a(��L����-
|oR�9��7n4�rFHD#��^����@�C:���Ǭ��H5��0a��S�A���<YD�����D��ǭ�y>T�}F��_��0����[�&��p;���p��z6L������������I�q�]#F"l�c�.QNx��R\"f��"~��Am�~.6��,6V� Ŷ=P4bs*z/b���i	��1ͼ��K�4 �9���N�R~�8ә�N�r4�������oz�!�:"#r��3ۍ�+42�{6JT! �c8�5�A_[	��xϚ)z|bm�*	��.����_fl'��S�Mϓ��	��v��'�P�u���d��=N��Mz��=q�z��QW\�ɮ�g�LA%�:������A��p֦!=@=B�~���<
j��VPc��O��g*�dw��t5���ۏ��79�.R"tH�����|}�����G��N(#;�y����?��C� BB�e��œ�U�Ad(D��d�T6�ǔ�SS#k�.�B�.NW֡l�W~"F��]ә�'b���t�^���V�ۭǪ����$�ΫN)e��4��-����#�64��^� ;�W~�vB�Ut�uc�W9��y�Z���'����l�����e�Vq�3�(�.|i!ip�Ƨ�ј����;�ç�wm�D�H��v��y�VK"�1�t�B���F8�e�RQ����u�wЮ�h:���u<��s�籸/']+rj=3	^������x�$�
�+����n^����9�歐I08UVo�1�DY�ljn'zM�%��Y�g��S�y���V��v:7D�YA>��P��Yh��]g�9<��H�uf�fK���h�"�K��C-=�p���ϧ�%�_�2Bf[�����YRN�7�"����B�kȗ�c�P�e^��\~�e����
�SO�������ʃ��n��@���QwK�Om�YO��F�?�V`���Z{�Iq%f�2G��=���d]�������xNL�fȠ��56�Ҷ�Iv��p����)�0y�rE�S�:(�	ᄉ"��>�����N��I2,Y��\�k�=`��\p%G�G99;TGNk�A7z�8��v������^H�D|�3��0�a@L��Zx��9^,ܑN�
 ��j�����D�BHk���zB86eVA����4Q����h�(@�t�/�p1w� �����9�,W+���!nk��B���8EJo!+N��0^��6�Z���sGDxy��D	��4P�����<���4R�?u���h�������3:�;"䃀%r��R㘴�ò�Y>��٦�ݨ�{�8j8�G`�"k�|]�����bzW�{�1�"�?�~d�R����.��XM�Ŭ���6�
4��1��7���>́~�P&NO�	�ENcH�'�>�?�sz��m@E?��;9s���,K�>��]v<�笫� '��c�r�fAwO�0�-������p^�����Xm�tUfxN@��ޗ�;y�b$M����o-�ʟ����阫8I[�\�r��%�Z�ݜ���A��t59s��dn��5	У��5݋n>T��l�T<�O)�rV3�$�>#v���
Yn�e*T����E����M�з��ԏ���(� ��$n[g�\a���"+	�YK�xԲ��ΟOH	*�x���ʏ
����ڀ�I�.S�)PV�弗h�8�q�ڏ���<m����9b[�*./u��8�B�eL=�U`����"`ċT�+�r�t������K�,�%�R�Bs�p@��	R��BOh���:+_��B�N� ��P��U�r~�`�B�4�n)��oee�m�cħ�N�ȍ3��g�%��?7+�K�����m�i�?����(�{�01Sdf���Xn�U��̴����o(]KF�G�6O�hw�ր��Y��G;�?B�Ty��E���a*�6�K�c�&��xm>B$�G-Rv��4�xV�Bz`9�8~+^`�%��fv�!,��e�s��|��%�lu��P[����{��g���OǦ��7!#t�ѥ;-��[aJ�!?T�w��XXөr]	ق��ƥ��cSB���lպ���S�V�����d�d�F;[��1	�n�t��nK���BA-�)85H�즭�&�"v]���~�{���u
��	&&�
���ct��#����Z^0����|u���Jd|"���pvAI\����@d�2��V�L,�Ͼ��s �E�&�Z�4Ʌ��U�����x�%F�Zb[�@%��l��rFt��HMS��K�]�fVR~AL�,f4N�4�"ne���k-c]�mJW�d2����#����S�x!	ꝺ0��~��n)�<Z�ί*�q�b����!J��Qzj�挪�рz{Y�o�-/f �l�Ò�IH�ڈ�7R7�����xv�v���F���rR}�X����GH�2�Qa�&�[QTW��dKIڅ֚�U�֜�J��ڜ�&���,/V�z[>]盠�����R�[{���J��}s.�{v�[����oX�޵HYD_���ΖӔ2&UݱT3&!M�`��zl��������K��!'p;�V\��X���]�;��l���!'?����n(�rTC�/2!Ȃ�?����G��L8��QΕ��gZs���-F�O+�؉"g�@�g���"�	�G�dJ'ȪE��w����mJo)17hc���k�2To�v+�",�ݥ�<�ͯ���R[_�"Rc:����:�E���E4xؽ�S���ǀ�0�S���l M���Z�,�vH�N�)�t�s`WiT��3���ˊ	Nv*����G�&2��xt���;�u:*��!"M�X�^���jj+�Q��XL�u�Ӽ�r�Z��P��C-Tw���&��ƥ������WA5R��,�7��d��m�N�ЎX�P��/J~�a�T��hÈ�n8N ��V��KN�|ˆLn(�hJC"�]6���՞�pn�	j+�҄ګ��Ү��,4�wݲ�㗿�����"���C9 ǘC,����#�r�yU?Z;��@�C���EG8�'H{���iyȍ{Ul�e�hI�g���L�����?݊|a�Xƴ�i͎�}E79@t�BټT@|����rԠ!�������gb�F3����sq��,��n`1E��e�:�:� �?a��������2��[���*��P��^V8{�.yj$�h��r��	-�,�^���#$�||�����ۣ�O��U  ��:^%�m���>�D��\~E.c�EY_Pғd�����?��5R CDP,F����'e.��u���!�gW��̎y��Uq�*_���M/� 5&bqHT�~@Tj�f�;7ֈ�̣Jp~�v�w�`��l����(�M�]�H�^,�
�9��������[Qt�2u9��j`�w�1P-�T��P��̮C۵����;ag}Hy�CT����|T���\b����E���;�&5q"��(lq�|�
R��M��k����j˩��E+1���� M
߂>�����`ǘ/��T��F�uU\B�����$HPoS������6��5~��2i<d��Չ2�h"w��_t$��rr��Tz�M���8�2��$�L!�#�[W��2(#����f����T�.��A���>f�7D���I`��~�9 ����\��2h���:���LDN %A�^�6��՟��{uE
1��ɋ���M�hq�w3��sq��R&����q�
�I���x!q.��W�A��w]+7���;~��d>���+)��7���l�r8>g+�=`=�|�������S���>~������'����LA�S�㩥>.�F���v���m�C��Lr�zfK��*r��M[�@V���k(U‴>j!�������M�����*�f&�����D���    Oݕ����%�^9m+��H�	�X�t���==�+ܦĞ���� �V�2�hn�w%A����T�+u���U��6uM�z��n�Q}jb����*l��V3��y�M��N���Ȧ�\ˍ�����~��77�����0�f&"�������FԪ��bG�Y�☉�b�
f<���bS��7xX��߿��]4#��k�z��T8��������,��1^?-��4��P����;�ݮ�ŎSY� ͇�ȽIpt~x�}�����Ï���{�(h4���Vty�@ۘ�'�����*��L�
Oi�<Q��6A�nr���/֓ ���\ 	8��f�	D$ֈ����1�=x9f@u���a�� ߲�|`h��M���e������4���ls�I|}�F9�˲*��j'\�AOˉ�o��u�0;�\��Kyb�����0=3^��x�y��q�TPy�I����P}�Ԏ���l����_���a�ę�5ܬ��}�*�|��Ą.�r�߿	�)D@�ۛ*4����Ïw�ᠩ�n2�����&U}�;�3K<!��n�{�>��K0b7W�9�eg%���}a}��6��x�8|�`��l�(U�^L/M�H�C"��J�i�İ�Jjq$w+�'S����=�N���%7Ą�P>vC�'�;��1U���_�k���ƎU>.�b���H�R��$ �%py����$&n5V�c{ө�55����Tc�|���m��P�(T�Uf�=����Į*hl�\1ل�(V���%
W����/�H (���LF�0��`��,��!܄��c�.W���h�䢊�l����T�(8ִ�w ʁ͓ݴ��Yo��VC��3�@��?}@��k��M�6� l����ِ�#M&dſ>8'���(ªZ�uȚ�C� �*w�*ش?��a�"�X�m9�g3��?si[ uCAU�C�� xQ�כC�T�X�lג�W������4o����Ԭ�i^U��)�g�tdE&������ʝ����!�!�v��z�%fWVT�vl���sI!��L�O�D��Oc]gJ �Q�d4����L��f���2���-'�մ`���QRZ��Ԏ�Ϭ���}�}��q��SD�P�mj��^n;>/�S��=!��)h�%X$	rC y�Zy�ݿ��6yƧnh3P�ϑ�<Ž����ޔ�G���C�O�U��K��N��=�n��J
�p��~.���i8E)d��
���~lV�̛����@��R�i�H�57�r�JB�%�;�s뾐q�ʗm~E{�\3�7whe�c7'����!�6WΈ,��K��Ϯ���R��+��Gi�HQq��)]?<>�}{�U���N�is7RT��U�/+���0�K���	m��"|��:Pr�6PB	H���#3���+9��HH9�U��Et�c0��m8o(��k�����K���$�5b��0��N�_�ϨxU��)��!��*h���enJ~|.6-�> I�0h��+��>����?�������R%����Y��ĴaE33�Q&}	0������%�u��#R3��̔��>-<.l�����]K9�F�]�5^ԋ��@B�M3��7����M�p��p�J��%$�Ѥa�M��`��"eM�9;VrR�ݔ�׷9W�d�K�IB<\��b�BO5>x$5��r�U��j����"��Ǒ�Ѹކh{���6 e�˶�H��>,$%�(�\���*v���?�O� 㴫�n��⬦����ܭVO�!�q!�0�86Hd �@I��֠Kd�b}�o��A\��3��	�M�<�.�(�_���C$�I��mVR��mH#�%�]���ol!�:i"�FC�6�4TOFp�{"ȓv�8��L[��y����G�y���!;���~�
��Ԛ34\�}2v��u����ew�������&_
X���n�aR�|ɶfq_~�X���>�' ��c��BT���
�T�.�k�a8���ɘ�P�~��:]Ph{�O���g�7��¾ξ���`C��� ���=���9��^�c3O�3Ĉ���� (1__V{A)�W=�.������
��ˊ��%nQ��[@��&C5:ψ@���*3�b�	��[ �m"k�hU�H~���B�2�K��������w�O�.+�y�ƞ�
���!)2H� �}��G\YQ
����6l=�zLq�WQ���]+=������%	t+��=�5��{���'�G��:-_3��\����H$+�l{�s6U�����beQS'�*v��F�,�0�L;?E*��b�dԄ3�������$��c$^��	��k�*g�� ��x����f�z��Y�A-�w�&Q&��>i������_NR�����/�����j*� �2Vр�i�1�<.�@���@&X����c�t�CSq3��U�,�8��W�{��?4�u��p�#�E��x����l��~V�t2���x��xP*����q���K	��G��sl\�^2`H7��r������������XY��Lr�,p�.�9PbHǟ)����ƫ�_gF6K8��>�����-������=��7�Lb�$벓b6���t�	jP&N�ӓ*�y�6�lq^�#3��� ���<R7��dr(�> ��|;t��0�8��@:�:5��U�.�y��	� �`�� ������.[���/�n�}νh1�D�)���5z&�s��0��x����c�ÈI#ۄ��\��QV+�̜����#�	�	QB}3�G�Y��lbZ:)� H����й� l-x��[��ڜZUe�N�}WUد��rx�#���V�q�`���NhH��x�^M߻��Nt����	$��ڐ���Z �!@�T��Ϝ�m&G����H�P6��C�S"�S{Uq����m ��$3��ܠ�����7Ŷ�eǥ���a���ː�,�'j9<{ԋ��	쟤1�{�qU�0|5O��$+�Ե׆C�[Y|'HUoe@V_R����LO)iJ��(2�b�<!^�s���Kp�p�Z��f�A�!凖X�~R.&��![D������E�+����Pyc��d���u�C��ԕ'�$�c��nIf ��F"ٚ%ҋ�pt���AM�Be�)����e-�O�>����2�7x�eP�.s\�A�i����^�-�*��Q���}fc�:.�=GX��TD`D�\Ej�(n�$r����`� 6:�45�#��jWZr 68�U��5�:Ѹ˷Y�js?>ؤ�#[JRrSi�J�76�����f� (�CqL�4�P�
��(u^-3�*<�d�
ֈ�<�F�쐕�-�e�hT�Az���k���"��uB�+R,~Kkn||�4?�Y�֡N��jZO��Gjm��F]�JD���:5�K�p��%�*NZi��9?�D�N"��U�����ͪ`}ZE,���&��ը�y	H����z�_8�M�0M�q�>D�P,��T�ý���X���a�=�{�x�6 ����a�Fr+I��N{����lU��,,�<�F�����N7@,4��F<*����^l`?��s�&�m��'����{���r��3 �;I�?g�b]Z����M|�Ep}ㅩɮ�у<��kdg�9��i$?����߁��gO�$�{�����+al�m.�眺�Y�l�g�}%s��_/��y������̱����A�>2������߱��*���|�o��%rm�{�_?/�0��	�_��"�ͷ���[���#�L|��v��q�X�b[�3��`gX�g.
3�����C�_G���DN?��spa׮�L�F�L��v�+�T��8����D��+`t R �d��ʗ\�ώ�p��P��%c�v��SFOQ���5EW�Oߗ�{�z[���F�x�����g�	V�O[�Ŏ"&[��l�`F�f�=d��3��[��=4���B�p���9�[��н���dw�8�|�	� ��ȩ�{��|}i���+w�&�#i���v��<S�'�ZI�yzm!��뱫�o[����G�$�(}kI`�6֒K�v0/OlCܰU�j3�~L&�����K��#�P��l��::Z��F-{�"aw�ۜ+��&�    ���w��C�P��C9K��.;|�����@&���|���򘭡{:���v�n.E��i���6��r>���I�0��ai����al5`�|�%g+�ٰ� pR�]�v��dzwٜ�W� X2�߻"�VA%����%
1N�l�&�KG�^�]��?e�3��Z�9\��T�f�h˔�l� �0u��C��cgٴޏ���|�M0
��w���k㶞�$MuhLSq���_������xѠ��,\ۂ�'o�t��:?1��M���l�¯�ʥ��Y��1@��vӆy����G��A�9�(�L|1�-�tfbQT�$�x���D҆�_y�$F1�aV�Zǐ 1֍Τ�b�c�]���B� ��i�u>#i�im�d�c�q�z���(���_sv��a{���]@U9(ɟ����R:�����Q'S�_��s��_M��o�e0���3Z��*DWU��)W��*�
6_�k�[��,U19IJ1UB��j*����h�%�rH��"р}�v�JEY
fW��M{W���w��QnF�	T:i䨻*���vLG�����:A��U-܌��M�z�q�Ze��M6ҭ�971��c�ay���ʬ���P��x�n�?��X���C�ø���昤��s���(6	����ɦ�xntp����κM��u3	����#;�	m��� @R���C@!��N��WJ�I�oh����6l76����m�=S�dgx5FάP9<)]y�X�2���fY�*������� �5Z$l�&N(~9�0���J�w��� �:��'�TBoD앛��h�(��W�[�l)r_}F������k�8�V�R���t��٘�r
T�'=�X�&#�o$U����^��c�_��[~�?�opQ%�*5��>��8������+�������>���q�(���d���05�]ק�R�b�<|�Q�w�P�[�\���	 ��6��Z�1\��6�'kC�g�t�LS#�J��n'���&�vP~�A����Po��!��-��|�Ӟ-���g�M�:_�Y	ھma�{�s?U�u ��R���C��z=���9�
� VV#U�1�˹�#:K{Ր���9�b����)�����c��e
��x3H�'z��LS<��9{:64<n�);�a���ebT"�4�׬߲���х�OO���N�M *7�Y�ƂXf����y���(s�j(ss�����T��a�~���A��ES��U�Cw����V;��=�dֿ��\��0��X3LSP�Cg��[��������v�O��-��=�@��飛��lלh*�����<^v�b���5�|��5��ٸ�)&+8�K�Fq�گ~as�3�#�Q�K+ZYg��y�P�E-���e�o�L�U<�%�lA��EZ`ٝ��Zј������/��Fu+�be�tȶ�ҋ�)�X�.�(�ٿ����P����|T7i��C���й���PIB-9Mۍ gǧ��mY�ÑԠ�@����r�vlyV_`��Ln��<X�8�Ơ�����R�z�٨Ն0�����&s�����f��,4��=@ⴵ��4ƓB���ܿ���^�P��v��A����!WgT4�������(c��g'����x~,���v��!9!_��B{��rc�2�D��a�S����\��FMTa�nÑ�[�������]�{�S��J �kG74�o V�ߜ���ѩ�1E^.�b��Gu��*R��X\ ��8m�(wt0
�����b�P��Q����N�����9�b��Tu�:��2H�.�+���-�CVt�b'�모�6IVpS�(�zOO��������� '��\3K�;�a�C�u�ү�W��*/����H��"3u���U
����Ƨ�uR3�Sn�F�r5�<�(ܒ���mn�� %t�m��<j�l\��.�k��
��v.,ʞM��U�P�>j����jer|rY�3���|B6*�z���`<���8��9.��A��瘤+_ҫ�}����҃_G���z㏃����luH{Γ�S�e ��w<2!_��K~n�o�N��m$~��,8��Q7_�J����{Xqp�
�	��oc��^�F�],T��9e]�%�������_%![gnn/@ %���-�J��I���{�����
�1���ɢ�K�iԈI��H����JT�O��I���:��2���&���X��;�3��ح.��f��sw��7,f�5�����ۅg����% 2�k�"�n�r5�f��8���A�Z����qP�|r:Kd�j�k��W��ώ1͌��t�I,#	|�2�����潼>�.���|ݶ������+M,,/E�L��F�$I�9ƅO���'O^[�9�P��?��4���J��Q��.�.�Hک�@C*r��IS	�ޕ��)-'w��zX��>�.�M�ç|S�ex���qM\����:����Z0S���)�U�0Y$�}����n�
���Y���?�a�spTTa��a�-N�f���)��Rc�'�Sy�N�)�.���
 ,"��.��)�R���`��3܉m��)�����3��̪.�Rw��/�3Ū�n�Kź�x=Y��EO�AI����_5�����P
��G����M5<n�_��"i�[m&<�ҥ���ʻ�=��w�Y'>���|��*P��l]�K�,89nB�^�2t�!'TB�Sڟ�3�d� �>ڬ~M���
�؇MƮ�o�+�)u�>B9��M���h�7��"���{�I>~U��tj��jY�.[f���S�:�0U�C��tS��s�;�?^�A��e�
BO}1�)V��>Sei$�A�j�?I4�FS%���� �c?T6�_]f��Qg�M�7yB���&�&?����y�ܔN��^|O~ߓ�⋼����jJ{��f�O�gP
/��XLtӣ�3>��s a�_��o�_�9����������0�
T�� �~RU11�'��P�}?���J��0�)S먣��e���|�d���S���.�^w�9����.���͚/�>�d56ڶp�%���I�s�e<�������Ƭak�F.���Gڥ��9���v�S"c�a��N�|�DN��e���1@�H���y=Җ^�|�Rv�	e�X��8S���I��rP:���*Sv���3g�pu�g@��I嚨x��J���e�k"p�.�=3���x��x��#��B��ċ��c̷���ɺ�*f�[;©�q�E���~pp>C��)&� O��!�X�wU��a��˗��+aŒD}��v\v���LF7"	!�D$t�'�Y�n͢� ��@]���W@�O^��)�T*��M�W�cz3J��Rg����7Čh�E�\���3AS@O���X���k�$&�J�E+�`Q>���!r��F�Tǡ�Lg�8�����'�tPB��6��مzN����}�y�,)�.4Vz��ߍ,�yx��G=���Ԫ�'��8����)n��}q�*K��op�Wr������=lL���h�5i&��k�1lK=4���S`y�f�D�V�#`�޲ȓ�JT���꯾�[)�ӥ°�T�f5C;�X2�E< �K2�V�M�5����㻟��>>�����i]T|�ld�R�/^�6�S��<����q4�({U�w��ޠ�AeZ-^�W�%q}jP��H�j!(�|ʽ϶�!�2��]�S�(Ns�3U� ����rW|�+�����++����~�~6��~��u hQ����'�z"��8T[{\O�SB��X�z�J�o��_Z��h�Cz4�;� Yl�+,��8���
n�s��PU�:@~;�r��o>UҘI��A����'�[� >�+eq�	 ��5�/(N�˲����u�/�7�V��$�ﴤJJ��p�cq+���y����E�/1?��fY 5�"���uP[zkR)�~hS1�_/�P�O�C�J�^O/h��(����;�����wӵf��A(R+3�7�k�� �XW�.��J4���w��$oC0����װT��S��B �np���*wYWa�l�_=YU�(��v�9_    !c5�d�Lݯ��6s�cM�Δ�6h�h��f}��
��^uD�.5�3x���q��&?�N"���|�F4�T�*��C��j���4{ M�k���x�4Q�CY��|�P�ݢPsQ�Z�8�d��~B��Gh���xɟ����I)Q�Cb������-�[_�wY^'�P#��6ُ����-�>r[�nMSh���ԛ�=pF3˪.E���O��\|Ύ!%V67$���*d[���b�.��K�cKb-�yXI�U�@uw%4�����UvPdןѠ��L��,�p���e�̬\4�,�΄���c��V�(���4�򾆚����-�~������:� �u:LCAN��J�����1?����#&ؓ��cMF��[�)�g�EV��G����2㸲2<S�fe����]�ll<6���U���e�==N��'�!�(ڻ
�t�LW�P{a2Qr�Y���W�)O����3~�R$[�za��g] hC���LW|pՅS^�����ڳJ7�Su|��D��sU�o�F�v�D�`wF@���Z���o�ۀ=e>쉆����T���o����=�2��bf��gYI��k�5��|}�O���Q�#���� %��xЙ베9�}�0��w�	2s�����g���Wo�񼏟|�nk)q��L�O�^,�1�z��c��<5*�Y\��Z����Ӣ��¡y �N�,LA�[Nh�z|�3w8Y&��#���w��� D � d���g�7���ٷW�u�����z͔�/�c�?�b}��n��?]Bq�^Zkם����?I�8��x�N�b�A�jfYo�p�ǄTu�XI����(\�@3����&�&{9�/"M�ÿ�V�!n^�0�'u<t������+��a��wo=�S��AXS1���q��mԐS��T������0�x�E�\ˑ���s��ltE�k�ۨՠQ�V	�#R�PiH�g�� �
��~ۉb��9ۍ=4��`(vz}ND���Cj$�A��W�;�[wT��;�5��x�o�(7�6R�����g���A���Y�%p�W�C��iK�_�u>�,�j���ۍ֢��܂����i)إSv�V߱�٤�����F���)v�_�i=0�F�*�=^I�-�����a)��?�{�f��f@�r��}��ZF"�_ED���<�~|,}��$U���Tm�jQ�
Q�J�g�2���,�=�@��]�4c�k�b7">B�P��e˿�O�>�t�(��,Z>'ʁ
��Gv寿�n����-0�ҏ4���a�����:�^dEH`^P:� /����K�Xa�dg� �� M�,ҬE�H�"�g$p�M4���8�&��t��q϶�ٽ��o:u��KY�-RpZ�ռ��U���h��;z3�����r7wY���}��N���3O�f�ޔ?�����dXc��@�� �
~�6-�	ޔ_�� ��f��D�p�6���� �#�:=0� �= 7����بz$� �p��6�5�%����y���R�k�\?np�6��<�K�K��`���R��!�.j��e}̧��bi5�Ψj��K�a��W!r�C }J�����V[/��('Z���B�3���
��o`�`�2Q҂��W�R����Hɍ����
�-j����R蔋�I�e)�Q�h$�n.+P�����<�p�3�h����O��\���8H��G�&�
N���"[���4���#JU�o2�J��u��w����~\+�P�{;���T��Ȭ���4bt�R�ǒ��� .�[���Y۟3�,%@��%z�ǡ:��Y mj�j@:�FT��E*ށ�m�I3�B���� *Ni���m2?'v����~F�^@��Q��s0�ۑ�Զs�0%-���fFS�]���覺#��n1b��cv���r�͏�e��'�ۄ��E%� �:�}-t$ﺝ�Y��n��˶�e�R�/��'6�9o�f?�����F@I�p�P~���e��1m�qugv��J�����ҵ�����	D��MMQ�<j�R�Ԝ��9�]�v�Q����NSj�*VK�f��!ζ�����ZD1��߯k��� L��n����|�6|������	D<Ɋ�i'f�m�	�@���r��E��\S��h��8��r��.�CG��Q�yg�[�K�;��z��r�ĥ�	���Qi&��
���ȸ��t3��r��J���(����{�Ą<���-mc������L-��#���&!�3	E4�Y��TC�l2�}^�G�M����d���1�5�.��{���y��1��{p�5��%.�X��+�c㋇;. 9w1���Z�&Z9��kĽ&]��O7ш��{����ǋqؕ^l��3����UA�G��4��)@�D�yժ�p��{��S!p��ւ䔤'OV;�����dV!��l�x�۲�Ō(ȴ���g�w��ٴeW�kh6Y`�dW3�]�l�,V��a��캊I?��*R�|���ܛ6��� Ɯ&�q�6ʣ�[l�q�$��8Q��&�3b�[�p�
���2�?���h@��ճ�t}*ڸ1W��H���g/�dR��5�&L�4f��ew�(�ꘟ=i���h�E�3D�fs�m��'D:�-^���w0����8cŭ��Y��RO2�FX���Sؑn+�)�RB�^A�	i'�ZI��+��ױc��E
'��}gǧ����"����*V�����%�T|[V>l~|�Z1�K�����ļ?�O�Hwވ���I��SX��&��<��
�I]����*nj������h�׬we��2������A_	���[�IC��a�As��<�+����J�HY4K�BY��x9���o��0�x�
|�ˆK��O����!���f?��)��ocV��_�j���ĩ*�E�T����4���5�m�3�fU��kv������	<����c�i�~��?��NZ#�_��8���X���GWI5����u���֏K�J;4��}��� I����6�`�&��~�T�����5�kJ2�I%v��uE<�[�:d���>7���z˯wơ&l$0ҭ�d�S�Ԅ�ey�A�p-�)�U-���.�]�h��&�k��\�@T5�f82H�Me<ׁ�\l�*�@���p%���8v�J�?އ��	z�"���);�y&)�>�q���-��Q�'i���ׇ�>�D�*��u�L�#���K����\�^i}�9=2�Ҷ��\��y3Hڵ�I�>&���e�C�0L<�*P;�W������	�s(u�nˎ�2S��Ρ��c%sW�
�[����w<F���6�r,�R�n)��5���#�^S�kr�I6��)�Y*-�.�US�>�8/���gNi�܈�˧�-u�A��(L�}���_�|��%�o��T���М����yN:�����9�_=�|�_��V�n.OǃK�����s�e(�C�'���s�]oiddڌic����c}8M���[%h�[4s�gۜ6�����c���E��m�v�^V��~{l
�S���Ȅ�����ɷ� sPQvS�%���#���t�J�p�j˖�s^U�!ep���{X���ܬ [3U���fnZ�\��L-���iU0j�1�+�7�R���e��6v��'�����guM��Ĝy���=���knQwH�J�Q\���=%P{R�ۍzҼ����/���:���=p���sʸ��#,�FS}B8M�c����V� ��
doȷIe��x�z�s[�t]����ײC,ΊG�|Ǳ˩�g�O��~��p�G�	�#VwE��4s�K5��)mO�g���,���Y$��Bors��6�����r��ED�����aE"��ƬC���Z���)�c�6u�O�Ѓ���C)s:J�!�NGэ!��hY�6���R|؋�{�U��P�˄��!֓��u�U��E��FWSٴ����S�vi�0�2fU��A.���N��EU�d�~�,z������]�kGH�s�g���~Wt����;���fW���]2_�:T���7E�F���%!��<E�^��
.,2�,�,���D=T)m�*C�V��+OKuOo��}�E� �  |)o.Jc��ΠN�r�/F�s��~��ߌ� �L�r�2.8�LUԅ����A'hS��Y�b_-T�,���,���pyڰ�����7�:��͕lG�~Phb�_]���}�}4"�jP�n���C��} ��Ê ��]�&�Ҳ�$��N���h���PE-+i(#�p�Q�\�����M	�ojC3�7�YeǗ�b��v�i�6j��j<��Q@�y��(O4��be�/O�����nI���xe�}�n4��X�1��W�Z���5x���܍�_��Ѣ�8���-?$�;��0��������u:)0�vh
�t�����kF�+I�f��o�k����fB�D�f4C��(it��}�mB(��7�6T���V�o���0�I]K�Дv|[$�\6��`���{.P�>�o������F+4�^�T�j�ٟ�{����&S\��#�����]�T�-]��T G����j�m���~�A����z��*;�/����U�u��t��/��W6\'	 ��iF׿%t�d���ğ�mڊ�C:$��6���W*���D~7"ڷ�`���Pݘ	B����)��.O�y���/G�GZ
~d/}���Qtu$]���x�mN����x�F��#z���kz�j=M���s���O7��#x;"[�z��������#'c$6R�3:�P�-���cv�i�:�4�L/��{�[�i箆��3��v�#G6����%1v��F-W���V�2i���Y�'#��l�vlv{e$�T&c�]E�+��_)�����Ae�,�+Ǳ�Tl�	��B���t
��l���t��!qb�/�G���}0�!A�>�M�îir�R�9"��Ӛ@	9B���}h��?��d��n�O�~ɯ������/<"�a/	�����d�<�/8��U�_��Q�lN�k��9Ɵ&ృ 0��b2���Z�̶G��vB9n��$�x�t�vL'z�h�TˣӤ��XeG��$�-��*��أ*������eb�``L�Ų����I���D������HjhVndԮ�|ۿ�W����mU�9��h��S�32V���np�Xy���:2��?l�̭��wq��y�����7x�!�Պ]G|	�0�M�P��^�"p��ko�<�E�����Fu?T�7ݵW:�:(���n�¼M-K��;/Ɇ��
�&�̘�&�T��Kӫ�]�8Ĺ�*�^���R����RԔ�0�CZ��+H�ҒӉ�&�w�֠S�ŋ70R�I� �@��owk=��;��1�u{=�!S]:sh����8�H=\g��y�]|��u/�����\�.eT�'���|!�	ٓt����	;�	K�]o{>��ϒ��R �t<OV�@%)�b��7��"7���VYT�c�EgX��4p�����Q;�U+�H�_�Q���Q�X�h{kgI=��ΗlS�;v�Ώ�p�V�So��$�a/�^�{�I�b�&�]+(=��RS��x4�:��$u*X~��6���_M~���z��e�����y{X����ޯq�:���V4���!ߚ��֣%�m����,(���_��>�Q[e�ϝ��c%��V%V\�5�Z)$��GzC��I��������5@\-�H������gaci��7�����!7G�!ߚ)|tNm��EYW��j��|)C	�KE/�ͮ!�{ԾH�V�x�-��{��;"k�a���m4lk����0U�񪓿e��K�|�b��� ���������"�=���i{`��c������V��Nj�!��ݲE�(b��o�-�..u}���|Yv��b'�h�\�������Hb�:F��U[w՗�՞rbFs%����{�
P*�FO)$S��u�V��'e�K�̝�U���� z� �^6t����4k�(k����ڵ
�؈�Ȗ�&�̒$�G��rG�_�*�0\��<e�a(���
3?UO3hʵ�V�������L�]6�f�U:U�G1\�my�	~�{U��G{���$���M��)�f5��DP�Mz�r�5� ����txq�=�N%^��~W<Y���q\�.wԘ��'��^<}����Ŕ8�m���2��	X��Uea%}E��� ��`(��i1��[h��@�����T�#9��3�o�o����60�+�7��տ�*Ȅ�A���Ud8N��=۷���l��r~wSP�x]�i�f}4L��z7���6��&��	޴�絓ӿ���qi��32�<R����������D�S�^�&'�?�U�G�-x���1�vF�p�m�
^��|�N���΂o>�9�ξ�����#*Ӫ#(����qw2�"=�Cݕ��4P9˼�@}��FZ�[v�U��=����R�8��gC�.=hW�h��LY>�J�jw�"��0����Z'����:�ˮ�:�
ٯ1a�x4�J~�+,O5��u?���R)R�@�7w�R��u]�j%*�L�J���>s�`:.f��G�q<��B{_�Z���ѹ�[��awΏ����\%W���O��qg�W�Z�D�� �s_i��:'�Y��?��%�9΍Y�������7I56���7�D��7o?=�^���������O�?�?�'�>�=���5e*�|j�^�/Z��`���>
���������TLj��P47��A�S���ni� m�c�I��.U!�9��	��"q͏j�͏�K��,�4tw�=�)ۦ�n�~��J�n���f-2�oVT�f\��C�ɞ�lTą���Ȇ¤��U�?
d�\��!_ή�ܜ.����~�@������Ѭ������Izȏ'(�ǎ��I�Q몏��~0���(�jRv�9(`/�* �lRYsp����Yt��.7a)g�,lH�!�3�TD��u*�\E	e1�6��X��xΜ0E�	� b;^X�keAz �zy*������*֛�&r�S�7ʏ;���>���GZ�c<	��&TP��@I�a�0#vM��@
��uP�W���k	ٴݯ ��B��G�\���^ʓ������������7P�M      U      x��}�rG��s�W�{E����(�� Ԃ���ff[2XTUH*+�:������m��e�?�~FFf��������<<<"<<�=��ⱹ�A'�V�iٿse�|đ��ڵ�z�ӛu�k�����ڮ�)ޭ�H?�VM�~1ς0�L�i#�����Q~�>���k��M7�ܣ0H33���|g���-�R@1Dx�#CԮ��/��~zS?��y��p�M�(K���M���?=x����O</4�R��"��y�Mr3M�#�4Y����z�G���^�w�d�!�O�p�oݽV{Ƚk�j���Y�v��w�m?��~��S��^�#�"mDz
���L�ԛ�1Rh�a��<�3s��$�o�h{i�� C�z~�͓�2����)��������ǩ��2�=��P&�3��4���;���(4���7��Pl�OB?nLL2�Nԯ��m�����R�5�N/�v�4��w���x�v�mn�Ӭ����^��eˎ�&=nП�+?�`7�G�;6��P�����ƁI.h��TE����ȯ��]k8�.u��0�u�l	W���֎��A��X��rk�����6<p�܄�g#����w�2��S�;�GO�8���5�\?}�nG���;�羰Ω�!�F&����^�������_�0Co�Ý�D���/����ġ��΀dH0w��).�������W ��C/��k3�e���CK��W"v��D���F��T�:��`�`,O��{�S?�¶�q��wj/�� �B���u-[��K���Gm����`_�8�yŸw����,��ͧ&����J|�de+� d�=ڐMv��+��-x@~���Ï��n��g��~j���� �͇�/ͽg����Y�Ht ꜂�0���%ETx�%>Rb�RD���\�o�Ӵ���=�֎i�ʱ*��S%� l�2Hf�pG	����}��߶͎v�A�K0��p���${n���2���~��7�d���[�S;�Η�S��໫%�%=J�����ʄ ��<_�Lz���5փ�gP,��ȸ[��H�k���,�+����Me��6�����B���]��N��i����Ն�E��6�����*1��u$)n����=�9v�e�m�ޚ�?ۂ�0�a�F�t2���C����
6��mɭ���$��'YL���J���}��loP�A�6�Ќ�	�(޺����^�c�Iq6�:���Z�|�)��I�J�@a/�w�@�f��u	ᓻ������&���` Vx��`�����F�5<��Q�#�5��׷k�/�[k[ַ�i���I���d�sц�c0O��ڰ����0�i������5|b��Yp��|Se�!öM������i)t �	��{�� �c��R�:.\;T�Tx�qIP����;�����{3D�E�,h�]������lYCz�\�j�z�/���f��E ��0�a;�=u�̖�nAd��0���n:��y�	��V�n�l+�080�{O���*'�q�Ӆw���ګ8���k�K����'�>ow?����#5��3O� �;?�es�{�44��,m��נ�	o3P�Ѡ�ݘH�R����04աo&�� 4�hj -W��<&���6�o�X�VUz��P_�Dm�i����M+��Pj�A��E�= 8 ��c�l$bz�.L��'��ώ���I�Z=�KqS9��a�'�
�(���G���a�^�	0m4,]��[�^�3��#Д�FH�(^*xՃ��L%4�T� �,jb[ 8�ݳ��vF�ѨI��Z��Z<�΀�D���2�;���v�3��Do:�����,�Ȉ{�3���aAj�]�hvkg�=V�}�Pв;����_C�ZaS�x���~i'��`�d�m�a�X;#�[�@گ.23�|��FF�+Fh�����yD�Y�Ą #o���@4.LreD�4�ӈ��i�̎V|k�g��DA:��U�.P\X)�8��G�Sn-���T��M�X���ZL�����d�A`C�@�
�����k�u���RX⇬em6m�h��D���8�~̣̬B�L��\3/F�k"�|�P��+�w_!�|t���5ɵ�/�t�� ل��?��L��W��R��@JY�t
2X�p���b�
���k�e��1uG04Ҥ7����}�ě������H�4tj��y^5�~�*����2�����1��A��'b�>�?��O� ��퉾��j(�o<��T�|�_,I=˗�ʬ��lUr(nHx��!�ce}%���.fl��n�E�Stk'��ݝ�z���z�0������~��A��m��L����B+��������|��oIys��be��M�.lE=]ଇ3�����Eb`}��4iZ�0�z�%�N�6�t��?%sq��mm����i����S~l��A�; �>��� �v �ȿv�鲦v��%l��l+]<�܋oa���p���i>��\�WK��zo���Qw�q�Z0�[��A�KA�{�Or?��w�/������ir�SsRɽ�P�Ѩ��oc5t���+ߠע�ݞ@�D�٦"<�38�F3-l{�A66���u��w0D�P�G�E�ma��}FUXίm�n��Z٬Uu�26�'���������۴J�t&�/���^�!(W#إ���wG�]q����r�����}�Ghˀ��#�5�� ����4��v9����P�O-1o8 ����9����Cu1��+es��G�#ז!~Ŧ�1���Q��'�+�1�������~����R.~p�v|��nl���X�{4��>ex����������V�-r�������~ībe[EN��xwv�x�<��Ω^��m3L;�������^�Fd�;��I�������;U����2޼�#4B/�x���!ѵw�ؠ���ᆮV��5щ��*�����Bߏ���#Gx>��j�\{��8}sr���S�=VA6>W��#'$��p��?��i��x������ه��{��d�$jy�گ�	޹�IC㶕|iG�H����vc}ӑ���{�=��jC��y���sA�y��P���S'�п
�I�]h*��L�Pj���m�p��%#3.ARs�^������^�:޶]tNW˥�[�"�WSK�6Vǟ���6��h���o8o�AF�G^V7;X�F�ۏ������[{�H!+>΃��[�� ���H-�<�ՉѬF��=��n�G�J��g�#�����H?(�{?�U8����,'�_��ƻ�; �ݑ�7 =ph�����]�]b�n�qԎ��z* �ˏR7��������x�+��".�m��Z-������O�7S�v��0쬁j����K���6qe� ��q1Š*��ܸKM��t��Z�fK�f�@�ۿ!��!cJ�[Ge[
���q8���6L��hr������Ӧ��ju�;s��(�a`:f�J�g�ϓ��W�xoW�eɩ�b�R��C�F����bү�I��SjłB���:�1NR�2"e�������BF���S9�"��d 	>���根MG�ZC��|lZX�|�	O��"JR�!�%ysGN.��lB ]D�9����Cz�V�-�wA�p�Ɖ���/NxL阘��� ��EՋ���,J����0�ћ�&� �3���Wd�R�||����I�ɄbV%����g�,�������8��6o$2�b2��.ʥ5w�b�_�[O��C�A"~1���i�6�8��7�y�����%���o,��nm�46h�����q������M	:[�݊+���ߖ$&m��^�aOȋT�.Ed�~4P���_O�;�/D=�o�@��*�i���"�q���`�<
��LƩ��v���u���Pw�f��Y�X]��rt����:D�)כ7�*0�+td��/w��*��N�n��MҾ?��24��U�O�1�f
�{�G?�|p�;�    `~A�]���'�:��n����K*N�$�d7�"V�Fϱ�R�p׽wr�݋}<�y2&�,��E���g{p�Y�Zx�l�<��O�|.��O����6��r�4����eb�H�-�58h#�ffJ�3�}�:�sM�é�Uj=����;h�b�@8L`7�5��v"w�[b��/ښt�6 �j[��΁�8��g��َѭMN��4�K8/P�Vď���*Hji����Y@��&��:��ꪄ�4��<�{��]���D
��S$�����gy����񜝯�����g�[��ɏ�*��6���gC�X�	��Rx�_�%/N�+���&�T+�x���$	���^cD�OY��]hƿ��1��7���k3
o?���^jƠS��TiBM�z�
ꖃ���]�<�Hש��v�fh �CJ.,�qF� �N��)"�2�:8�y�pE����������T6�;�{:l�����N؋��a�6�c1�|Q��Y�ᑒw�r���I1��1��Vп�r��z���?��3<F��ADo�X4���sJ��~�<M�}f��I7��wb��$��-�ϯE�NQ�èd����M��ML�i{�U2�t4+�'���*��Xٽpٝ~����W���ܠ�#K"��J)n6ɴ���@o���{Bo5��:cV������qHSJψ��z��t/)�bރ%�U�}}�|u�}}�EY���
A�����K���G�3�"S3!�8��K���`����4[B�9�*e!p_*�t�tVTk=�AnR?��[�դ�,#�G=K�y�z����M�<����Y
��4��o �q��K�Əڽޑ�<�����_����I|��'W>=�,�z����n���a,{"�O=k�p��?������-_����7�ϟ�����=��}=�&8����_�E`^ia��/@�^0�F�3�w�5��T�M0Z?�߂_�=}Q Hm�ϗ��^�\���N�s��W�8��{�=�&;E�Y��|���~P�J��R����s�y���T�J��o� �V����������-���5vo}��s�:5s���.V4+���_۷�z~���^P����x��;�=Y�K��^c �}��;����C��ğg������wcu������26���~A���D
�qc[R�>��5�9�p�!' ��-`���Q�g�T�]�젺	>�Ǉ�iج��L9��v�4���>�H�²
� �v����;�7m|����ew~��<�[��Vo	h˙r��X��������ϼm㜽t���y吨��V6��;7��^�|�����!1U͚�p/)��ޔq·���'Xu�+�\��L�7���0+8�����Jt��2:l��8&��S{cn�+!Ԫ�����O�Mߞd� ���d�-�G,6�}��6��!�ju�_v�zܳa��V�}a?���:l��2��ۮ�`�(y�mϛ'��8�kb5CF,W��=޿���(x�,
^a�Y��c`{�5j��(	�~�oQ����Ł���c�*ˁpS�Z�A����h����6(�����<�BD>��N-�	���'nˋ
κ
��q�*���4K�#F�o��2Y<.���<j�E�u����
�
l��I�ui#Tz���E�V�����eha\�t]��B=$�}B�I�1X��ش@E���=$΃��J*N�,n+�
}tHD�53j���3̋�[M��~p�C"2��A��@la�f�ܹ��ɕ?<V���W���jA4�c2<����(5r�Z<X�J��!G�]��d�2B	����9�תɟ���{��xa��*Y���Z�"k����H�0��5���G?V�KJ�������L��n��*��nc�oʨ��H[c3X�۝^ne�۫�Q�z�v6���CM�����Rd�	�lk��X!HEȖ������C�ܗ�ۿ�J�v�9XU�Sͧp띮WbJ�Wdf:-�j0���u��3&���.@¿*��E�>Z��>>*h���Sy��wr	�C����j*��Ⴇ2�2�_[Hv��P�=1g�֦V�o}3e��wY�vG�^E,��ȴKŝUJ������z�>صj��,�1,Ιc:9[I�U�`�����g�m��|	�e�#҇	p�rҜH�Y��6��̐�0hM5�t�#�&�����CJ�X����6.g}�-#�s5�z��g���TF`���L1��J��Ds/vj?�/�=����:{�_ '9�N���r��y}� MkZU*��_�bE�����hO@_�H��k���M�Q)����vt$���u���B,���֏�Ɛo�<B1Rˮя����~p�l�\,����6����x��N�5�v5����鲃h���o�M<ZO�#�/�y�۟��w2i�w�yDN��E"~��G�8���\*��M/����ԡK���yB�IzΩ��s�/�	[��:����k�,P[��ŧ���q\�:Ύ~�)��5�R*Q���R�U?�w��#�7.T��^�ACPW�#߀�cm&xRL|�&0������e�ȸ�^De�`�'1A��ㄳ�#v\֗p7w�2#!�T@�ߟۈ0����PI/�d��u�������t�F^d�lv�u��O�[�WOҭs�u2���a1���`�FD�7��<y���#���O��tc�S�v�h� t�'�@���=|���+oDw��0���p� �L�I>�����A��|\r�=#���󀼬q2�2�yJyɓ��u�͟6���k��◤���럹>V\�`f�U��0#�)wZ g0I��	�(�q���.��?���S7*����~:�q*� ��cj�j?�e;@����Cm����_��7�wg��ὡ�r��aK�2���rc��֛�������M��� @�x�4�\z��{�������bM\�!�S� u�Xbr�4�g� 2�؆IP�#�l�s�d"pa�ct�y�?ZCa���pw�@<�pw���{�!xs<m!��,�7oL�I�8;[�>45�ع�Z����K"��g��+8o�'��l�%'��C�N(XS�#J���&�9G��+�m��P��bk���X�&
�b�'n�ċqfA��аϨ�$� V���ƵcC}9	���y�R;�Rԁ�p�Ѽ�Z����#���u�;2T�}2H�G�<�5�f�O��xH��	Wџ���^���Gr�{w���[�a1h(h������:����A���87>�sX-W��oX����<O�_VR��W �fd�� �b,�ѼhЇR�4Sy9�y�0_����UE*aWB�!#�ږ@	��:_�������-�G�n�Ki^N�f��j���+qP��+���c<�����;	��Jx�C+(r�p��a�gu-x�\��"�W���Q��S�G -�~ޙ�hzTya��N�m�,��"Sb�9��C(Q�N��Ipt0�����Ltr����`G�.�Qm1���f�$4����'FK�I����}�B�'��a��u�i޷-`����2�Q3ĀJ�p��_K�O\{�Z�|ϰ���ֻ�i�|�T{$������!E@�'VMB���f%�haa���^%�6�9&��n�)�����W{��$��d$l|j��1n��(?�T������lj4b����yWvĹ������o�$lO)`����i(�K�-3��[������ �J��b��y�N>Q�|Z�Yq��`v>kH���@xzD�r⇷��d�@`Z>T+ʼ9)J����P6��7NiiW���w7b���	њ��
⌫�Lڬ�������ʍ�/i�����"��g%��b�Z %0skcw���*9��F��	-P�r�;A�er���#�,E���CX�ᄆIWW�T��|�p���0�}D��4�����Z	��0�ML^1�N�L��a��xhP�\X/��5��'�	n>�ގY��ۻ
�=dof�	es�AD���O���	pf{j���%����q���    G��~o[�W���K�c�Q���,�B���������>E�,^�vC��?��{�DK��iW����n�E�Iص��;tq�%�1t=Qŋ|�m7���`т�]������r��;�a�T��^��°�e���9����	���8��Bǔ���ؚ\��r4h�~`6Ԧ�\|f"�#oD�����?R�;���q�$�r�qF��J�
��i����4Mz��(gY�Lr+��w�i8\\d���Ĥ��)�2���$M9����Ft����6�pM�R��i�-$�G�^���^-�
��}^�2l�;��k���]���փ+�K�$�u�I��&be�bU���������i���/�������{�e%()�^����£U����g�Fv��t�6��E�A��8�S���ļ��ݚ�v��nw㤖���z]*�ۤTI��.u��fKN���u�� ���Y9ϱ������rHb���,�������Mc����ˋ|�f�X��F��}�Ѻ�,�[ZR�E2��}#��Ŕ\��.�������黷�?��s�����y��z�1xfuf��D��b7���hs�5��0�`��K����u�Q�����<���cnr2�����8�$�%ncf�CO��23u��4����G��^����\������]N7@i����0�h����B���_>���=XG�P���6HƔ���G�ee�4�K�M����6,���Y�^J-�U��U/����!F�"��l�*����ǩ㝙���0�ʣF��Dθ�oe.��q�l\��Qe(�)�o�P/ޫ?��-
F�r)�U<!ԥ=�ݡ��e�b�b���^�N������B�ld�]S:S>s}�,q��E�8�fy��G\������[v��5X�}�g�[K�f�6Z�4ۛ-M��O��\A�T�f���@�2m�M�Ph���9��)�~���<jmR˔�'~�
~XP�U�@0�@5��a`6��F,���Mr�%g����T� �EI�,�x�r��@~���N=+��sd�KF�����zk��"5�%���`���d���0wX���F����Y��(�_�{K8݅���U^�=�+�����q4/�V+�͑�=̠o����p�R�8۰����]�MK���G�Mj�n &�s^ɶi&9�XL��>]f^j�ߝ��ps�/�TA����B'�p��!H'����u�Q� ϱ�?vzTN�2b�.]���	��P���)D+2�e\=
+�qׂ�a�UX�}�W��u�A�#6�}��WT�Z.v�um����r�;B�5Wִ�b��/˺+ԥ�Yos��[������K�V����Z����$'iC�V�fY�V���	��7�<L�1���N��^��0mIKR��<Й^�X�I��7}~��J�F��M �)g�_�ľ���=R1��?���d�4�F���GnF�� �^]˂�w�ߓ�[,ֺi]��A���k�xv��!,p,�j\W��=��kc7���=����g�����_�{5|�F��&��7��u�ᤈ�M+��� E�|��a��k�)tZ���ӢlOQз�S8���(6�`���d��~q�;p�3��.�����C9�B��T��֏*e�b�'�A��]ǈ���w�-�h7�qKQc&ǝ���cD����a��У�p����.�4��'���O �u@q*+�4���M�׿�����Pp�M�!IM���Y��@�� ���+����7�6���{�C�$رw�FL�_��r���kkпr���tR[��#�;���9M5�J���JL��*�:'f1&��vN��#���/��l���E��bAGR��5��s�z�ԞG\ ��ܰ	�I�A�JT�x�"4�L�jS�t�L�Q����YZ6���qr����w��E�̨��uYR,/��?)M���t�<���+!�Xb��7Y��ZL~Vנ�Gx���}�&i#\��Hݴ�c�z�<1��
-���3��H�AX>��0q�r��Zh�Ԝ�d�IsT�%.Ӡ��_sq���|�Y��s)�����SM�&s,�YC�%QM��qIY�*�<�&�F�R�ޣԄXd7I�dg�E��t��_(�r�`�v{�%��7q^1�Y�E�&���tk����c4'Z���M]���X�d��:n⃪C��0Nv��MN,ew�Aa�>t�cH�<�P����H+��c�K����=�����|;UÝ����0�[2�Q��q�"���Uqа<S�
/½k��g�V�*;�1	+հ5�\[��8���Z&^�_s��ή�8�K�&q�pc��\�d�D�����n�ٌ�{�Ȯ�Iz�w+�s��2 ?���e�����%k2�s��c�Sl�,�#,��j��s&�Z���Ph�j�2�%��,! qf���Z�(W�ٷ��iE�B�gO�jt�y���ɉ�pjg�")�/;r���V�B�c�b��O���nQ��� �ZN��B6)��$/1q��;0�Z������^�x&�P���j�9�!M�%#����;g�l�9���A ZAޗ��'���k��Ȧ����9���38��ֹR�����#�;���S�~y��G���V��2����_��͏��"i���c3��1��ʤ%�Z��5G�w	�!�������'�(#��n���9k~���q\H
�c��� 0Am�Y�:��FϮ�ϭwj\q��
��������tjB �@�-)mrx�Sh����p�ΐ�~���'0�|\(�y�M->?h�����J�a�j�-��^��/����nc"�&�	L1�pL3_�B�h	�o+��ªN��秎�� /�{�PI�#] C(@V�:U�h�l�������{O�T@������b�`?)X�UNq��J���N��L�cj�"�"^mPGH(����dA2a1/�������lES]��a^c�ݣ"�
�����=��}�*z-�Q�ő%�#~N�Y!�&D�Ft������5w�м4:/�tfi�%���&a_����!�`_����"��4WZB��NY�"�+ˤ�xt�_i{6�Q���#��U�� &թg��q���H�ݝఔ��SZ���A^��y�$d�g�$�Ls Vi�Tޏ������n�"{rP:C��g����9J�b�<&�@�=��Ǉ0�c��>�ګg�a�oo�3<���_��"�P�/Vu8��?8�>*��-8<5l�:�k��0�Ț�ը,Kٮ�-�!��Ӽ��R��W$���:2������v��|1��nE�R��P˄v����ט�	#�l�5�y�'3�Ď"�����Rq]x<���L�AD[�^��A|�u��<�&�c�<-;;�4uk��HZ�]��U�J��-�N��Ți��l0Xtx��,�Ѯ��rlT,�X���A��O^x����o����U��؃J��?���"�"}��Ԫ���_�F�+�b� ��@,Ɛ;��}�&b���4����g�L7z��2�Qg�����J�|v���-���}�Nܷ�2R�7���YY��8+��]P���\��5L���gh�i��*�ؤ����_�a�bag���	d�F�_�_�Ze�zM��#�OP��];����l�\'�-����+R��&ngi�;�3p�G0�vL��hVk�OA�xL~��i6�yb�,�eKo�s�5�<5��ͮG���}���;�� %a��[5�@E��<��@FK�=u�|xĂ��	�a�4YD��O�d]�.�51s*�N�Lp�]˩������s��
Q��Zo��Q������bM�Y݀��bՐ)���%(����dJ'#�P��T1	��e �:v����K_�m���G�/��
���8_��������6��8v[���
=�0h;�A�^����&�#!����M l|op�˨z�-i�p����{���!��|Y��;���	���S�N�"�F�O$���(R.�6��@Kp��>����#�A|��)?�Y՘���}RA��HϮ�����;�C����s?��[     �B���Ͷ��(���'J"�����'��� ��ϒ�ӉU7���rI�>���)��pzBz,f�B��fW�(?(3�#ع#o�P�nw��Hؿ_�X:��TDE��(] O���~gny��|���-S�<s�'�Ц>�!�2�z"ܩ��$&��y��I�wtnk�/5�B�Ӳt2�hP˖oE����-sP��n�z"!:���mf,�bIorm>k�)r�q�m�q�@�gƻ�y��(��1~\�+�6�(ȄNڨs����C�鏥ڈ���Ѿyx1����㩨�z���a��c��/�`���ȉ�g���J䁆1�~���1������F�Z�����Y�b�%F1C�&w���HL*�QU�s6���W�$x� �z$#X�+E�Z�u.�Y��ܫ,[ئ�;B�>u��<�>�3�R���2�T2R��MhI'��f�Ӹ�ѩ+��%�{�����r?]�+@����,���ƉE��\��{2�ߟ|w��ۢ�� (���@����(��Ι��������QzkyO�=���~\5��~�0���P���"���%l��_~��b�9���K���D��\����%ѷX�Y�d�Q�(9��Y�3B3N�Id�d	�Tcq�y^�xր���vO���\D� �)�s�4��U�(�e�WC��¼�Y�i�d�<ɮ�'p���d����>2�#��%{9j5x��\t�F��G���P�wBjO������Y���Dfˀ�CY�N���گ�ꮤa�`H>Ŀ �?��P�wW���o!�N��4��^ �$L�*2�EZN�@����֙�%�mM�F�F��q>J
H��sI�TN<<���X��y7�zM�aq�o��.��jǠ_���)R�r��r1Si�1�-R$!��&j�6?�v^���NtD6P���G�xg��������ä�W���:?�&ͫDP��� �(#��]��HĔp������b�ںwLG`��~������r�ת��ވ��.��B��������I�	���
���G$��I/��v���<:7r�g��\R:P����U��(�&C�6��P�������D:�'i�*��9��w�8�j�QS
�?�2���^A�Du�����IQi*Gi�R���|�.g�#:'�s�x�P��G��Ŀ74x�o��.�I[v���j�òG�VTe�������Kv9�L��2dMٖ	S���:R=�؏Wo�ر��c�wd''������zLg�<�Q6,8�1%���������ƃY���Y��Vm�O�$1融��E�����-|���@B���o��^P{nɶ�����y���� w��Mu��!y�b������#��|�v�nU�Z���IVu��}z�C�5�0$=�^�������E�~c�ʝ��.`[��2ZQ����vƴ��V���t��j � K��Z�H�h ʇ¿���G�jc�Z���HW7�F�m76I�4�M�{�А9���޷WE�Jj�u)�VdHK�AC��o�,�#/ZO�����6G\.�O�A�c���A�)FRj�k�#oz$ҙ���|M���8�pK�3���������D�ܷ��;�2;ǦW����+��t�_�О6�o�y�k�� �kڣ�$~O���z ��,rF\�HL�M�"	��[�=B�S�l��!��J��y	��1#_���%l��x���M���T�������<2�~�)Y�t
��A��{��R��R'�*���!�n�F��Ep3���v�fn�UCA0	$6��p�߅�1<����� S��җ���O䉥]�|��5r
LcN#B�PL���/���Guj3�.�@�������.sY���(,\�Ri~��ʽ� ��_��fg����xv ���Z�XfYj1!�@����=�_¯ԭhK�9TR�G���lˑ�@�%���d�R#۲�ܳ�c � ˧ԇs�׮��� �v	|����b[��}���e�ChN��V�U�0{76ʯ�ϗ;-�����9˸-v7N'�cCU�:�[C�WL�6�'�����nĳCC�/ۣ�m苭�jC�r�:�����m/�K���L��s��S�b�����g���ņt0�N��'��2��ȍZr����CC�{����?����4��'00�w�axW�|�'r��Dɨ
��ǀ�Ѓ����+���vr����WQ4ڣ��0�_�3}a�4R��~a�T4�S&y��=z)�V�c��饋_SgE�y^�~Iq�W7\�-���d��l��X�|AU�vVo��h�>�Š��Da�/�8� O�H��ͫ@2l��|�P��0��o8w�U*X�Wؽ� K%L�F�i�R���*�e�N�tc{����ݬ!��-��Zu��,<�5Mu^�$3�=�-������?n�;E��Un��҃MG��\��eEK���ewh풆��6CW�e����
��-�)1..s�*򍕯4�C���2�~���@săq�u]k��h�[�tu?m����
���8��Ҍ-�M���v����`2�V�[YM;8�JS'����\�P�Z�������S	���;�_eWYr�]������n�z_�����s]����(��	|����޲?��=Y���/�~X����O��N�^��Ip��ϟ���Hvxt:H��#'����g�ㄜ1��W�L�������I&Q��r�qO=y��FRI-aLg�EF�4�e�F����S�޲�(���v�_N�0~��$�v���#t���x�~��s�$#�.;���T���:@vb	ڠ�"z��ߗ���+itzV�cD���m�!tiX�K��G,v��ZJ���#Nc� -aތm\%��H��YBV�U�ό�"xm��t��O��ɂ���Eq�"y̒n�{��F�n=��a��G?C��"y!'L�TwJa������A�k�����GyT$�qJ1ܦ��w��,��r�31��o���ʿE�z�O0Ҝ�	�>�� ����4���%�����	VSM"��<�R�?tWąL�\>�=�R�	zCO�0?N0����1�UN����]#K�J�2���i��/O�kt�lQd}j�&��x�V���Qȓ|n�Go7�dE��;&��������։_�Ϗ�� �o�Z�3t��G�d.^$�#�t%�00�j-:�ݕS�y�	E�P�:d����^$�x�#���b���?��-gs�\���r�x	�tVK����c��攏N��<.m��"O��[�3��i@��G��ķ�NBt�#V�{�r�Z��rE��IT��%��u!��8"lrʪ��1�p%��:�%���c�)Ҍ��:�N��X�:1�'9h��1����\��D�c��Ѿgk��h�MhƉ��"r����$�P	L���HP�{J�0=*
�R@W0��<��'s�L-���U8�k}K��W	�:"RyMT�s�����n$G��U��jB��W�|R^����dx���������;#���i���q����{g�e<:?���w��~z%��l����x��Պ�(e��p�9؁�#B:#������4�Fi�+�I��R;�T �`��+�9�Y7�7ߠ{S��V7RI�[��h_ը��R�)cY�,.��QM�68��&��M�2
�6���ix�I�XQJ�0䄬E�$C))UZ���+T@kІI�D������y�!X�=�E�ߍuR�mP,0'�S�ؗѡPJU�Ʒ(�2�Z��9f��\��֑�x��{wB���	��L^�ZE.̯��ƙ7����%ֆ��eW����+�ђ:��4�� Fy��sg,��#{� �������@�9�]�$�1*G�7g���07��u�.
c��岀z�~�������b�cj�^#T
��V�kB��'�ƅ=�R�L�,�$h�TMj^���eSfԷD�M���J]�xH��-WhO�$��H�-=@\�k��p�w���5�K�0d����99;y����˳ �  c���u�{yvr�}}���E��Ѳ�9��;������'�T0S�~�7���Ύ��c6� �@Z��ց~~Uv;�n�qis_!o��)��鄨�&'���¸�<@r0�d)��HA�rD�B�X�$�/#>e�������k��he4��Wa�2AZ'�ɵ����לW�*��7�C]���i}Me�m�$S2qJ�R[4V��Nu�e��Q�Ç��".�j0�X�Dk�3��2%�p��+Y�m~@��K��%�R2�U��Ԓ3���/���Y��8Q�R%f�/���	-�����S ���s�)�'&R�!��-���U1��?-�]Kt��p��lv�Y���D�Ze�`=�y7��%r��c��XTV iQ
��!��6�e�Dj�P�%�P���Z3�ie�PVf��I��:��P�`��*����JE��t{5iU�c�4�8��	��F2J����S�E��j�啗_&����"N`J�[,�2V�ϒ�议s_J��}�Ӯq�����I�HY�Q�ɥ��:��l��/���O�pB�s��R��q�����Oe�E��H��sd(�ѵ�4"K�f�t� x 3Q[d0�5d�#���u�P�b�PS7��VVӉ����:8�e�Zk�n���J+�^��v�ic���p�6�E�,���݆�7� �\���u��\}0�ڝA����?}���[Jh����9+qx��p���d>oZ��L�At�̓��/N��4�k0ͮ�z�f�� ٳlOo�$r����z�\CDH�h��q�*����Ps�<��7�?fW��z�7� (�|� ���hs����,>5-�2��lq�~e�l��^j�ް�X�y5�N����y�\&ۏ�{�AZ֜_h��c�J�+��+����םb��Ď"(�KlZhʲV�)���cZ�-d�
�+\,� �PK7��xo0��__���t���حnk$m蔚���:�f���N�ذ��:�f�=:8 P����@�ttH����Yu�m��h�!��20��s]!��W�d��/��mb���+��w���A��.��	����$���Q�@@;��3����i_ϧ. ��C{Tu�X>v4 �d#	h��t�]��>�c_	::����:(��f[(�욋Nv��[������S����Uh_�      i   .   x�+�OJ�OM�,�/�44200046����00(��4�\1z\\\ ��
�      X   �	  x��[�n��v����]�%˱����,Т��6(
Z����R����>C�z;/�C��(��l�vҁ1�%J������!U�5�h�J.fؓ��p���?yɣ�g������^����1E��Ѹ�(�d4�(���(�H__7,c	/�ꋽV���p�M����jG�"ų���QA�""x�
����UB$�p<!���p�W�y���D.vUJ;�j~���7D7�_�*��Z��(�^�+�l��.p;�*�>��B�?u�p<</�2��ռ=��/t�+��Ho�z�^o?|x���)x��")�.��=�NA��� ?)��VX{÷���e�*C1`G�
y���otCX+#�ӇAL�d��~����6z�� �,�ϢM�ɿ���k�K��Yf^�*}��wz�+'��x�v KF�i#q 7X��89}~ߣ��ւ�?�g�vn>���Ll�/p�s(9|#ɡ�[�4NI�꼎2�Iw��04 ���`�f'f��Kp(���;5yC-PVQ�.'a�{�BT� ��Z�6�S�cE/K`��-B�'=J�'S���o3M�FS�`m<R����]Fjj��d�2�,���=i��'G)�Q_%�G�ԑ��E�(rnss�r�4����ǆm O20���+�yhC	|e$����Тe�g��S8WK�T�x��[4J�j�ϐ\�I��<��	T�p8Lb`0��ꔖD>�B1��hJ��-�F�+���{!/����$A߳��&����Ҟ� �kh�N��H\]��3��Z����l��B�|�2���ѦRq"!�b�T=Zy���u ���)W+l�)��JK���4�ft�`�%0ZG]=L�S���6<�Dp�Y�=������77���u÷FD��D��%/�-͙�{�͐6��bY�$Oץ�ʲ��d�1cٰ4C��d��}�W_�D���(�MUD��=���Y��=�14�2����o��ZY%����a��Mg������	��	 "~VM�;�,��q��V�h]�84M%�0ڵН�W�j\�yT%������_-��D1������H��=�Y���>����N�=��p��@A�g��J��j����h):�N���Pg�ao]šAtg�_��q_0�d6��=]�`_W���n�ύ�e�G�
c����J�u:��-J閼���b�� `�� zI�*�'��`����������U�\n�7���x�@g��={Wo~	~ٓʮ?�C�`L�1�7?q��:鎰���)
�ّC�`�)��$�i0*ӸEj!Q�u@c#�,h�$��n��Թ��ZAp7H���ˇ��շ�f���O���},�u0!�j �lK���	�����0�6,O��"�܂���o��hz%E�q����f�'��w�e������#,�ay���[G�W�����_���>�:��3��CG/'��14~�
�����ny�?N�X��!$�Q<�C<�Z	��dG�n t�:�[�]"+/�5	i��OW����;��=M7�~*
���h�4���F7��E�!�WTYPE3D�]UZ{w�C�&6˰gE�"�,.����q��d]G�}O�d�]=��<b�j���(L����������[�4W7Z������uǬ��n�=�[x�	/m{�5�{{��ZO_x�5��@s]�헭��y)W�k��-ڶ	��ra�0ܗ�#v��E4y��6�0��iL�E,�Q� )�Q����|s= �SS`��S{ȁ�����E��=$S�/�-H�d�K ���s�N�o�����VT9�H���4�u����ҎY�=f-Y.�����$�зnk�	�r��ɽ)z�5v�8T����_/H�}�Rʐb;�s s�I;�;Q����T�uʁ�J�}�ga�wc�߁!(l�/j�Vc>-��(E�_��{�@r�~�սo�൫r#2���i�?؆��BWQ�i��f��

��ߩE�qC]�-��z�О$7�U��?%b���2�9�Ԃ�ktFh쬆w~XCW�.��`G��~���ZwӸ<�gG�7��kd�g��P6λ��qö�~�|1.e����S��E���x�Vm}ƺ���s�q�7��F��o��Ź�p���U��g��}�u��f��.Sr���dq��a�o��Be1+��m�|�V��A���E�N>��ܓ����&P,~O`:��7��{�/��&�{���w�;��W�Fp�u��h�K�{��%���XL�xz8�7�b�(̵{-}]Ӑ/AIE\�2�U��G�*�`	_����RbR�-7w�]�@%����)�L���%�>E	�i�ԝ�+*w�STT뷙�ӗ��EVщ�~�զ�ۧ醯+C	x��kգV������'qdF�}�s� aJ	]�����O�[) 90��x��O �{��X��+�]����%�5��-��t��m�>h�%9(����>�R4����:��>7Ow777�t�!3      Z   �  x���Mo�0����L�)�ӎ;�4UB��RG��^���|�M��T!��y��jE#��(�1Ʊvw�@��:H�`�	�w6�N�;`�,31�@��b����W�����Z��
qV�8��F��'9�#�n���>X�YM'�����ƙ@幭$�`9�l�ȃ���{��{����dE����!*��Ƅ5m�5����������E��Qh#�i�
�cǽ���))b�J��|bb}Y�֗��`��t*(��������<E�K��	���̄���b��=&�!f��@�k%����|����
�Lh/��
�|�=)1��� �/>��$2y��WR{X����x���vT�ܝ"P߭��~�N�I��"uFj�7��÷����[�e���o�      ]   �   x�}�A
1��uzi����E�Q*�Q�?6�pռm>����s�o�x�c�����Fb�8B�pC�ʚAybX2*�
�D�����RQi�4TVT:r^�J��Pö��ԲR&��7�a˰u-˛�4�沼��a˰u�^RJ?�C�M      x   �  x���kr� ��)z�N��.�d�A%-%?z��65c�YS2���Ϗ]�֔�P���#@��	B��0���/%@ �38E�,�:@�,Œ�(2��kS~*k^_��|����C�-:��J�S1�.��ww�G{��a�9���l7��[-��+�FΕWM�^4�8�-	j˂���ς��kmM�����[�&@Ƙ�!�sF9f�g 8,Ga<��i�蔹҆���T�O	��Z�D�U�G4A�{�	��Qu�Ti�ץXzt8
���ܟe�MO�0�����������7F�ꎺQ=�\�ǋ�x>y@6��'��z�-����zb��E��U�f����>2w1��a1
T��^'���-�����w9yߞf�@N��!�uf���L�$�X��[5������rE�#Q!���I��l�u�������RF�]E?p;3�      z   D  x��Ykr�8���"���?{�=�TQ
VR�b��H��~[a,�l ��\)W$������J߼�\ʾi	����/#?�&���uҿ�S�ty��}�T��r��o���Zu4��C_�3x�]p.�rӈ?!3�e0�4�Irl���yW�^�"<�w�_K�GY�.�yB�p�Y󄦷5OX:	ϼ�"�A����mN9l(�Y{���_D$���5�7l�Y2��	@����P;1�������a"��L[ � ����"��Ͼ�����O�>�(A���\����Aa3�Uh�"�|�}e˵ �sA�ƐA�/(��UU����1�G'�qG̴�� �� c�\n���y���l�3V��9۳��4����M0Ԯ�02��O(s�8]$f1�C۬h���� ���ES�ڍgD��!&��@nT޻	���m�7��PF�s��d4.8'#^2��;��	hbڐ��S^�D�������79[��2f~=Db�-\����UuM�v_��!!pXeS�P�1�,���ʢ���o}�6asx�vo(�9I��t�c8�.��� g���*�p,Y��RN�Tմ�ˇ�,��K>�0���1y��߽n빟���"�ӛ+�_��:�Kv9��c�wqۓ�ˡ �X+ydbz�K���")�I<"�D �>�6�p��t��<�c���兑 _}�.���l�u )~֘`����*������	v�:cS�i�<�_�C`L�����2/�^@J�RBċ�|�O(��N4��o�/�M�ǲ� z{�A����8; w��,;��{�n	�6�ͫ�*hP,6��t�c�T��k��V*��ÿ�Ax�ԏ���cHH�[�w4i��s| k�|��)�[	�y9��R������oBB3��K�I������\ 7�)��Y ����̛1���Y����t�))*L�,����i�Lq������������Ww�̋�R�gN�Q��4+]�Ba�T}YU�H�Ʈ�2����A�N�_%�2�!!�Y4��-�dF
<4��+��Sd�^�I/% �>��|V��;裋��ݎ�������e��ձ�tM�f���؞��0&��c����
��T[6�%��<.�e)t1DSגc�U2K�Yr~:�T۾=n��\���O(*�t���>Yr��q��
᫊Bw�ҳ\���F��l��8��۲��5�L��ș�W�L�QJ���he�@P7��E	L |�-B�
�fte��y���!�Z��������C�	Fl@w�!	���d�BM1�F�-v��W`ɽX�
�R_sx{=�%��/6c��_�������Բ      r      x������ � �      n   �  x���钛8�{&����R	!eILf��+Nk0��̔���I}���)%<F���Ap��O����?<�5� ���0Y%��}�b��E�����uo�U�m�tRSE��a���A�;��Do%��`�Qr'~�^�];yHU6U��1d��[B�s�� �<i��D�\h�'M��As {k�w��,2Nd�eBV���FC��E��p����CoK]�p�IΫs����l\���.�lx���^u�����������2g����^q.�u�GS��)6h0�9��XN�,<��}��zm�g29Jz�f_/�jHS�U��U���h����mj��ڔ%�Q�*��N�V��5�2�J@.z#�KCJ��cТ����X����uLC]S��J�����@��Q�w��� nt@}���|���T��+�%m�m#PqTڋ��ϥ�%�!�B���� y�Sc�l���i��.7�������R�c(~��q&�!mtӭ6WM-	e�e��!d�V��4~h������ F����hV���%*7���U)4�o8��B��D�w��Y�6:G/I��ϰK�?����c��J���%����^"%>�8�hp2}4�J�`��-�JLMsa;:#jT��"(av	ᯜ
�A�PP!���#�S��8
TfYA5�I�_!o�D�]z����LV�)%m���	�vV&B� l�3Q�J�`S1�%9��F�<�-GM�l�g2�᧷e�Y|�us�Z�2�#}`	�'�]���]X]�?<ݓN`��.�ӑ�q}%6�Ծfci#��脟3�e
ۯR���t ����l���Ʋ���;_�$��n'����&&�{�Ҙ�ć(F
7�ixzHq�?����Wg���aL8�5����q.c�k���2�+@��~������8ќ�v�#`T�t4˭�DY\�i9~;�_�u��R��ι(����Zom{����E�2^�D&��W/Y�]W8_ׁ�d������VY�Q}���Qt���0�]:E���8�ߪ�dyj���3o�������x��n}x�	��LJJ����\��/��A��6��5�"�7�4����_�:���W9viN�G�	�ݧ��>�dF� Yc�OsLX��#/��>��s��&YS�]�8{�lrK�pE�ϗV��+�~dE·��������JPH��%��S�We����K���+��''1��jc���pG���۫��IP���۾-�[t{bF�Q��{�p��.]d4�ďk�:E���?*��(L�#{�9��Aa�x?���4 .����{~~���M�T�yX��=�~��j���{y���{�n���cN�� �(����
��wr�t6����4�ag�Y9<wNo$���v*�����gE> �s\��q�w\���pR��^����Spyx��K]�N��X^Se�,���'n<������?>�x      p      x���K�亍�����1{�H���o��&����Pe���'3�GR��ϯ�/QE�jOx��*~ E�$��2~tm�qb��/M��������u��c	cI���~����e�){-c{��4��^�l�n�|���u��^�-xŗC�Vp�b��-�l�^��=z@Y��,cE����G��;>�_�!~H.q��I��l�������MTs��B�Yds5��7W�������X�뽛{�%�MU��.��5�ʎkL�D����޳���x߻it�{�U��6��������
V�'Xc���������:���,Y�����᥶X����`��y��p�o
�H�h�(m�W���^����v��/�x��@��X���L�+�X�m��QP�Z1 W:S���;��Pn*�i�_x�R���0w?�Vr�M�+Wj�#��4w���{�����>�}�c�h՜4�у��\$�ˉ���ɺ� ��+k�K?=;�lF��cj��b4%fl	���<<��X��[L��������6�uu�N��F,LW��b�h������@�ϔe|��٭����e�ҚMoްk7}u�m�$a�$���}_����+��~z$.���O��)�|�_W��|6���(jb��8��SCQ��f(z���졨� ���x��q+T�~n�����`M�����ÝOp�:磛Z�p�J������B&�.���w�7W�a��~�)}���X:��B	���{�N<L��=�-�0(�f�(���~�$MY��5y�S����%�2��R�b���B��4	�V��~�����[��6f��r��c�!J��c'�\�b���-W��gwn�&D�S�غ��&Ş���8�}_�dܔ�V{����#F�b����ю����j����Ga���-�8��Mg�
g���I�vV�~~�KGS�5&�j��+��nt���S�yQq)�-|�բ:�Y�DfH�^�+��������u��R�`_�E�WxМ��>ZB����l�u�k��Õ>ڕ��л��������>p�Ҡ��yX�)Xz�����d+#b�Uҭ���W��Vh�A#~F6"�J�y��4a`F��Uo��L�T~|.�����D��ȼ���s�X|�6�X{n�� �v\��%��i>��3~܇/h9eZ���Y�Z8k�5E�©��X8ݫ e�S�*�r�7@Y\�����z��(ة/�����w����鹙�)7'�m~���J���,a�o�Z9C�J�HO�Gv)d��7��U�=�m�^�������5c����6hP�rmD.Z@za'V�e�g'����/(+J�W�i��xV9�N����5���#a/�L2;�흆�?\����r���b�*9������"f���E��tf��
��_��`Y��`j�HT7k#�����{՘�%��s�`�6F�3��{O�%�"C�'�c%S9��}�+�)�+�#���D#f�.�^bj'�G.b��J
��=J�P�h͜V4���2��t�V�����w��N�k|�aٲL� �Jps�����p&a�#?ЊxUu.a�螔s��-$+�����˽���RW{)g�:Wft�����U�&a�F��5�F�������_����=ǘw��|t�8�P���^�?�}?�[G��h%Щ{~��::���W\�0�|ﯿ�Cu��ytN�7�֙�s��	seVӞ8��&���������0�'�eX��#ە�7<�W_H���ņg��K�G����5�g�8�a+ȹ���즨��ˤ[����@��햯v��>�0JR��u�k,�I�M�*[���Q�xDlIy�\����{���E����]����Hp	�f�&w�s����m3���2��n�!+Y*rksx���ў9H9��M�����ڴ���M"\���>�O���ܟ:��ݠU"�4y�w������.W�)��65�2@`c۷�n���&�7"��TE~�_S�9\�vƫ�ܒBi������z�{V�nw%+��cej���+D�E��m�:�X�E"��.[�v?G�J|=%)u�h�����!)N�`7�p)�1�ڋ���Br���W:L �������\�2a��e�a޾&Ghp�(����h�;�O���o�n�<.�+�9�쎀<//�D�\.�*/��]b.Z�A��1��j�I-`��ZWM��"�9���3��������i�Iv|���L��{��-GN"l��ǻs�4�M�ܱ�K�&����W<�h�+A���ŏ��aX�w�t���k�^�`�f�n���=��P!��Rܻ��>�Cv�k��>Q�l�9��J͐r"�')+u#Sf{"U5X:�y��m{N.V���-��9:��s��\vRB�N�<އ+h�V��6	�͹��̀��w�A"���~��Q�C�q�����
���k���0�M�h���+r�d�f�L��q���c\�g?��OY^�@��'��9����Uy/Z���Ͼ��h�E�P�g�3��$&�L����Gh^�S,�Q��~�s�%�蔋�(���$9 R������(_�@��*	�`]��/~����צ�r��x���;)���5�౴�������6���P���k4 @�#�8� x��c�����f����ɺ����g����Lc�7� �7-��2^)�G����9�x��M�����sg"��b�ЯI=��gk�Uo��6�Z��Z]L� 2js7S�O(�����U�n�D���M�&��
U14N8�a׮����࿹˖�59�
�bQ3��R� �-!.�l�;^��Cp�bj��賻�2�B��
�	�	� {Wٷ�� .D� cãC���_��<Z!����\��}�a�"f�@����T>�ޱ|�Y%1�{�bшLWȣ�O⪒{qb܁���u���K�RɃ�\c��0c�
VWQ> j3�D`�B�&~d�ُ�v��G��tr�L� �^	3yǆ����9L��2h\n���`(^��@���Wx�E�bh� ���7꫉�%��ma\7z�V��m��|�J�!�����)�/��$�S1M�̑<��3���c<o�Q�����>�/dq��/3S�ZY��`5��c�@k������j��}�*��3󅩸&R�1����4m2R[�>�&
�l�9�/"�E�	�S��M�*Xcק�BH����;�<r���R�9?�D�/�B�S[ч���NĪ��b��S��t'5/Ͻ�qH�:|����u�2��AXtxyL�A�r0f�����Gw�m�(���n۳���XdH�7���k� 
&"�Z�Q10c��vx��v����c:��m$����1-��M���I���{��}��Ћ�7�
�)�`��<��ԷA	5�j��u��}FT,����I�Zg��J?@�
v��������� �.���p����>xr���g�J�������/�B�ńZ��N�`��nx�SW�|*˷�'�?��Ѕ�'�r�E�N���o6S�W�|���b~;�ӫ{��w�2.��o���#�<�ư�2tO��OR��E��tph�����aۻ�:*[-i�CH!�PC��喻QŪ�a�e�`N �Ǜ�YV����^�`�)���"K�1�x����-�'��7� �����n'`�[�=i�A"ez�&���u�s/�F	2���?�=!�
��J��3�7�<����ò��>�@FڑOa�J�n�'�5�����B )ag���#s3��j����.Έel��29�����+�ц/�%sl�}�uNUl��@�!��ن�EMA$[l}8ޅC�J�����<L �$lP�(`41�V$��=eq���v&����I���mQc�D����g��)�^l�����0�υ4".27�9��`�a��I�;����4s��0���;w�M��Q�E�������o��Z`��7R�fU	�UDŕp�<ЮC���.g`�z4>(�1\���M ��8��ش�de�'�ah�5�ùD    r<�[����pFfL�N���N����#��r�>[!��G+�dx�z�w���J8SKc�UށT�)�¹�-�U�l��������7RK�cx�cq�Ʋy�d�D9Y#S�M�Pq�=�����Қ�<a��4��N\K������H�e���+uq�6"୐G+R]k����N���+OZ.�N��S�cܛH!�VJ�OS�+�F���?�mfw/�j )�E�f��ĘF���Ps*��k����g�T��ds��[����ů�X8c2�_��j��lf�=D
��%$�P�F�I<�A�R t+��U:b" �c�2�F�)'��~/F��(�1��)���H'�iջ)��� x��{g��]�F��Ê��w�析�[0%ݕ�ūw0��ٚ5�P�����V���:&����5D&�L���T�Q��DS��(�{��D�.�>8A�`T�;�F��i����1�~V���j��}x��%X�2�z�u䯵,xά�y��+;��Ncv���
�A��˾���`i0�t�Ubu͎#WZ].
���0E���2U,���ZcfQ�
�!Ru����ۏ{�O��KK�����Q{P,�����VN���8�o��8�����E��F	�J ���ΰo鎈S89�`"��p!x�#D�f���L>����Sq��u<O�?�5���N1k�Ӎ�:)�y�ש�C���{z�yv�5+���b�q��d�T��W����"�h���\A>[��˘�rN�3�ZU����1� .q�!�_S�߈�	�L	�cM�[����?s\����I�(���?@ދ��A����I]̄asD$�b�#�\��D^��G�����I�ƊL.����~KdH��ϒJ��t��GM2gjHj͹+3$.��~�!��;�vV�o��hM�3hR{�>H�E�u�L�V���G�R�4���10�m.Cb��.�!������w��ݜvCj�2w"uӭ9�8q�V���̉��:}���X#Q�5��r���b�fwX�y�*�s&`��u�h֙��^W�U�<q������3���@��+��7���V���D�v�$j~�8�Y��G?Ƹ͎�Ŕ�Ju�i2�$�[��L�v&�Z��A�N���;�x�N�I��}�N"y�|�H7jz��&��@�P����o%�L��7��Ӣ
��]�Q��PÞs|�b��v"!= ���?(����g��0Rvӳ�+:K/�ľ�E8�"bFy��e��
��F4�Fwr��5�o���	%��2�o�+y��(!Yt���\��gx]��f����9E�"`�y.C�죦jy~����!NT�ע���� 4$�^�0M���ŝ;��a4"fŉt�s�41�~�<԰\}�ڮ�=���t��3E�8U��s]ϭg�U�R��&Vl_�&M���']���%6)���W������O�O��;ķ�g��`����<߉ �o^������I���7QQs��Z��0�n6	�f��
�p/��i�l�euv2�7<u=|{�H� ��i��=��6L���@
��l���]t��P)*�щ�w�Pu�8O&+�xC�V����T����uȩ�d���u�ZR�1�M»�-�m��`y��`\Sy�q�>�<橺�E�:+
U°����R�'��й�c�# iYF�As�R����8I+�
��z5���Y���q��Y�Q���˧��&^<�2��BqC��u�x�K�G��yٽP	z���e:��|{�O`Ε��x���V���5:A��]�Z ?ʢz��̳�L��o��A���w:yHa�0�z�����B�����M�k �
�i˥���Чj?7��/�b�&/��1����ɶZ�dXn��)$Ԗ�}�E�i�׫��b'R�],��A.a�q�����ʧ�*�Q�KdL}x{c���m�[�������p���kw��G��W�1%$�^D6`���$�oA΂
42�	���F��5��0n��j8�[i�����M�k,BBct$_wݪ3���N��� �G�`D�E�e��E6MJ���c�t�ԧL*�6���Gj��e�����EI)<�Dj�/ߜ#���d8�#����8�ǀ�M��S��
kO��(XZ�"2XY;#2XcX�2,����M���z>B�8�@"q��k!8�0�0�?������c\�'D$?7�8[���C��7�TNgǝQ4��Ĉ@����r����|�v�`[M�� Fp)�n�"�{�D���S���`QN��@S+�/������ѱ�\hu��6߳��#·t���%�nx:�F��:�U	���X&�S//h���:tEq������o�����.����?�	�[�#�[�M����O�*h'i^���9>1�Xk����v]�Y���`�<�
(L�|��Cs�Řsh�CLl��]c�,)"�,FB�$؟�	8��oA��ph�z9���Hvdt�07=qV��;Ua
�(�: ЇZU�l���#7��p�=j_?o�&��,&��kv�t���1��D�i�_;�S��qݽ���O����`Ӛp�m�9��G������p���9�d6��^�S��
W��T*��i��,�	�P��/��z}���;���=k��n=fM]p�����7�����Z�ְ��_v,7�gi����u�'��e�s���:��>q�K���X�����\����>���a�S�0Ҵ ���]0C@�d�Q��ʈ�E1ʇ8�K���N�x+xEb����C.m����Hg2 T~������z�5��B^㶙+k�2Ee�(c�
P
yND�"L�!J���3�K��H��h��>��O4wX������ s2g:��T�.�c���}� G�/9n��Bu�S�c񪁭��;�z�jJ��<T��h��5�0lSi9�+嶜aZ��!<�3}^�yg1��{�V�ڑ2I�g)�i';��c��ȳ��ؼ�D�1$kN1���!��Js��[�"�)yX5PJ������oɁ���q7G͜(UTP�/y��'�׌�WDx97fDttD?j<]qbƑ��Vv{S0 �o�\/�[�嶔���9���8F�m��\�#�0Wn���i�� �aӈ���ȏ݀�W;Z�'�x�}���TT��ȕ��+�2���0�T��?wj9O�s,�$����N��9�޺�>���\�B��������Pڧ����kdO�<�I���T5�@c�|L���5������<����l��b4w7ǅ����YT8(o}�9���].J�`��ϕ���ʲ��5�3~k�Ou_���Y�oV��_Ѱ��^9�4$]�jdl�(�����䉟����`��[K�����f�.�k�:��\Tb߅ډ��^������w��^?	����X�1�2�Z���CA)悭#�i�h�,��cJ��"�J�]g�����<��yζ[ǻKS�]Q�T�LJ$��,��s�u
�g7�7c{�0��!65knq�Έ"J�ёX޶�C��8�PC������Rz:<��Nc�п3M�c!{3Dd�����^&?��5��lUYS�Y���[� �p�:� ����0ۏy\��
�d�Y̾mK�����yŜ+de�[H��lz�$�h��:�'*04�4�*�n�sZ�<IR�����(�
�q��S89Ze�%8D����EYx�9�#��ä�N��Y�4�!
�담}�{ԋ���C���Kt�7�\�B���������d.s��G�H(_���V%�=��$T��*M(x8%�jw�çg���>T�ݩ�,޸/}���te�lF{lS�Yn��z'�ئ����I<�g��Q��֜��q��=���+L���y�YsbpA��]�I�X���o����?|�׷����^u�Y9R[h�*����׼{�~L^n8X��Wev�KF�j/#;Z�Չ��p�N6��$�[�l��C��R�f���S���6_o����S[���Y�#Fbf�6.GE�����Qb2y�-p\�����Y�w�<
g�q]��7�:�:]�;e6w�{w�_��,���a+�GjO��٩d �*}"�l�=9졕�ㄗ���� p
  �W��m>`��5Q?�����*�w4Y[_���d?���5C��*>�|�)�`ͥ��2F>g�����Q��i����Ö�g�b�j�(
[�H��:�(>�o�r¡4{���We��1�
J)`���l�D�U����B�wY=�"�B�%Zl����;M�3�df=���v`ꟑkn;�N�g?��<��wxK&��S����x���r{���0��^���
�y�r�w��ɰ:����}9 �+���8�[��!>̹6�Ό9^h��|��LdI��X���]E��~�s��J	�7
�CK�#�)�Ã���l�c5�u�A��4�����( ����&��#Yy_M$a���-RWGj?��|pV�����U�@Ŷ�,�=WZ�K+�sɔ��T_���d#��)a09c>��U`��/⊁}�[l��6�R_�>&J}�� 2pǩ������bf(�K/��P6��H>FR��bYX�2~�l!����H�/-�O0���4��xS@�pu����0I��7�����M���k�'���Uq�BF�����І�"�+)��_H�Q���e���Ӽ�	y�G1񂟷��j�-6r���e��l���ZyM�ܟk:���ڧ:���ۆn9J��l��A+�}�+T�fT�{��ҍ}��B)�Fߨ'A	3��˸��__N��y�=~���*씮��2V���T�_9Q���٪\��wj�+�����p�7����ʕ�m"?�!��M�)�g��Sj�{ ���a�-ռ���'��4����9�]�Aೳ���Z[F��A^���R�5��l�9� X2RǊ�� P�}X���*9^C��%ů�sA��:�����`��6i޲�&4�;X�2��P��*��I�ܤy�1G�R�LH��sF��F-I��I���㡔��;VP�y�q������ew�(c�$�{�1�R����-J�}y�P�#=��W��p����'-�<F�g���Jw����9~AR㸤k��D��8Lt�q!�S
���2��������C��#:���3E�ɷY�2L�H�|y'Ϋ0쩏,��x�.���M���3<�����>����3A�����PL�L2uN���Y�D��z�2T
�ù[�=vC��r��sL��C9��\���Ez����5�g�:)�8#K���d	;'�0s����&vRX}�_�^H�V! ;ڹV��ӝ���]��&R��̗X)FP~�,FH��v��Jw��sªm��3OY�R����rK�V��:�.���J
c���7-5d�O�<�8�3M�c��	�_%݄�Sx/P��"g��wΉ�H��=nc-�QU��ˠie�["�UB�÷n�]�gj�_�ٯ���B�X��\HZ!0�|�0���a��a��
B;�#_m4�K�;����^�z
¹�|-̛P��ҦiX�$������a��?��bϫ��!�����V�g]������|�.����� ?� s�E�v�e���#Ȝ=���a���)���� �=�%꯿ ��4CMNpV6�ķ-���Q��v�U�UAza�Z���R�'�CϠ�o�Cu���F��)��HEf����R�ҫ$Z�xN�8Z����M.e"'��g1j�˛_���_7ߜ�/��,|�Κr�i)=�Tl4i����x�T,L��
�|���ؓ�v��V���F!B5��+k�>1���n�aq��3_�VG����5L{k����'� �#��h�����Nr'&c�i4���Q9���C'��J�,��;���[Ys��]���?B�+٘�(k7r�I&�� ˋm��'ҿ!����������nZ�P�C�\Y����ܯ�����Y�VѣJ�O�m�w����@�1���"���8	�����@ya�����W�'-�d?�dc�_��2�~7�|TU����OG���� &��ٹ��T)�����_?�K���KY7�n�r���8��th�-INc��}P��P�ta@B�
��֝���iY���2�Q�k���<,҆�uV�����gX���֦��~��<H��E��f�V6��V��R酵n�!$	���ċ��m�FyHp͜^r۰�?磠�e���^��1�G��Qo�`$)���o�����뮮<����@o��W���ȼv�1��`�6u��S�$�b�]�3M���B�x��<x��"�֌���Њ�<������qA��f=�V��z�wqaVK91�ay�'�-�#DTM����6���-�)�Z;�G���n��֭��������s��DA�4s�5�5���V�#C�EzZQ�k�{�ЄU�&�	a��4=#0��Cc�ʷ�m��߶�2�dW�S]bvG�I=/�(*���T��[���/�󛿱{`[�S��,g竏�QH4Q�ؗx%[��vY��+�Æ�!��T��/�Ǯ�_��,�	�/^U��b�(�<�t���"%&�$�M�7�3�?��X]�S	?�5���>!r(&�޾07y�󶌳���=���^_��8CB�D�oUo�8���}�U��j���mW�����x%��Y�r)��˽h1����6{��m�0^��&�m��۱ܤ��ײK�u�D�K'��Uo
llO����_�̻	R      t   �  x���Mo�0���_��joY�f�*�(ݪ�6��J� Y^{H\��ڦ��6��%l�C����;��<��=Z�6IJ2�F��sm
�
j0
�Ԃ��Z�!�H�
J\G�������I~_��&��G��-I_]6M/�d�R��)�,K�s�wq?�C����8(Az�C^Z
��榰XQQ�o������F(��_�`!�{j�B&����g��W7��%�����|��տ�Y��S��~�}�]��GG���ܼ����M�(�ňov���&"�;a�G�JG�1�~�
��V���>����s!��g����>���as��e�a�<������γM�1X��l��ɸh=Ж&���v�\F�r�v�N���*-��JAڕ+�pk�Bj4��U]�[�3��oT�+�bF��6�V�#)�fd3VhV�Q��٦F.��C�Fp^�5�z���?y9�雄�����.�aW���l�X�L��p      u   �   x���M��0���a�%Ƕ|�����fiz�qh�,A�2�{���}�M���������{����Pd߁�@@1w5� �F#U
�e��e�pi� ��b��N ����z�zEM��5�o����\Z?9}-�b�h�����)�|U���7�go�3���v�Ϳ�6�ݗ	0��0�M�A�"K����ݽ��i[�'r�y!���h�V�G�#�$V�*�6⾍���~.�0��1A      w   �   x�}��
�0E�'�"���!M��N�R��mQ+��yι�F���E� J^@	��Gt���'��^(�8d
�hf�A,���0R��ҶV �ِ��u0��l�A~P�6L��h#���a$��3�f���w@�FA��?@_}�Hks_V��뉿���nԽ����{_      2      x������ � �      0      x��]k��8���>̆�&/�?��P٪l�8�9~T��� A�"-������	 H?o?��t�<o��V������������?��WHq����|{��rH<2XN�//�:���x���x��[����9^�-�9|���s򥧔�5��>]����Յ3ތ���-��v�<���3�sw�^���o5&+�Î2Ġx߄�o@�Zƞf��UJ����R(>��y��<(@5����oh��i����@��lЇ0
��C��Q��#������_�����6X>3�].|?M_�s���*=;<��t�N>���~�1�C,5���)�]�d���9��sT�g�,���6])5�1�¼0�mP�Aͨ��s��q0s���&Ey�����H��L��(�a@�s����܉��;5�v	�l!�;�|ޮ�M��P�p�W�23�P���|ߎ~z�I:�������z%�\e��a��-�䦂)���>�-���Ű�O����.�p��#�̏~�U� ,͈�_*W5}y�8Of�"��ֱg5Oh{�?n�>�W@�f�}z<�m�J-�|�P�/��y��?�+��;B(u 5�a3(�U���-�_�(c��T?h�k}�ĉ=U�3(��#��
���a���K�T܈23��e�t9R���s36�)u�Rٌ_x�~Wm'+�>�4��_P~?����_�6�9Q��5y��34|�T˶�*F�a��ҭg�D�l�m���?������L��.b��~���k�ga�0���ln"|�)|�?^?N�ΐ�a&J���F/X� �Ɵw8F��n�g_�⼎?^>�����Sb��@P|�-"���w���~{Rp� �ۓ0��q���_a���Ƭ��cr���.z��6!����	r�E��,@��+9�¹յ���G]�C�Ch�B$ ��t��>����vn�d�Dm�I%1b@�zI�.��Y�����3�^��]>��JP�A���r�@����(Y��WUԯD@�@�o*E"����j!3s��&��`C�kR�H���M��$�2�����9����D�F:$V~,v��X"k��w|/Ő�HKi#�o��RǑ�,d��H��4 �2C�J�!@_�*T�\ Gw3�%��`������k���j|��3!l�xb��I�:I��
8���,+���\b�hz@Z0��KzP�t���-��%c�x�©nVXd��Q��lKH�����&�����1���"Iz��p���Э��H,�%-��%��DE�"&���'�y�HP������b�ߒ�"�,L~�se����ގ%)�;���͏����r�n'�I���6Ʌ��ر	F������κkt�,٩0~E�(�WHʖ�L�t��$)J͛N9��$8J�;>�8+Dg�$���\
�ʯ>ݖ��b�����������W7j���G�;�7o���΁���x����p��Fnqa�t<m;q�p0 ��㏎gA�XL���~�5u

�z����A�(}ӏAxƥ�bp)��p�`�]F3h[0G�t�%^�����=/p���X���@��T�lu�m�j���@�e�4T�T��E[����0,b@��
�܈��x}�_v������N�(P�����k�}�==b��=7 �ۆA�������Q(�
B�0kH�#y��(���I*���@k�1P�Ƙ�5������ 5�5֎%�56�����������^4;gF/���2�hF�=ES	F/H
�<a�@�Gj�W�6�=ɀ]���^�7�i��o`3�}��/7�]��D�8\H�(˃����@�0���!�g�Gr����BdF)�����^��#�P6���>�&5�Fj�rFqD@c[�X�����p���:�S�e0�#�7n�����6������:]�mC_H�<��t��+�̄0�)�Jvi؟ ���3�bJ)׵�h.ۡ��@/��{��ӟޘ��Q����X됞2f�����:�#"$WqR�t�'��ƙLΈE���n!�n%%��8��ɮG;��,l��jZԽa�1Ҵ�\:�p� ����\�O�u���q`�8P������1���F����quw�l?G�R�%Z�x�@ͭ�I
ב��Q'��qb�l'jv-3�D+rZ.�x�K��,��c��l?r)��w�,H�-P�X��Y����e�嚖a�b�&�)���'�j.9r�5���p���,U���Y���SS.�TYJ��2�޺��KB/s�:��5�Ļzރ�!OD��y'+8��{�9��q�
�|N_� �yU�z�~`h,^\��zL�__�����Ƕ@��!�(��(�R�L޷P��!�����=9X�N�O�8%t����S��PU�S6�qV;er���)��Є�)К{r	@iH[BΫ�Є����8��&�4q�F�Z)(A��/QHo0�����qC��P�u��G�˥�n�x5�@hx�Oo2�=L����X$bV�c|^�W?�ϗ����d²
{��YFc���$�$>(;b 	@��&� �4g�d	:��3��t�I�EXBX�ÙJ0��������Mʴ1��,`���4ԏ�����v�:�IHL�C����+^'��!έN1Z̇ c��F�`�Fr��
l�O�e�����R*���,
������NI�Fa�/�N���3��� ��i�9=o�C�`r&����I6嚨9�?���!����8$C)���y$�3�%"��4P]2҆���1bXJ'��-�9ٛ��l��ړ"}���rm�-��$�aa�ڧ��FNPML�˛���5� ��30���?u�#f�����31<u?�Si��b��0��2�b�<�]�����R��?��E8h���Ҏ�J�r�&�S����&t�ܵ��xS�w�ا�p��L�t~	�Hf95MR#f\���덴I�ŶM�-�T2�]6�q0y�b�>~���{���z/.8x���7L�j�ؒ��J�p@.��j.�oY��hQ%ֲax��i2�F�\��!,��u�H(Q��!:ȇ-��@~M��,��|^4���R�ꝰ��NGMae�!p�����A;t���E�w�(>��.ѡxr-�R�l���*�kzF��Z+����"I^��m	�[v�����e3(�WK�lW�`��Z�
���"SVg��-�ʌ��q,���wӡ���`CJ�#0��c,�,Nh�L_����b��ߨ�!��1��^�d<�C������}0�|~�y�u;�NE[�*8�$��P�jK8�Ԛ�t�i��a���nL,�U��M��-Oq+M<˫��cr�H��n>���Ym�3
�8�X�0�@�)���g�^K9�Wgs�ߵC�]&Rn�#%���⸒�����J����!��S�2�J�a��J�7�0��ch�څ��"엊:�~m��kS��"T��$RҰՅ�f��&W�.Qs�K�1�X�%Q#)���!yP�"�|a+���țP�8uk�����i�0O�z��D��u�3SJ�M����q���x��d �#����n�X�\fZ���U3�0 �����-�yX̧�E�����W΁��DA&ӿ7��;�E����+��*ʪh`gI)���Z]��z�q���W'f ym�q�'JxE�3�L=�^�A�M�����` ��C�caX��,ː�ʾQ�hS=���յ6&��_�
h9��b����g��b���P���\���)K�m�`�"�-͜�Y넋{�+���ˡ�����䒕ĭ^kp&�^��9�b��K ����gOC�a�S���@:~�kWD��;�5x�S=�e���C��򂡘1�aW�A�h�Oڴ���*f��sa�ߧ��=���t��o�a[z%6�r�0��t_�*j���	?|���^;�ҲP�pb�q[ۖ�Yh='{1[m5����t]cHKiZx��$��)^������5�<0�{#Q��
l���)?m�7�$�ħBc�۰��Q�16�2��[��t^I�f�6D��>���7HԲ �  ,]~��vng��ح̋�fl�e$J5[���)��w/����*� ���I�]����	K�/M是N��(x��H۳a�H|D�G�|���Mc#+6�s~^/����jX��n�����z�Eņ��ǆp4�tK�c���Ӈ�I/QQk��j�!U�
�	�� 0�>�{�U6҈�"�a�����������I��d7��[x�|�����g9c&]!�N?�t����8�LQ5_*�� �)��N㈂�d���t��4�I"gU_\��'(q��@�r� ?�Ϯ�	2 �6�p
�N���u� X0�-����3jV4h��阒��Ǖ���
C
��������\��i�zG�4�x�uaKXeڱ�J���Mr_+��H���{F0��m_��V�pB�d3�U}=���gܱo�p���DN��o:q�ѲFwekk2z(�?_��̅� �U�����υ��=fp%o��g��El	~��뎘�
{�췺�6W��a@�t�A��G>~�.�����Nf�Vn��2�������B�x&c���
��T�L���b��:� .q�=Mu�����𾀨�<��(c#�ϻ�(���<8�����~o�lX��F���D�^���t�[�c]�HB�:z�������%JeS���a��_݀�f ��h����oR�wWeؒ�{���6A���AX^�N���`�����k���@���p|�y9�p6B�edAToޢ��	������x��T��@F���v��iI����	�ha�xYE�6қ���ɘ}�g3�<�y�^���l5���Y�H{i|k8�`�BaN����<�	�g���Mt�Y���Y��S��7��)�>�I��Z�a�y�a �q�O�l�l��$F>U!7O6t:��&ƛ��_��Id#6vE{<�����#7ܔk��z�NK�X�C��>MD4��X��yL�W�$1��L2��Y�A*�L�J��b�ޕ�ڕOB���!~Tx#�1�͈�@7�R����ဖEj@�y��,Xj;�Z�¾�u�[DX�0�����~ʆ��֜� ��jʡ�u]D�D6LT`BӡR��U4i���9~L_�RM)���FmG�8d���"M��ek�NZ4k�[Wմx��s����x-7Qs�L���(-�0��L^�+��x�%�
�fè0�8��7oo�a���G��q%}y"���dH�7 �"톷i�h���p�_�c˗."#�#f4�d��|��s����4=�ؐ�
�DD0g����듕�>c��@|V�[;��\��?�ԫ~�]�&[�M��>r�Hj붹�2d��'Zi1)`fJ��/�P��v�DY��Q��Rw`:��曾g��C�l��e)De!v+�TBt�l�KV��2և:�m��x{Ϯ1.#<�x���?V��rRj��t����2�4?��+;c!)�������3d���2B���eN�M﯄�(�?t�F�g2Nu�D)Q:�B�i_��0�t
��	b�ZA�P�� wxܮ����:p��(�w%u�GjoA���w+2V�C��FBdb��+!.CI�`� �>�$f�N��>�|l)C��M�l<X��41E��P��1��v��.����Q�X�Te��:M3�3����z�%�ŵǿI��5��h�� �˲�����V�79!��'�r泷5MS�Ek���j�Ӕ�)H�����>�¤|�� ����KD��
E�#7C���q�nk��-{5Z7��!M
���g<[����E����i�F��~Yj,��hْ	���ᶘ
N2�=�h�M�P�N!�Fj���l�df)crC~����1r��t#�<zِ/�H�!o���*,�VBA���m�j������s�)\������P��:�#��W"������ �D�H4>��lI�/��>��>4��5��N0@�;/�M��=eT��Ydq��,'o�i����9~/Ǣh�T�M�2��zs��v�E�Km�7]�)E�,�8zX�㙾��j}���/��~�j�;�U��D�l�;�NG�U��-���#y��!b|O��X���7<����}��rwjoz��A8~�~\�h�
�"D+c%,PAt	a�y�����V�0��¯8\v��a��_�* π���+z��r�+P;�m�5����tܨ���T*��P�5��X�1̊^d��č%(����z[Iq@��p�b������	��[�,�����?���jJ�{.v�ˊ����[a�W���\��z˅: KD��Y�=e����=���Yr�C<X���k�p��ldņ�A#RUȝz42�v�^K�i��B���-�U��������ڭ�[$������R{DkDau������V��ja�B>cx�kY!�֦�EZ�����j�R��<�V���+�[�HV�R�[4�0O\֢7-RT���%��Z��Dn%Z�hla�䯅�[���+�*��m�-:���,�-l��	��۩ρW��A������d�N�O�s����̠e **0���Z��2kUFr�]#���	)�Z��d)7%v���ρ�*�JbRK�\ۍj��Bn%��h8�P���x�o�n�!�g	'��p\e	T;G6�Xr�;��$ɒ�7��˒���� f�o{^S,����b��ӡ��g+⛪9]\�$Qs���=��Q�!�:�a�8]\g��:F�t=@�o�I	n{�/���$VwL ،���?|�n�s�9��W�T��T��Wb$)�"4���O�(˛��v�F��`!��0�?57�1�O5�!�6N0�������t��M�������p���Zc2�څS
������������x���k��Q/�����\�V�>�Mo׏�<���l�Հ�Dr��������y<O]�wJ�������L�0$�_]��f+=�Y��u8��L����sz<�}�L%^�B�Ve�����t�K�(uT����,��b�,��X�ox�l2��p^6�;k�����C����;=���͛yD��.��aɋoӌi��<���c��������h��t@��}��)�����+JR�IW"�%��Ě�+�&C�J�������t%0`���,������d����nV���[G\��@"�9YR�L�e	������ُ3      \      x��]K��6�>ÿ����{��÷���]���tu�^*���XU�H���z<�Os���\���ER$EI $��Y��@"��L U�&�<��a��,`��"���,�O�UUl�y�w�ЬX����ެ1<�������<���|=ˋ��]��0	�8��l��2��w���m�yY���y�aq<� �Ly�	�(��_O��6�mc�>�L�j��ʢ���Wo֞���h�٦e^ }���zj���T����� $�b	�l�-36���\n��鐜������t`A{u���?�3�ĬX>�eDaZ�5�}��Q��糌���(�m�8BU�.X�����-�M˔~Y�L�XӳG����v�JY�ߦ������R���d��/iR�O��_����=ge����<5G$�B��=��]ky=���: ]UI�m�|4�k�[�.��s�"�����ؘ	8�P%�[ �(����*��6�@,ީ��9���C��W6cʺ̞Y�|��N����B�HK�H[�.C�G�zM�K6�b%[4HD�G�`=u�B5�1� >��3��؜�DX��B�(�3�"�gL0K�V��j�%��d���)>)�~�*��>��E���{�r�z�L�)�%���{���}~g�!�5�� D�����nl��QQ��`
�#�>4`��S�c������T|�sr�r��U�l�f�ӭ���i
J�����O�j�f��m���C��1�f�N�Ix่Pw���1�:bc�zX59����!'N�m��՜z��V`hY�E=��{Y2���g��˔�����q��`|�츰��Ѣ��Q��K�J�J�鵻�ꟹ�p�"^ʈ)Sʦ����C<��|zm��g#��t�D�~�xI�H���u�X�zڄW�Q����s�-�	�����X�u��,-�lM����5�V��ܨW&[��y�SظQ}�����$j}{`B'N���a+p�Q�=4�ҵ���G𜖈4���h��PEcV=2܌�O��p��ꠍ���h_�սu
�@z,���;6�$`B�|�#xnG1 �=�BD&f�XqYK4�r�j��ƀ�&�>A9��E��[*��f�ͣ>}b#)�5��?��5��h�Ͷ�G�C]ր�/�5d�Z%��b����� E�)}�1#��;$��1�(��nq�v��HK�Z�j�&"`N�d��&��6����!�㭹^��Q�{n�v��6�B��D:+�Eش�!q������c�-ύX��`�|5~˿�ˋ�fb�遊\�Cc �-�Cf�rI�ڥ홆�
�-֋�y��9�g1���')`AA	�"�(�ߕ�!}�_G�K��uy��pxf�K�
�d�SE1U�@p��Á���3��a�8�/�q����!m�U]\U���3BD��'�r��
�/���;�/�5|Ϝ3}�#���O0��C�ŀT�M�]Ly�,�`��v塸g���.G:���� ���H�w��w���Sa��U�.� ÌN&��G5���%K[��`� ��c�-gvU���iBΨF'_�K���I�sMCW�5*.3j�����Y�0�����~��֜���O�ݥ��TnW%�3��,�|��q�Po������#��u�X�s��nT�*�Q��d� V�P�̳]ǘ�ҏ��!&Tfe*BA�d� E��%���_D��������j�k!Z���̡�˒�v����[U4N�P�Gp�,7�<vc��D� *F939�
t��,�!�����9
�����x��Hk���h�d���6+�@�1_��왝Q5��'2�� o.�EFW?��8�B�=f�,�ѩۧ�lNnOv���e��>�w�ۼ\����WY78��4Ɲ�Ⱦ?N�����������0�	z-J��_W�{�r��VV�U������zbJS���g�Z��nRk� �e��E1K����߉!�RӠ�5}J��%O0
��d�����:-�T$���9}b��U���!Z���������taZ!�UU�@1�¿���,��f����|�g��z�=M�����*�~�1���DM�Ӛap� #��9!Hv ͇��/t����è�-$�T�`�N 

���N q@7�7��"q��Ы%oF�����3UE��h��!4��ā���oG���T��`"��]m5H�Z�jc�!c�#�G�P�!�������B��k�S�źEX#���)�:�ir]�"Fͻ��Z����*�@�^����:�>fԮA����2�u�dB���"�*��	m��aC����3i<lH?�0��㣄T���=B2���:�ȥ��sA];�3fW�j9f��\Xѧr���h�Į�h�l�]�"�m�3�h7���r�E|��GP8W�M�0נz�ǵX��̵X�@&�+��+�Gpd��xXծ��XU���h�8�CD��{*ʨ�ҵ#S�8_�.��#b�����)����X��qM�
�kP���j�/���d�B���P�����ؼ�0������&3��S���#ʱ�N�wq2^��!O�Vy���}&D2��d�-S��r���|����	�I��N2/ёO�Ct����s�r&P|<�P�\�p�c$ ��>���{��k9�7�1���;9eFѰ�������(��;T?�X�j���P�c3w=�nG��Fn�V;�f�l
~���i�G}��P������ǿ���4/����L���Cv<A�>���X���4c�k���Nc?Bem,}�n,	6!�lh8�]�gF�ښo<����Wǅ7~�	s亻C!p�z����"M��gf �K8���O��|5��Fd�c�Pl~�|�����LIMaʑ�)��;"7�}���;w��Q�"uK���7��Sf*���c�Ov�c������@�Z�/qx���
�Ɇ����C��EQ&)���AɁ@�]���?/��&�5���[��mņ���h���v�����#"=!*����:[g�r�g>�^p|�6�w^�������q3+���)-7?8�{��6����"�A��_:\a�	5��]o�9��C��}kv��&�(9�7��!�ZX�)����
Fa`c�q�yע�C0@�\Q���J���;d(}�1L���u�I��,��9+����6Ώ�Hy��;�����(�n�E2O+Pq��o����`v7k���zz�O�t���m6�=h�	�Jݐ!���#|z�'���j٭(@������%9�L'�<JQ�z)�θ���=�9���A�l��Ϛ���zp4�DhS,�Y^m��0s�k��;u��4n\�!6�r���{��qxF5b
P��H�ٍ`���� z�۳�=���U���������Z��w1	*���?uOK�>>m���y5wwK黆|V,�]��x	n�����H#��l'������ �Zf|sv����P�)V�F��A��/F!C��GA����?�g0@�r|��;��-X��B�1�Q��S�i�{��	��W���q)*�����b����X���4j��X�������<�'ip��QR��߇C�|�s-�O���6�:�O|�s�t�B�	��p�m���v�|�g�.�:�88T�/f����8�I��x6"�g3/r��]ڴC�G�4����/}#����-��D�Hx������f6�O�"_�=�'���w��������QO/R�~05£��w�&�U�7pN����N��������{�����f�s�ΓY�z�_��n�p���S�qn՟��P�p��&��Yf3_pg�3O���Iz��1&�D��ж�����y�¬�MF�Ī�B����� ��ʎ���j�r:�����]ǂ�0ii����CmW���"�M�Z�%���0%k�K�.����\;[�C����p���5����eV���A{jx�^Am��/�lW(:l�n�f�E�*ω��\�F��cmI_H�^x��撡V_��}�o�+n�3�'�Md�q))�I �  I�;���CL'na�M-�<ap�z�c��I�f�d^̶� ���sW?jˠ� nX~;��ნ�Àg�'���\��M�h�V�3�A��z�j��9���E%0H*iɝr����(�b�����X?�^D���+�E˙K��?˗��/5����"����� �C�k����&"� p�(�l�B���* �����7
}��P�ƽ��Q(X�h7��*���cφY`7���Q�:-�l���˩c;��j�.��S1bwmvS��,�^��Y�k��F�M-��9g\��3g���;�[в�v�v�.�ٓ�m6�)��������YD�̤�b��rv���t`�\����#@�D��}��Ͷ�t��}���f�K�}�<~�G�^�31iFp��[�f��-C8��lƂ�O��l�&�r�n�� W��v�E����6p�tZ?��9޽}�KP+�OTO	��dr�:��"c���o*���N{a}'�]��T�^R1��2���F9�����y�u��MJ�b3{��1��t
�3{��%3{�Sp����!<0���5�wwو�]��E&�&�xp�{��#���zU�|�YpU�|�Yx�Iއ�gD�wŖ���L��Ӵ��%���K[N�6�Ք�:�V,�3T��&�:L䢱��9�EZ��W�dH0#Ea(q��:8 c��t(���z�a�����"��[�m��#80���j}b��ZT�]g���`�����N�MqR��a�J��ƣy9`KQ��E�"�}�ם���^��z�y+^��nV��Ow�4֑:�<<_��j�[��u�f��(�%��'�m��Cz� �Pƃ9B��k�����~hcb�U�)i����r��by�����Ϻ(�@0d�OE��n{O?uz�@+޹!��Mp~����a<�`Ll0ދ(�̱�lD&���t]/e��͹\�~�om�Vɦ��3��������¾(�D7�h�!� �
v��p���d�Fؠ��E�qvl!�v{'�C���튚�*��A�}P�)y��)2�|�@���wlbqd�Ͷ�b���A�U���ĸ��<�|-�����ɻ�-c���]��� ��X��SW&���] $/�W�1�&��@�h?"�4	0�ݞ��Q���3{���QZ�`�y{��:2���'ݹ�s�Ŗ	\D8l_؃	b`�>��(���4��`��Q#��r�g�	�8U#XN�h���r:�����/����B��k��/���fs���6���4p-�A�8}�7����f�?}{�0&��p����a2���â�~�g%�dKVbG�.���L	KMH}F��:�����Jֱ<��+r	M&zq�.�%����T����W��A�k�k���C����Dhk�+�1V�7���}�#����xsA+~��^��~��'r[膨�d�m{$�x�X�v}�3�:^����A� r�k�&�j�m���S��ƈ~9���%Vg��~�^�d�:7	,{kYI>B��S����g$|N"F�r8E�-l~�r��ッ]׹�x����_���w?�?|�|s��A�l�^���.�$�"���{b�9�x8T9 ��'D��`���nOs8�9��U*�}��x�>��>�{���xu���؃$�*cCU�	<�����^<��      c   b   x�+�OJ�OM�,�/�466 CKNCU��LQjZjQj^rf"'X�������)g��D�69SN3��
�LiqibQf~1��!X�1Ķ=... 51
      e   �  x��Y[s�6~6��39픀��N�(�)g)Ӧ}h}��Htj,_:i:�I��c]݌��)��(ҷ��])�e��44K-��`�$4�\�� i$����
f�k�f@�[�k��毿�ۗ��������ջ��;�j��]Bk���IHH��#|���^:.]-��4?L>LF�Z�=��mw�7�Q����נ�8A�K�M�&��I��NO�J��ع� �(��3���>�T�u&?8��J�p�O��K3!)h��u�{:�s��௎&�VO���G��U��|	q�x8l���x� ��������5�w�R?!���]a�'���=�ā����������C�T�W�fd��3l�"�h$�C�2e�������+_�)l�*ؖ$��:��c��'/I��@@2��Hr/f#�ؽ`��y�rXX�,²�N�\�"8H�n������U���2��-2�h��0Q�馃��>3@��U�(�"�:�t'T������9Ő�Q�]I��J*{7RΛs��>k�P��5����4B/����V�>���	��y-�� ml��j��])HW8�t �#�&����E{����4�S7ΉS��D�����:ǣ�(g^hv+lB�@�,�F���B>�p�Pu�:�1b����CM�������7uݕ��nklr��^��4LCI�J=� zU�1��լV��YĊ�*3�_�2�8%�)RA���h
��`^tS�2�q��P^��IpF��g�[!��p�3���(N�M��
f�|L���̽6+LV���N�i��{=�+ ��D�\�s�������G�rM���d�"��F	��Tr���q�㬸z=��^Y����G*�{Nm�Od&ΊES�c��<cK߭ZZ���S����2��q�R���g�<"p�GO@z<�J�Q��#vL�����^1�#��� ��ŰX8N��:1l��쯍�鈄]�0;A���Z���w�ĢI�_��9a��]T�%eh�t�]_��x�1�6(G����S���У��π�q������l��y]g�ήbm��������UǗb��8U1���BZ�pЫ��7��Z�d�J�Er���Є,	|��ַ��7��.�LuKT
����zn��r$(ľO<��J����T�;�x �_�	��U�O�F�V����u      b   p   x�K���IM��������,�OJ�JNLI�K�tS
)�
%�%P����DN70����/��*T*x�8`I�0��W��Z���wx���$g��s�d��m����c���� ��8�      j   /   x�+�OJ�/JMK-J�K�L�46 Cs�? �*�.m������ �_�      `      x���v�H�&z�y
�U]+�i�O:���[)ɕ�m�*K���%oN��(�@�	�*�3��!|Yyѫ��f��؎�� ��D��*��i!�/"���c�ר4��fe_����qR%��7�+�U�/�eK�_�r�/N���̆���G瞺_���i/	F� �䳒���|x��#�swT��q�������߃�}O:N|�_�)��_�.@�&~4�38��lV��Av�pW�I��/�o���a�*ſ��'��up�kX��3�=��tx���}j �Z��S�M*|�U�Ta�w�����f�������ٔ��?^\��矷�U�!��#��O���ĝ���5�lW~�G�?�ͯ�������������U�l�ɸ7	�*9�G/���,,�J�ǒ�E�$��b�7�؝N�qDJ5?�y��rcelx&Vݱ�y,_X'4��-�fFu�;;�P�(��AϷ�7�~yL˜8��M����5[���Obh%ZsܗLDp�D_�<kJ,�O��'�	H�	H/��R�!�I��i�A<IF'�����w��*��)�ҾP��(��8�g8XuSb���HW�k��N %����K�Q�i���t*q�M.��m����/i���o�y�/�ԗ�_Qp�wo	������_������i��J%p^���N8��D"<?�A:�k�O�����܉z4�57��$��M�����:(��#~���;m���9��x&b*�-���$�	O�<��P�,M�ԓ��d��W?���A׏�Gކ�K<��P�����/h�ŗrf�����*!�X���7���~:�{Hk8y�]����zC��J����Α�F=��B�ߥ�H���Xý��h
kd�>b�r���	B�hʨ�`������A"�nD�fP�bے���V�P^���]Q$���2Br�s8���t�(Z��!y���.!�h�Ү�C�8�.̫IX�|]��R��¶�ma���h�����x-�g��(�L��g}����e�9k�}��:\+8��� c��`�K�&9�2�%�\��$�lD�yW�H�����@ο��l==[6cI��:4֋�5����������k:�L��CP�Z�t��|��+E�%-eY�tM����	�m97Ծ�Z���!~� �#�xYs�y����z,����h#�w�b/|˞��L�b|�%~(��ak���ɾG�I��)����T��/���V�i� ��WD�g�a����o��{��a�,�OJ>#_
.Rt��/(�dʐ����H�7 �KnǗ��Г��\�(_I���$����-7�%=RגAo!�Jק]5�CN�|���e��UcM6������f���X|20���vf^xG��Aȍs�4�n����@J�&x[���X?���� �I"���&H�D`+Ƀ�<c�׫Ds����ݑ��
�q���G�ъ����ɧ�ߠk�IE�d~�٥o>ݔ��iʵw�$��,0�{��T. P��F��^QXtOq���:a���@�1��pj�2,���Dm�a��)z�4]�������כ�-YrC���'�߈�q&�������fo(9&�e���=7&k��mY�waZL֋Շ�t����٨fMd�|�P��:�[�&u�7�s������d�P��9�R5c��\������{u�O~�o���D�~���_��Y�h]ͣD��8x�X���mOY�A�'}�(F�h2�5��OJ|�/��R擹�OZ}�9jr��$e;9�r~G=�H�����q�_���ݮ���0�Wuy�[����;s\ 5;;D��_�������ڪ^���zL�-)CI�ӗ�?5�y��ro+4.E���tGJ�l�<15٤��x�>�<�
y�&�yGRF�=��$=��y���8�F{�8�ů�ܲ$9g�H�x��F{�FF.�HpEc���Px�[��edN�%-H�t�q�p�c�b96!|��O�Ò(�`��e.yOL�9I�ջ
��Y���d���"�+lJ��S)�ʧ �9��?O�t=|z
��Ȼ�Uʹ�w#�8y����u���KD?��6�V��ˠ'Hm��C�'� 4]�i,D _��7������JF±i�O���n
��ڸ
�5�r8k�n�K`��Mc��+�`�ck����ZJ������+��{�����S��5mG�C�箠���*D�l�O�z�4�'��3I"$g���o|>k ՗�(��Sf��H�n.	S��Hk�i��
�r��t2�I�Т��lߗ�i�� ݛ�߷��JH��E��"}X��i�eX�%��]8�m=�ڼ(ɑ1�3�o\��e�`c5#��cל2v�ϡ�$�u��52���?��!ˎ�T��䡃wH��#ڿ��ȡco2�^��Mk�ڤ�_>a,�+��;<s��$J��	�����ʉ4�H�PH6#�br����0��}����M���?k
^=�^���La�^��A��_��۠��`6��O�o��Xʜ/�����8
�W`�X,�[ө[}�6�;���o������H�ܚ2��~���SP�P�!p*�`���#LQ	#On��ߛ����Y���hpa0I+���֞2j��rlԎ�֩���"�'X�	p� .Fjk��%%�$j�[9��*H��]?һ��Q}Q�΂lC�b�/7"	��ƥr�=ԝz����Y!W�R��՞{���W/��W{����%۫�dvܺ5'�{/Z��r=�T�κ��;�y�u۪�f���ީ�K����k!{���/�e�ʯA/J&Hma�@zH�P0*��@�I����o�j���S���#?Z������@S�gJi:�y���)E�QN()��R��~�Y�2�;g�g�<S�&	�'������m��iۇ:E(P^Ԋ�kRH��^M��l�s�\�Xs�mhj�2g�4�#�>�����vq��n�i��8����'��*LH�<����I��E��'$'�;M�8nj$af�p0��I����w�����؏@S�����/LK��c���w�D�$7c_85]F'j�wУ��ěLgX�0����M�>8~��NmǓtR�n���{���B�#sZ0,�X�ҳx�9x?�ZӶ�l�Q��H��q�[yO���������C�}�D$Z����Nb/��;M2`*�{�O��	������#�kA�w��j�����>`5w�0�8 �43EY�R�R5R�� }G;-=��V�2Ň/�\k}�Cq�4ݮ����;m&cE&)�Ch���U�=gF�l"R{F/sR����q,5�쉵�y����=��|R��f o�1��Z����v�LcƝ����iL�,Cc?�l��7�I8/�+?����~�ԇm��f?1���0�[Y���r�ClX���z�LK��P��K�pv���GSK��8��l����b�d�!�2	$���H�H�Hx�ĿL�q�|�L�jqxOfx�;{�ur��@���&�T�e�����m�`�xkP�5�G��z�yv.��{����i0��c9-0kg�#�3��TJNAǿƊV�����7:���3px�����$|������ (LEk�)?��n��������_i�H:�8�liخ%��������G\ar��㤊�H��ˠx/ԏ	�ui��*�}Q�J5�	��ކd���D7q��}�����'/,w�;�)��j��e�$"q��g���!c�ݩ�w0x��Ð��`I������d��|�س��@P�I&2	�<�Z@�_A��7&��;�'��	�7��F�+����?�`��i���#�1�jѓ��D���|$%N���h����Dr	�ܚ_}��
�b��ػ���a^��-k������ �C�9�w�T�ax�[�Q�6�&-�~�l��Q���]%��^���=�80/���|�Џ�k��^P���$x�E�D��@gHv4`P���ǆ��q����c�OR���0x�"��~"C�:�L"�T�%~/H�H����`y
!�v�
�>D�3�N�:)��~T��,    Z���F�F|,�H�������)I����,9"J�v����~q@��`��#�hx�HA�M0�6TҚ���ױ�A�d����*����~l;t�, �q�l��Վ���@���a�fT"lU4Ea�<���$ �ςh,��d��C�iz��������������tp�Wt�+����$R#��^,yFB�Q��B<jx�,�*yH��7p�	��Z%��#��Z��~\�ֹڑk�����M�zq ��pJ֔����r\"�ťC�)�FYJ��' @��~Ի.G��I�B��q{
���D���[�V�O��'I��z<�����_n�5H}����k�xX6gs<G
�t��'�T���p���sK?H{��nr����j�E���Ơ�A�Z��,�?���)<0�	�݃�Ү|�5`���G$�����@��4T�Dd�.�q�7���S�����������+Aw
�'>MR��yx�.�7�0�u�|ΑĊ�7�S����%@@B^������'b0!f���.�M�C�0�	�;[N����ۓ�u�A$�3M.��f��L�{'�h���=lC%<�Z�#����+y ��CW vc&� 4��NB��L�Q�΁�e��,Z?_��r�B�D(�̪�	��ڪ��-�i ߁��'Q�)�)��rb��ׯ��e�~�ۊ���AQ�b![��������?i�݅�ѻ'H+�w�b+�����򜂺MJڬ C@���/cT8{F�Js�eʌ���=vFB��4/�j*h�|������!�"On|�&�r�8C>y����N� ��_��O}h��5�i.����m� ��7F�����JF��tƘ��S=}�5V�%s�V]C�[�4��9���5A��Oթ�JS�QT�Ŭݎǌ�mU���$fK#g�!_^D�W��6Mj�g��ܙ曐)(
&Q���qR�
s�t�~�ꅁ$$d�X"��ͼV����8�:<-�Ef*"�P��xz oL�W��`�h,�����d�r��@�_�1�4�G�r�@���#�E��i`���]8�{4Zy��qp�flj�qP�ǊυDP([C|��KН@����nq+]�n��0�K�e.���H�]E,o?��Fx�c��Ia�Z��5�.7��z��8�9\����M�u!	Ƈ+´p~����{VT���B����e� �X;��~ۼ��R[l>xj�]�xm �ݪ�=pM�q��������A�4���U�����{D֖ku ��w"��Ȳ�������wAZhu5�A�, )�ȫDXE�霾��w�� �U�bl�u�5�9
n���N�`��8�;d�R�Os|�S��܂(�c7:!'�mn���bSnM����w���}�юN���jw|�Ӵ���9���S,w���m��C�ڒ�C��Id����\Sd�Y�Er ����(��Og{��`I-T�+�(�}�|�4�<h��4�n���u�щ�ݦ�nT���7�qV���_)�*���@Ƽ��&����!O�gi�x�J,��]����lNqG�{�U O�|s��5� $��f�u�9���%*���Ӊ#�=:��^�Ʒ����d	Sa駐�LPP12!e�,�54K܅&#H���U)�\UG7�M�r�5y7���pE�TZ �qBU׷�$��i�_��Q����hz�:�����G��A�>c��I$�BZr����i4�������2i�,9��E��l�A�f����(\[>�M��$��*g 	s��TE��[[��/J�|Z{��� ��(�E')n�/ؓK�������<჏�*���)��I�]G>����X;�@�M˓��1x?{JBO�Ef�yr�,�%r����0m|�H��##�{��>���*��I�1��x0�i��}Ȳʝ��ai��g�F�}�gٖJ�����b;[&޽�Pu�d8yx@U���.�W��ӻ��u�w�^�>�5��f���4$�R�$� j��y��c�|<�Ӡ��X1&b��e9�J5��
4�\��0B�+sq��Ei���=N?�,sO���*s���n���}?���F;|�v��h1�$"�a
��dB"�L����� �,a�U܋MQzI[\� +@y�-e�w8��3ReU'��w���/�{���޶�ll9�X�:.|J�QwPwǨ]�<�eʄ��H���v�Ȓ9��rc=�9nf��v� ���b|��(л8%ץ�JE��>��Xx��51:NL���ɫ.6���О��EL�݀����_qyVe�=���d(�a�	��u���/�Sy�9st�4W	ͮ�@'&��VqC�FJ;T�b�,(�R�`�	�����;n����QW�z�$��1�{��ww�j���M�����N���,�H��n��������ɞ{��f�T�͇���U�s��>x��7��5H�<}\��'�f�IJɨ�p3�\n^�I�a�����|��$(E�f�z�`�M�O�d�Ҫ����J�6r���������H5�-'��Bl�Q����*�N�'.��0����Xʽ]?I�D��2;U��F�޵p�G�2�i�<6w�:+\C�q��]�
a�1�bà\ޏ���aJ	C�X������׼�.�Jϊ�Bi������l_���oS�Л����f�G�KcF�4�7�S��Z:g��f|�:̳�.G�4�Z��L���.��f%|E�9إ��@}:�z�-7�T�QcM���uM� �UӋ����xHI�TH.�j�8�S*�$&���'�����u�����a8@a5eU(���o�yB9r�T��K�E*��$�d�)��@K�y���\滹礰]v�H�j�v����/��E��a�<���fq%��:���(�QV��G�(]<�ɠl��Mf?� �JV�C3J&������Qt��aa��#�̙�t먽�P)�$�i�~�.b��#�382"k�=��py	�)��O@�9���>��Zx����#5��8�y�
�U2��+9|� [>�Yb|%l�m �}�8�-��}O�Q�a���R}'*�|�A	�S=���o�������ު���l'�'�v`tX�y��#�:'&oӧ��
�מ<���Q�`~&�hsC�(�F�A�}c+<
	^	�:����3$����f*�x?/|��eK�I[wa� �Uc��(���=�[���G��.� u� �ښ��no"����t���'�;���8��Κ��*�Q\x0��R��I��B/-`��\�j>8����X�!�G����*��x=^���69���2�~�\T2�2wf[��-�����H�x�ua����,t�.M�nÜ�K����73׹�Rh$��8	EMn�TH���z�{�I��-٨�g?>H���+�`�U�B��QI�_���w���!��J��g�Dp�Q�\�F�n�Q-BY�T<�l��`�QL��� ��>�M��a��h��.(w�
t�	)��E�>���(I��V_�<!�kG@^�1d5��"�E�¼�����A�ʥ���1���o�P�TG��<��hk���h�>.���4H��
�]4�w��ql��Y��V���g
�ҏs�f�<1wH0� ��j��+�M�a���jV�hM�Q�3��`-�`Ω��Q��`�y���4��SS�ز�,V�Jꊮ���G�#a�q���g�**)����__���s�J�s�e97���~z�;:�~�ҵ9	�{pҟ��Ew��ة��������Jϓ�]?���k��kC�K�,��������;=3��(�����^v�A�>@�S9�x�,\5P�E�H�2�񔜍�"F��ڈMθ�~>����q 8=X� ��Q�?v���C(O� ���ـHF��[���P*�=�<(!�J�}�@�<�6U��E�k2�J�a��������x��Ƚ�d�L�$K����`���P�(���:ڢM"[�C)g��L^�c,mz��8u��л��c��p� `���a�N�E�7(3�>�	��%��;M��o����ڻM�|��g��fXA�Cs�h��#Ł�TDL�!��6N����En�!u;�N�j�TΒOʔ    H����Y���O�k.oM��>yٶ���$�uv���b�,�B#�&s|�!O	�o��h���{�f]��Ҧ\�߮������R:���2aP���}�z��z��W���y1�W��%�;N���ݵ�tV*er����)��^ti�����@�}��=U�c�����mr�		�R|��������$	.E�l2�c�1�>�|O�i?h���Fc{����-��ȇo�Yq�_&}؍�4 g ��^l��~��*/�='~�h���'�v�p�qi䫄��)]}� ��yxA����ʬ�vw��B	/�'k4ēm�u�����/P^��ߚЦs@�[;�Ƃ�����ڌAh9a�sx��ç~��'<{��]]�W����R��77?�ǳ��P9=Z�5m�vQ��f\V�Fn�\3��<�Yt�SAԏ�׼p��W�ĩ<%��eI�F��.�\`.>�͂��\Sy%7��0��7�eW������>QI��75��B����[��G��91+�vگM���+�cV1+��������lsˉ�I��Z2�h,>�f��i3[��y���U Wp�Ko�@�	�u�5��z��O3Nݏz�_$��t�L(N�����y�B}�Y��$�H�xgz��*(���<���w��@0;��y�$�*�{�j���|T>=�^�E��]u�E{�V��%߻���iL�ZN�桅�Ry�'��;���ա�v�2M�j��^"��le@t�@��J-���s@��¶*�W� �Ui*m@���QNfr�Q(�zO״<�7�TՐ�T`�

��+���EY�q��V���'PF�ǛB\F�]Z�T�;w�u�����͝!��]���G�%AD!M��~D�e�ҪU�4�m5�������w���
�G�f��q��>�ŀ٪TY<�����Y��t��E��aryim������K���{.0�g��.YiA��(j|���7�9����KZ�����^&(��~ۏm��@�&���܉/3�;w���#����܂�Q�? O�84��L��0%��PҠ�=�Hj�n|]0���h�A�R-�*�J# ���v\���3�N"�%�w;��z�=1�q������Z��qǅ�zE�a^5�&�nɱ����c�ߣ0�[<��y��?������:�b� /8jA���O��X9i�]�i�6��0����m�̑.�i\�^(!�(���H���ϒ)�pH!.���<32��{\��'�ށ�W����e�1�'�2��<]u�o��T�#���\.E �1H�e�8��%����ejI�Ӱv) c���������9�ġ��B�F3��x���]1_F
I퉑�a�18T��n
��}$������m�h <�ـo� ��'�'�7!U�$%�g^�������e`�iU�z\m�(����0���B�s�8΋;�m�~�]��G�V�o�Bl籜�;�"b�Iέ�Sgd�í�I5�H��5��5z��GOR���p�M���'ү䋜�5˜���Vq��>�P�l:W��� ��:5NfPؒ���8�%=Ln��d:�&��F���L?n�cv���ע?���!�qb�>��k�j@��Q[�]�P5�[oW�ԡ9,V$7eo�rģ၅s-A�3]W��� >�JxTLz�I�q��ʴ���paD�c�G���9��0�K�^���FE9�ff�B|QG���2W�#�C�рFg7Ou���/���$�jsy�o���ɖk.	n��e[��ɒ\\���(^�nA��<���T!Ue��P�|#?���qdS��a�Q^]�f�#(�ʩj��Ս��>��L�v�A��o�,��0i�|��0q,���{%�������3��AM�o�`�9�&��<Lv�a�`R;&G��N�%V�<����C�r#N�z����#��q��瓉��t�(����B{Nč��R�Q�m�fND�mx?��9���M���ev���O���{�-�_�)6<�J&L�2���k��Mh����cMm�����/Q0������O؟*�kU���$n���Rr�J~�Z1�9��V?]�w��ϕy�7 �I������i�;f3 x{A���@�	���0�.��)!��UDBn�q/�|�6Z�1�O`}������́�R��)4������q��E�,��t��\��bvw�E����,?����nn��#����,��$0J1�����V��c�d��sp�Z�!���E�2YV��*�#ݗ1&"T�q,r��EQ_$�-�������E�UZ$I�;��m]u��9�p�F �2˧��pU��[�ʦ�M�RNY�E�)*��'E���C%fd'Ll�� 
\��>z륍&��US���ۿ� ����}�p������^�[JHQ*G��EO���`K��/��24ϔNl���Q�9pTS��p����ؤ�o����u��v���ē<�����i8%�"��nuW3 �+_Y����v��ߡ p'+��9�_��X��Q9	��$�;����S�_�y��d�Gߠ9?��esm��2Dv��Hf#gz��q~|
��;�,v�$>����+9^��!'R�g+��K̩DB� +��p�����&��-s��g�.�F�p�ˇ10�TtA����,�p�q�}h�Ͳ��Y.;�W� ۳�{kj�����zж���[����E��n���ru�k���n\7���%G����n������R��\�;[�M>����^*�8r=��O�?�<�xcok��d���ǝ3�c�[��MQs(�W�F�@
�����	k�OMƿn�7���k�j��%[>(�Jrm����)In��Q��f����9��	^~���{Z+�^���|RQci!,�k�y�5�Ę���ʝ;s�÷y�_���:H7_s,�8<:=:9<:98����.�x�.O_Ζ�.�{���g���\KR�-i;\K.�&���l쵦�R�\��wI��\�,P�]s��24ժ���Z���u*2�Y3Ѕ���!yy
�`��n�2��U��v,d ��ܘ�&X��\�����].-��fZ}td%}��*������".�d���[�T� uՕ��H��F�����#��PA`�����̺"8|�i� tp�Q�.H%��_�.���&�2HPT�AH�]=fR��.��#�P�bY�xs游�^\�)�t����r!MR9�a�n=|�$���v�ì��f�Q����dL�aQ�)О\r��°��Y�+�K#A�C߿���QQ� �-@��p�.�݁�q K�*m��I7ć�}��!�����-�����~��ۈ8Ԕ7���
+x��%8=K[sk�r��!뵅�j#��=qx!3^���9O~sp]#1��6�e��Q9Bt���͢!j8�/R|Zq;��c�E6o��I���.x8X"��n���lGd�+g�䉇�L�p�Q��r�2�tD�d��&��nh���@9B_�G=q��aJ9�q�X���m������.Q�@f� �[�s�x���]�~ÞS2g��1&�˚z�;-�6��K��\�¬�l&ʗ�T5_䈺:Ⱥ�j��+1
bE�cv�#�`hc��k���K�N=ۻ��5~\�Jf��S�^(ߪzP�7^��ؾŪM[[[��.�ٻn2�r���A��<=|7��Q��l����1���C���. Lo�@'[��4�4|n� �]��3̢��g�CN��()5<�:`B�F�h�B�I� ����0�6�̫��R�h.C.,���y'1Lv����2I'�'��<(4䟗��e^�RB岄�Js��
}����o��Ka�����-ّ���RF��ȟDJ����,���vbo��V�Ǩ���X��-ˢ��/z�fZ[x�*H˾O}�&o��8�suh'�ࠎPD_��Y���Q�����X~�yʋh�1��x�[�fg*k���<l�+��cI�îVZ�Q�9��v��}݀�}ƅ����C����|Z@��@7)Q%��OB�R�6��[w��b    z7ވaۥ�|�~�
Q&�f��b7���4�Jd�3��j3@�&n���bą��p/�SH��\����4s��.���L���{C�9=,�^ؓ�Ԫ#����_ �a[�
��n7\�d�BZ\\�p���P$즧0������]r�a1�<&7Aԓ�KA��~��"��'j����!��"��-J��@p������є��|x˜\�3��lF��K�Ms��Y9�4[��K�M���n`=���M	�Z嚠i�DL�� ���AL��o���O;$��Sһ���З�=l�6�������Y��Dc�|HOA�vV5k�`�4��{S>sI^��U��������8�)���2��f��Jj'&p�StuV c�>�(�īQ聱�#u����`=��&L~"ˑ�nr����N�a�f5��X=�.D7��H�ʸ�L~j�ς�V��r1Z�@�i���K�bȹf�� �D�+�N_�;5ygJ]
��&H'�c+=#�.�!�'�[���(%��ݫf`��k�v͎���p{;'�s4p���Q�^��rؠ\p����<�|oyp�&���]���To]�0��qW3���U�f�LF�NA-l����C39�fƳ���/P<�@+�DB� ���ɲ�?��H���-�o;��)�D`M;R�C���n刴���"�"�y����;�A��
ɲ͖����6�����1=����5v|��ttr�~��]i4���iu�x$�Kf]Ɍ�s��f��F���J.��@�]�����>�-�E40N�-���+��,hR�J��<�Mi����)w;�Z��41k&޹�'�h?��_s�8�M��<E�u;��Mz(Հ�0FB �k\�glk�l���s#�i�F��#Fa�!(!�@�작��
��RH���_)�]�l�"�,,����N2��B��`���S�Q/�����oo�w3��3�������o���@���r4W��z�`b/ߛ���)�t�m@$YZ~�D죀ak�W��������igP$Q~�@��.�r�,=�n����O����!&Ԟ�H���n���f�P�{Qp��[/N0T�rb��~qX"Nԡ��O""��j6_��aK�%V�@h�EBP�"�X�Eo�1v�W����f�6�ai��g��H�NO�eԼ��?�)l�Cj�q��O�q!IJ��xdeǵ�qH��q9"��ٴf�`��	Ǚ��:����K.����1G'`<BM}j�f����(�[�u�/H].�l�Ă#�>���sҬ�bk��ȕRp�"v<��?�������2<�c�S�!&���!t8r�	O1�* ��@�i�@��F����>� �F�*`��?%b�MN�<�	����u����d�q�=;��bm$jJ�B��u�X ��|���Pj��9�A��5��g���ʲً�8ђp�|&5�Tg��zZ����:#�50*5�X�����:X1-����Ҧy�{Q��3ة93��S�5�:^���T�z~h�dy��D�c v ���֞!jT_� �-@9�`�8F*C�i�+X��*��7-%1DѾ	r���F���#�S"����[��Z�CMsz�����vL����ԡ���s�A'�x���@���lJ�d�^5�HP�gC��d��'	��m�S�$־���<A�g��C�f��F�3��4�C�W�&��e��Tͽqv�[l��B�TGle �&��6O�1��r�7R��R�	vV����α?��K��[ɯ�#�S�8z齚��_���W���C�t)�|ё�}�|����ꗯ_zGa@^� ��G�/�kJ��H�)NQ���H�������2(���3��A�5�V�~zo��Y��Q�e��H�j�Vjgf��>��^�%L��q^2]pв����9d����|(W�E�9�&�t�dU�}s����c̽�;g�^��.��Dfx�y�c"���Ϳ˖�ca��J���{�'7`d���ǉ��͟��7�]�3���i��Ψ4
 &c�p$���n�R��p~~��G�Y�Q��T=�G(e�Y҅��T�E�\��~�I�wc�B�_z�R�h��k)�6�ȭC������_7�V15�ZG��uW��qL�7�1�<�/�X�VR�����P�A/~Q}_G�	�+&yj!u6�+T �T��_���^�s��P�<����a䑋@<uɖ���O�b2�Mo2Gfw�G�B6�}������M>X97P�X@5��fQ���	˱��\���r���r���Vs8�?^�wC�����$� ���"ȕs��a8;���ϝ� d�V����&sP��I&O��R�;���%;�i�W� �i8�j��Q��^����SnJl�e�A}�*�ې<�C�W^2?/�Ԙ�_�_�i��[�U'0%m��$���V+�TJJTP��BC!����:�^��)9�Y���yE�;�1��+d�����n�S�ZSb�3�~�6{f�H����������Ljpo��8� �ö~ L�JYt�Z�Ebzn��c�~8�p�������(cҡ���.ލ�E/`A�=N�����82�^<"���QVt�d`	�%�6�X�Kd6�5Dr{o���H��`l���5���"�\�⊵Y�k���d�s���2}�X@|��y��lYD
�0�F����m��Ӳ)�CL�:��AE0vwr,K(Fi>YH�J$�@_�C��X�����/Y���
����]cN���-��3n�N�(�+w�Jy��W����ǖG��%�̥�;zS�6��4�c<Q�}�s�_��Ǚ_MG�e�Y�i�y�ԯ��-�_�P��D6�i�A�8p��ʦ"�6����r��{OW��oA�Ů�Ŋ�53��C#��
T#UM�(EװK9t?���0��Ɂ5-*}������9�$���M���l��]���=P�o��!� *$r(;�s���I��w�ܓV�1[�6:���u]N�>��90�,�9��-�o�����Lc�q�j�т}�{���yhS����I#~`v�J�'��Ϭ ��B#"���͈t�Nc���H=A��N��p�d����r��2�9])�C������.4��6y�7?�
�Ay�*<#]�Bg�sS�� yT��I�a�צ�1c���(�_��]5_e㻠�����z��_�˫:�ŷ.c�V���!�y�9�YI��e�hQ.���$��9�)��;4:�=f\���tk/nE|�$`���l̴��5E�xBp;�`��F�A;ٴ�Cf�SnC�$�H$S� pJ�Wܐ��I�ͶՖW�ZSx�h��� �1�n����F�/��$�<	��	�CrQ�!�%������Cy�k��������$q枇�U�;$���JQ���A�|*�zv����ׇJa�ٍT�GF�40I9zIM)���k����(V�,:�<�uL&&fR��"����E����7-z.;G�\�4:
I���|KV����lSQc������u�X�Г5#�鄧P�֎?5LAΎ�����;Lx;����YT�C����j�.�5�
��ʹ���o�e��?T�|x���t�jui��[\���`/��#�a��Y����v���]��7�/�����:;�;���oX'��g��7�����Q��)}L��y_�~2�X����c�3T�����:�����~��v����4�'��@��z���㓣�:D����@</*M1�P�m�T
gu�-���8B�X���r�J��p͛����s�1XSVի����Q�����vSo�o!�<�0�%�>0�h��O��xE�b"(ʹռS��9�`R$�RGQQERsxp��g�F�B%v�S��c|VUF��ux]���A.����*::��q��
�
<�+���@�ɕ$(��B�y:�Wb�<]^�΁���-�b~ێ�&J�m_jӱ^lD�/��N�۝��E���!'tH!�poj0������f��m*o��J�j��R^��sk�$���p:�����z�J����48��L�    Μ�E�S�z��I��}�d�;�<�=��E4fvR��L�t��B�"��_�Jws�ZOm;����"t�T��T�t����<�Y6f�LY<���CeA���T��*� m��%�3��#�iֹ�=I{o���e��(���c�2����}Uk�I��L�k���fP`d�Z��{��}Q��;�?#�P�����jY/3�?a2Ieߚ�G]Cw��+4M�ֺq���~�{����t����gv@L�C�QJ3 ٶi �?`�%�p�$7$2�Y&�酛lɖ��/�L��id��������(�.i�X圂��}�j;�����0��0�w��<�e�H���5�q��k�!��Cg5�쌣�L�ٖ���L-Ǟk�,�RF,���&�S�5^���%f�?�l%e�r��=�g��4��idm���1'����ء��bi\�d�+`k��]�~��3�Y�e�@\�uQ�wH�3��A�;%f�`�eR�,h��eZ4%�NC�p
��0� �&�4�I��K���N3��T������j��&���bh�)�3��i��W��鷡8�F�OR�AZ/�ߓkC�w�y��p��a྽�J~���!z:��vk{��vZ+ �u��WY(����?BTՍR�S�T�kE*�Fgk���c�wyJó��){�'��sf9��	$�q�KCF�@��L&�E�L^��4�W��_Q�� s�������q��`�b%���s��(�F��c_�(�'��4 :mg�8\�k�v*o�[����ȿ��c�=)fO"�("7�ӕ�˽�ӕ9���!���2ݠ�.�s�{��,*75��t�`��K��n�i����'&f�1j�y��O�d�R�v�a�TgxP4���!�
�8������ǑnG:�1	H0h ��9�SN#+�1�R��s��2&Xf�*��JE_�lЁx�ϰ5�*�i���C��r�8����߸�%�4��̜��&F�C��?A�Dq���W�Cܙ�9JW���\/���!�4��r{b��$���}w���p������C�����炷+��up���rDmd���# M�SE3>��K&�It���SF�ƪ������ŷ��&V�-���'d"��Ȟ�[9�\�����;���$��Qe(>wK}��3W���NHI鍭�Zc�}�i:��ԥ�i#Ӭ��g�L���	f���`�r�_��\b�c��ٟ��a�E�+�8�gK��V~B�:�xz�,N��\M`������C<Ī$r���OD�A��ڏ�z�NV��yB���7�
�Y���,D_��t�A�ܧ�"3<�iMԣ/C���h�e��]��è���tɒ��]U���Y'�B�6y�"�.c a:�R��2�d��ei�3�����p���9��M�q�ȍl�`�����t���ȍ�]��j�l99�u�cԞ���L�1�L�q�l@G��F�+l���d�qd����|ϡU{�H�<�٘��p�����
O�C��L_V:��F�!�0H�j5q�4|�ۣ����Hι\�`�p'iyLIّ���RW�f+��a*�n�yn��iE��QV�Ӗ+�<�,RLN���z�qo2��=H^(�L��	�9fP�T�,{d�<��;g���}�s�(xD}���[˰{ O�G���J��pߏ�h*V�op8:���d��]>Ze��X��2.��7���Vql�3�R��,C���4p����3��54!�>�a�F'8�lU3o�Y��	��T��S����[S��-�cjW��N�pz�~���|6D�䮇��R�9��SwY������*��vq��JfNW�H�1SM�S6qqb����CI��)�Q�FV�F҄D��4�(t]Ҁj=�z(��`�����ۇ.p�-u�=R��w��k锏K�n_}_��e�[�+zH������E�~�Y�\�ܥ��N~��c<v��ƺ��],�ØK�k����-j5�T�a|\�u�@*00�!�m�)�y�n�@�k`[M��l��e&;�ysJ�������ڲ^M�ʗ�Rߛ=l7��=�����P8�<�דl5�9&R�����䌻�Iz��U��1'^~�����y'97|�˗�]6�;>9<>8����3���2h������k��!�d��HI{�閤��l��9W�b�M�����@ʗʥ_,�\Xδ�vL;������l�u`6�ۮm�����օ9k��EH��bG�bY^�oy�M�Sv'�[Ǐ�i{]��/��G�	t�v�U���_N�tw�B��;��Aއ�c�*<���V�1�$d�$Փy DMtc�<h#�&_��op.�B�<�J�Xd^U���K$@�^�	��p�5�`;������K�ʧ��s��	%~H��p�.���ګ��5��E�V2�v��*i�/=��U�U|?O�4� �pjं�� k�(��Qi9�H��Ϡ"q�┛��h�cp�=G$uV6�wEpz_�Q@~�r�)d�������+��[c1���]/)Ah����d�O���C��j��(�C�̸b�n�*=w-n����x�t��E����u.���1l�_�Bi�
5�H��EL��-5���V��Hކ�B^��o�U����.��ʊZu��e�t��TܕB
cET�ݍ��(�6=n��:���}%����:�Z 6M��g��]�Y��9���Ѭ��8ƄK�g�Ȇb՗����
�z���jy�)��ʤ��r��Ea��rsԞ�G��{~�������w`��٣����駝�TY�F�b�颲�>%�J!��ܹ�l�)�7~l�����i5�d?Oh��u@1Հ� %�a� [����tQ�N�ʯ�[!��*H[EHF���b.
�M�ρ��txp����hڅ(���ס�~�դ����U���G4
dG1`֍�٩8[�� y����gqZ#��R��iG�)���o`�s=C@�b��K�g(vI.*31+�p~�����ዊ�%�,��x�^�a|DL�Pu�i8���?N�o���֩�����y���}`����J��,���5�M@�&�8$���{%�P��	�
s{�8���R#;�W�!�kTNo�c$o-Ξ�S?!�,(F�l�D�?O�,O�
¬��{�t"0.;�@������%1:��r7ߟNӱ�g�L9�)���Տ�oU>��Y㋬j�>���[��{#�[s�fy-��'�U0�$�TX� ��b�K�9����(%��*F��rw�H(���=�Qul1v�ڌ�ȵ�3�
��n�0�ʻ^��G
'b�9Eȭ�S����џ��/T�kQ�y�1����An�Q[H��U0^l�^�%����/�E*�g��kO�<O}�:p�fj��n���c�.6�Q]XU�?�b{ۃ�I[D26JΖ�K�"L?�ƹ:�I&�T��#��`	n��k�g��o��[j����r�S�b�"c��]Y��T\%m\J�N!+�^ĳ��DQ�M2��˅k9x���E��3��%ﹸ·��tJ�d�$D�m0��'K>�%Sd�\�2C23�lɉ���\��rN�62�sE�"�^KF�O��B'�̉�!���/1:,\�_9�ρQ�L�M��Vh�� �T_�� ���F/M����T32�P�W�nKقT0�0���,j��(kl��N�aQ�$2�g�,+]����W��c�Wt�el{���T�R)!ʲc�*[]\��h� �e�ݖS3��ny���I�ܥ�B��;8�hEoԼC�T��L
"0��*ƣsj�?�ۼ��i|����/J7�N�N�N��_l����<�<}9z���G��t$�ݰ3��M�|ܠ	�^��g}l��E�\h[�Ma����c�N��MN[x
	��W o��7G� ��&����o���v\���6}�������j�Kѵ��Iǌ�:���X��I֜c!�cC�q�\\B*����$j�RԺB����b�t_nx1�A�lB�16	����Q�WV*QdJz��ݸ�48�v��x���9���ʧ�][�    �ɰF*fN��?�0r�3��9�'��l���9�)� ^�&�.�C��S�=!�Z	xg�1���Ҵp/�!&U��)����*H�l�=	%�����
`���g����[9wyt�%�2)�R�^fzA͡u���Z�*`w�.p⨯����n�T�0Gя�'le;���O8qu�}+"�h����җT��>$����+y��Fe��u��U���榰=Oi:7���>���M�9��*�ے�X�Pz�K��+ۗ���z0���ƽٗf!J�����s��>lX��Ώ��$�Y�iw�����A��@eV����3�l�?X@jkٹ�m뼶�o+ł��;�*��I��N�(zA��..Q{SE�Q�u�[w��2�R���,y�T
Pk<3�y0U9Z�0�ɯ{?*''�w�1�f`��lj>�dA7�#�BY����3uy�j�G��w�����xg�@��U�YN��2uY�t��CMh����L�/Y�Y�]D[D���pԷ:�_؇&/swxǦ(�ő��ٰdo|��	��2�;si.�^��^pW��a]���i�YLOZ���6�%/���;�ДGt۬��|�_]+����������ٺ�X7�v˵aNK�c�ɀ�^1D̜p��|��\��,hck
�`1�V8y��Lh�]�����u����x����{BԠd���=M���q1��dÓ�k)��U ��ѩ_{ S�D̢��WG�H�����ې�-�Q6�A;s˴���E���ۈ�c����j��~?+m6���3��M�����{v~�"G��׵�a����gAu�~Ͼ�q~�B��|�/r���j�p�hz�t�<�	�W�6i��r���E�I���iںK�i �I#����q��!�Ѹ���^	V%�����	�F4I}6[��Q����ﻠ�݄jm�(��ե��)��S=��(O�a��T�lң@�T�a��2�5��XfO��7�ݲ��̟��bI���$�d=�I�B�f!����3��{���EzqQ{@����!�Y8qٝ0=�wpv7�r�Q�pB�%U|w�/�.Gd�PM���6�#��D����dk�$~�Z��.�9��
NʮPf5�no�w3��3���������Ƈ�S 0��+X�c�^l�ҽa�$'-�e	z`��"4���
 �2�S�6�;o�q�%�݈0N��(`�%c�X2�)����[�Ne��4Ir��g(n�(���u31�����^ �m�e� U����ϔ,����I�����\���G�����l�i�w�Fe
��� ��;l"K��,�iI��N)�L�|��df�o��|�M����$>Ƌj�y,V���P�K�-��Q����88�B6�P�{��R�;7��L���.�蘜�  �F	�{D�e�0��}]Gy�8ʃd2�I=����7�(�����*�RO�%�pD��R
�#���><C��Z����x�1k���@Mꍎ0�t���O1�*P����S>��{7�G$@c]� �<(0X��Ο1�&=|�b�x,6�++2���*�V/��c\W;�K�q
�oN���Iv�"��uF���d[ӭ�8?����H�,��Ŗ��f�09�v�s�������+��Խ<S@�T�I?	���cU��T�Թ�J����{vx�����ixg��~�v�����ah���|�\+�Mi�|ȿa��g~fKX�{R�E�h(�@��xv�鄝'���'�L��3��uI���M���,E�&��r��b�-����:1jWxB��/8��A�.��;������e���	�X�@� ���?�=C�:ۘ\��֤�nFB�F�Dn2�՜T���\2�w���]��t⯳���e�C�|��R=��B�T�8f���t2B����:ǣc�j�G!�"rߏ��)h�Pri�s(A��iW�$x�nx�B'I�5xv��{���d�:�|ޗ"I_z�*���
O�G˒V�sKE���ꍓ�;ƓЕ��p
¼G!�fL�TX}b�,�y���� �o�
}::Q-�K?y	��)�XS���K��$|�*^��|���J���S��,�^\�ꗯ_zG��~#�G�a@��0�W%1�1�bN� �n�A������2(yC5��|�Y���{�/Оit�0>Q9��i�B/%ݪ���-<���U]���3���9ģWO���[=��ݞ��1?�. �W�s3��ǘx0w"���V4J�x�y��ѐ���<�����j �<3���6���Oۦ�9X1{W��<�f&�S��鼩���'N)!
nB;�^�Cta(�Yz��_��U]�U��|P�ԍ��C;%]�-�]���q�,��U�{���ކ�*�ҋ����q�sDY5�c���.���o���ȭS���Fc�ȭ��l�;���d0%*�|��tԥ�J"�ƶ%&���-�AC}&�k޹?��=0z�����DW���ȽK�/���pW���k�v�[x��^r�ZW�B3c�<)Ja¾jMи���b<���\s�m *F�,����~�Ѽ�<���(�&��ù<�|.[���@������C��B/6�Ѓy�w� �*�
5k�!�6��� ��Y9SgU�yB��ӳA�@,�f�˟:�Gqx���|��w��B鍗����2�{�8[`�|`8���@��.B��3�;э����DyBf9��:�҇�ƽ�t��XB��Eq����#��l���{��a�c~3�$�[N��������z��k�Z�y��9��8�jEB�x�X/]p�����\@�ݸ�.mV�d�o%9�n)�ȁ���+��,��@�� �R�� �Q���K�6p�7:7��_�7&�j�~jR�3���}����z�U�/q�-�z�XP>��� ��B�*��e�v���*�U�Q�Oi�:U�X���3Ξ�V9&���2$ޏ�j+l�V]�gI,�̀LM�Ϲ�K�'q�Jī���Tw��jZ��)8����=���m�8�Z��[�S,��Moͬ�*
tMN|�Q$����4X�Ǿ��s�'�fo�^�����l�E�ί�7����OIXW�>����U7��_�d7l�+ە}�h��=*������p�� ��#��甗T"�,"��`�mFN7���C����oP��O ����h ED�^Fy?�2�W'ZO��iw�zv�'WJ ���w3�I�Ϸ�<bs�Q��s	�<��Ɉ�����>$�����I����>�/!z�s����b�.�?�̮ba}c�����+��2,���f���ʠ-2�P�;?�����ZP��y��RJ� DW?W̘��	���ZfD��4.���)9ux����v�:D	8����-�������?�O����w��[�g�%�j�{Op(�FQ?���Y����v��H/7���R��Q��V���}�f�2]�� �[��)°������ l��"��l!g�#�;�����y"niAԺ���͏���C���p��4����O��`�)�tڞ�:�^4W|c����OFK�Y�;�v���[�K�Q�7G"�'��4P�W��5@�|N��lMez�=�޳�QEL�ʇ?��� ��M��Ğڙ�(�b�˔�CуtC�w���F�GQC_H�-Lɵ��,�O�>�0Q͉��ߙ2��~:��;�TG���:E(���Pw5���4d�����xJCh�cW��OhP����^�۪�ͫ��� 2
��V9���0�,��^�ɢ7,�C1*��|�{��o�n� :;�ٺ��?�T�;�oL51e��CA�1krw\�8p�څO�ԖK
�-a=ٳ&Z���*���0�s�`	W�X��Uߪ0��@�dP0���W�T#q�qӥM�Tt���S>�wtx|����n�̳�/}ڠmA��4!n��&3�ȴSDd�҄DfSi�$��Y�=Ԭ�n�1 _d-V���1״���-�����3(�XA[�O��������Kj�t��>��1��ui��>�m�E�Uc5��-    �W�DgXԎNK<4;HY���e��ޢ����C>ه�~Vt;��d�-:��3ۂ��~�n=��P��0�+��B�?�ʫ�u�_�U"��f��*�����R�9���b�6Ǹ�;�+�����W<�S�d�`73c�e��p�#)�N��u�sAq�T��2lV=�F7�8�tb8lB�G
UX#�.f	?
� O]��Kn�8�ؑ�
P`�F�W�<�|́����_�M�Rq�a�b;Q�/j�Ȩ-%��d-}�Y���l;�S���v���E�2Z���A�DZ�;��ǫ�砚�nsq�!-����*|O�ј���/C�{U���:����h6�g�#�e?�E��dL����8
�A�8���)��#j'9l�33�#a���D�V3H�@�cR�)�)TU6���T��>���B�T�� ���	�T=�_l���e����mA}����ύn��,�NȽc��XV�o�u�vϽ�"�� b�,%�r�s����V�-�yv߅Y���Ѩ22�I=��YB�������n�&�����<�bCu_4+w�������Wvv�@�c���c1>3��^���e"�p�q?gC,��������.���fP==w��-��@��@ t|��F��&�`����'8w�..�m�I�g;f�����WQ����#�t����n��ǣ��������L�$y������JA��@@���W:�)\ϣ}�� -(���+k�仟�<uLf�#>��91k�������/�M�"�]C�p$�rW�uZ��s�;�U{h�'��^�};����M �V�����U�ϱ1l����z����<�|8�vw�8z�xҷ���g�N��b����s_8���V:I���[
k��,�F�8ɷ�S]��o� Y\�\H#���J�s��x��,.U *P�H.��S�l�R|�Q�	�wXN�k��b�!]�,��}��"�'����o���u��^)����x�e"cs�F;�����Λ�}��6���^y	�-���m�{�/>��%M���"o�ˍ�'�&��x�>�=C���3 �b~�L�-v�@��c�����t0��%�:���'J�JC@Z_��0�^�B>ܡX�L&n��@RV[�#��T��?��(W;���8���cIĪ;�C̙i�}���*���y��Պ��]��Uk]){�(,:�λ����>j��t2���"�?=ά5����z#�y�]���#����"S+]�Xy���]�� ٪�T���bv\ç�؇k�Sy����O)w ͡�����h�h�c�]�Ji�jT�p��2v�����ؕ\SW�2VK�Zz&����+\3T�ˁ~ꏺ���#�էP��f�\4ǹE��{��������]���وcߩ@Ug��$#L�E��S���.c�Bo"*oVx��:����?�k�M�,��4�Vj.si��8T퍊�(�($���JYQ�71���!����&��W�J6{(���1d��^\6���b6"cQ;	�P8x�Ci*^��Wޕ���ix�`@Mk����w�ȁ���J���wU��W9����!�7�������<�	��^?Z>xһ�Pj�y5����N�𛐘�C�uU��/t�y�9�v.}JtVW ���Uڥ�MCg��oUNs�s�qG�V��:&�������qڮ��熐c� ���t7�i�i�B�����@���yD��'�tW|�-�G����'�
�����������. �)B��1��_��fސ1Q.��<��2��~�R��E7䘅����R ހ�^���?�Ÿ�EG� \z�t)(DU��(sR��<2�Ƿ߮b$�^d|�����π��{\��\�>�N������vEw+�p�J�S-���_#τ�杢�3��"~�}9J�"b�0��ˋ蕤��q�{�˗��Ur��q%���'�S��K)sfǡ���`w����ŷ���^������ߡ��CB�ۗ��EB���[A��R2�^�O�L�����Bg���jV�8~J��J�w��#�kK�fgƩ�ju�>��l�Cwp@#��U����v�]�c��V�횲��Z�4k6�b��)�J��z*�P�=���Mu�۬�^~R6���D��NƂ�"�ٜv�J��'���1ʢ,@5��/eh�~O
��VA+u�$��y&1�/:v�^è�PU��o������[���9��5G֍||�v6��������;E����ٵ�~������/�F=Y�r�=>�����a�[�0���=`����SZ�r�������4QȯC��mognbs���������W���P����Z˾���ֻ�
E5F���n��~���p��AI�Ry�nЫ�>�����(F|9I�lK�]�'aJ�	\;���պ��g�ќ'k�#�&��l9Tk�gi�w ���kCY��k͋�o�T(
a� *�xL8�/5���;<� �������fM"-^�������Ȃ⍮G�0���/���2ow���-&��8�/�ޙ�v�Wm���k�Okٱ�?���aO���t3���>�^l$��O���~�y�;�O���>�jY��L�0��0ϊ�nXQ��ʛ۶Ð�v
I�U�޲�?4��I��^!r܈o���q�C�Wr ���C�I|R��?�����'Pm�A���c���S(�S���>����=�}�sC�]q��4��j�٤mocb�\��(�\�\�@���[��ޏ*�6��zr����GZ�M��wpa�>�!�oX��f��v������<dj��8��5sBrx<�OY"�\^⠈�v�IՈKtO��,�2��ϖ����1VK��R߷��r�/��*_�'@ͭN~Mҋ��Y�>���� �+��'�� ��0ʂ���k�P�z�-#`�@"/��'^�, D�zq/F��wC�;%і�}�~|� ;��2y2Bk%b�C�i.�9��u4wN�_�g��ByU���������^���7b2nQm�(&�݇��&%��M\N�H�	��,��U�׀�X���)+a#.���9�Ux"��N��2���B�srt�p����C���|u�pv�t�e�tt�G��H�z��>�z0d9��	���g��Ӥ��5,�f���Rz('��vÕ�X�1��$�z���X�a�HcTäK��O�Ƽ�C�bu�˷�jP�a��)��ſ�R\ڛ��UŃ;tT�n�����͘~�ja����%�i�Ps��IH�Tޘ�l9O�tnM�el;+F�!K�@���ɷcs]HP� �-q�E.jĨ�z#8�ʟ�*tZ�����@�;��)z�A���@2��!�D 5�e��u�S|�9�jb��n"Ci�����d��\؞����[[E�J�pVG%����{ ��T'ۭF&C���|�71?�$�X�m�� 6� �<������Murs����,� p���&i�>�˼Z�V�x��z� H��W�SX�h���9�Xl����;��K�'L��(�Isە}V\��ǒqR�7���"�*LV����|���py� ��YmY�>	�/�;`n���$�&��іdl�6�}3<���p�^�b��(HK�F
6���8��z�Bv2�_Ӿ�8x��QǬ9e̐O�+��.r2����JQ��x�>�37>���g�&'<�t�j��g��+�~�J%�/%�0V�>}U6�����2��
T���v�*x	|�hS��48�X����?h�D�'=�Xr 7��>vՐ9Tv?��<��h�������Y̦�ߘMP�S(�hh�N����� I~���fi�(ܤ�88�A`�1�;��5��W�c�rA̺�8t�̅x�8>Y�TRN����3�Rs�)���8�j%?!:)� \4�.���M�;���-�g �~�`+V�,0�m.׶���03N��,��7I��0�J>Ӑ��dAU����_E��UA����g(��%G~����*ʨ@@t�j����SJ�U�拯`Bn޴��s�&��)kN�;E,�>�~~�|���O��H    y؎�<��i�8f	�s�ﱝ8�ì��Ӈ`����N�FZT�R�R�� �[?K��,0�+�$E'�"$�N�*D�[�	 ��" �DݵR���S�O�� �,ᬩZp;�z�ؿ�%�,k����z�9��}Һ7�(t��,�o�}w2o�|y_v��Ow�.ʾ;����k;+���p��g�rdhem*-����Nq�dS���:U�H��4�?���к��r�ߜ��C
N��c	-)��O��,����u]\;Â;u/�>�N�A�Z���k2[�3@�sPw8���Nŵ�U)N�C���E~���r�C�Jdn�\t�����۵��dw���O���l�;�D |���F-�i%�����g��B$$�C�Դ;ɇ��\��>���}����STU (�S��XDP�:Uu��ЏѸ���Oǜ A�o%G��$�!{-C�`�i�y�{<{��9�Ŀ�J]8I�Aa�"e�{�H����������b��@�*�֭�lH�(
�����7vd}���&���N.��Θ�bG��M�n�����Fq�(Ij�g"#�S�70;��I�y����,~��?�i��s�`�k�q�<�~
���@��<�����a�t�]jH����c�/§�XIג̕��ٌ�!�]�I�D-�@��0�bt�M�R�o�(:0��]��(� �~Ť4X����%Aiq��®f1�.�������5��C=�OB=���}�q]�O�����F��,x"Y�ٔ����������OU�d��Tk�Mͫ�T��~�P]�F>�E����|I�.]@�6=+��͍˾8�0���8K�tu�QS�Rx�4dũKq,дZ�7#Xf�gq���w��/�[׬"i����&��t�T��vQ�-����?R���S*{�/%���a�^�@ڵoy;<R|O��#�+�}��P�s"I�����b��(�>�/Qo_\՝��^�3{���$7�t�i��� �%�M�Ge�-.!�x~(��P5O���r�!wP��j�HTL����T��A��سO0{�rx�p��K���q�P���g�Ў�,в>V0�FJu�#�K?O����x�W�	�i��&ñ�0Uj�nD1��U@ʓ���!L�4�!1õ0�,f#ߺo{��p5p��MqQ�.w�VD��x�WQ�#F7l>�q�z�?�2��|"�5�tـ�\d����?z���S4�29�/.CR~�( �m��a�z�ќ;6�켆H����VW��k��p��E {�g��ِ�c�`�"���N�l����ғ`�`�a4���a��E�,A���H<�G����M���Z��;�=���xW�T�bku��z��N�S�u�����4��� g~oQ'E0��4����۾�
�	��>y���z�E����$���"�8�Dy)L���<OTn}��d</9m�,r��V-�|�"/�)>%�,��~I�]��Y�X�n�`�C���)[�ϴ)̬հ�ui#(M$���/S����Q���&Zk�t�ۿ/H�O�p�L���ĸ�p�pOSieYb�r-?�e�ԦiJ9ɘ@��TCa=S�s�'X��>��<���G<9���'O�GU��
�y]��.�]gK�\g$f��0t��AC���[o�g^�>�����,í)_�00#~!�����s��|b�Uܒ���x!�,r�W���A��k+��<m��nh���,/�~���&I:o�K�/6�f���?����K�n	���G�Ҏ�a�Y9E��N:ߝm�Җ���LK�"j�HO���CX���*�E*���LS';�5�� ��>�y}8�����[�O�
�5H�t|���(�`�Eӗ�CU8P �	�nj�%�q_�O<�]j$�ާ��A�h&����5���H�`hHT���5=)"��eeNQʭ�O���H��k�r���'U+�6����B�E�*/�]gWS�P���;n`���@�"��\���X�-K�̐Q�������Cg����Ko��Q�˼	�Q�I7��q<�᫦/kՏ��n�A��,b!̴]i-*���bL`	�.�Te*�U���ӊ�v���*�&4M�^%Z8O(�z�u~v���]�n��a&�ϐu[�}urU�Q�淑�(=>�A�+�Q!����n��!�튙cJ��<�2��"�USW�$R�Q^w[�^��-�0NM�G-�������[[�^)5TΑԒ)C�"iI����m7��r�f�t�ҝ$1B�x�҆h��;�m{�uV�!�K�@=�Վy%�7f�1Q����m�>�;��ø_�s���Vچ�ҭ�a]�w���=/6�� xQ���9CF{<="�g�r��}P�pg�[2^���/g��,k/ ���f��q�k���y�qV-'Z�IaH���?I8z=MA
3�
K�R���@q�����|���a�iUD�0�z�����,�Q5[�इ��5Ӈ&�z��i��K��&��م,�q��H��O������K�v�~LK�+����Y��p�$|+_W%w��c��n�Y�9+Ɉ(�!O�,�.΅�J-��*q���კ��r�����k H�>l^x�JN��3\/���f� ��K�b�	�4�J�k1x�������pA����b��|YK^��CA�Q��I<�o�5�`�m;��
�Ֆ�a�Ƌ�t��0���7�sԲ��S�ݺ�F;��
���ŘoD��� )�Y_}w����C�����0����f�Mq�l����w�{_�����zs�d�8`�E�+���[<H+��҂�5��@K��i4����B*n$Tt���{^��3|����/��H�7��.�#��;��KM}�Q�Z��g�\�Qo)�����L��˨�١M�[2Re��P�u�l�4�L�q�}#j�<��_�JBwK�2�t\���?��!ya]~��[�����go٨l{Xz�aI�<��Dd�a:tj��Q�}�If����wz,vc>��!A����@�Y��W�{�h�vWr���g l��XpK�Tv j�N��lzP힂�x�ȱ�D�a�O1�%�����HC�~���`��?�UY����Ӱ[��~W�〻E	�S�S |;���-i�ஔD�H&����{*�Ђ�V����9N��H]"xӺ��s?
,��/։L���**�o����l�MGGK�A����J���z�X��߻&�L9���hN�j��#�&��N.��OAX�!��
r'C��7��R �\��`苟�m���Fv���v�l���'��i��5u?��T�IfT�D�؞[K�q��
�aIM��M_���"WR����m��[v�Q=g��4�i��A�O��A�	dl�/*�vC��M&��Aگ[����e���e��4`8�z�Aq�C�5�Ȱ[C3��|3���)��A,��;\�Y��f/2���z!o4w�f4�}6p�PiQIs7V�Ly�M���D$�����*q�E����x� �)-��O�f\��
�-55�d�Q��
C(	Zy
(�6:�f3��L�p�1<�L�p���(�\f��t�&���}J=0����LEBլ�s[�4�l�Q:4����"UuV�X/���ݖ��J�>ct��G����"�ۜ�]=P%�C9C�ș4{�!�X��1�V�~��h i��uD��ԥ)|KS�xX�?Zi�wv�#�ᇘx���Q�FŐ���=5��a�6/��7��~��H$�<;;�:�<;�<�8y�����/���
e��f��S�49x���VO4P/p�&?�nn��b m�Ow�RTnL����}3C���A��v*���ďo�Q^��rl�>��T푻JUc�O,��Z�e�E���8�1T��n���55�@w�|b����?�N 5[vz���ܲ}�=*�9�-����0�:�U���O�|<�j�I�Xk�Ao�f��ϣ�_>��MH1�Z���|h����-=�y��G�����&k���b�8:�":��f���N!�޽���'�M��ş
��	���s��3��=Th4>��)�0�����     �8ڞ���TY��h��i�&��ˇ'��i2X��[q��A�H��n�n�z�Q����;�*ͥ���ub$b�:��u���S�>�iG�%�"Rh �F��j;e��i!������ɏ�#��ո�n
��D,���rCb�`���S����$��V�S��y���f�]Ps�Z9��K���5<r�M�ӞfgзT_�X�"��]��y\�����T�{}�k1O:[��iRu�Kf�,�t�6�f���ͦ��gT��@>O���:���=�w �x�g�)�T���Y��4������;Q��L�"�l���k��;�C�Ax��ҹ��6HKh��h�v�"H��UՂ�-X&�ƫ��=*+�.YChyp�5��v*�qԗ�T���Ɂs7N�)�A�g=�W�(�����s�l��u�5����t�qSd�^p;zpQx�^O9�y��j��'�c�;mgv%�v<�A���L.��~�Y��ޏ)��-�!,��G��C,�>��'���1��Z��Ҳ�/�;��5U�u
��<Z_�8b�@���ƞ�i�k !�D���9�M�L���8��r��.�.yk�5�iC�G\��q��N�p<�0��<vm�][U�|����zb�����U�O��8<�������u�o�{zTf���cڝ���XliX7(���!s�V����!=�{t��,<+�(H�z$$mI>E��K� !q��0)l�FY�S��Y�}]�C�(�'���f�]&Gi-zx��h�+dyT#�jI�D��#�;!Ƃ|Q���<�-����Uٍ-r).�����O���+|���}e#@�G�`Ƈ e��/��ҵǧ��	�qz+�D���1l�d��dm�C3��7I(P��f�:�fנY���VH�TӀ�̨v�@zC�RG��3R�R�Iz�e-�xG�;Qю�������>�:����eh�i�#.͌R����sRf��M@�@�:vE6=��=�$-��'
����cǻ�����F���L	L��h��ã�74QZz�V�%�	˚�B���k�2�\k,	_3�k�٢�"�Z���eǰ��r���ץ�upw�%.?qOQ�6���d���i��(�`��{�+Ug��FԹf�b�C�>[	q��%���*ʃa);ɣw�uO�9�����Re��TYN����'����HxE�	<��|��c><T��6���p��|ٸ𜻹�T7��������)�n��k��ҡ�^X�eU���	�ʁC�H�r`U�}|VV���-f�憫û�t����| z�����(��7���<Ȫ����O�l�ZHr�\��mdY>����c��s.��T����7��I��m[�I�2nˤ�����O��顤_���P�1��6�ƕ�9=0l"S��Ѐ͐���S��s(���߀�S�1*���Aڨ�A ��Jw�s���x�Z>Ή�����G	!��[�A��3��Gf�g��p��|�,d�<�q捬g/!R`��YЍ�����쫋˳���[��|�
"��蚦~����C��N��@5Z-�����O���� 1��,s��[>����1���^Nb�"H�^�.Ξ�<�s���irc9�R��H/��kn,i�f2UpTZzxp��O��v�炁+l����ވ�Ip��~�
�t���º���������7�sk�g���iH�mg���``�y�;�A��@�u-�V��]�_O1!d����{�d8dbs�wp�w>z A�2����N � �[T\gߧ�H�	OD��ow`�Z�]%<������g���#�ϰN&��pz�q��3�RGx��GE��̼ED�C�N8��t6��;���D����ۓ�<��[�x9����J�qt��8�&m!|��.3ߍ6�h���/n0��(�09�0��"�	J<~Ġ<�xJ��|80M1�r��x~�yF`�N�{�N�]��>��]���s�/����i>O�pʓm��,%��1�T�����;��薀�z��ϴK4�D�̎���ӕ��ة�8͎��L[����l��T-w�GD�Y��=�pK��"��17���e��b|��Q�^0�����(���O����wn���Fټ�E-2��h ��Ƃ��$b��q� �I�3�	���A$�Te��y�~��"o���W�]���1�X�k�%���D���D��-&s�I(�pj6͊ԛd���t��2K|d��K�	�����@�&K�@��i0���+���H�v��l�춝����0�4�
'IԒ(༡0<P�|��r�����qK��g�he&�eA�=�r,'�^-ge]Rb�M@�vCާ�Y����&���b�!�&�y}�h�����{D�w����- �I�b����8<<-e��[�7b����|Ca��9�ɉ�R�SH���א��k��@;�F�-^R�D�|���3��ܘ��S���|�l;�j�S�2cJwo�l��Kwz
�H���G�����f�_d�9�Ap˦�1'�(�c۰v����c���D��q��4=4�_Y��3����D�}A	\��1^���of�8�b
g��4H�XXX$��o6d�B�j����T|���=K�S���r+�ЅW)/��$��^��������zF��G��%�-o 6��R�����*�I��K�++ZRr�L���r�e�a�H�	缋�V�s$��
~_Wơ��`��GFʵKE��YN"V����';U�j���}���i���%�+"^z~�����wJ���ƻ%���|��4�!T����Zb��"i�i+����	�ڙ$�DNM����f�%��2�r���L����*�4}m}�H��'D8�n+0@.��0���3�� �aĚeZ��ㇿ��4�[��
D��4������*@����C�o�A��2@^h�䈜�Pɉ��H�����ă��6�3��!��Ct=c!���G�*���J�	8� @�&G�QUk<�L���md���C�͸�9i�79��-=4��T{����9~[E��Vc^�4�
Ar����^�����������/N��o�9�XW(G�A�7%$6	���C_�CH���툅��]"=="�������DS���#�Z���M�[�wÊ>��X��=uv%l�d[Uv�O"���1uA?�@�#*�Y��P���u�i9�`����zO��r��ZZ�����$j�'a���5+SD{�T��xYg��ǐ�{������NH� K�7!������GQ�������t�!օ� ����̙�O�~"ɩ�pb�=�F7�TB���(tH�XO(%�Y�0�R�̆?�@�(DC�Sv(�H+�8����<!� ��D��fC}d��Q�����������1���^��u���D������RQ�� H���;�p�60�YՏ�1#	z��5%v'&��i��ۉxQ/F�ϑuA?!G[�O>\\�\g.xۑe��F�AI��騩�p����U�ɟ�=��5:������#}�����6��·��~����:��A(Q`�QG5_����XmV8J0�� MN|�['�Q��e��v�%��%�ze0�3��3bDgyE�[6��z����L_*G9N�R��7��ǒ]_��*R���JٹJz��si�����y7'W}qӕar�azRn��_�n;�NGe�T[�S*5�M�V����2���:Y���v�@y"�,���$	�o�Q��/E%�%�ϺFñk���������3p\N���F��.��>
$��i�.eq4��Z���J�3H�*3�>ę��y������专B>9G������Wa�X�rw�Vib�UC��Cg򦅎6u�YV�VS�l�ŵ�m�����v���~M-�a�b�2L��"bp9���!�Q��h�������
y�*|�)e%�к�F#�k��M����蛗����7ߜCn���7�|m�����f��4;ϵ@��l��7�[޽��r�JTCN��?�3]�����5�\P1�K�-==    �Ù�<f}Ҭ�oc��Ao��+�Ϗ�Lv�P\�vk��U��F}e��[W�qI�������OrOM+RH@5��(�C~��r P�=������r�.*z�b"y�~nt�̴��(A+P_���5�����ÛX�觛bngh՜Fc�S�@y���N]��G8����w�q:�őE�א�q��<�u��x\9��"_20�q�c�	��ڐ�3W�t@����C��e����4X�����sd�{��G�b���α���e(�Na�?s4�t���r<�C�??��	�5��vU��
�_(�>ч-&�,�Rt4;C)$���ތ�;l jh�Uegy������Zs���*�YAȫ��4'��"�YH����+��Ee�T�ǩ]L�q΄������"rI t� ��n��6p}H)�W�*kbQR�i��cRR��9�~���	A�峡�/�D[��@���������v��.��/�h�>�[嵺8<zm�[�~�&z�����7�Ս(k��o�N�ll�foF4�	�����;�W���!a�F�"Y�Vx�n�T��Fy�"-���%�\/F�b>~I�9�@�ܔ�?�-vN���/0𦌿����S����tiI�K�m]�]Q84���:��'R�gl!�5�4�v[?Yo��$ (3V=E"EN�8��]��\'_-���ɤv�����	Z��XK�'���Tr'�z�y�b��5nR�/^_�ù�l��}����������o�������/���aCZ�M�Vwn�"9%X�@*��h*��o�:�P	6�~��~��0�Y��*��J��Ş]�}�%�;Z��3�¨��h�G�+��7��RWRym���y%��g	bI]t�݁���$ ?zHCT���@�7����o���Ԍ�k��6f3e��������fۢ���*���v(D���u~6nG��x�<a�m[?�E�ku*��<ʍ���Y��cS�*���յ��1�|襺O��,�hȖ��G�;ޓ��_�S��
�=/x������.�[B��q��OG�0�W��Y�,�yS0Q䀿c=b$ y��E!px�����N�>>Y�_]��{Fz4���_�0Ư�W3���!��i��҈���TԳY�!@s�u�[+tx�g9X:�~��I���I�d���V�	!ޤ�Zsh��&7R
�E�Mq�X-ƮI� ��Q]���KL���&s�8V����C�k"~�s�1[�R�
[xZk�j4�#�ns�'}�́m�0w(���g+9�96�I���Zx�Q���sjp��������v�j������予�deF��5�>����*�%�BO)FMAS�(�jP�IRv�����- r^r��!��C�UD�j�#!�j��
���䆤5���`�Z|3p2�o�vAE84] 룒�	�>��fq��B���?M��za�VJ���I������,��u9C�����7�>���wg��o�?��
��?)�]�}[ն��ɻ&E\n䷨�$� ���J)oؗ~d��!r�J�Z��9?��nV���B�Q9LU^,���nL�"&�W��V��=��<������V�f@z&h�)����lyHqSH��	�> �E����F�Őݕ��^>�ty�_����W<��;�;���R�J�kMtز]�ܤ���d�H[h#}%���艭�#RyR*�T��ğf�h��'��r�I�A������nM��u��|�ݟT��(ى+ͳ]*[ٽ���:�6���nc�6�\rR�sL�ۓ����-�9/��{M�Aq���Wܫ��o0}4�Rc�gQ%��f1$�+�|��X��=�.s�\��?H���4�7��M=֜X����#�(i4L3���wf�@�ep��G��C�$����Dˤ]N�������%ir�`"���V8%�Y�)1WI���G����g�-HőP�$���W+Z��%���sp�t�9N�.K��̟1�W�cVd`��~��y���Q��u9����h~
���w�Vt�D#���,=�.s�d,���.�k��:���tZv�%E��3�3�_��r�PU���dyEx���p��+^e�����}��Wk�O��e�=���3='���0Њ�vH����ňm�36�����Dr�`�ߝ\]X��{���s�ߐx��vg�B�`N��:Npk#�_\�2IOMN�}�3�5:�_���ez�S���E�v�Y�z*�r�H�vVҾJ����B�*� �H���v�A�3���"ș���)�E���td���`8Y:�u�G��6�5��dr��B�[`.ô)���*"29M!�p6�ٜ�����~:����pٚK��n�#�󑺿�6r	�dB7�c�ۭ�e;�x:F���/ޭ]��`]~�����b{pt�p��$x�D�v����^��i`��%]+�Vx�v�}z�tf��rk�~N�Q�����I�W��O���5ix��*�rl�kLUf��X�u����y5���� �j�?M��.߇^����7��\�VɅ��(�,�*�6��pm���I�:��s�$ۤ�kJ/�����LR�8���K&3�+�������'����w�Q]N�B��ȿCLʑ���e��a�ӛ�wA���j!��Ӈ_,,0���P$����솮<��'��C�=�9���-2�֋���ӱkv3�=�c�I�{�.�N����[�_RL$ f0o�犉��~�e������;,��]��"Do�%��Wc�:9{w>����R��[� Ō��6��[;U��w��]�F)��o�*d��D�x�p%�9[�G;��<�NJ��G�}9��|Xx�m����˦G��n3_s��i]�D��:�pק2�Y��Y�K��--�t��?��VY�2������	y��������u���ڿ��3֫�o`Y�+L�Hv����/?Ȉ����[
S�J�`�����e~���w�����1���-x�
����$ �Ƴ��4bO^��C��"� 5�\�Z1ܐ!�H�8��� ��f앱6c���?���
W�Qt4D���B���	B�(��yO�i������a���x��fo0���s�N���*�"*��m�������rH��$�NW=C���c9�� �5o"�����.O�1X��:�v���wmx�z�mٟ=�<�{�X�A� M��C�𐋫�LGe��O�~0��+ś^�\~���Uȱ�n�9ŀ�L��D�
�Л"�&���Q��`�6��B�� ��pRZi�L!�ڪ#�1�|� k�5�m�:�xg���>�"v����FIٹq*+e�=����{����C���l���\_��Z��l��-�x�%�3���ߟ-<����S$�rC�*ɒJ�\� ��v%�M�)�A�~Au��O�1�jY֜'�`zd1RF>���;J��#h
��y�wvCr�ǜ��Z�������Q�̪�/Y푖��l.P�x¶h��jz�vr_��Gҋ:�q8ArM�<�Sn�:e�6n틁��@��sg`�Ht����Ի9��d�N�\�&��w�� 6�/�;������0ȅ��L2&`D}�.���I�kZdYҵW��E6����R�b{�M���HEexB#R#���c�[���Yf
;,%]ט@����l�{�́ �<�i�Zl�_:�����V�������a�����b�F��[�R��}ok6��4��ݛLD��-�ٰ�(��rGo����h�<&R��5,����5��%��ڱo갇�� W�(k%�!^��3X^�1�+H��U�Ԫz����g;�ȷ4�|ؿ��0��b
i;�ȌV��ȩ���]:�o�~x{�R�@��y)C-j��]��]�SF��X-N�5��ep�Xn�s��������e��Z� U�0��"�c/�?y�[p��P8�����y��G��4S$x�y[�0�>[���م@�����"^�ƹ��cU0_���y.�*��Dɫ��4��G���O��`����    =E Pk���X<�ud�ʤ�������wG�K({�7~�o�G6̐�x�Ⱥ���$~������3�D��'���ZH���*6�p �O�U�Q�ª��F�aշG(�m���v���Y���g�mW��Wd�[FV/;dV�na��avjo�����f.�fv�#0���~a3�9��c3m�z�xthl��)�����a��`�����H#=S��p����i�ߌ2���^1���Yޗ�<��8E�V��F��j�E΃ �-����bAN�H�9A|${�Ӌ:_7(?%��$��8`U�0�إ�</0zƦy��A2��/+{6�h�k?q��iQ��6�0jk0�BA��y���C��v�:�7�8�d/B�Q��j=��n�q�s�"b������ *�#�Np<�0�'�\����_ �8��s4a �A����Z�w~5`3�y�WϏ,
����c?���l_3��c �ʾ�[0��}H�������35;���g��@6�����і3���N�	�Xײ+Ȓ��);�ȏ�����@���.�M�cq��;�괤�7�68-�������U�`ls_�}9�5w�W��k��������])�p)�~��!T��͡��8���θ�^O��(�>��8�,�Z����e��+���di�dJ�/K!���?`рT�y4�3ȅ
�&��V�e��f�.dv�c�+L@��T�� ( ����H��W<̭�ݩ��g]��pW���]�6�>�٘1���Մ�8$��@�X�����YK��_�{e`����XUˆ��:E��Q0.�$枋��٣u��a�{��cpi�HOg/`�Nxs��o�eH�Y�إ,:��|-�����G�[�nCA?���)� �iS���w��{޼څ��\�	����-�)����i�������X`�vO��B9���%��k3	��'�������,�� ����4,0	z�b�e�ښ��װ�(xI�La�gu2�_w�X�b6�T�5�'��/0��(����SR!?k96]Z"�g�)/���O:Nq,��~��
��Y*MVJh���!p5���X?0w���R��@Ӳ�l�;US�:PZ�t"��m����B�~Wz�����Z�]M�c��eݏS��Y{WIF�/ 4� ܀EC�?�Ж�-|J���~��}}�JάI��nH���������(�t�P<�?�R�)���M��(�΂-yET$��*gҿ�ߕ�q�����pO��d�X��X��Q��R�NJ\*W��!�T�m0�� ��V��gh#k$��q�$��ae&Q<�ҳM<Nm֘�o���![�}0��[��U��x�Ȫٜ��M�l9LVf�j/; P�LP@X�\hl{.ض	5ީ<j��2��_=
�	���r����������q�g���vUќ&���!������Q/�6B�^W
� �����܀��ˎ!����Ho;��uX�j�A�L�1b�}<Z�kRkǖ�FۺM�o�W���!�@IN٣� �nBc_0VW^56L�2X=3XN,G�09XBg�X=����:,�Z����*v�m���W�����'��9|��?���L�V�k����pT�}�$_H�/J+���AL�q���$_��S����z�������a���8b��·m�ޚ��t�J��E�[��S���p���m�c/�t�ח��s��!Y��xϔ
�gs�-O�
e��h������^�	&���rru�Ep���e��\y��/�P
]�Q�x&�Uj�LK
��{o���b~��e]t��o2:!v� �>q����Vz&F��/�P��v��K0}5 m=�_�������\�(���/A��d�ǹiXoID�p2�s� �+�W�ڛ���qb���(
������0�~�?�sl�7�u�i��Q��vh7ZE�;6�#�O|��uo� <�#`��0>��hh�P��,L�@��^ф�c��w~\�7s����l�Vw� o&A�{:80�f0ؾ�k���ļ�����a�n��i<�B�]�B�#�$�ڰ���H7^��M[i�8�ҿ�S��c0��b�p�����rLz��;-�֢��B>���'��=4��h��hۉ$>��9�'�p
 T�n��q����Eڵ����x��jT�����t>�[�~����ߩ���9�����@��@洞B 9�ی1����pq�i[p�}�3ur)��^0R���f���{�������H����o������8d߯�����q����q�&�ڍ"N�}>�[h����
(,�ղ݁�J�� �d�񀗔TD͔��ц�e5�!=[;���W�����v�I4�M �B�(W~�D�Ζ��.�M��Ƙ���9�	�!��8=�����$�E(�u:n�x�5�PG���VsJ���.'n
n���:�f��/A�Wz#ϒ����ˇ���<Q]/�v��o��o����؉S�B��F�ƌz��5:W��o�dL��&?E�#\2N7^{�ap$Q,������/�����'��7�a��Ѻ���������:H��F���	DR$-�$�3�������m��Zkޚ/�)Y��KȜ��|뙴@7��z�x��"����� Z�@���w ����yoQ7��o�.LVyH~�6A�AL�P3o��ػ�A�I0qҮ������MQ�av�Y�@\3VNдZ��$�1��̿���飸K�?-�B��F�[�pz�m�)�:�vu	�S���e�Xs�!�VBN�L�aD(��Ⱥ�V�sqX����9x���m����p�,
�%�)~g�;O�d
#k���;�ċ��k��7%]3��K�o��x��^Ⱦ���b��0V�S+y�1�'�/���I=���LHz?�9��l7ٍ��~����q͋�U�%'~��Wt�tM���.+����Y�	B��I�KC�і�����{�x+�~ÿ}[���z�M����̓�m��>��24kd��p�K�1mZ�f�8�_����S�Zy<�	���S�l�����8�%��nl�\W\���
�`"��w'gLH�pC�1,@W�f����s~|����~z�vE�I���I9���`<�b5U����)�ρx<4"Ǟ������,�Sd�MVQNR���(Z�����5bb6�sJQ,�_�D#Y͆,1>F�H�����
��(�j��\�A줂E����8�F�N�Bn�g�2���o���F&[���!�����#࢏�]�����Ji�nq����Y�\e�S/�ɩ��8:���۶y��覼�4�N������KvE��;u�ެ���z�ޭ�T�v*�/kM�HR�Կ��@.��6q�
?����p���*�vR��~2��m]D�/^��h&z��������A�9�� ��2%��=��U��6��x��m	9�l(�R��{/W"�6��08C�vbN���M��t��*$i�|{��Ftn��rCӥS�����>"�4#�Θ�1�ڷ�9c��&+	)��$Mo�9!����ņ���������D��DY�b�غ���ܦ>K��]���A��~&�crd
�<h��ibzPk]PS�����v�@u�3��8�r����W�����5���3l�{Jݚr�&,�-x�!����S��f��ʬ�N�m�ܱf����c��j������ ��]�ظ��%d��)\ �;J
�YA����,��?�� ��ī[?��:$�����~��>F�X�;��"pM#p��f6��T�M0���5��c�h����Yt L?ͮA��Qh7�;,|.j���i�1�O(�'��KB��hu�*�s��J�a���!�tƻi	�:�_*O}���£F�w'o~L��1�-}n�y�V�:�F唟�����~��7�ÿ���3\'���@�c�e����ں�Y���A0�([����sF����i`����S�<N�4:A��_�1�ŵyJEL�Nc�.��P'�}����_C�!�c�C�f
~����z�"I�:�#�i��Rq��qqA��@
�)�    �+���r��h�]��˔[S^A�%�J�����)��鏿�UJ�t�z:"�f��cvU��XU��.��m�ğ�z������aP{�ܕ�p�<�&G�Õ�oE��Ã�5�B�i����e�����ń�\�A���`�.���&�|Cs�����`-[jsM<�i0��0=�iBo@yMc��������g�YF��4VpD�}4X�2��H�@� ��N{�>���`��Mi�W|��}���3�B�FS����r����A8d��H<w��}]\���pY��}��|�va�mZ�����T�(͏`׊�*!�����؜AJ����y�#d�y3+�%8فss���B�{A_�����Qr�(a���6��sf�(=c��?"2��G��?>�Z[��|َ݀Cd��h�&^��� B[x�=�:?�O�#���Ga�� bkp�9d+��_��E�@�+<��]d�2t� ��A�N����5Y���3)��`W�)��4�4 mC���gh&K�;�cO�*�c�G��F��Q2�sU�Dɥ?Ip�w�[�r7����S��!�!��ğ�9L�Fh��C�<�ׇI5]�2$<hs(��$���Z��$�HC͸�MB�`+#!�6'�]4�H9S��=�k�y?�<S����>��;��y��S�5u��VQ �R�W�vzס��A��KH��N��a&����8����T�����ͦ�{?z��g�\��ݧ%kT�E�91�N�z�J�e�c#;|�l]5�K�~H����[�M؁UL�6�X7b���x�mdk��-�n�aV�8%�bG��עm��	��&L�Yd��偒Ă /S'�'��횂O^��ҽٷ^��E�0��1]��N[h0J�Ҵ��ʕp
������ھ�̵{"ȀT�I(�mU�6��
�v��y���ğ�ӌE�H?Kag�/�a\�w��!t�%���[5}.*�����4䅲���?f�>��I�EFZ;�°3,�)���d3&�+�g�Dk�)�a]׼{�)&����!��P���$Yk_�P���dY�[J��|�U��kӏ�G��	k~JS��ۃ\-p�����e�i0Њ|v�Wl?���~I��;�I)a7�,]P�;M�_�Ȫ_�������\ǐ�|�C��Z���-yTk/$�����T��F['�].�g�����㏂;F3�$��ʚIz9��sT��¤�TG�dj���¥Q3U$^(�GG���-Mۀ�Rn�j7��\��
�*�%��D*����ix�x���V��I޲��};[�W��������LI\W'��u�'u�Ė�����-�6��2`Ĩ&ʓQĹGp2\�2B�n�P\�MAr�G-��Rz(k��k��Q,�B|�Z!j�!���,��c|m���t����1�tG���S�>� M��=��2g�����VZ���mX�~䥋�9�)ʭ�DN��y8���.�1�M�2��,��3�P�w��`�����?訶 ���)����ߺ���J����&[%����؋`���Y+ݫ�DD���o|[���f��}�T@!�ٖ�ߎmTXS`��aI�1�;edx��|���l�[���2ޣ��d����g6E�0m�/��Vt���Ώ��]�m����_���$��[w�m݊�O���"�Wt�d��4��cW,�.�@�hB��+��
��Y1޿�Y�rx8z<RR��J�:�r��*�i�]j���N�%���MS����ͺa��Ԇ���t���Rxl�p: Hэ������cޑo�	#��G�CB����Ox�6nv�DK~b0����b�� �����N��y�)M)#��GR�P4E�����"��Ƞ��g���<�g�U֋q^l���߃�ݧ����;Gzk��X�4b��	������V�g�E�uLu�ˆs$W�,a�WBi�3o(��=�x{y�n'ܡ�M����dJj�F��������	��K�-�Cx��Ƕ���u��0JQ>I	�!b�
4y�Rո��:+�pm���ϣ��z�K�5	Qvxd³����m�Y�ax��w<�:��Ė�/�5~NԱH�<c��\ �D�n(n<�F����"쥨gK��`�k3/�%>�2k�t����-}��@��QH�C��Ν5]��%P�~�{���`���y��y[����;׀�ܲz�*e���\i@�2�4��T(a	y��~h�(�@/��Z[&������얾h����C��C�}���	�6/Q�rX�kb�t�@��Q��~W��#@��ly���^�������"�>]=>�b|m�R��␰Y��&����L�x �ٟ|0}��qjB�\�R��h�p�%s,+ܥ��EuM��W!N�Y���0�e���6
e�k3���i4��n+��ˠY=Ii�y���=.\c����t���tT�߫Gg�t��a���yT�x^v!ŝ�'���>�@]�=�Znǰ�Ah���iB��u˩�W�}�<��a��D8�R�]a��b��1l��F�����]�8E��AL�*��>m�K2 ���O�4;����N���������ws�v\_�εh��]}0�Y�Y}F�E��^Tq���e��Ҥ�2Z����Z:��CH����9`���:��".ON0����p|�H�m/�4x����B0�&�S��VS�z�LD�('���R^�ǁ�҃p��p#B��Eb�G����oa�t�]P;��v��>����jn��ua�|�n�Q  ��à(6�Cb� 1��m�H�He��>0z� JE��i-(]=_�MO��\Pl=_%di��@ ��/,-�>�=�X��h.tjj�i��"Փ�@'�w�7Z�RW�Ƃpi��x����-=�iW
1�A���+��0�R�K�ѷ}R�6��Z��"�~��_mԟ7�8�p��V�T����h�"4���2��9i+Mh�۴�B�� G�$�>���8k$����J4:�if%S��D��%Z�<&�H���ݭ9�V1ʁ��� �xcŝk�M�܍4=o��N�cP��{?Ƥ��\�{䲮��&�;��W��e��Q�͸6�2�r��K�fh%��#����6
�/��g�kk��w���o���8}����}��^2�����/��1��~���|c�^Q2�{��~��	���!�<�0�L)'5
�n���̦���,������Q�>������p�Lr�D��+QV����}+VÆ�mj�eCBT��?GF��.<��%�����">� 	~�H:@$E�'�}�2�p�����w�w��!���a�}�gC
��q���
��.�e�0zn軾����F��xq�&{ݏc9��.��3mO-�L��:ES�~���	�"�Z�b�⸧����Sm"��KZ���SD)�c�;������F!�7��]ƒhѳx�ģ��߮?�7:~�����l��]1�зg��Ez�݈�z�;?)�);D�G?<Yo3<���3��!v�����|����>4Cv�0�J�u�����U,�����a��Q�q���;>�n����+�R�R�d'_�m[7?"�u�6�1<M$�I��.<�d���j8�+����=c�b�;z^����,���w�v�\}�@t� :]b���N�|�i�}+��Q镠"�%I1�|���/g7iʫ���a=W�~g�_��9X��ᴔr6J_�A�.AM�ܔ������ޭ�
���qKh�-�пЏv��&4M34�c�;�����e��Rl|� ���T���.gR����1���h��G�s�J��T�aT�D�F&N%6&y���ĭ���� �/4A?@�j��+T-��p�"J�֚�$+�;g��v�)-�t].��UU6Eh��oˀ_	�M�T�E��P���,2��?#���屘����#�m�kl:| KXw�����'�0����vi�o����pf���3��b6��i�*a�K�~�4����]��V
�,�/B��� 1�r�Ӷ����/�P��RQ�`
쇃7�pU���-jd�Z\�	o!    ;��1)��]4��OV�v�#�(L���\*J�B�
YGW�ge��n�IxW���5#�S���}��E3i�)a�u�5}�w�ǈ"v�7��7A������w�����f�
���atz�<7n�z독���:DU>�D>e[W��0,@���O�RY��^�w��eS���6��Q[���6Kˌ��
�6�cZ�������za���g�W�����Y��8��:��ڭg��m�y�6��PǌP�' ���*�!��;Ѯ��u�XA8l��u-��5b8e�3QZ�6�b�s,-��߼�[�(f������#(F{�~�A1�d���s��n�1X�*�����3d��@�#�G��rq��_l��T�hp�͸��z�zz/�+��M������)EZ!�q�*ΦAǌ৙����Sџ�����}�/�_��zg75�9s�j���I�pD�+���$�� -W��#b�&��	O�����,6��Y��#ڈ���&f2!܏=#N���|�}��)t�br�Y<J��ND����l��v(Tջ�X�A�$N5)cTȶ�bQ@�v�)�#�����d��*�ntڗN�Xϵ�&a��P�e�c�
��+mr���Nˆ�#;B��0�
��,�aX�<ODM���Q�e0��^:��?z/~>y�O����������gƨ�-����IEe�(������fT��3��#��Vw		�Qx���>���vGo��೙�H+�@2dZ'�q����?��9��
g��g��J�ѺĖ��Taq^L.��.2��8��~�9ݤ-DA"�m( �G?�}q�B}�@N���˷15�5�����';IS�Zt�D9���# r��e<���	x��նǔ��������zu㭻�nE������0�ǧ�]����isV��@v<}��)�h��y�J��i��G`㘱!?��x�*�X��C���Ѱ���0�D5�,tW9C����T�{w���"	�E�&L�a�H�'�"����X���`����m�<|����#`#0���^jhG���ʣ�zt��	}���v��_�����}�$��W�32�T⽽8�K{8�zm# �`"%P�#|q���+��
E�~k��m��mݡ/��_�D#D�)�3<ӻ�e�����rqu��.�J͢da̽a�N����>�Hu�1߇Q�,J�b�B�I�q��F��G�;��u�n�L?��.�<L,�F,L������
�&ߩ]G���Y3DF�lu90L�FL>F���Ħ��=b�-C�M����?6������pꃃc��Wx�If�o5�ϖ��v68f vmGS� �P�a3Q�|���S.�I;F��9a�j9xSj��	<pw9	� n�.F���(��P��mh��UR�=U�����SQD�<`%��K�<���0�H���0�����<\Տ�6�Ȕ*}�F��ǀ�ީ~�&L�^�L8��(R�ɩY�د��
��5�?}~�����櫺�շ�GƙZߎ�p�}e���w��W^���{�����ۯ���3v����X	/�ۯ�����ˋ���E�7��}���ϼ������-�W�k�Vz����f��a���L����7��o�j]�5�Z;&���T��{rǶ� ��cr���[����Ũ�R�j�$�M�)�d��M$�_����T���6�(�N&b(�d�H7�3m��Se��Ed:5��ߝ��t�-�}�~�M�۫��h	�@����sN�2��J���ls�-�@����O��m5���P���c/�V��s]g�g�jȲ[$���+	O���t,� �D�r#��־cMo2�kw2|Q{(?t�to�0-� �M��K@�=IP�m�]�q�!��������0�����XE֡�gwоy��+��v��d��6�67��cH��*66�TFFG����MCq75������+�vW��|�����칿C��G�R��!O�ҨlW��lvT �{��T��y�O�9z�5<�t�%[�R�$��%ٱG��c��w8y8C�-�kY�y�v��k=�y/8��!�aZ��(<�9߮�Ϸ��mM[�}M�������u4�,���#�3�Zv��Bī��&�zѴ?g�i�"7�6�&�ܔ=���e���T�V�_e��!(����P.by ��/F%��N�g�#҂�z��pG40�̉&GJ1��/�K%T��Yd8M�FW�Ƽ�q��������T0Z6��Z�4@]C�g[B����A1?�@�H˄.ێ9���b����,-M����l�L��R����mUT6�ɡ�ԡ⏽@�G�2���
I�٨A�k���������߽��w+����#8��_�z��~s��w�#�j�����c�$NE����u%Z,�����{HI�rdn��N7���Р�C30@3H�ac9hz:h��T��BO�m��3�|A��5x̞�>9��#}�W����f�y�s�eʷ�5������8�&�O}V��2�����׏O#�+W�Fp\�n���l���Fi������%��K^����v(7 p,�ğ��^�AY�(ăB��c�i4�>��Ҍ���?guS�Mլ�pC�Y��u��ݟ7|
��@n���y�Z:��A30
��dw������~Ț,��+Ӿn������S�{G�m�����sD��_���x��._�	�NX�(��^�?�_c�������	���A�:��.�M�,���������`d���p��48�dG+�*�{�I��>����_a��d;9�mƙ\4������ h}��fN)ڳ܁�P���VY�Y�����k���cM���S��|ґL�R//.���˷�'�uf��j�&}����J%P=��N��8m��{�'��spy�żuuh�)�8J��{�Ch4uh�S%���fJ3�)�S�oV�H��%�-�#�ٽ�^?fB���h��-!mY���G~8���~u��:�-�~�dBKnx����:I"��X}�n �C�G��7�^K�t�D^Y'���F�d�Jo*	�>��:H�[Ǫ V�uV�^ަ�M����&Z�.�̜שO�ԡ��xq�xќl������S��,D��x�f��:�欍N�6Z�u~v���JdEۜn���Z:��m���Xw�F[F��V�5w�]�n,::,��4Ewr\D�D�aE��f�V�w=/��B��9�����4��@�E.m7��.�����V[���Ȯ�D�Zʯ�m���"U����VRn����俕����̧�^�N�j�g���t��;m��{�I�yU�F��+�эS�Zh��P��^�i�5�ich�m}��p֗xE�ܔV���Ç��=+��{��O��Ol��C��"}
{>�sڒ�ص^Xg��ǶA�����l�w�\���B�ZJ��AnP.�mp�Y,pE?�F����ȳ��4V�&e1֙�QR[�&u�9�x��.xC��ә7
~��[%0TpIz��Ϯ�<kvXA����܉�1�b�l�P�5ر�L���An��E���������R�`#���ډ4SgS��ݠ�nW7O�����T�U1��O@T<l�ڭ��'�PK��8�jLO��~��������8օb W���
.���6�۝,hN�I� �2�6�76�wC_�QB��c�xn�Z*P�b4�uXl,�d�s�v�j�G�{��������.�J�\�Z:���,�,�bg�{�å�G���!w>*3�]��l7�Y�Wަ��Ad�͘GaVD0'&JJA[���x��"����4a#Y�d*�@�4���@`��'o2M]��z��~��s����M�ps���C���#R7�5h?�[�OspA+�1?>�U,[�ã�?{�1j����Q��;���7��A��AQ��R�VG[+b#���X�ͻ#{y���}k�	����jD^�p#��Q�LyD^�p��F)2s����14�h�R/�B<^s^<}����jWb����s��M�\�Om�K����cb�3V�����y}<l��qv�����l��s�NF^    c�"�
�[ϘI'�!�'F�Ս��h���d� ��W�	dY��r�� o���"YvL�tۺ�y��HN��N�w��d�5��'��hz�SM���i)GRu?ak�����ڕ�"aQE�P�蛌�Yb�$���Ȫ�^iB�d�ϒ���d(�������)�Y�wDg�66-��su���Wwj'�%���'l���}��������WR~ʀy;��g�5u���D�ꨅ�r�x�(���9�u�cH�tH�\	[�#x H���(��g��h ��[:�&exd�̋�͆~���:��Ǩ��>[#��b�2�oI�ԈS��T�o)�v��.�.�sl�J��m/L�[�8y36�8�����D�`LgJ�S���p%i1/���:A�����^iE	����|�`k��u�L��n2��|�%��>HT�J+���c�KwK�V�V؛]'�6b�"xqɴI�x?��i���`���2�>����a"p�T�[��Dg�D�J�X��T��?�I7�
�ٻ�Yi�S����9�z����s��(b�� ���_$�����u��Ux�j/�=�?"R��Ct����'#R��~�����"?�(�b�P?Oϰ���yp���kzp3�����>����@���۽5�ُ���tJ��-:
��(<2mIqDHJ�W5��{���W�M�	¼���ĚA�H�䃳~b�F��aó^Nb�x��_��zvq���1��⺸��9/ ������������/~��o�WL�0��	s�V��=��]�޽�۞�yƈr���j����U�?f�<f`����WG��	��������%���'��bGT�V��J�*�,ݾbp��c�~���>lFR�����_��S9ƩF�X^N��f!,:����o�;�d,��S��at\����U�i��v,�v��1c�i�}Ӈpm���RGD��r��OT��"��oQ��R,�x��w;B1U��4�hp��᭴�I�[A!+�٪A!I�<�Y5��=�±�Z;��e�,摅o�+��^��L|,�s�ű�:�$�(���!nW�b�IW�?��Z&,b����1����Z�����$5�9�ߜ0F�Ck���]2�9�=kZ�N�����)�!c0�l&�C87�}+�t���NؿÇ_��M��ŕ�y�%Ň���q0�P���=�Co������;u��>�T+����4��CP�$�u�
��.��H�� X�^��n�G�:�k$��h7֧嶴���X��\h���?��+�S�=�x�	��^X�xN��R���p�O�a�F�=>��(�7����a��[Ǘ;�����mT���7�;�A;����T@[��r;qW
��(6��g 톑5���#�٬���o��%^�q�\�hg+���3���k����I�*	Ѫ䈭N���/�x67+z&�����I��:�����������}����ܸ�[&G0q���h�jx�o�}��Mp��܄�HW��~�k�~�s|�^ҤT�U�m�:\>��	��I���O��4�D�>'�ղ&�N��/r�&R����aȿ����5�SܥZ�5 UG.�\�A3��Sß�39����W�����ey��.�@���j�-[��Ŵ��;e���YJ��0����,���8��j�G��ѩ�|%5Ҟ�p�쟆)��ީ��pncM�R�%|�h���z[�Ojpk���\��,o?���&�]o#&�vӄ��x�u�q-�n��UĤe�d�'�>j��?�*���d
.u��x9h�Ҵo�O\_�5ȥ̄F�p}��1m��R�P���[����W�`�\�;�7k���՟�*륜�L��b��z�#��� ��v������i|���p�N�+�nq���E�c®��H���ܹ[u�L�1@�dc�8m#0���
��4C�dh].C+Ѧ�O������ ���[�Q�k�l��N�_l�msdX��t��/t�fAc�A^f*� O����M0��PYW�V2�|�ف���.��7���](Z�w�\E�,7ozV�R�����J	%�S�&��t��� �m�m������M��Nۂ��Ǉ�MǄyo��+?�t�>��[���[_]t̳�RiF!}�!1}R�2"Y��u6��j����&��D�h�$��|��Z`G�@�*`l��* ���mCO'���.`ٜ����i��0h�����%�"�l�?A��T]l�ni�\j/\:`�,IbHmWMX���r��<v@9r��(�fJR�B�vu��~Y�WΗeZ��,��t�i���h<�e���7�?�%���[0Wމ�
�5��.h��K�G��vpU��n�q�㽔��خ�U��z����Q��)+�E��Fm��0��<���h!D{ZD�0D�N�Q�چ�ކ�i�E4�>GA��݃��;G;k*���/;>�\h�o��i4�ؤ{K��i*�eP�9/�nr��O��AƵmu�l�J���nnkd���t��#W���O!�V�Fbi�̦ơΦ0��̺�Sύyi��+3&(�y'���ҩ���G��/�׭�X���)�C�Y0����eN�&p;]af�_�PN�<(s��z��&b�T�m���h;S|e'�O&�̿��+�kO��k�4O֣�:�-#��&���|����K����y���!�M��t��xa�%l�~�j'��p��;w7�W�̵C��%�++�X]G���@�F��]_�ze��%n�x��� [�j�4�4�&����l�I��Э�~vru���FT����MF��c�v�Q�v�O����U�۪S��^�)��C��.���y�8�8S�+cކk�GM_�́k>B^H@˘��6c���%���s�;��T7�R��mz�/ڴ���B��)Y��&�H�@2&��r���Y���cFWp�"*;X
3"e��O��9�N"pM}���퇊�Y��bU:ԔjV*r-��7Y�(u�+*�l�I�T�B5�}���]��i�핡;O��3t�J�ǣ�S)Ϭp�yX݆��v���9���
�zd�ׂ����t����u�ns�N�h�T�S) �tO�1���w~�j�[�t�$����2�����m1,��2؄�ݴs؊(�mħ�"�ݺk�D^�R�JJ�=�B��02�z�P6��5&�9|�[��O��.��R|r#���Qr%�* P��6L�������?�f�!� �Q�6���G?Ue9� �&��?Ht�@��4h&9FMI'y�0���R=��9��н��OF��,��Q��Z�E���Ӿ�&E[Vf����"�DO~Ȏof�`Q�9��y2�YZX\c�u��ʼi�f����3X��k=|�d��(Â�f�g\��i�Ҋv�E��и����0��T��2ll#6Oˢ���1�RɘI-��5��A��Oٞ�ǶY�풦��Z���V6$��B�6BS�!�6�5���	y�:e2oFȚ��M��6c\�Q!�"{�]��u77�����y�J��/��G@�6 O�ʐ��,<1C�@�Tmy�����B�J�E,
B�z�F�<�f���=���Yh�bJ0af��!U�A����u����h?P�0�v|���U~!=0+w��k�YrP�t�,�:6J�����c��h$�x��p��rȄ�F�ff�� �D]9��r�AcUb< I�Fy�7�� j
Q갲pf��_t5�8EP�R�.�e��ВD���W`�k��|�fA\���_�?���jÔ��`�_��}7����c�X1g�g���h�y*u�pt�p�r	��
��8hv���^8��$�MĔ]@���:��D�|� u�%@a�P#JtV�x�%�l��%Ŗ�����1�_ʀ�rJ�zR�ظ5m���4+_��,m�JX�������Ԣ2��7��O����hqG�\���
R-�K٨`�#B��E�ɑ��hv�l驳%+J�G�>�S��U�=��o���7�/ߪ�ݝm���%W�:[\�vک����^�6�v�\�� ��P��u0H��^%$Ļ� �
  ��y�f�E�}
�H���bR���b9@5q�z�a}��AX����]�,m�8���S����2����jaaB����w�SU��V�p��_W�t�m�=lX��w�bJh6�hV�p���-5�>s��
�&���<�j�<�X����0�,c�0�="�������Y�2�e����Ґ32;H��V��co¿�����ё�7�qs�؍���ps�5T�C�p6ƕ�?��M�S��>{��q� -���{��k�2Z�LK� �c?J`1�a^����]����l��U�æ�Ӛg]��z$:d%�ċ��X�(�؞�%�`[�`Y�}���8����w+��lA�Dw�Z�*��/Z�ʞ�<�n�ΰ�G�u&�#�-}8���s�cK	8߉5|I$���8Ed��QpKי�1�YE$�ތ�/8vMX�W[iw�{0?:_�g-s̆(�n�����iº�����<�-&7��wā�sŠhFR��	����6<qA�Ža����gv��:F$KR��=?�BP���쵥{L5�Ba�ݫ�C@�L����U�n��`M�n%�,~vc�5���ѽΦ����\��}��	쁸"��������o��zš ������j����H�}����k��R�jCD.����c�ͅ8HTCH'�_����I��opf�>?5DX+�Y�����Ӏ�.��٦kn^��9�-7>!w�Y�)�z\������}�sa��gp1:,������6e�t�8����d�D+3ƪRwM�ڊ��}K��ZT��K�u��â0nJ�/�&��Z)������뽋7�Y�\TRF�P��$��A��ZD�0�@&�X<���A�W4�p�NY>���V1��D��s@rwZ� qA$sQH���d�_[#6���+�s��Q�`|��BnIMcU�$=-\��+�qjg��iX�cG����d���om��-D�N�.�b �V��ab2.���`�qSnm���»���%�
���.!V�vh.s�BDwDR�@�F�3r��!�fhŊ��b˘�=>�S����b�Z����x�b��	��_����d?�*�c�&��L$��Ab�Khq:,��#���8�P?\é����~�8�a�-6i�̿|Z���4�,�ܫ���4_#�i��NA�>>�	�&��t��Jƨ�8������M'����mG�|�����.$Ln���%Ł9H�}3oK*��@x-������s�H��2��c�<	:���y,��?��ۉ,q�D��p�;s)a�$Ҍ̔TJ�_'9�1'9@k�SYuV�٩�q���u\�����8�t�
�F�9��X��	�3"VBk�rHK�2c1!q���ةI�ȩ{��҃y�$E!�st��Q@ˁ5^��P+�:�W��U3־����ӗn�h�JC��:6zþ8d9R0�0������E�R�&E���P�4KSA���(i�R�:��/[	L����6|wyu�-Q�f�3<�(v��	f���]�|�����
@ ��
�`���{O������~�p]���wM�����x ����h�����q�>�����A���qyT��.h\gurLU�*�]�)�""�L�s,�~���)c �� 4��� ��𛜾7jA�7mMtU�Lf�o���"`��4�'Tx� {w;���������*��t��3s�_Ϭ!��qL��%���D�܇�~�`&�S?*X����}g~8�(�mw����b���c�+��G� ���)΂&?`�V��{��y$Iɶ=���P��a�w!ã؆LO�#G��V��X�	�ꫨj����-p�2��q<�o�ץ�V�+��Uy�r(�����0\8q,��d�ŝ�K�7�[t��յ�?��X�\$��A���	"�e������(���>���+������h�gFpw����U�!�܂j.R��Wd�����T^Jͭ���)/�XD��.+�I=fд��
���];���E�;Ah��/m�O��θ�
d�Zbہ��oS|�V(c�]���ۅZN}����"p��Kpo����GIp�8	n[2�FJ��V�,�<ь+�Ɗ��g[sn��c{K�4�֖e�����J:o:;��K��ۋ��1PpH�E��H᷏��ݷ��;>�2h�j����6o���>�\+V��
-��Wv����L�8SS��M{c���F��Ul�ݓi#���Ո�[e��ɺ\SG�twxUp��!N^G�uZ�-j�*�|���s�'%��*+���z� �*@7���3�<��-��W��'��*�ekX~��Gk]�?�-r����b�ٌRm�Y�p�*\w���H�=�ۆ">�jG���G��-�M/gb���ϧ��4i�Q���v��u�%��Ԓ�m+����C��mV�M��ܽ7��s!B�M���Z��l�A5^����AV�N��|�*��+���J{JF�P �<�kr��Sk����?�.�3LF ��2^eeY��2�f�<�Vo�v_yg��#���b���O��ȁ�.."���3e�l�Z�jʰ_h)I�Kz�p�*�@ݝ���ȷ@8�CvL�dȻ�%��_� ����L��:�6L�eq��O�2I�m����;+���YQ=��m�]~E?@J��7Hy��My���ڼ\Ywfp�ա�S��7l�"����;yҹrM.���p�m�`� y�EI��e��� �r�H��7���k�`y�����?�ʘL      a   r   x�+�OJ�OM�,�/�4400042��C���4e�1\%���MMQ���cddfL���ԴԢԼ��D�]�D�U�%���2���4��&e����Ab`I�Sc���� <aV�      4      x��}ݎ�H��5�)87F/�m3���`�vy���u�}X/��*�+�jR��gq�b��/��\�0~�������H&Ej�4�]�*Iߗ��������6\D�x��1�?�'�m��a�}����+�e��a��?ЇU���{�m����K��'z��µ�E��_�z��7�6\%�cxw��>�O}|�i~��1����X��/�;�ؔ���.��%e��|,|# _�x��GxS��i�C��h���G7�Q�C����j�G��Cb�+��~�?��m���FGq-�����ǛP��}�C{k����4ik������?�
���\G����*׉����?�ڣk������^W���Mѝ���n�d��2��zFTp�wn�������>'�z��X8�kt�YF���������k�M� =z�X�D?�j�*�r��{��t{���+��Ϊjo{0�,��������>�S��!M�����(ԯ_���ū��t�ׯ���U�me���C�<]'۲�R���Rq�T��T*c��� ���C����7���e�8ו��s����_H?�O��i��$<tX���VP1T��?-��Za:���-���h78�k��B�pj�/�tkÖ��-���*`:���V����#n:pG��G���O�]Ov��2���m�����ہ����7��j��́��a���x�d�5�Q�[��6��a����k��}L~��G)]�6�����&�d�]�ןz��K^q��LO�?$�(]���x���7��f����dT5����22N[uT��N��O�k4�-���˸��Qdb�&���*����n�h-aH�(
ύ���`;�urQ;=	�Sg�`'9�'�J��J��5�@���]�ڨ$���5-e�l8Gr�wJ�و�l~"�-,�m��Ŭj����wo_<}�������#M[��'9rc��)�6o���
� ?��L�-�?��7>W�]Az�����>�֍��e3���nk��6?җ�&ܮ��������?�y���ջk���2=�����E߲Փ}�d��ц�A�G�ֳ�~�&|���2}�>�Ҧ�g����e;'W2��NC��ᣮ�hRodx�+'���i� �V�8��u��v��R���x����^�=�>���U���?#*ׄU��sA����{�����m�0.iTT��6��(�q�� +L��.��^�%/j�cPͫ	���V_5��@��=@m:�[n˺rA:����B[8P�:��:tݲ����>��>��_���L԰���O�U��������S�<�Y����{��|��t��_�	6<i�8P=�M8�ÂcG�]���_@wH�����{0_�}�ã�������{�dYw�C��.7�bI���ƾ�W�(\�~���Pk��N������y U��G4���>Rep�K�	��uc���A=X���E:|(z[8�P�`�Z��$١���b��UW:���� 
�`�VWߦ����p���pr��u�8��~�<�L6�認�1�L�fMM�{��+����R;��@��T�)�ᵴ2�4K��
�&ޤ�s��a_��4M��q��7�<x��>�3�tL���}����b�,�v�er��<���5�6�p��ؖ�]�p���(]ЉlG�'�u=�_�_T�B�����ZO����O�EKv6?H�=I����ٟr���x����N��K�ƱQ|��1�08�P͵�c�f%�[�?���� z����N�3)��r����xsX�8��Q��M�\d��)w����� ?�b���k]�/h��B�-����`*������6������򫕫�8h��k���f��f����8K�$���? Biݳ���=�4(���`U `5NG���cR�m��Qj�a5�ɠ�d�ذ� �>���͏Wo_�n�<57�K7p�li�M��A�	j·����-�%�B<=ox��n��t��:xw���a���M����%�����̆{4�
N���le�rJa�qtϫ��n��R��yD�wDl8��m��
�����
i�� T��3f�g�q�B�/��F}
�U�}�ǣ={{�=��Hg/`�ǈ���\ct@��'Z".=�n?��Ԓ����HC.��p��!Y���R\D�˕�P(6�N{��U c_D����=��8N��`�Յ#���qЍc��p��T�$�~>`h�]�n"XZ��e��:�
��Lϯ*4�)c�x�L�*HI7�p���b&[��1��r4�����p�N,���}�y�,�Zct�A�O;&��t�Y<�GJC犁=�ۚi�q�O���P_śh�1Wd��V�R�Bvc��=��nΘ�5���n�0���'vS�!Om=��/yr��a춾�0��q5 �TD��q��:����֯]D�ya�g!v�k�*�N���4�b��Z��}��L,��M��t���ĕ5=@.�B.r�G�&���p!s�_i߈W����eG����Cx(�S�,{�>�?򎻺MY+v_�����O�zJV�h�J$��)��*����?mᏵ+�
�v~��;%�m�g�]�U�ws�4����7��+0�����,�c��c�x����wDB�q��\���
��o�o��s���/п��3n� �.ɀ]��ߔ���rqx���rq�����u�[��"�%��6�=B��Nm¯��&|��(�!#�x�5��&�y[��D`�V�MU��\=�7�|���۳��%=�0��*Ϗ����˶�}N��Y�Q���a��@�x��eB?���Oai�M�� ����[�����/�\S���xծ���T\�����f}�%)�戇6`�,�r`�1��[�������vfr���C���I�I�T�2�uW�޳߲�W_�V\:;�MN�Χ|����1�Q�ġ.�!"���)h�b�ё�,�8�>
�]-e3*�h{�S*x���M֏O��	�|������-��k�d|	�S��4`��z��<����gI*���D�=K�t)�V�xuX�t��y���X���|�yz�`Z���ɴ�&����M�ǁ�xZE������%�d��&�n����q�i�>��IHw��<��P<1;m��~j�alO��sCfI��FiMqF������	~ݱ�3P�g>&ܩQƧ�q��%TF�4ZE{�\܆�Py2��`Ĳ>sY�ĸM=&3�rq��K��^C	�]�8�}�m�oB@¸����y���Wq� Mf��`��b���M��b��>�`�B�\8�_��0��Ŷd�d�0���3X�<.VΦ{��N�q^h"�͒i%�qL�H.���Q܀�=z�1�P.wO�q-8�@i�t���SDٞ[��TE���C�@��M�`�W{��������5�>
���6Ĺ��d��y�}ۜ�gw4���0}&��ERۆ����l�@����I�gpOS�X���ux�d���u-��K](���F0�/zc�B���=���X,Y�V:uV�A�mV 9U�� [��S_��"�y�p-r^� )¢��sz������ SM�a@��;�x�1<q�t���v���[� y�V1�J�|��c�<�^���}������3� ��6!��L�-� �*��6������"�,�ڠ�t,��m�'��?�)��`tF�2�C`Eo�����۠\Www�+�O�H�����E���(?Q6�~AX��Y"|q2�k��~��u����N��qDg���n�[8
`�+���`����%S�6��4�p���������X T��K�'H(q�i�::j_@*=ρ �e��H�bD�FO��em��h�F��=�ŏ���<;%^�N��9&��g�|�M�q=��ˣM_ƛ]���`��́��Hቄ,�6���=�"�'JD�s�h��lԎ�)��DC�I��I1$��$«�@���b?����ayR5</�Algx��s�i��K�9A�:~�����.�8q��D�G�v[�    �����-����*#lcf �s|��3��Le��iE����M3g�9�-�%���ܔ�1N�Ϳ��[|��h�/V�d���=e�a	��!|{����~S���'�P���"\��>��5~L��!(�L��-^KJ^k�i!�rқ�^o����W��8�;<�C�Þ;؝a����bEdp�䵂�_g(8�dM-v��}�<Rfzx�\�zI�R����x��tS����uз��z���8B�U�hvf"������u���K����	�Rz�$�5�q��
�g�S\d�K��8�oJ?U����x�S��P�����cNs,P�G��іZ9�5П�'�}/��E@�	�Q,��H��*q�x�y�����!VW08̨gE� �Q]�����|��M�f[�lE?~8ִ@��Z,�[�ҔZ���M����:�B���S�xz��6���T�y��Cn	��x롤/p��7�{�������R�� ���|#�wu�j-�(�˥}D�r;=��2w�hrԛs��k!݇��-ʫ�9�ul�y���,L�����-%\)����j#��-i��5�"�ԁnL0وi+c2��%Sϡl.s[ҩ�8>A; ,D�XFK-_(�"x�s�&�1KI����\��e�#��-��{mp�`-���Ue�V�yL[O8x\��/�\��`Ok�z�t����'�o����NәZ�ϑ��I���;1�(���z0���mM�Lok��(�j�-�]�u9��sl)T�]���`�x���<d�A#h�U��$���p<��GLa������j�X�qw[W�H���S��c࿢}�Û�O���C:ڐcNR�y�jC筞f~:�L8>�<F�/���`q;գ�)|vjQY��P�jr���p����\�h���x!��TJ�BL@3�B��r�@�)d���G�p�豠O��b<��
~�� Pر�: �]rA�jyS�O
X�v��#���9mǿg�����7}0��_;s� ��Ѣ��=�1�6��Zc�ؖx�%�|2�N����yrF\~k����ޠ`�k,��X�ǭ9�bUz��G�:�r-��T��h��C�a�����Ҟ�?��R-�FA�
�l;݃�&m�~�8��lcV&��d���Cy�`.��ۑ�	Y�O�kG>^u<�����1C��O�fe������}aQH�@6��B��G�2cy�&}M�0
Ϫ1�N��z�0X?�/U?��:ڒ��&��D���5��P0���|&59	�"��ꉇ�z�#�+��$FS�o���M+���Mo�u�#�F�X�j�;��aȆ�B2G��!_	�^�ۨ�1'�����=�R)����z_+p]V�j��$.�1Zw�gC�!���a�n Y]j
|vT���_��	�Ǆ��'�c�O��P2�w�K=^|L�*�t��G=�`Yj�v�g��)j��=a� \�b�8��Q��8S�`����k��$�o�WTQ�h�օ�U�<:?��JM~�̇aL>��b7���WR|�����M$8�Β����\��z��#ĉ����Qc����Aw��$?A.��'��t`��[D��x͐Ő�C�؟(�"
$�_S��7�:���g��̉Mi�%��k@�d���6�Ê�����3�s"F���x>%�hM���zZ�4�-�1��m�+1�6�x�$Q�k����O���"#�7��Ó��-?���!�]��?��������%[�2Jz���?V��̧;Q?�;����=>=v���<���ʲ b���0rmx�����i�x�G� bt@ֺ�P]K�������yU�Q�l2E��DUE��8	 �+r5�
I9<��0k��#��;�sZ��P@�o�V�<n�*۷%|��o#yj��NW��������^���3���Bi=�:�P,;���"�<"�ېXY+ '�M<qd}<{��O�r.tW��b�0lJ{���An�E��t�6!��Y�?C��e�
���!�3�w�s�Gք��4�_Q�����ITǞ�m���ы�\\4+}TS�C�������҇�(����������x˳��Ãu���;���ɵ�VG�V|ⶪ�y�>�!�Pg�h-O��"gY�����J����7ϰ���Ga���V��K�]�!ڇ������*��LB.�ɖ���K��B߽M6��Tҿ@��]��U��B�!Ԩ_6[�m�[���=����]��o��=:�}������_�תE��&s���Ov��E�iR'h&\u7&�a�N՚� ����*p)�w��4JX�RԺϼ�U�#�"���(o@k8��F�Kf�G���w�=�����k���jg�`&���=�$Jzf�V{UO��qk*J.aWk�L��6����pq�z=c����;�V���=�.8;r���"��xX-v������L��4jI�'��wz�i`�=�z���"�_T/���X"V���f�e|����������n�`����S����B�%�l�:.D���b��ݮ�<���C5��"gf�������&8v��\�+ڢ��|k!y`��K='`��Z�y�8�o��r�1�J�S�ZE��³4�k&�Qmͫ^�8#j!5�g`�OMeU���uU�F�-�Y��Ix%y�h+��`y@ľS5&�j�Û�蚪:]��Җ�V��0ӛ�幜���VwPL�]r�C�ͳ���l������<|'�}^F�"�k��:����:k����~,dQkA�s��Kr�y����5�7�\����!,��Ŧ �����8���y�R�2�7�4���b���1\�d�[��|��(KҰ5w�[T�(�Fnb�C
n�By�|�R�`�Az䫝��(n��f�s��$�,Y':I�i�������F�^�G�9�vH�oR�ҡ��:6��Laci�d{�p"˧Z(�<ew�i�R��-�/h�K�(��,}��IVru�m���-���.y#θrZ,��-90�6�i�Skzf��Ա�CfDHSk�Ls|`�*;p�=�_�q~i���0�>��«i�S��6�����gЭ�]���l��*�<��Jm�3�F��� �4�Oe�ۍ����r+�� �9�� �Wc93ĥS�	����Z���t��:خ���@'xl��#��f��|����[�&\��ֿ�?�:}ݒ�U���B���U��s֨xӝ���5R��n�a�g�Z�o��J�6�.
�
�AV�L���d�5L�������P�i��Ί�p:�R���)?�dx!�M�~��+i��K����I�O,�÷�m�f�v��+��)��<Lc|�4x��Z���l�-"�1a0�HT��(P�=H�P�x�,!�P���i��Q�^����jcG�#Y'Rd�xYq�s��) /rbg����1���o
��U�!)x�2w�,z��Ť���x��
�Ey@"�J�wW�g-�w[���t�˒%�ý����b�9_1j�p�7���]D����5��Y\ �U������m(����(�*9�:7@����EUo1*9�K�J
a3���$�f�ߧ�]�OQ��� U�� �����;���=��f��=\Q���GSR��<�D0Q��m�C&t����� ��>]6)u< �G8:n:�9jp��pt ���5=h# M� =5@�F|���-]��=~��%5=!�����^�Pp[���������t�0v���?F�����t̖i�^߆i�;�|�S;.�+l�O��]�;��i��]��KI����Z
�"}�;;}T�v��jư��Ĵ���؈PY^
�V�	F��kI߃�H{-�����&m��X2��e���x��C���,�t�J��(�%�*��G�F�*q��> r5_��I,�h�>t���oG�]GG�g�efp�����/�Y)�8�Yf�e9ն�j<�}ν�.�xJsQ�2¨m�R%`q�$��]�o�5�mf�c�����w���s���2�B�1v��J�vv��x9��p    �{����}���ߜU"�U���K���21V��+Ƿs"w�!?p�� ���P)������D�h߳G��\3���s��t��c�a:���\�>!^������֨3�!�̙����ޜB�BT�����b� 4�����ܦT5CH��� �����]����~6��sD��X~6��o�G��4ZET4�~��7����;�����כ+J�y�^����l]��{��7'�wd���N�N�$I<l���F!�Wʱ��(����3�-���؎�6��v�51�ID䚩��B�v����О��a&�+}�N����c��Z�o����V�_n���>���.��=���!\��,���e�%�A)@]I�5*m� ���C;@C�b��Gu��7=�_y�Y�7�����#�0����߯���_�,�?�	�	V����(����;T��PIj�V�L���Gl��,
�)t2��6�T�&��x�k/!�Ò��+G�&d�@f���6ރ/4{��=ެ~��ݠ	�H�������9|� �t�GLi�s.���;^�/�虽��"(D�c1�W1�R��a"�j��J�����c�ˮ������ϓIA� :õT�7�S�v���0)X���P_��ˁ�&�ȭ��_�g."���7�4�*�*�"���l�qluqఆ�4H�Q�	�h��[䖁� "E��1$o$�w�s�� <_�1���0/vss���a ��nn��a��]��M1M�Mi �)o
�4�RG�~d��-m������z
Q��|R���f�@	s粑����x���r]D��'���~��F~z�*�6� B��*h9�p�
�-����;:Gb�:�pj{�(Αi�~�?�?���G!�Q(3xB�8�0��m��a���'Y����F#Z��aQ��U��	\mJؑ]#![��BMG\0�<{%A��ſ�Z�]�~v��eB�SX�P��^�ʷ�S�A�Z��I���tѢW���p���5���N��"J��^ѿ��z#�prM�&�С�7��C�N�EXd]�ڦq�h?�D�,�eOx�LVh��D�
3��^C��a:��mo�S������Ǆ��_��k�=1�B�g��E�-)�Y*������w.Tv�L>\�����e'�MI�";������?����'�F�$�b%�e5+�
���0��:<dxb�BK��S��Ƕ^w�v����1��K�������W������`,d�OG��KR����]�ס��Yc|7y�Y2����a��k�ى�Ʈ���2Ƥ���A�bNh1�Y���u-���xX"�
G<�M��t�O�Cx�R,2V��ө(��𖀧��@߄�M���������#�.Հ����J�$��$�K�
\��K��J�d�P��&�l:L+0Q�\eb�2��������/Ӕ���\�g���i���	������x�i�k�C[��t<��q�[��e�����Ԥ��:�r�?v�XLVe�B��zi�&�=/b�m�9�X�$�o��J��M��ރD5��3��&( ���1Q�r��/�ߴ'2�N�J����᫄���vAEVG�@��9��tE(�J�H���'��
��e�,
� y�-�L��f%��e������������Ke�d�]��C�������h����,��c�C�ӟKU }?�_��8�rnUq�F���4��W30�c���+	B��G� ��:��~�>�^�:t�u"?z�JckpGA�Gw�3�f�F��͞�,g͞�4f��=V�Ǽ�1�H�bƴ��Ӷ �*h+�^�Z���ɸ�*�xQ�m�_�Y2JK�u���=�4��Bd��Y��*����mT����,\�;rW^՟c�!��W�	��<C;�\��E�b@MD;�[��q��,D;�Z� WT�a�6�ˬR����`���4�!.B��b����N-��a2U8�`uL!�7X���j��I�������)|�Ps�4�j���|�͉�I],]eN �i���O��Ѯ62���V��
ա��A�R.�S���Ѥ5��6;c/�X-�j���!"4��])H�~�q�_x,�0."T���s�󇹹�"v�T�ᣅ�B	��|�]�jW��Hp� {vx~Q>Ә�I� ��߼��c�����?�g�/��]���+^����)��M�/���@�q�!��������s��N����
ri��*3�rF�]Z��(�a?V��xKu
2��L��mQgO��L��#?z!�N(etK������Bu�ù�9�a���<lq;��#�S�X�����v��"ބ��v�	��[9��H)_�:JD�������K���؃�^�LS��F�� �Y�B���]�U�y��-��e�_b+l�SK�X"� �N�Xt�'�$��[��K
�/�2,��H��*4W��x�Pל�:uqr��'wƩ�B�� `sg���Pfe��'�U���QW�sl(��]�F�v�ً��5~��,��P��IA��Ɂl��rFX࡮z6��a;",0Q�q,v"�CRyÇ�/�r �-%���1Ֆ���M��xq��.�mؖG����	����>��I �~��t�6yQ�zX}r�)�j�$�W������qB���phT��m�k�$�-t���1a�B�mD������w-s�-�۲�to������Ö-��Bb�4�T�d�-�5�/�\���l6�ؠ6I��>A���w%OW1�܏7?^�}�읚�:R����ėt>j
�HC(D�Zw\�@\8�u�=�a��3( E��Z�*g5�o�5�u��[�"��!pt�ڱ��u$��`�!�1T��N�oa�=E�x�(J���(�.G��$La���L1�C�����!տ�&4�n˚/Pe{�����߮j���P�x�߽~�����x�h�7}`b�`�@Z��>����������-��U� ��I��>��e"wI��>�;Q��lO���X%#ME�E�O �������̠�l�^�,�j<��}��Ї���!��|��mCʹmH=��Q�m#>C��@�,�����0����e'z��ڋ��Cϵ�"�MBh� �����xVé� r��}���>X#�1ܺ0r
�����B"�Ћ`P-�QFI`�r��9�Q�pH?'1[�������p���V&f���9�(]��{�~|��s����n�w�Fe��m�.~|�������#(q��QNV_N���)N���GSԧqb�9�q����������9Yr�N��h{�����{���uQ����U`s����}ҍA�E6`Ұ��2D1�3���ġ^�y1��&nb�9��&n[䗵E.�y�E�Ⱦ)y�e�I�݇z���Uٕ����7�޾x�����~U󧎳��ܜ��M�7�j���)���W�ǫv�1*_[n.��]襃���,BO��9%�e��NSh�C`�d������.��Jӟ���O9�((��
��6��[�-�|��/kNsl9�4���zb�"?pۤ�l�Y�%��7�jO a1eb�bR�y�Y�3.u*A*�x4;2��e*��@��{�MA<]7h�g�\��aB��E�Zd�:^��ê�Y��4ٶ���%-�����;�2Yl��^c��Sŋb<ڡM���+��{��U7�����>��P��N{G�tv.G�*!U��>��S�<�C=�E�*��/C}��r�-�o���*
@�}��.�a�������y ��!�n������餭������b���U�������~���4�!r�p���<��(2j��pB�͇�pH��������Q�b?.����4Zh�~�sFժ�G��u:$Y�q1&�%�A{��KG7�pl��L�r�O��S�Y��?W��� �U/RTe�	Q��G��@ޮYc���rl8�A�Y�(qibd᧲��ߩx�X��ja��B*+T	Z�Üu
�u�{��m)n�������8���Ó�V����2����tˁ�gZo��� �  .�Q�d,�Ix,�5��a�n�6(T��H�$���M���}�^E�.ݞ��� g�'{�0#݆�iV����傿/�apy,�5�z��̃��]�w<�NvP��D�U�3�B��)�ݨ��N�տ�ǜZI�Z���@�@�7҄5�x`������(� �Sδb��53�օH�w�=<�X����<��	�*K�q`s�rq�K�L�l���mѢ
�� �N�JƲ�:�9-H8�2��v-#�S�A^1���6Qzp�E��dX�T�I��Q���'_޹#��V���u�Z��ۢP*�e�e�L�\��cp4��X�´�=���?̣NR��d�����e�5��e�C���Gd�QH,��ǜIs� /�=[��2��&���`H�;:�*�������7U=�f�6q�#.�T�q��'��Z���Z*˘#�,��(x�zE�v�Ja���>��	8�]��ۅg�v��(c���J!T�={�,'����ف�Ǿ�f��Nꁱu|_�3(����ݎ;K�}����S��x��0��v�C�nPG1}���L�ɪ�7d�:#&kC)�0��AHa�f�w�=p��7������e�|��zp]����=i{�-ɾ=܍���L�^'��Ť�._H��#�!��Yq�`O������Iq}�����tRG�uk��qF\aU6�6i��B��z�YYXYn�D@I�m���E�^ۻ)4�dL�|�ʓ��
<<��$��7]�韋]~)P��b�T�?T�E-Q�5�i`ͩ0X���]a���u�
��HqN����I�T)̮0>�d�	��
ΰ9�Qa {�Q�g6��@�q�
70ř����=Ց�!���8�(���pJ��fڟKos:V�Μ:�s�K�.T�s�N���헔M�����CC7��4S�J�����q��H���T����=�L�D�"��i�8]��3I����ϴK�6��9%:��`n���+�W�;�����:h~/�b���fFA���;p�?��V�7��I�es�ӗ)ƫjVgaI��3�3p8�1u\_���4�"�@Ҙs��C%Cr���iIs�Ii��f"[Ҙ_���ȕ4gU >��@v i̮@�!�\�9DҜS�\C�Ω@.�4fW ה\.Y�\KҜU�ly.��ͥ��]���p��q$�ޛ��g		I�y�/i�?����gH�s*�OA�yq��%i̮@�-�\�9��
�c�
^�9geϓt曕=>�ά��7$���O$�KT�)i�9�|>�����I�V!��
r)��|>��	n�����9� 
��1� 
L��Q`I�s����u+S�H:��L��e��0�}�K��^�ܪ����1 ���y	*�GҙK%��Ä@����Yb��`4f�g	�8\.w�%��TМo�%�*�Ѱ�9r[s+T�\.X� ���9[t+1�6�U�2W�1�͔��j�U��DD�w/FQV� >�(���M_����[��|��N$`;�op��i˻rfxn�;��Y�Ei�l�5}`�ٮ}�d+e0���fX)� X
?cK�C��y��>�If3T� �q%��|�hRK���{[�H �9ה\�2˕uD!�!� t��L9v��\�hQ�[	�"=L;!�j���ʜ�T�@S�Z"a�u�����?��l      h   L   x�+�OJ�/JMK-J�K�L�4400031���,�LQ1~\%芌���-@�I�ExU���s2��2B�1F��� u�,�      .      x������ � �      f   A   x�+�OJ�/JMK-J�K�L�4400036�L��-��K�+I-�O͌�M,H���KI��2�b���� k��      A   �   x�5�A
�0D��)f��Vz�nK H�_�$�6?.z���G�bM��0��͇�*�>m�lP�';fZ(Srު��:5��M
!R�H�����axZ�p��3����K�N3�q�=����F
�^"�q�L�On6�H%�ԏ�Mg����7�o�_zh��_��@�      S   \  x����n7@���ߊby'�����VZ���$��W+�\�V6gF�b ��xn$g��9Ǉ���x�6l�������s�׽�2N��q��Ǉ���'V>wǊ�T��_q�:�>�=��ȸ��(�tL���8�{ ���X���z ��d�YG��"��0�y���y6Z*gsOx(��xFD
(�8eM�$M3AI��\� �+��./]�~Jj����M��8}~����^�`�\��V����u�~#�ٕ��A(y��MW*|�Zd@���H�-��U�/"�[���e;JT�Jj�\���^��O�����w�dk�v�\����%�a��v�d.[��H��?g�LL7�M�u�uɥ�Y��B�Z_}:�!�!��CE�WPG����H`]0Bl	>��^&� g��`(E��t�<Vq~4�T�z4<w;<R�4d$KER�vp��%9S�~��>��P�g����eT;�-�F8�R����� �㔋ي�]qTiAG�[�k�J�$�R��r��d�2_7�U͎1"�L��>�#,��%r��U��o��4W��*�b����v�u����������vW�1�C^�$�a�r�Z�a����"��j��k;����j?q���>�8�%D?�ק���vpm=ҙƓ P��Q��Z[X��yu�å�$�S�a�?���H�ߓ*���x�$P6?��Œo���f�j��@LT�����ݷݴ{{ڏ��Gl�Z ��3~�PP�ЪM�s�k�h"%���i�(k�`�Z�1s^��_�~^A�-�2�naO�T7`:z�r����E�,J&��*y�z��-����)�O)pW E�������LN��^T��q��ю�<�(�A<M��� �̉�0ٺ��i_����g>�ŷ����2N��5��F)h�bP��ח���T.g��/����oO��tUFl#1��5��A��i7��Ɨygm8��J2EK�K��^IiJ���?U���;�sR��^r�]�J�@uS^u�\2Z��8�	cb6����TA�xH\�.����eP՚�� uP��B��6�
�Ϫح�*��
G�!	C����?���f_%1��q�2�L����t�8L�1ZgT"��g��H�!�A�UofO�k�p̩hu����yQ��3���^�b�v��xE[ac	�2��re&�:cՏA+Wϫ+$�6���T���0�����.W9�j�ٌ�ܐ���4�6�ǜ�⑍��0Ec���q��	1��d�l*{u����B��)�������̴zV@T>���Hx�M�H�%�
�o`�K�V^��§fU#0��n�AY%@�M�yo��$8y�`�R*�>0���XL�p#�4�x16>�-���`����(Q��e�P��(:[�j Ac��(�t"�����?J�Q�j��:�i|x���{?6\��㟋U@`�e�@�����N?+)a���d�f��
b��[�mV����@$#tl`�<�ex)��9g3��r>J,�%���ܺ' 4Jٖ�whh��e0���+8M����z��%�Vꙧ`ß'��	,vJ6�ϖ��&���D�%r�q�w���m|94L�� �PRº�����qww�?�y��      R   :   x�+IL���qtR��/ʬ��+I��*
���R�J2��B�U�E)��`�+F��� g(�      H      x������ � �      {   h  x��XIn�8];�iH��4PHU��t�$u�&-�_&%����{'Q�����o�߿?>����#祧JOy�~J	�TB��7|xR	�H��y>�wS�|���V�97+�z��X���~_��s���[��f_�wx{�͊;
sQǄ���MFw��㇜�hw%������6��w"Q,H���8��X^`g�;:��2P�A`�p�q�(���GN��8 ��*0<	Lr�^,�Y-�B�r�K襄%�92(
��q)i)�ep���N}pR�W���9�M�(�z�i\rVù'0��ELJ��'�N~B9���SN�*Pi��ȡi�(��h'��h'�A�+�5Hgu����f:��'b������4�0�����*BR�O��@(�:}h�6)��yo8w&r� m%�9�Jz_��!LҤdH#������z;)?���Vk�Ih\�m��I&t�rb�S�&�1�JN@�X��B�Af�^d]ݵ٫ 7��eDʆd�ϒ�!�"jI���3���<,�0~�c@���c6o�e����N�puׇ�UL���41@'j-a��E�6��@{��n��!n�#��&�� -����M�hRtFE4B�a��]w�zW9aT�S��l��(Q����k�o�D�V$c�/��+eip�ߡV'(�ˈ:�F+t��.ш����t;���H��)��h͹�D��*#$Ֆz���
k�E�͕K;�ԥl�t��w�,d�3bQD�FqZ���t���r=a/��ͳ�֛�СN�B�U�:�4pY\R�Qs�1�m/��B����YF;Pp2��� )�$=	:P�D m<��n�u���-�!��h�Z�wB�8b���u�x7t�s#t%AT+hr(e��T���5=db�6R3!�5�rn�]1 t�V�UajTl�g� (eW��抅9:���D�f��fvŅ'�����T�jr͞��1�0�!覸'� h��T�_��z�6n����PQPG p^G�^�9����c����Z�9���k@�fS�X����A���L�y���t��=Yz��H(	y��8����vq��;��vp�ݡ��,�y>�s���^�|������_�XV�V�
�(�݀H�j ����y���������gE}�qTh��2�(#��}K��k���ȹ7��t�Z�9�0J�� 8�Ɔ[�"���y��n�k	��K��]�9-��
�{�:��[
�"��Ig�w�e�E�ۜ��0x�h���IOzZ����������}}��Gղ�]j��$�Mz��ߵ���['\�}�b��7nvϏ�s�������?����      ^   �  x��]�n����<a�A��.*v�AP�MΏs~U��&�2[�d��O�w�S��ʋD-/Kr�C�m��D����ٝ�����l��'!����G��|��F_���i����}�)��z�4�m�������	�W��aKA3�Ђz>Ղ������
���2���藭�����,�|���ct��ӱ��P�0�[SQ%�;k�Np륾6 :���`�ZHU+#O�*�E�I@�['�z`hp0��� ��$`��LT��2X�3�]z���)��$���c��=a~���|�xt�|���PLsb�6�![1[�� �_7	��;��h@cXRk`a�\^�6*B�>
bE�����	�u�-�Ň�`%v���%4䊎oY|�q��0�&����q�$V"�����I�t_!R�U����@�)֪IeK�N�oT:N��G#x4���>��wq�~��&!�J�]mZ+�Ӛ�_���û��ekz�x,����Yy_|\�ں~Y��z���\���_O�nޟN	tZ��e5{���=�߰M�I��z��}e����}�$���･iK݇ۈQ���|wS����L(�B��Ǵ.oI�>�o��c�/L�JIeG$x{�_�aE�H3䐘�m��*O�S�0!{��d�����ǘ��sj���K��������Ol�~��.�|�#1��cٴ��e����_qt{wݷ�
���1n�T�τj���F�d��vKH���^�\R$)���0����_��<�����MT������A��A&����Ư�~�ebĉ�x`ṕ���� [7pƪ�
3 �kx��nC��e�=H�Ta��
���k#�~�Ct�8�YY]$�����
���A�>p��������-,}ж��k__p��9�`�C�=����dO�sipa�-�d�3v]��A],���c-������_k���W�t���c,DH>��s��ʮ�ڒ�.��Ի�:Bh6p���ꠧ�*�de��Y4�HCi|Ӕ۷l'��u��+�Q���V�V���@�s���	���TGV��2�����$�l���)A�%%оP�0�UW
�shA���qR����1�&d�B�0�hX�+�� J���bۋ>��b7���b>��
<�@g i�S0�0�B9mE�'��C������$��|v7�<U�8���o�� ��7�7�C��n��T�����~���V������}����5N��Ĕ�&�=&�Vai9���Py"��X9�ߟ�L�Bҫ��Sp��aqO���)F�w7�����_��0�ߦ� #��g]�iQd0w���>W�M}�����q.-���:����呱MH����	��)�{Q��%8��rS?��p1:��3z� Ԃ�XNrm�ؖդڵ���5���n�bUWÂ(��p�j�]���.`s��9W?6�F4F6�z��Hl]E�h��[����l.�j�tX-&������0)��Í.�X*D'fs�L\�A��@�Mo�7�.Z���v��)6t��S����QM��a��B��^]%_����U�,����@�)�!�Y3�ć�R~��j���ڑ.�^�*��a]���ذ�Cp:��v�B�N�_(l�W�,�M2�U��]G��W���C��;��K�W��4�H���bϵC���(�\}QX����WK�;����]� �Ӿ�';��������IV�x"����C��QC�v��%�+4�k�2C������h��#e���H��qm�@���8�̍Sq��".JE��2��ur�4�R�ӐswǦa��6��5x,�G��+�H ϳ�9�mlF�47�H��>6FV�!G�1�wO��}[*@6�c|�v�,�\��
�'�Ib5�zԒ���*cm���H����<�Z	fr1+��=0�L+J�å&RN?�-
���:yx��%��C���^��}B���gx)������E���
�U�t�E�]�G��Ʌ	#��'�np�l_.���k��L���?x���cr{���IvP��D^�RCY�X��q�}��(l��{��Jz�3�?������o��e�����{� �,!^�}��YFy�C����G��YW�!�%⛭ѱm%H�#�߯c" K�+ :�#7A>���w����a�XɹH#s���H���:Z�j�P�!�\�o��G3�Fޔ
>�ԁ�j"�$`�9�21�U�䚨p�:iM�ay���/�>�MtQ9����pX|�TW-�F�8OAUɜB�{z�NK%��X�B"q����HV��0`d�B.X��i9�rNlL����y�	�O'�q:m�qy.�a鬔]�].��b�]Y!��ݾe""_�!iY���r�.9v���'v�%Ӆ�c0GG'd+$!�CX���qe��QNQa1���� �����l/�>8i�Fs���'<����lgb����� Ȧ�	�l�X־�@������cV\M;0/jb$�@�%tbS�k�m���7����(�
�������}ȱ�o��������y��z�AذWS��U���)��^�A_�b�[D�]�ݑ39 }2p�Y@��V��{����%q��s�y<�D>")�K���X衢���*�U�����:�`9��Z ��7��?6�F'��x49������5q�}f1<(�r�e�n��6G���	�=�%�a�o�H���5�By+�"3��`�y^���:4����k�u���`�u"a�4d���@��g���}#�ʪo]t��Bg��%ODB��Ip��B��x��D����1H���^���c�&�Ӈ3UH������h��W��~�v>���m�T��e9�'NSӅ�����`����g�vB��$9Z&�mH�mY[=��p/��>�x�uɾ���l��=9Z�\��!�ғ�{��0��x�e�Iׅ��}"�($��`�G�D1j�|T�!�ŵ�(dY��l�<mI�ϻ�2&��(��c������]��e�Ͱܴ�m����/�o�ǉ|Q����������|ux�)X�g*)��J�=/�HO�r��l��q�1Nl2�u3�	鐦�b�r/�H	~�%�:��ܐ���� �۾�e�D/K�5����&p��sG<8���[Qƌ�[�հA����`]~,�+����t�أt�xm0N:�Rp6@��k��B��s�黴�#i@~�%����QH�����gP��y_ߵ�I��R����w<�Tw�@�eǵ~����T婄�O���x�!�ui<���7�sF�s��b��ݴu��� <<0:�����0�R�$~ �̠��G�ܹ��dK�wl@Q4{WM3o�5��W8��p~_���W8�̏��ՙ�oN>��*��"�6��\�l}Ẑ%ծy��6;��-��xJyt�ShGA������@���0Pѱ�*��G��a@�i+�KL#�f���K��s�F�=�;�y蹽�8lh��Y :�͏�^��/f��      V   D  x��[�\)�]�0+�7/�O0�(;ӻ�������(�T�l~�n�9c����o������_~�� ��`����,OO�`����Lb3��b`b���*F����'����/d���LV��h��F�T���j�E=FC�0%@�K����"SDC���m;�Ϙ��a�j{��/�ͯ�a�H����Y��<X,̃ѩ+oJ�C�ǧ����g`�aL�@Z���y�V=��o���ɪz�A���gV2d�r�����L9a-7�z|�������,O�f��ͳ_���w��Ǭ�!��d�Y��}!k��E=
�!oK�\�"��S^ =?'���dͱ������4`��,~������Q�{�����"�M��̌�X��R�+`@~���B������^Lo���b�6�'\vT�I u"=��>[m��j6��X mi �3�`t<(��� q���p|��4ByAZ�YH�@2�	����Ǘ�&�	(�H�r��>a��l�X���H�Zx�Pq��H	�m�x�z���u֥I�	�Ҋ�t��;a&
�r��$�n�Fd�P�B�
NjCw�i!�ȲM`Dd�0�=�8Ëq;�p��9��C�U"���`^y�T��42|��,#�u�+<��1�di$B��H����G�6�"�L;�1��R�̒Ǯ���(	@}{d��̠��	ׯ�[��[HoSl$<
+԰�=;A�HJ�lӿ���E���1���(�n�����Hx�"�Ѽ��h+z�y��v��Ǆi�]E�>��'��"���7�Ru[�<q�f7v�^�?�0�T�#�0��즛�8�'�y+I���yD&���������Z��X�"e��e�7��&Z���	:|��-��E����Y&�,�b
�z6IýM�h�ކp}]Z�ZzK�u�6����f�������a6�QJ�E_�3�`C=d��!1:����	e0(W�	-E�E�7�\��X�@�ouxH�΃{�:�X��p\~�Z}^ɭ��j`�eH���_��4t����y�"����Pv$�v8��Ҥ�����T�ȫMځ l%��t���*�_Z�
g�]c��8�5<��8M,�؛�F��q��h��%�+�a��iD*��D��f�|Ǥ.x�n�1�7��*��y�"O���I��6���6 
����u�O�k�Y�Ց��o�%�A	�7FL���a��R	�B�d�Ŏ�nK=�����nfJ��r+������_��6]CNJ?�y7�-��`��K�v�꺪�V;5����c(x��ԵU�������C�WKr��2y���'ɻ����-F�5ޏ��g+H0�%���A9U��v�Rl���m��Gm�G�6T
�-V�s��8A���81��2Aq�b�\�5��Bx��uZ(���~��r��ϴ���r���7�XıJ�wnm���/cc�Y�1�|����Gs���� ��./�&��C+3Y���v0�2
W}E,5��<�
>l���}gʣ0}I̜��b��,]��h��x��[zz�vV'q�+���uy�&[��'�]��%��{�dn��&����6+Ku_�[��.h>̋�I�t<�ܵy�tY�`2�� ��(�N�hY�$z&Z%��H�-��������߾~��:D>��J�Zd��r���A.7r1��&G�kg�l�9q3+Gn)/M)~׾9-+�'&WpV���`��QS �=����I5�z�f�ۻ[��N��¤��8�N�M�f�.Nr0yH9�����~Z��i=����Г���ꮚ*�]UE��6�d�����*�m} rR��q�{�3��+mJf���UH��9�t޺�=��L{�c�;*g��v3����9��@�=ˌ�`ZQL�G�m>2���c?�+-�/һA9�%����t0,:�moU�� ա��`V�Z4����>1G�yb3�Ġ��9�����T�~�М�0_�6�e�!(bvn�/j f>�&���)��L��=5ݵ�>�8w�Xe����3��C��Lq�o��~�p��3��Y®'��eA�x�����Y�B�B�yFAb����[���HMư���a�0ڕ�6�p�Ű�lU���ZL�.��ŗ��k`uA��uWV���<Zko[0<���a�m��Hi��%�:X�	�
�v��{P��=]í_	S5c`���҄�mi�vk�,x�W�h�_����D.��q���Q	����gK8z�X�%����-����0	���kki��)a�wؘL�uĞjL	ƣp� �jĘ�jx��{{0�#֒R�̓������������G��N�&O��Έplo&�C�-�`媍�S�5~,Z���K��fˆ��֦�9��h �}�����-�_��ue䌐���VO���������|��uѶ��CM��8�+�z��l�l؛_i3�7�%g�o��>Q�ܴ��kD�����G�������J�������1z�N�909������4o:�l�o�Qx��qYz`��.u_��x���ە��Y#����!�$/ɷ�]�ߑ�7�q�����VÈ��0y��S�dX�i5�2ߗ�~�v�d�d�+�V�"/�W52_�5#�)2_I�3t7��nx݈[���r��Od�?�����o?�&����̣Q�ãd³��qÀ��ŋ߀9Cq���!��������hϓe�8������]a��ht��6o���}����0n>Z��"us�o<.è�Ê�'�Z?nX�MI:L�Jv\�?�`�����ax�����E���б���[�u�4`?*�nGk��c ����[3<4�Ki��z`i������%w��G����mp��BR�Z ���B?~Hu�(u��*a%E�NA���-���԰��b���ƭ4?Q#SwE5Icj*K�j�R�E���۰���P�b׃����?�2�j�+�R@��6-�\,д�bOl�)wSeD�0lP�ي;�n�=��m���ҶTf��寶�i��w�[��F�j�zRy;�l�JMIgO�I]Rm]3�>n����%�v����2[ ��󫝄��}�m����wR�j�=���wR��E�7�RWMu�؇��ן����?�?~~ß1t��8"�#h�`F&�%X0]@@�\@��F��O ֩|+�轀��(��3���K�h�$8�C��5�8n��Bxʆ�mO6�-3<�_�s����ץE���Ū��O�8�h�e?{8���G��	΍�RQ�8�U0X�X�%�_�<�,�<��걾dq��`��jK�di�Y$+Y���Zz���Ų����s�fb��e��"{e���"���c!VbVq/Y�W�U'kx�dY��Y�}�ƸY��5�F��X�lo�U�1�#VaY�#�b�pe�~PX��\��Pc��j\.�,�6�d5���"����}�+�I�z��E��u�h�;c�BV=ZV�J�1�@nC���m�e�͢��}n3n&�eC���2�jn�"�s+�^�d�԰����B-sBY��|���W�c�O����|�����Zb̳Y3'�$Y�G�Z R,$ ��]���t�=!��u�牤	o������/�>	Y         �  x��T͎�0>g�"�EfX�'���eX	�+E��-�Z'��6� ��q���oJ�aU���}vb'ڳ�O�T%����$���hyQEtV9]!i!N�o����%q�>g�4 9�4lv�_��I�7����:W� u��J���^ːx�~/!�W�����KNA9��.�
X�if.l�]`���#�HB�#/B���1��N*��K������:`aՀ�d��\H޷ϼC˛||�ｌ=��z��H��`�^�����O��C��ǧǄ���+��e��G���Tf=n@����۷}J�@j13�"C����+'���u�yzo���J5&N/=�b�(�^��8΂/��4we��" �ܲ����X������X�<_����V�7�ŐH��Z�2Q>�n��0�6E�X�%7�8�K�����Y��
B���Ӱ2���10<;�����"�+��뢗E��q���a���:��         D  x��PKK�@>'�b�(Kij&UjăZ���e�n�H�wW<���l��Z#�m�{�|3V=2*8Z�=+��n�����"�]��P�䦩N��4�_�I��F���T}!�Q������T������u�zb�mɶ�l���ϯb�̒�8���}���O`�1x�i�2P��X��$j���I@�Ɉ�Ʉ��cQ��(Di�W�3�)gV������GM]i�KN��J�oh��]��hQS�(���2�m\#�����\8���c���Ҡ�b�ۯ�p���Ih��+�Rq�p^Fh	[5յ������o�%9����?����	aS9�      �   ;   x�34�,�OJ�/JMK-J�K�L�L2�3��9] ,G�?.Cc�*��*�@*c���� P��      �   4   x�+�OJ�/JMK-J�K�L�LL����44�*A�-.M,���44����� Wi�      �   �  x��U�n� �&O��Mj�Q/�6�*UIզ�M$�bڱ�`^���a/6���4��$+����9����z�`�xu��D����+�sM��_aՓ2 ���)D��`��V�-s�� �����c�>��<Vi��_����4��S�^�O��3f�5z��䫋��).x4�BEK��wЬ�j�L�����̝�)�e�Jv4Ye�*�;e�f� �	�]LI�Z���U�t���l�V_��$��J<J���q^ !���	ZB1��O�x/�����{�e�$�fe�1Tk��*����;����L�JW�G�V/�4rY�O.+��ԟ���4��<� �3��Z73/�Ɇ�3xnJ��3׼�yݹτ���s�������f��Dz�1j�kP�� �����2���I[CB�ʺ
�.��ն�Xz�X�7��j~v (sj�x�u}M89f&:0�Oj����s4�8_�4��oOr�у]�NŚI�^��R�tA󡦁�L�4/�]apu�M�o���p��]�$�����H�K�l%h��Ԭe�k8>�9�a���Z'���(霹[�?l��[p�!��M8�W%����Ѧiԅ��A{k�2�{-������d2�1%         s   x�e�K� �5>�O�-r�n+E�;���D|�_��MXY�̛���(0�$�d�=��!�p7��=�[_s
u�!���������,�B���6�(�ڿ�_��عOMBOODt�S{         �   x���Q
�0����0zo0�F,�II���0F�Þ������(H1�Z�]T�`]I��!2�p��b������y�#��Ӈ��!���E����c�Z�cV��dfC��&\NQ�G�e�޿e�Ď         u   x���A
�0��c���Q�Zb)����;=�Jn����E����D�V�'&@@��ǋ|h��<�U���n'��h��p�'�#6���j���������������2VAu;{�GJi����      5   ]   x�+�OJ�/JMK-J�K�L�,H-*��K�44 sc(�Ā�MebNin^>L�	L�!���ĒԢL���0�F*��s3�3��`J�`J��b���� �H1�         �   x���Q
!�g=�'���  w���Ǉn�������0���ND����q��g�����r����@E���Q�&5��^�^�`E��`j#u���иT���۟���\����)[����WI/�ѳq���7�҅�;�ö�i'�|P�̑      	   ,   x�K,H���OJ�*(ʯLM.���2���3�8��W� Sa*      J   �   x���]
�@������saٲQ1�M��vYEź>%���(��!�+(y�
j��=�n��$j!(�+H��L�y�&J�hf�z ��+>z�T�Y�؇N`�CE#w;X�^������������"~ N��      �   *   x�+�OJ�/JMK-J�K�L�44 C΂���$ �+F��� ��
�      �   2   x�+�OJ�/JMK-J�K�L�44 C0mdh�ihlh�ilh�i����� U�/      �      x������ � �      �      x������ � �      �      x������ � �      �   8   x�+�OJ�/JMK-J�K�L�44 C0mhi�i�ij`�i�UB@�1��L��b���� A��      �      x������ � �      �   2   x�sqv���w�tq�,�OJ�4202�50�54P04�2��20������ �d	/      �   �   x���A!E�pЭ����
�L#���/�L�u������*]�q#���O�$N�Ig%E͵���!
0SJ$F����u/p�[�Z�|C�-syl��y
8�:��5�3y���n���q�\�c���;��p��yH3I]җ�27�I�ʕ|�v�`��w��:      �   I   x�+�OJ�/JMK-J�K�L�L�Ɍ/�̋/NM/-�LIL�,J-.��+N���4�*!���8�7���6F��� 
`"g         s   x�m�A
�0E��a<Ÿp�V���H�6��z1���F�(����{��_� (�>ib9Dv��~J�Dd[�C�����s�8��&��Ԇ�@<�[R='M?���U͐�=�*���H�           x�m��j�0���S�A�=�(��2BsإPGm=ɋ��Z{����4�0z�d��h�6��)"$F�ɞ�Y�}i!xd�A�g�a �2a�H
5D�Lc#q���m�s�΢u?����j��jvo�V�h:��\LL��}�Pd43=�wL�ȃhc�׻��Ē�B�ў��~�6Gw��uD�i�� XrЫ$��b�S)M�<���z�-���C'V[��xg�t]dB9��N�[��[���~�K62��5UU����            x������ � �      m   W   x�s�t��K,���r�tN,JL.I-�r�t���\n�n���\>�>����\~�~�� �ΐ��������N��Ģ�|�=... ���         j   x�+�OJ�T1�T14Pq77H�7sNs��4.w�0��q�(Ns�*���r*7t�4�ȭ0�q�L/,�H	�
7�-.M,��W��Ǚ�\TYP�i b���b���� 5�)�      �     x����j�0���S�	J�7�ֱ�.��BPm������q����t$��$���'��Sb1�[
fן���\ivΡG6�ۀ����4��������Q���g׵��_��bBl18��f�V�b��Q[����ؼO��<�tcy�
�� ���#�FZo��)䁮���A�EVt�&�m.X�(�'����D{�~Ǿ�ye0�������c�4������u��/�V"���򻻵�:�8��O�jr�C�����J�'}��(���E�      �   �  x��[ю�8|�~���,���{�����-\�C�-���1��9C(���mqHQ�d{��}x�������p�q:������� �h#��3@�~ �X�=)"#BFς�,zZ
h)���<!d�.PtAz� ���6�H'��KA+�;�[P�}�+HA5� �=�S@��{�a`D�h�Fz�={,�N0t�2��` ���6&
�$q�DB���(4�>l�|�e� S��L��)��$�L!ԕd
�L���L���L���L��B}^@�:V�0�P��)�:X,L!t
�*L���a`"L��ǣ3(�
}�܋����<��+�9+(:�Ԣ�B����x�o��P+A�Ob94��||�����q��2�!x�H	�+Bm����5AYc�0:�����Ap^Q�g��a�LNtRf�,��7��ɝ�l/�ٜ��Ӳf?��9<�709��i�lN�ιA�ܠsn�97�t�:��K�ΥA�Ҡsiй4��t?˒؜�K��C����<mRu�������b6�f������t1Ͻ�����5\��
�-O���"��L��B�j��p��.���,�'��?���;v3��ef4�v3�Q��P~�b�e�e�U�c8+U�F3jS�55\�M�^��ޫHv��$'	��$�h,sH}�i�i�?$�HתH���F�ԢxK�$R��v�I-��-��-���s��E�ܢxnQ<�(�[���ԢxnQ��(^Z��ӚԢxiQ�;��^�Z/-�-b��a{DV�^&�:�����t�����k��hyU=@��#F�/� (�:5R�HDJ"Z�f�J�\���S#����H���[J�\����������ٚ�"��W�K$4!�������_$�B�t`�D^��B�t�\��"�v^	�'��	�z�<&O�ɉb���(B�(���I��LHN���d��'DO�Ⱥ���d윂��,��C윊��@�Sr�:B��**z���Wr1xJOIv�W��5��5��i^� Q2o�"lA]���2�1#�6��v[a0[�y�<̨�j|$Zw����������vG�Ҋ�@
�Y=a0k,7Zj���F˼�0�� #[�0�!_��3�Jo����m��y��\���V���i����t9{���r��x8*�_�6n΁[ܚ��w�s�����[q��ͼ�����i|�l��u��`�8�Ϛ ���>��������ŭ�o����\WS��NQh h�SZNh�S�4�)��aP�8���ϑ1�)���aDŗ��z4�)���1�UkT7"k
�)|+�!KQ�X����˵�-Ei��M�5r)�[���USx�F������0E��5�0E���g���u�(�9� ��8/�������,��+{�>��E��{}�hb�`����.ƷJď��突Kn1��U�p�6��\���
�%�/8�VJ����>ɉ?9�'����8�ߗ�i��/��ۗ�}�OK�!d���ݶ����`��u�`b`��������L���2�Վd���X  e��%<�C0���з��� �k��P$�F4��uV�h�Q;�ddE�	5�HDM2S�IΓ~gnO|}��Y�� D� ��hC#ml�UҲG����|�]·�mR_�SN��l_��?��yy�/Oo_�x{{���bw      �      x������ � �      �   Q   x�+�OJ�OM�,�/�4�H-J��Qp��"�$I3���dQjZjQj^rf"��r��&%�T��*@�Zb���� >�#C      �   8   x�+�OJ�OM�,�/�4��42�4�*A4�@4�44�42�4�"
$�b���� Ϙ6            x������ � �      �   Q   x�m��	�0@�s3��8A!�6J@I���k��ῴ����y�~��|O�+|E睝�	��A.�5I�rp�Mr��)�Ӯ <`e/6      Q      x������ � �      �      x������ � �            x������ � �      !      x������ � �         (   x�3�t���2�t��2��q�2�t���2Q!\1z\\\ tva      �   �   x��α�0���<�����8���2�c����RBX�XB	J����c`d4yM,�Q\�X�2E�. B@p�:ձo�<�^�5Υ��Y�E�)�y��E��U�i��� ����T2�
�P��\k�!)�eg�5����;��z��jZ      �      x������ � �      �   �  x���[n�0E�a�@�y/�+��$�"U�j���\��Ne��s�񽃩! ���/]3��Cs�L����|��F ��4���%��E����?�,��!=��yt[)���F�C������{:_����8�����u��G#b�b�^��U�,j_��"Ի�\�w9�T���`t���B���uS�P�]�\S�v���]�\[�B��wS#��t���h	��|�8v��l�0��{/����y��a�ʼ����y�D����9"ݍ�{��������׼� ���Ν��~�����>����||�w�����A�[��l�η��yd�o�_��|9�g��3���Ļ��P��"o5���}f�y	#��m��-_�/�Zм)���<j�z��\��%���ּ�����۶��P.�      �      x������ � �      �      x������ � �      �     x�Ŗ���6�k�)X&�^E�}��&���.4EJ�Dd���,�9�s��"� .���7��&��u�N>\��0�� �A���D`���u�T�uc,�L�j�C�Ɨ���(��';�N�˶����1��ݠ# !�
��U2o�SK\��26��g��ɱ���/�e�tD�\�[�ع.pp;���v�"���&Ƿ�R�`�O6* �������V����$�v��e�Y���� ڂy�eh=�Z'm��V�Q���2=^#9�����_����+Y�r�ų\�� #A� �'N�(�}Y����o��9�qF-Zϡ�Zٝ�l�x/!��~��XP�h#���n�y��m�QRݝ����w��S�L������hï�l4sFMQUU��h5�yu?P�7�H�e�6
�\�^�caϦ.��˖���0�D�L�1���}��:K��t�N��#���_�¯~:�ނe6�-����f�}@�`oH	�p���H�3��ep�kc ��)��@���\\G�&�$�t�Π��7Aw������r;�;��YϽ��;M�\�jvۚ��^����z~�t� �̖�����y��E�]7�4ӥ�:������S�%�Ų�ȍ/��=!���fR��V=��}|�X�8@p����7����Y�����,�ON����9bzD�1�i�)�PIj�����^�EON���4z�j�U1w��8��/w�}�O�$��p��d��J�~F�6V�����;�^�}�.�n�܀0}��a��vShS�k��Y�ɹ�^�o��~�f���      �   l  x���Yn7��G��4(�B��9��v��@`��\??9m���t��'Y�X�_�|����_�~����%_�{�|���_>�qabz!y	��B�X��U=[��Q�������~
�%�$D#u3���E:�
Sdc�LY��u���v��E"Ӕ�Z��O����-%DY2'��cɩ7j�)v���<�4�v�K�CX��K��YB�9���UԎ�š)�4^ޏ������~T���l��b��9�>��GM�)Di��^ca	�ҙ�|Q�P��%�dJҦ��i87Dk�	OY��zM>�'5���(����E�9Guu��-��K*d����on`}��ͱ%����)bV����C!6���綀�G��E
J�׼a���KA���G"�����#5�uP����̧��V��: "�]M9QT��U�գE��D��� '��¸ք[�Dh:fK�$a�!��0�aA*�F����u�q��	�G�=B�>�u��SB�	}��#X�	�\c�
q��Y�Ȑ��X�d{B��]g�6!�~�Y#��XX/�7�ؓ���9y?��(����;���)}nvE�uҬSX��h?9[��)���t �7d5��׷߿}��"�����Ɛ���e	VB�������<9l1�Ǩ�Hqձ����<eL��I�N��:�d�ߌQ0�.(�;iM�#���	���i諩��i�L��X�a^Bm̎A�]5a-�a�&��<���΄�Z��N��0d�{�*��H�A2����?��������/_?!Wn���^��7���v�������\~��5���	��2�blC�������!�YP}�աc�+y�����=�� �Ъr��b$��@��X���!r�._��V��I�E�r67ʆ>�+^]��{���ЪM!"��`�k1~�)kB]��6��2��Ӷ����@tE%	�ۺ�n0��f���C�Qd
)qm0weV��0���h�,1{N��D>Ą�@9̐��e�-C�qm=��`�W �w�be��*�|�4G�
#a� m(�ҏA��D,=X���ֺ%�$Y/LUD	�q��6eb��F�tS ��~ֵ����o=c�����!Rh��t��v�d	�C�Ĳ;�"�����"Uv�R4l�(�r(�[��%_Co��"�i��u�_�*�P���tD��=�w�b4��*�F��w�0`�! �t[�a��e4r��o��d�$є�D�;=���]G��V^x��B���r)�PdYDK��qn�DLp�z�PS�1��V�6��R�'-�"�pK.G�)g��ǆ8Y2&D�{��DtI��r�����{8�	�[��\���e��4�T�BE?���㖜0����;��!"� �BG�A�SC�Ws�x��Zy�b1;#tv�����ΘX��TP�y�w�9�ׁ\����hR7�����)u��R�J�[�|ڂ�T'�[E����ǁ��n�6SL�pYr��4������Щ3�f)ڶ�h�M�K�pyB�ڰ�Mb +Hw]��5b���"K��ʹ�u��0&��_\&���6� L�N�W��e�d�)��-�.�*����#������0z[�򩆺����4���'�UR��^F���t��xhշ��r�#`�p}zz�=L(@      �   3  x���Qn�0@��aP��!�,�*�؄4��r��;�	�{��x�����5ݷ�x3&o�\.�y_�Ζ�R�����,	1��� 8�F~Qa�+y����F~i�'��3���6|�!��ٿ�^��E�U`�H��Y�my���9��m����Oh]�
���W�^�z5*'~ ��ῂ��(��B/�`Р��.�A��A/`L`'g�AyOeN՜rtS�+�d��� ,�*A�	�^r%ߌ�>f��������NW���w:�{��:�{�6���)O�tʎ���&<.�T�^L}k��y ��t      �      x������ � �      �      x���M��:n��U�x+0$�G� � =�x�wЯnPU݃l+K��B�>��(_��{'�e��(��ϗ�?�����z����S��>}������������|�C����~���A��!��Ƙ?��<�y������?~�����ɂ��������������۷��?^�RS�Ő��y��ߠ��A�D������|���������r�?߿�(���	�����o��������]ni����I��]��g��Z�J���Y�69K4�/EȖ:7�X���-Тl�eܐ�K"6�V�`���$'W
�k!��i�a��ْ�e�;ф����)�(\ X6�f�2���[9J�ق��@V*Ճ
�xْ{9���[�ݒ����ܱ/�+�	׺��+���G�l@Π�\4�Co�\Xg�U�k��Q��{,�gGHfD(��(ںD_��\l]؀e;��t��.K\��MުT�<�'�H$< ��5K��R�ج��G��֒��eTW������^����L�%o�\�d�n�`Ι�d�+Tn�<�.c��D�͉����bѽ�V���J�j���Ҳ\�g�AS�	�2�Gn�L������d�K> �^� ;��uLώ�|$���u�<X$�u�6'��˸9'����7r.���a�mh�4�!�I+�6�~��z�͂���y�Ȣ��'[��Լ$�	��h�؀�AC*Ы�7jN*�|3Kz�b����,�D[H�M9X��B��<�.�Z,֞p�hč�U���{(��x����ގbԺYջ�P�Y[A�Ջj�Ԩ����xhUo/2�lǴ����dш�w�u�q����T�l�\=7�!A�����%AG{�՗3XY&�����-���0'J���3�MP��91�n*�-BO�����E胔��J�`@�Rר�E#v�T,�#l�m��~	��%B�m�|\�>����1'���4���m'�==�j�nTWЀ	����=hn+�K:��h�0�4p�7��;I��ډ���Z����PԓԵ?'+���9��X�Ko/����+p$tK�p�pȑ�d�AU~+I�R`iйaN\ы��S�9�����J���Xp���H���V�Wt���v��|�.����.��-�zN��<�n�(Cjk�8P)\SZr"��.zmvGʠAcc[�+��<���u�����V�5��h���P�`���k�<�h�}%=K'�
��y�Zz��J�`.v&	pt���s-�����N���OĲd�y߼~��2���i_?��9���n���vIr[�OZ���IR��\\�#����B�R;J�1Ѻ��F{���M��Zm�+~f7�\��e�.�ڛ��.��(K(�;y�d�U�X�u�z����QRI��3$$tHK6Y��n����ƪ@^���M�J �0��>������3P~�hp��U�(j��WK&)�ޑ��`Ia�n(
�9p'J�e]GOldڕt�=�ʰ�K��#KN�6�~cip�R!���uM��\8ٻ兺Ar��6^u%�>P[�6�B �=hɿ���-QB�dj�8"i����"y�N�I:hBx��Q����y�\/���f�����$���
��^gR �]4���@(ޝ<�\�֑`Rz����*�J*]�ΰ��#!��(�U�@1��E��x��0��,�ts�B��K��p[ÞX��W�6��Ge �#z5������¯a�k��ya�.��s(��$+�z�!E��8Y|�H��,͜��B#�I$?�Ά���@%�u�A}G�C%��z�I�`��� �h�C�ו�fY�.��7�Ы`�$��Jl��ʫ`��$\H_���07;1P�>a�������YDd�Q��k[/{�H1�lu�G�9b�5����uq�#�:����#esΕn�ؗ��\m��6C@�Ғ8Ӳ	�4x���;*���ɵ�l���渠���J���!˶g{�����A#����IWY����!4�\�;�=��7�|�H���l�"�%!����&0�E���KI��+$D/�F�X�%����aL=���R\��rs�[E��^�o����m��V�V�1�����]��5�D
X.��%�}�K鐣���7�o)ڱ��%,S?��iY��Y�N Vo��U�T��7F
؋�k���JK�!�J��6[�ᾀ���n��Gc�D��e�#�,˵JX��Q^��԰J�J���V"%�%D/�+a�Ā};8�ee�Gn�<ޛe��n�$J^�lYc��U��6�6�H��)-�&R�*-9V��a~�b��{G�Uɿg��V���������#�x�7cգ#���G�
�Y3Q�I�9G	T��N�v��ݹ�)�l�f��픷��d�\��O�N�@�K���-	��־ܩ�N��n�:
����
�)Ωf;�i�S~q�K��F�*i
d[+��gPd�^
v
4�J庰Env;�"}�w\��X���{_
J�7��$��=i��P��f2������7d��PG�Y*{��F�I7��>�JCi�c>�c�ﭭ7{�H0؞��f�	���\��<ym�A6�nq=C��~zK��^z9�1\t[�̥P���e
�Gh�d81���B^�A�~$Y̊t^�a��$ִ�(��0`�B�%M��8�mY�o�#��/��K�Ka���o����`�+IUbY7%ӗ�$�N��~���O�NΓ��V�9ѭ��,3�u���.�Oͨ#���~\4����ځ���UA'��LǗ���W������]א{�����Ŝh@��-�ckА��&��oe(�1�0�����D����~�?q����~�Y�f̵1��F�H��E��>�&t�F|��~Sf���I��7h[~��>s�ʌy:�۝yr8��/P%f0`�"�͇	�T?�a�3��p�mf�2ӹL3j�U��:��&�'����'�%}�3��P��^�������l��1}��!�dD�dLG��	yfw2N�I5����,Ū���%�ۻX�^�Ϙ��{!�3���dԯK̘��e�uZ��ͪ~�B6ol\���_��۶�j̤����PL"i)m�\ܺ>i���:�R5g�慬���DFd6s�]�	��d}�w�����|�������?a�u��uC�r���v�(-A�����kHPQ[/��/�: �xw_�8��D��6����;y'ٛ���_v�EW~����h �[A�����m �N?��:���!�O��J���8��O��!��p����i'��B��p��=�����w׾�]�uU�O�>�O�z��>Ns�y�"w���B��!d����a��+6��/ۓE�iF��]����A̤�bu���� U�p�{ I�8Hau{���y �$������:FK��Yl*�o��-!n��%�G������LQq.R
�N�@�8���pA#������$����5�#�5i��[��Tn�Ie���jP������/D�&�$SP��Kiw�G���1(G(�o�_��]�g��b�g���uWŝ��v�\Q�[e�ɪj�
P�w&0�w���uєס���RB�\sH���������$�}���sŚGBl3��#��R��8D�9��Ij@}�ء�]�+:��}U��us�#'����nl\�d^0����D�K�k��M�����
�<s�%�\]*�D}4W��:N����1���������h)�z����*�S*�<o��p{!�c��4�w>v�E���A�Ǔ2���B;s�ɀ���X�P����/PϥO�����ڑ.G3��Ț��K6��c�X�ؐ��:u�����%*3�1PJ�~��|�%�W�%,�S�������­53��c��z̑5���D�!}��<�Q1��z�2�،�2 NP�Y�NʕSª�b��`��['�Y��͵.P|�����N���$�AB�v�}<`��0��c������)s:Zϒc͘�B
�#q��y�\�l��.}&}��A}'�3�A#6�q|u<�;'$���ޡ��mh��ٚ>c;!V�� �   v���y�9���#�����IJ�n/��q�-�3���'"U�K젴��n��$X^w���X���uoR1��	6��f<Wœ�W���.NT��lЀ������F�0Ry$�����}�+\-��ߪM�q\9G�$��1��7f��1Ȗ˴?��/�2�A}!'��>�����q2ص�����ϟ�OG;      �      x������ � �      �      x������ � �      �      x�uY�r�F�]'��iǸ��$E�b�!Y�ٔH��E2 �GZ���]���=�	�������W���:'a�P�S�����.Ϫ����$�,Y�L�{|���߃0�
�������fk�Mm�}E�|W�%��D^H�4ߢy_�s��EI��u�?;��;��ʧ�]�W�^�:�V�]R�ܧ�����b<C�)�}u�^B�4o�{����ϴlY���ہgu�����~ϓ�g,q����;���~�ׇT�ֶ�	�
��K���&m�zW0���ۥՁ��-τd�^��U�+*�0�LDF �=P/=��\�W�g:�?6ذ��'������{���{[�6!#8�nО�M<�"+ ���;���1�5�?�ܻ�^q�^�01���+]*�,G4J��t_��YqǳYE����c��`i�U(��+�{v��X1$�(��|����lDVR�|ܻR/��!�\�R>cm��U{y6&�@��z�w�ІX?!+HLF�w��b��|�[�[Ҳ(������.,��������֗ԿK�]�#b/@8���k��������l�r�����ٖ{F^Ц@�X_Q��v܊���?@����ǈ�Fέ���_���1�[�9�_�wзC�J���ű8=��Af7�SQ�u�Q�	�L;)�?�W�ؖ�ƴ���!��H��I�WW��8��-j+�ÏY�ߡ|���5;Sm����\����s�%0�;ymKm�{[�����_��Ą��|����j�Ȇ^;����\��	2R[V�P���sc�!��������a����G꿧����m�kw�-w�jBWi~r�3X$��`|uCW�gOŹ�뇕j�W3�*NY.�F�"�akW�����b�ƭD�����֠O�����(��R(H�4ؿ��X����Ww48�+w|m��0�M�\��7�qvu�@;��s����1I[@,iPfu)$�0�PPhP�E�{�v(xkԇ�x�g!Đ�B������%��PB��s=Fk~��|��(�Ku�����[�Cx��H�rإ�{�pm/�������7Y��(�H.�p@ô(���$	��M� pņ���7�e�E!E��pDÃ�1^��8=\ҰLS���P$.����_�HeQL���5�pzrG��֋����>!�m�Ӣ��=�oڿ���rgv4�:�:���o��0�^�RG �i�2�{a+�:u���4*�ݹt[�N�:��hC�s�,ߑ�:!u�������@0 ��x?��8������,Ώ�����J^[�(����xI�R���	u���7n�������x���5/6���)��ҥG~��[����Ƶ;��/(�s���^�&�b���M�x{���w/)_on�(w�Il=�(W'�4q����T������ɀ&i�&w��h��$+�'�!'�	���,hR ~��a�*��_�EY|���S-/iQ" M��\�𿬐n.�X/1�r�{����F�k��XJ�ɐ&o����ayI�%%�ߴKS�oD�(iS"�M��Z�j�/	)�=������CD��7]�P���3u(�K�fOc0"�D��>�AP5����	v�1����4�ꔙLۂa���	,�5:ԇs�M;�X-��� 0����������gj�ֵ�لfn��'0�ӵ��Ɲۻj�Jv�I$�]K ���zt�9�Z��k	$���i,�n��Z��M��A	��b�\fS��t��]K`�������k	0�%����W7�4B:0�u��Ζ�sF�Vp�e+3^g�i�?���0�e�[��W���̶8?������Ͳm��H�	�2��͊�x��`~`����0�g:X����ٜ-�X��	�2�ـm8�t_�Ș7t��κ��Ŗ'��M�G����w~�8�c�wŀ�e�3x��'���x����`�����.��)e#V,��̗0�e�3�`��w��y��$S�C0_��w>�d�l�	߀ %��GX������'�����4G:+�o�%�Q6<�Ƈ�+%��4�xB �Tx~KH3�?xl�	������`����	-��&d�(�/�a:���	Xɣ��#�y`��w1��j�}�x�"V9��Fy��}��7~��<�c1�E���X�^��#Z�:g//��C���(�]LiQ(�m�`(�]�a(��O-�)�g�r�o]��j����T�0,oiY�4�@���Q�����\Id�ipR��tyOK���<<�%��1��
ʱ���J��<}�D���T�(]������6Sɷ��(o���p��4�_��9�r�b��)��_aԩ�S c6��F��jC�#�d�D-/�Үְ��8�����ًH"lܖܱ���]�wK'��A0��c;����' 6k��.�5�rM�l�� �������BMp��S�5JkWSZeiY:�"S�pmC�ނ�j;��^M��Ai���ՄVG$�g9]��Rf����7���Rn��ъ�W�_�cN �F���]NZ���VAs�R�G�$��F�1t���ċ8��w�r�)6[f����,� �R����Bl,���5JyWKpZP�]��Qڻz��w��+\�1�%���.�W���E�oCV�k������=��ԓGT����Z�߳��¹�(^?�7oW�e�x=���5���l����� t���@6~@&�������wH�b/E8
Rl��oю��xr���x��5��vn'�~]<9ϱ�3 *e��9��yVie������^�T>�Hm	�8)[^����@ H�Q⼾���%�b5g��y3���#�`10g��yӥ�3��X�p�y6J����Y��$0��)3j�g@��R�a���~W�p��h �F��f��aU�<�Œ�7�)������doi����� lPJ��6t�rh'yi���.��S-���լ (�6���݀�S�ϩ�.��6J���t�����4��-e�zHO�<��e���qF��Ԑ��l�0?��cvzrO�9���e6J�!:�O��S�:h�Q꼾�(��I �]�w��<g�i������V���	^�'�x~���6J��$"-LS�HZ_�,�l�\,�z��.��A��J���!L��5��$�9w5��˶���j<��u[Ui����Ĺ"[��X�]Y#AfJt�d���2%�rrU�Aj���*9���_l���2I�#n�O9�{��*QǺ���q��]��U�>��(u�1��f�+0���r@DVY���!��8>��\���U.?���ㇶ��H
Bo��/��/������}0�+�	Y��L�ߊ�N�^gA���Ŭy���)�3��G�aa+Fg.�
���t��)��>��\J`�V+����)������g�ju�� `U��>����?_<� �U
���[7��O?˅�H-!�o�)�cq(Mq��z��A�cb�ʅ�GZ<_�8D��\�*�P_��Q���XXO�ԟSe�ȼB��Xix��'e$7˥rU
�a���s�9J�@WU�̀n���0.�kr�sv<6�2�
�:��ziyj�s��\jp*Ʒ�cUV����agu���Z`���P�X���i�����Rd��5�M��u���?��e�>�`,�j�[��0&�wo ��}�6����*6�'t��?G����fG�NP���sA^e�pL��dq[�a��*Ef+�}s��W�@��H�9-�z�2�Rh��d5jBd�S)����BߴU�����'S�V����W�bn�OS���3]5�,�<t�M�e!c�Ǟ,~ddf�E���}�dq��řC�+ᅒ�NSN�������)Տ�t|x�<Ve���=�Yv���n�.y�M�B�X�=5*�_�&�A�X?���P(F�����!粰߭�㑭@]U�L!NR�Ncj7�Y��*���Ǫ�u�^]U��U���X�BOo����'�7wc�����/nz ��@���=��X X��M����'��Ɛo�m���-��8��!D�U   as}��(��ǚ/'Y�7é��ҷMp�P7V��3'C$7�^.�mj�>����E�<�	�Ú޻o\��U��&�8VE�r@��T����T�t��g-���"�8�{��łwX��ʦ;�,p�Ñ�0�)H�2guC+0�'<�R}��7V���>Tk��#�R���2�f����?���α�u����PR��_Ѥ���B%��̱*u+�5�@��"�f)��н;��2{��G/$����D��ԯ #b+���\�e!���#�������M�����XB�eQU�U���Z[1h�L0/Қ#��=�\�*�`�vƅB�9���f3 V��G���m@A%�K/��c�?�p�I?�V�K�?�����D?�Js�X�|5���\WۃlWl� �h�we3S̟��|f�X �?7k������i>Ex?�g����\Y;���?�VjB0jM�c�@J8hnJ8?�E�������Ͽ������N�����Z'T��[�D!38x����i���ΥxZu���x�����      �   H   x�3���I���".cN������(ߔ3$5/��3�*MO����t+-I�ρr�8SRrR��=... �c      �   _   x�3�t�JM)J����,�2�tI�M,�pL8��!,SΠԲԢ�L׌3(��45'�M�2�tN��Q�OSH)-�T0��Zp�+�B�1z\\\ ��T      �      x������ � �      �   3   x�3���/N�4200�50�5����!.CN������|��1�%c���� ���      �   ?   x�-���0��r1�׹���I ?�H+D���j�z����Z�y~�U3��>&���2�	1�c      �   ;   x�3�4�4�4�44�4��2�A��a��2��L�,8����3�r1z\\\ �2x     