<?php

class toba_mc_comp__1000299
{
	static function get_metadatos()
	{
		return array (
  '_info' => 
  array (
    'proyecto' => 'toba_editor',
    'objeto' => 1000299,
    'anterior' => NULL,
    'identificador' => NULL,
    'reflexivo' => NULL,
    'clase_proyecto' => 'toba',
    'clase' => 'toba_ei_formulario',
    'subclase' => 'form_molde',
    'subclase_archivo' => 'asistentes/form_molde.php',
    'objeto_categoria_proyecto' => NULL,
    'objeto_categoria' => NULL,
    'nombre' => 'Asistente de operaciones - pant_generacion - form_molde',
    'titulo' => NULL,
    'colapsable' => 0,
    'descripcion' => NULL,
    'fuente_proyecto' => 'toba_editor',
    'fuente' => 'instancia',
    'solicitud_registrar' => NULL,
    'solicitud_obj_obs_tipo' => NULL,
    'solicitud_obj_observacion' => NULL,
    'parametro_a' => NULL,
    'parametro_b' => NULL,
    'parametro_c' => NULL,
    'parametro_d' => NULL,
    'parametro_e' => NULL,
    'parametro_f' => NULL,
    'usuario' => NULL,
    'creacion' => '2007-07-23 09:59:46',
    'punto_montaje' => 12,
    'clase_editor_proyecto' => 'toba_editor',
    'clase_editor_item' => '1000255',
    'clase_archivo' => 'nucleo/componentes/interface/toba_ei_formulario.php',
    'clase_vinculos' => NULL,
    'clase_editor' => '1000255',
    'clase_icono' => 'objetos/ut_formulario.gif',
    'clase_descripcion_corta' => 'ei_formulario',
    'clase_instanciador_proyecto' => 'toba_editor',
    'clase_instanciador_item' => '1842',
    'objeto_existe_ayuda' => NULL,
    'ap_clase' => NULL,
    'ap_archivo' => NULL,
    'ap_punto_montaje' => NULL,
    'cant_dependencias' => 0,
    'posicion_botonera' => 'abajo',
  ),
  '_info_eventos' => 
  array (
    0 => 
    array (
      'evento_id' => 1000333,
      'identificador' => 'modificacion',
      'etiqueta' => '&Modificar',
      'maneja_datos' => 1,
      'sobre_fila' => NULL,
      'confirmacion' => NULL,
      'estilo' => NULL,
      'imagen_recurso_origen' => 'apex',
      'imagen' => NULL,
      'en_botonera' => 0,
      'ayuda' => NULL,
      'ci_predep' => NULL,
      'implicito' => 1,
      'defecto' => 0,
      'grupo' => NULL,
      'accion' => NULL,
      'accion_imphtml_debug' => NULL,
      'accion_vinculo_carpeta' => NULL,
      'accion_vinculo_item' => NULL,
      'accion_vinculo_objeto' => NULL,
      'accion_vinculo_popup' => NULL,
      'accion_vinculo_popup_param' => NULL,
      'accion_vinculo_celda' => NULL,
      'accion_vinculo_target' => NULL,
      'accion_vinculo_servicio' => NULL,
      'es_seleccion_multiple' => 0,
      'es_autovinculo' => 0,
    ),
  ),
  '_info_puntos_control' => 
  array (
  ),
  '_info_formulario' => 
  array (
    'auto_reset' => NULL,
    'ancho' => '100%',
    'ancho_etiqueta' => '200px',
    'expandir_descripcion' => 0,
    'no_imprimir_efs_sin_estado' => 0,
    'resaltar_efs_con_estado' => 0,
    'template' => NULL,
    'template_impresion' => NULL,
  ),
  '_info_formulario_ef' => 
  array (
    0 => 
    array (
      'objeto_ei_formulario_fila' => 33000106,
      'objeto_ei_formulario' => 1000299,
      'objeto_ei_formulario_proyecto' => 'toba_editor',
      'identificador' => 'punto_montaje',
      'elemento_formulario' => 'ef_combo',
      'columnas' => 'punto_montaje',
      'obligatorio' => 1,
      'oculto_relaja_obligatorio' => 0,
      'orden' => '1',
      'etiqueta' => 'Punto de Montaje',
      'etiqueta_estilo' => NULL,
      'descripcion' => NULL,
      'colapsado' => 0,
      'desactivado' => 0,
      'estilo' => NULL,
      'total' => NULL,
      'inicializacion' => NULL,
      'permitir_html' => 0,
      'deshabilitar_rest_func' => 0,
      'estado_defecto' => NULL,
      'solo_lectura' => 0,
      'solo_lectura_modificacion' => 0,
      'carga_metodo' => 'get_pms',
      'carga_clase' => NULL,
      'carga_include' => NULL,
      'carga_dt' => NULL,
      'carga_consulta_php' => 1,
      'carga_sql' => NULL,
      'carga_fuente' => 'instancia',
      'carga_lista' => NULL,
      'carga_col_clave' => 'id',
      'carga_col_desc' => 'etiqueta',
      'carga_maestros' => NULL,
      'carga_cascada_relaj' => 0,
      'cascada_mantiene_estado' => 0,
      'carga_permite_no_seteado' => 0,
      'carga_no_seteado' => NULL,
      'carga_no_seteado_ocultar' => 0,
      'edit_tamano' => NULL,
      'edit_maximo' => NULL,
      'edit_mascara' => NULL,
      'edit_unidad' => NULL,
      'edit_rango' => NULL,
      'edit_filas' => NULL,
      'edit_columnas' => NULL,
      'edit_wrap' => NULL,
      'edit_resaltar' => NULL,
      'edit_ajustable' => NULL,
      'edit_confirmar_clave' => NULL,
      'edit_expreg' => NULL,
      'popup_item' => NULL,
      'popup_proyecto' => NULL,
      'popup_editable' => NULL,
      'popup_ventana' => NULL,
      'popup_carga_desc_metodo' => NULL,
      'popup_carga_desc_clase' => NULL,
      'popup_carga_desc_include' => NULL,
      'popup_puede_borrar_estado' => NULL,
      'fieldset_fin' => NULL,
      'check_valor_si' => NULL,
      'check_valor_no' => NULL,
      'check_desc_si' => NULL,
      'check_desc_no' => NULL,
      'check_ml_toggle' => NULL,
      'fijo_sin_estado' => NULL,
      'editor_ancho' => NULL,
      'editor_alto' => NULL,
      'editor_botonera' => NULL,
      'selec_cant_minima' => NULL,
      'selec_cant_maxima' => NULL,
      'selec_utilidades' => NULL,
      'selec_tamano' => NULL,
      'selec_ancho' => NULL,
      'selec_serializar' => NULL,
      'selec_cant_columnas' => NULL,
      'upload_extensiones' => NULL,
      'punto_montaje' => 12,
      'placeholder' => NULL,
      'carga_consulta_php_clase' => 'toba_info_editores',
      'carga_consulta_php_archivo' => 'modelo/info/toba_info_editores.php',
    ),
    1 => 
    array (
      'objeto_ei_formulario_fila' => 1000445,
      'objeto_ei_formulario' => 1000299,
      'objeto_ei_formulario_proyecto' => 'toba_editor',
      'identificador' => 'carpeta_archivos',
      'elemento_formulario' => 'ef_popup',
      'columnas' => 'carpeta_archivos',
      'obligatorio' => 1,
      'oculto_relaja_obligatorio' => 0,
      'orden' => '2',
      'etiqueta' => 'Carpeta archivos',
      'etiqueta_estilo' => NULL,
      'descripcion' => 'Carpeta relativa al path php del proyecto en donde se almacenarán las clases generadas automáticamente por el asistente.',
      'colapsado' => 0,
      'desactivado' => 0,
      'estilo' => NULL,
      'total' => NULL,
      'inicializacion' => NULL,
      'permitir_html' => NULL,
      'deshabilitar_rest_func' => NULL,
      'estado_defecto' => 'prueba',
      'solo_lectura' => 0,
      'solo_lectura_modificacion' => 0,
      'carga_metodo' => NULL,
      'carga_clase' => NULL,
      'carga_include' => NULL,
      'carga_dt' => NULL,
      'carga_consulta_php' => NULL,
      'carga_sql' => NULL,
      'carga_fuente' => NULL,
      'carga_lista' => NULL,
      'carga_col_clave' => NULL,
      'carga_col_desc' => NULL,
      'carga_maestros' => NULL,
      'carga_cascada_relaj' => NULL,
      'cascada_mantiene_estado' => 0,
      'carga_permite_no_seteado' => 0,
      'carga_no_seteado' => NULL,
      'carga_no_seteado_ocultar' => NULL,
      'edit_tamano' => 40,
      'edit_maximo' => NULL,
      'edit_mascara' => NULL,
      'edit_unidad' => NULL,
      'edit_rango' => NULL,
      'edit_filas' => NULL,
      'edit_columnas' => NULL,
      'edit_wrap' => NULL,
      'edit_resaltar' => NULL,
      'edit_ajustable' => NULL,
      'edit_confirmar_clave' => NULL,
      'edit_expreg' => NULL,
      'popup_item' => '1000111',
      'popup_proyecto' => 'toba_editor',
      'popup_editable' => 1,
      'popup_ventana' => 'width: 450,height: 400,scrollbars: yes',
      'popup_carga_desc_metodo' => NULL,
      'popup_carga_desc_clase' => NULL,
      'popup_carga_desc_include' => NULL,
      'popup_puede_borrar_estado' => NULL,
      'fieldset_fin' => NULL,
      'check_valor_si' => NULL,
      'check_valor_no' => NULL,
      'check_desc_si' => NULL,
      'check_desc_no' => NULL,
      'check_ml_toggle' => NULL,
      'fijo_sin_estado' => NULL,
      'editor_ancho' => NULL,
      'editor_alto' => NULL,
      'editor_botonera' => NULL,
      'selec_cant_minima' => NULL,
      'selec_cant_maxima' => NULL,
      'selec_utilidades' => NULL,
      'selec_tamano' => NULL,
      'selec_ancho' => NULL,
      'selec_serializar' => NULL,
      'selec_cant_columnas' => NULL,
      'upload_extensiones' => NULL,
      'punto_montaje' => 12,
      'placeholder' => NULL,
      'carga_consulta_php_clase' => NULL,
      'carga_consulta_php_archivo' => NULL,
    ),
    2 => 
    array (
      'objeto_ei_formulario_fila' => 1000446,
      'objeto_ei_formulario' => 1000299,
      'objeto_ei_formulario_proyecto' => 'toba_editor',
      'identificador' => 'prefijo_clases',
      'elemento_formulario' => 'ef_editable',
      'columnas' => 'prefijo_clases',
      'obligatorio' => 1,
      'oculto_relaja_obligatorio' => 0,
      'orden' => '3',
      'etiqueta' => 'Anexo nombre clases',
      'etiqueta_estilo' => NULL,
      'descripcion' => 'Puede anexar un nombre a cada clase PHP generada automáticamente por el asistente.',
      'colapsado' => 0,
      'desactivado' => 0,
      'estilo' => NULL,
      'total' => NULL,
      'inicializacion' => NULL,
      'permitir_html' => 0,
      'deshabilitar_rest_func' => 0,
      'estado_defecto' => 'prueba',
      'solo_lectura' => 0,
      'solo_lectura_modificacion' => 0,
      'carga_metodo' => NULL,
      'carga_clase' => NULL,
      'carga_include' => NULL,
      'carga_dt' => NULL,
      'carga_consulta_php' => NULL,
      'carga_sql' => NULL,
      'carga_fuente' => NULL,
      'carga_lista' => NULL,
      'carga_col_clave' => NULL,
      'carga_col_desc' => NULL,
      'carga_maestros' => NULL,
      'carga_cascada_relaj' => NULL,
      'cascada_mantiene_estado' => 0,
      'carga_permite_no_seteado' => 0,
      'carga_no_seteado' => NULL,
      'carga_no_seteado_ocultar' => NULL,
      'edit_tamano' => NULL,
      'edit_maximo' => NULL,
      'edit_mascara' => NULL,
      'edit_unidad' => NULL,
      'edit_rango' => NULL,
      'edit_filas' => NULL,
      'edit_columnas' => NULL,
      'edit_wrap' => NULL,
      'edit_resaltar' => NULL,
      'edit_ajustable' => NULL,
      'edit_confirmar_clave' => NULL,
      'edit_expreg' => '/^[a-zA-Z0-9_]+$/',
      'popup_item' => NULL,
      'popup_proyecto' => NULL,
      'popup_editable' => NULL,
      'popup_ventana' => NULL,
      'popup_carga_desc_metodo' => NULL,
      'popup_carga_desc_clase' => NULL,
      'popup_carga_desc_include' => NULL,
      'popup_puede_borrar_estado' => NULL,
      'fieldset_fin' => NULL,
      'check_valor_si' => NULL,
      'check_valor_no' => NULL,
      'check_desc_si' => NULL,
      'check_desc_no' => NULL,
      'check_ml_toggle' => NULL,
      'fijo_sin_estado' => NULL,
      'editor_ancho' => NULL,
      'editor_alto' => NULL,
      'editor_botonera' => NULL,
      'selec_cant_minima' => NULL,
      'selec_cant_maxima' => NULL,
      'selec_utilidades' => NULL,
      'selec_tamano' => NULL,
      'selec_ancho' => NULL,
      'selec_serializar' => NULL,
      'selec_cant_columnas' => NULL,
      'upload_extensiones' => NULL,
      'punto_montaje' => 12,
      'placeholder' => NULL,
      'carga_consulta_php_clase' => NULL,
      'carga_consulta_php_archivo' => NULL,
    ),
  ),
);
	}

}

?>