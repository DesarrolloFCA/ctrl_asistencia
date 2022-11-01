------------------------------------------------------------
--[35736730000070]--  reajustes 
------------------------------------------------------------

------------------------------------------------------------
-- apex_objeto
------------------------------------------------------------

--- INICIO Grupo de desarrollo 35736730
INSERT INTO apex_objeto (proyecto, objeto, anterior, identificador, reflexivo, clase_proyecto, clase, punto_montaje, subclase, subclase_archivo, objeto_categoria_proyecto, objeto_categoria, nombre, titulo, colapsable, descripcion, fuente_datos_proyecto, fuente_datos, solicitud_registrar, solicitud_obj_obs_tipo, solicitud_obj_observacion, parametro_a, parametro_b, parametro_c, parametro_d, parametro_e, parametro_f, usuario, creacion, posicion_botonera) VALUES (
	'personal', --proyecto
	'35736730000070', --objeto
	NULL, --anterior
	NULL, --identificador
	NULL, --reflexivo
	'toba', --clase_proyecto
	'toba_datos_tabla', --clase
	'35736730000001', --punto_montaje
	'dt_reajustes', --subclase
	'datos/dt_reajustes.php', --subclase_archivo
	NULL, --objeto_categoria_proyecto
	NULL, --objeto_categoria
	'reajustes', --nombre
	NULL, --titulo
	NULL, --colapsable
	NULL, --descripcion
	'personal', --fuente_datos_proyecto
	'personal', --fuente_datos
	NULL, --solicitud_registrar
	NULL, --solicitud_obj_obs_tipo
	NULL, --solicitud_obj_observacion
	NULL, --parametro_a
	NULL, --parametro_b
	NULL, --parametro_c
	NULL, --parametro_d
	NULL, --parametro_e
	NULL, --parametro_f
	NULL, --usuario
	'2020-07-17 16:51:40', --creacion
	NULL  --posicion_botonera
);
--- FIN Grupo de desarrollo 35736730

------------------------------------------------------------
-- apex_objeto_db_registros
------------------------------------------------------------
INSERT INTO apex_objeto_db_registros (objeto_proyecto, objeto, max_registros, min_registros, punto_montaje, ap, ap_clase, ap_archivo, tabla, tabla_ext, alias, modificar_claves, fuente_datos_proyecto, fuente_datos, permite_actualizacion_automatica, esquema, esquema_ext) VALUES (
	'personal', --objeto_proyecto
	'35736730000070', --objeto
	NULL, --max_registros
	NULL, --min_registros
	'35736730000001', --punto_montaje
	'1', --ap
	NULL, --ap_clase
	NULL, --ap_archivo
	'reajustes', --tabla
	NULL, --tabla_ext
	NULL, --alias
	'0', --modificar_claves
	'personal', --fuente_datos_proyecto
	'personal', --fuente_datos
	'1', --permite_actualizacion_automatica
	'public', --esquema
	'public'  --esquema_ext
);

------------------------------------------------------------
-- apex_objeto_db_registros_col
------------------------------------------------------------

--- INICIO Grupo de desarrollo 35736730
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'personal', --objeto_proyecto
	'35736730000070', --objeto
	'35736730000041', --col_id
	'reajuste', --columna
	'E', --tipo
	'1', --pk
	'reajustes_reajuste_seq', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'1', --no_nulo_db
	'0', --externa
	'reajustes'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'personal', --objeto_proyecto
	'35736730000070', --objeto
	'35736730000042', --col_id
	'nro_reajuste', --columna
	'C', --tipo
	'0', --pk
	'', --secuencia
	'60', --largo
	NULL, --no_nulo
	'1', --no_nulo_db
	'0', --externa
	'reajustes'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'personal', --objeto_proyecto
	'35736730000070', --objeto
	'35736730000043', --col_id
	'documento', --columna
	'C', --tipo
	'0', --pk
	'', --secuencia
	'1000', --largo
	NULL, --no_nulo
	'0', --no_nulo_db
	'0', --externa
	'reajustes'  --tabla
);
--- FIN Grupo de desarrollo 35736730
