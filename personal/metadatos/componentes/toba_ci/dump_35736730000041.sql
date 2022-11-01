------------------------------------------------------------
--[35736730000041]--  Login Genérico 
------------------------------------------------------------

------------------------------------------------------------
-- apex_objeto
------------------------------------------------------------

--- INICIO Grupo de desarrollo 35736730
INSERT INTO apex_objeto (proyecto, objeto, anterior, identificador, reflexivo, clase_proyecto, clase, punto_montaje, subclase, subclase_archivo, objeto_categoria_proyecto, objeto_categoria, nombre, titulo, colapsable, descripcion, fuente_datos_proyecto, fuente_datos, solicitud_registrar, solicitud_obj_obs_tipo, solicitud_obj_observacion, parametro_a, parametro_b, parametro_c, parametro_d, parametro_e, parametro_f, usuario, creacion, posicion_botonera) VALUES (
	'personal', --proyecto
	'35736730000041', --objeto
	NULL, --anterior
	NULL, --identificador
	NULL, --reflexivo
	'toba', --clase_proyecto
	'toba_ci', --clase
	'35736730000001', --punto_montaje
	'ci_login', --subclase
	'login/ci_login.php', --subclase_archivo
	NULL, --objeto_categoria_proyecto
	NULL, --objeto_categoria
	'Login Genérico', --nombre
	'Autentificación de Usuarios', --titulo
	'0', --colapsable
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
	'2006-07-20 13:55:33', --creacion
	'abajo'  --posicion_botonera
);
--- FIN Grupo de desarrollo 35736730

------------------------------------------------------------
-- apex_objeto_mt_me
------------------------------------------------------------
INSERT INTO apex_objeto_mt_me (objeto_mt_me_proyecto, objeto_mt_me, ev_procesar_etiq, ev_cancelar_etiq, ancho, alto, posicion_botonera, tipo_navegacion, botonera_barra_item, con_toc, incremental, debug_eventos, activacion_procesar, activacion_cancelar, ev_procesar, ev_cancelar, objetos, post_procesar, metodo_despachador, metodo_opciones) VALUES (
	'personal', --objeto_mt_me_proyecto
	'35736730000041', --objeto_mt_me
	NULL, --ev_procesar_etiq
	NULL, --ev_cancelar_etiq
	NULL, --ancho
	NULL, --alto
	NULL, --posicion_botonera
	NULL, --tipo_navegacion
	'0', --botonera_barra_item
	'0', --con_toc
	NULL, --incremental
	NULL, --debug_eventos
	NULL, --activacion_procesar
	NULL, --activacion_cancelar
	NULL, --ev_procesar
	NULL, --ev_cancelar
	NULL, --objetos
	NULL, --post_procesar
	NULL, --metodo_despachador
	NULL  --metodo_opciones
);

------------------------------------------------------------
-- apex_objeto_dependencias
------------------------------------------------------------

--- INICIO Grupo de desarrollo 35736730
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'personal', --proyecto
	'35736730000037', --dep_id
	'35736730000041', --objeto_consumidor
	'35736730000036', --objeto_proveedor
	'cas', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'personal', --proyecto
	'35736730000038', --dep_id
	'35736730000041', --objeto_consumidor
	'35736730000037', --objeto_proveedor
	'datos', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'personal', --proyecto
	'35736730000039', --dep_id
	'35736730000041', --objeto_consumidor
	'35736730000038', --objeto_proveedor
	'form_passwd_vencido', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'personal', --proyecto
	'35736730000040', --dep_id
	'35736730000041', --objeto_consumidor
	'35736730000039', --objeto_proveedor
	'openid', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'personal', --proyecto
	'35736730000041', --dep_id
	'35736730000041', --objeto_consumidor
	'35736730000040', --objeto_proveedor
	'seleccion_usuario', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
--- FIN Grupo de desarrollo 35736730

------------------------------------------------------------
-- apex_objeto_ci_pantalla
------------------------------------------------------------

--- INICIO Grupo de desarrollo 35736730
INSERT INTO apex_objeto_ci_pantalla (objeto_ci_proyecto, objeto_ci, pantalla, identificador, orden, etiqueta, descripcion, tip, imagen_recurso_origen, imagen, objetos, eventos, subclase, subclase_archivo, template, template_impresion, punto_montaje) VALUES (
	'personal', --objeto_ci_proyecto
	'35736730000041', --objeto_ci
	'35736730000010', --pantalla
	'cambiar_contrasenia', --identificador
	'2', --orden
	'Contraseña', --etiqueta
	NULL, --descripcion
	NULL, --tip
	'apex', --imagen_recurso_origen
	NULL, --imagen
	NULL, --objetos
	NULL, --eventos
	NULL, --subclase
	NULL, --subclase_archivo
	NULL, --template
	NULL, --template_impresion
	'35736730000001'  --punto_montaje
);
INSERT INTO apex_objeto_ci_pantalla (objeto_ci_proyecto, objeto_ci, pantalla, identificador, orden, etiqueta, descripcion, tip, imagen_recurso_origen, imagen, objetos, eventos, subclase, subclase_archivo, template, template_impresion, punto_montaje) VALUES (
	'personal', --objeto_ci_proyecto
	'35736730000041', --objeto_ci
	'35736730000011', --pantalla
	'login', --identificador
	'1', --orden
	'Login', --etiqueta
	NULL, --descripcion
	NULL, --tip
	'apex', --imagen_recurso_origen
	NULL, --imagen
	NULL, --objetos
	NULL, --eventos
	'pant_login', --subclase
	'login/pant_login.php', --subclase_archivo
	NULL, --template
	NULL, --template_impresion
	'35736730000001'  --punto_montaje
);
--- FIN Grupo de desarrollo 35736730

------------------------------------------------------------
-- apex_objetos_pantalla
------------------------------------------------------------
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000010', --pantalla
	'35736730000041', --objeto_ci
	'0', --orden
	'35736730000039'  --dep_id
);
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000011', --pantalla
	'35736730000041', --objeto_ci
	'3', --orden
	'35736730000037'  --dep_id
);
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000011', --pantalla
	'35736730000041', --objeto_ci
	'0', --orden
	'35736730000038'  --dep_id
);
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000011', --pantalla
	'35736730000041', --objeto_ci
	'1', --orden
	'35736730000040'  --dep_id
);
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000011', --pantalla
	'35736730000041', --objeto_ci
	'2', --orden
	'35736730000041'  --dep_id
);
