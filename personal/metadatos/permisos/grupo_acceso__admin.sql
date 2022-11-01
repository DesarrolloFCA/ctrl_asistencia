
------------------------------------------------------------
-- apex_usuario_grupo_acc
------------------------------------------------------------
INSERT INTO apex_usuario_grupo_acc (proyecto, usuario_grupo_acc, nombre, nivel_acceso, descripcion, vencimiento, dias, hora_entrada, hora_salida, listar, permite_edicion, menu_usuario) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	'Administrador', --nombre
	'0', --nivel_acceso
	'Accede a toda la funcionalidad', --descripcion
	NULL, --vencimiento
	NULL, --dias
	NULL, --hora_entrada
	NULL, --hora_salida
	NULL, --listar
	'1', --permite_edicion
	NULL  --menu_usuario
);

------------------------------------------------------------
-- apex_usuario_grupo_acc_item
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'2'  --item
);
--- FIN Grupo de desarrollo 0

--- INICIO Grupo de desarrollo 35736730
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000009'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000010'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000011'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000012'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000015'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000016'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000017'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000019'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000021'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000027'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000035'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000037'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'personal', --proyecto
	'admin', --usuario_grupo_acc
	NULL, --item_id
	'35736730000038'  --item
);
--- FIN Grupo de desarrollo 35736730
