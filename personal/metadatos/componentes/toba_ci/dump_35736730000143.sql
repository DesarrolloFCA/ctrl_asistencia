------------------------------------------------------------
--[35736730000143]--  ci_catedra - cons_car_cat 
------------------------------------------------------------

------------------------------------------------------------
-- apex_objeto
------------------------------------------------------------

--- INICIO Grupo de desarrollo 35736730
INSERT INTO apex_objeto (proyecto, objeto, anterior, identificador, reflexivo, clase_proyecto, clase, punto_montaje, subclase, subclase_archivo, objeto_categoria_proyecto, objeto_categoria, nombre, titulo, colapsable, descripcion, fuente_datos_proyecto, fuente_datos, solicitud_registrar, solicitud_obj_obs_tipo, solicitud_obj_observacion, parametro_a, parametro_b, parametro_c, parametro_d, parametro_e, parametro_f, usuario, creacion, posicion_botonera) VALUES (
	'personal', --proyecto
	'35736730000143', --objeto
	NULL, --anterior
	NULL, --identificador
	NULL, --reflexivo
	'toba', --clase_proyecto
	'toba_ci', --clase
	'35736730000001', --punto_montaje
	NULL, --subclase
	NULL, --subclase_archivo
	NULL, --objeto_categoria_proyecto
	NULL, --objeto_categoria
	'ci_catedra - cons_car_cat', --nombre
	NULL, --titulo
	'0', --colapsable
	NULL, --descripcion
	NULL, --fuente_datos_proyecto
	NULL, --fuente_datos
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
	'2020-08-15 12:43:27', --creacion
	'abajo'  --posicion_botonera
);
--- FIN Grupo de desarrollo 35736730

------------------------------------------------------------
-- apex_objeto_mt_me
------------------------------------------------------------
INSERT INTO apex_objeto_mt_me (objeto_mt_me_proyecto, objeto_mt_me, ev_procesar_etiq, ev_cancelar_etiq, ancho, alto, posicion_botonera, tipo_navegacion, botonera_barra_item, con_toc, incremental, debug_eventos, activacion_procesar, activacion_cancelar, ev_procesar, ev_cancelar, objetos, post_procesar, metodo_despachador, metodo_opciones) VALUES (
	'personal', --objeto_mt_me_proyecto
	'35736730000143', --objeto_mt_me
	NULL, --ev_procesar_etiq
	NULL, --ev_cancelar_etiq
	NULL, --ancho
	NULL, --alto
	NULL, --posicion_botonera
	'tab_v', --tipo_navegacion
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
	'35736730000126', --dep_id
	'35736730000143', --objeto_consumidor
	'35736730000144', --objeto_proveedor
	'ci_cargos', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'personal', --proyecto
	'35736730000127', --dep_id
	'35736730000143', --objeto_consumidor
	'35736730000145', --objeto_proveedor
	'ci_detalle', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'personal', --proyecto
	'35736730000141', --dep_id
	'35736730000143', --objeto_consumidor
	'35736730000157', --objeto_proveedor
	'ci_esq_cargo', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'personal', --proyecto
	'35736730000129', --dep_id
	'35736730000143', --objeto_consumidor
	'35736730000147', --objeto_proveedor
	'ci_personal', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'personal', --proyecto
	'35736730000128', --dep_id
	'35736730000143', --objeto_consumidor
	'35736730000146', --objeto_proveedor
	'ci_total', --identificador
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
	'35736730000143', --objeto_ci
	'35736730000049', --pantalla
	'cargos', --identificador
	'1', --orden
	'Cargos de la Cátedra', --etiqueta
	NULL, --descripcion
	NULL, --tip
	'apex', --imagen_recurso_origen
	NULL, --imagen
	NULL, --objetos
	NULL, --eventos
	NULL, --subclase
	NULL, --subclase_archivo
	'<p>[dep id=ci_cargos]</p>', --template
	NULL, --template_impresion
	'35736730000001'  --punto_montaje
);
INSERT INTO apex_objeto_ci_pantalla (objeto_ci_proyecto, objeto_ci, pantalla, identificador, orden, etiqueta, descripcion, tip, imagen_recurso_origen, imagen, objetos, eventos, subclase, subclase_archivo, template, template_impresion, punto_montaje) VALUES (
	'personal', --objeto_ci_proyecto
	'35736730000143', --objeto_ci
	'35736730000050', --pantalla
	'detalle', --identificador
	'2', --orden
	'Detalle de Costos de Cátedra', --etiqueta
	NULL, --descripcion
	NULL, --tip
	'apex', --imagen_recurso_origen
	NULL, --imagen
	NULL, --objetos
	NULL, --eventos
	NULL, --subclase
	NULL, --subclase_archivo
	'<p>[dep id=ci_detalle]</p>', --template
	NULL, --template_impresion
	NULL  --punto_montaje
);
INSERT INTO apex_objeto_ci_pantalla (objeto_ci_proyecto, objeto_ci, pantalla, identificador, orden, etiqueta, descripcion, tip, imagen_recurso_origen, imagen, objetos, eventos, subclase, subclase_archivo, template, template_impresion, punto_montaje) VALUES (
	'personal', --objeto_ci_proyecto
	'35736730000143', --objeto_ci
	'35736730000051', --pantalla
	'total', --identificador
	'3', --orden
	'Costo Total de Cátedra', --etiqueta
	NULL, --descripcion
	NULL, --tip
	'apex', --imagen_recurso_origen
	NULL, --imagen
	NULL, --objetos
	NULL, --eventos
	NULL, --subclase
	NULL, --subclase_archivo
	'<p>[dep id=ci_total]</p>', --template
	NULL, --template_impresion
	NULL  --punto_montaje
);
INSERT INTO apex_objeto_ci_pantalla (objeto_ci_proyecto, objeto_ci, pantalla, identificador, orden, etiqueta, descripcion, tip, imagen_recurso_origen, imagen, objetos, eventos, subclase, subclase_archivo, template, template_impresion, punto_montaje) VALUES (
	'personal', --objeto_ci_proyecto
	'35736730000143', --objeto_ci
	'35736730000052', --pantalla
	'personal', --identificador
	'5', --orden
	'Personal de Cátedra', --etiqueta
	NULL, --descripcion
	NULL, --tip
	'apex', --imagen_recurso_origen
	NULL, --imagen
	NULL, --objetos
	NULL, --eventos
	NULL, --subclase
	NULL, --subclase_archivo
	'<p>[dep id=ci_personal]</p>', --template
	NULL, --template_impresion
	NULL  --punto_montaje
);
INSERT INTO apex_objeto_ci_pantalla (objeto_ci_proyecto, objeto_ci, pantalla, identificador, orden, etiqueta, descripcion, tip, imagen_recurso_origen, imagen, objetos, eventos, subclase, subclase_archivo, template, template_impresion, punto_montaje) VALUES (
	'personal', --objeto_ci_proyecto
	'35736730000143', --objeto_ci
	'35736730000059', --pantalla
	'esquema', --identificador
	'4', --orden
	'Esquemas de cargos', --etiqueta
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
	NULL  --punto_montaje
);
--- FIN Grupo de desarrollo 35736730

------------------------------------------------------------
-- apex_objetos_pantalla
------------------------------------------------------------
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000049', --pantalla
	'35736730000143', --objeto_ci
	'0', --orden
	'35736730000126'  --dep_id
);
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000050', --pantalla
	'35736730000143', --objeto_ci
	'0', --orden
	'35736730000127'  --dep_id
);
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000051', --pantalla
	'35736730000143', --objeto_ci
	'0', --orden
	'35736730000128'  --dep_id
);
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000052', --pantalla
	'35736730000143', --objeto_ci
	'0', --orden
	'35736730000129'  --dep_id
);
INSERT INTO apex_objetos_pantalla (proyecto, pantalla, objeto_ci, orden, dep_id) VALUES (
	'personal', --proyecto
	'35736730000059', --pantalla
	'35736730000143', --objeto_ci
	'0', --orden
	'35736730000141'  --dep_id
);
