<?php

class toba_mc_comp__1821
{
	static function get_metadatos()
	{
		return array (
  '_info' => 
  array (
    'proyecto' => 'toba_editor',
    'objeto' => 1821,
    'anterior' => NULL,
    'identificador' => NULL,
    'reflexivo' => NULL,
    'clase_proyecto' => 'toba',
    'clase' => 'toba_ei_cuadro',
    'subclase' => 'cuadro_actividad_local',
    'subclase_archivo' => 'utilitarios/actividad_local/cuadro_actividad_local.php',
    'objeto_categoria_proyecto' => NULL,
    'objeto_categoria' => NULL,
    'nombre' => 'Listado de cambios',
    'titulo' => NULL,
    'colapsable' => NULL,
    'descripcion' => NULL,
    'fuente_proyecto' => NULL,
    'fuente' => NULL,
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
    'creacion' => '2006-04-17 15:28:47',
    'punto_montaje' => 12,
    'clase_editor_proyecto' => 'toba_editor',
    'clase_editor_item' => '1000253',
    'clase_archivo' => 'nucleo/componentes/interface/toba_ei_cuadro.php',
    'clase_vinculos' => NULL,
    'clase_editor' => '1000253',
    'clase_icono' => 'objetos/cuadro_array.gif',
    'clase_descripcion_corta' => 'ei_cuadro',
    'clase_instanciador_proyecto' => 'toba_editor',
    'clase_instanciador_item' => '1843',
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
      'evento_id' => 432,
      'identificador' => 'seleccion',
      'etiqueta' => NULL,
      'maneja_datos' => NULL,
      'sobre_fila' => 1,
      'confirmacion' => NULL,
      'estilo' => NULL,
      'imagen_recurso_origen' => 'apex',
      'imagen' => 'doc.gif',
      'en_botonera' => 0,
      'ayuda' => NULL,
      'ci_predep' => NULL,
      'implicito' => NULL,
      'defecto' => NULL,
      'grupo' => NULL,
      'accion' => 'V',
      'accion_imphtml_debug' => NULL,
      'accion_vinculo_carpeta' => NULL,
      'accion_vinculo_item' => NULL,
      'accion_vinculo_objeto' => NULL,
      'accion_vinculo_popup' => 0,
      'accion_vinculo_popup_param' => NULL,
      'accion_vinculo_celda' => 'central',
      'accion_vinculo_target' => 'frame_centro',
      'accion_vinculo_servicio' => NULL,
      'es_seleccion_multiple' => 0,
      'es_autovinculo' => 0,
    ),
  ),
  '_info_puntos_control' => 
  array (
  ),
  '_info_cuadro' => 
  array (
    'titulo' => NULL,
    'subtitulo' => NULL,
    'sql' => NULL,
    'columnas_clave' => 'componente_proyecto, componente_id',
    'clave_datos_tabla' => NULL,
    'archivos_callbacks' => NULL,
    'ancho' => NULL,
    'ordenar' => NULL,
    'exportar_paginado' => NULL,
    'exportar_xls' => NULL,
    'exportar_pdf' => NULL,
    'paginar' => NULL,
    'tamano_pagina' => NULL,
    'tipo_paginado' => NULL,
    'scroll' => NULL,
    'alto' => NULL,
    'eof_invisible' => 1,
    'eof_customizado' => NULL,
    'pdf_respetar_paginacion' => NULL,
    'pdf_propiedades' => NULL,
    'asociacion_columnas' => NULL,
    'dao_nucleo_proyecto' => NULL,
    'dao_clase' => NULL,
    'dao_metodo' => NULL,
    'dao_parametros' => NULL,
    'dao_archivo' => '',
    'cc_modo' => 't',
    'cc_modo_anidado_colap' => 0,
    'cc_modo_anidado_totcol' => NULL,
    'cc_modo_anidado_totcua' => NULL,
    'columna_descripcion' => NULL,
    'mostrar_total_registros' => 0,
    'siempre_con_titulo' => 0,
  ),
  '_info_cuadro_columna' => 
  array (
    0 => 
    array (
      'orden' => '1',
      'objeto_cuadro_col' => 525,
      'titulo' => 'Usuario',
      'estilo_titulo' => NULL,
      'estilo' => 'col-tex-p1',
      'ancho' => NULL,
      'clave' => 'usuario',
      'formateo' => NULL,
      'no_ordenar' => NULL,
      'mostrar_xls' => NULL,
      'mostrar_pdf' => NULL,
      'pdf_propiedades' => NULL,
      'total' => NULL,
      'vinculo_indice' => NULL,
      'usar_vinculo' => NULL,
      'total_cc' => NULL,
      'permitir_html' => NULL,
      'grupo' => NULL,
      'evento_asociado' => NULL,
    ),
    1 => 
    array (
      'orden' => '2',
      'objeto_cuadro_col' => 526,
      'titulo' => 'Momento',
      'estilo_titulo' => NULL,
      'estilo' => 'col-tex-p1',
      'ancho' => NULL,
      'clave' => 'momento',
      'formateo' => NULL,
      'no_ordenar' => NULL,
      'mostrar_xls' => NULL,
      'mostrar_pdf' => NULL,
      'pdf_propiedades' => NULL,
      'total' => NULL,
      'vinculo_indice' => NULL,
      'usar_vinculo' => NULL,
      'total_cc' => NULL,
      'permitir_html' => NULL,
      'grupo' => NULL,
      'evento_asociado' => NULL,
    ),
    2 => 
    array (
      'orden' => '3',
      'objeto_cuadro_col' => 529,
      'titulo' => NULL,
      'estilo_titulo' => 'ei-cuadro-col-tit',
      'estilo' => 'col-num-p1',
      'ancho' => NULL,
      'clave' => 'icono_tipo_componente',
      'formateo' => 'imagen_toba',
      'no_ordenar' => NULL,
      'mostrar_xls' => NULL,
      'mostrar_pdf' => NULL,
      'pdf_propiedades' => NULL,
      'total' => NULL,
      'vinculo_indice' => NULL,
      'usar_vinculo' => NULL,
      'total_cc' => NULL,
      'permitir_html' => NULL,
      'grupo' => NULL,
      'evento_asociado' => NULL,
    ),
    3 => 
    array (
      'orden' => '4',
      'objeto_cuadro_col' => 527,
      'titulo' => 'Componente',
      'estilo_titulo' => NULL,
      'estilo' => 'col-tex-p1',
      'ancho' => NULL,
      'clave' => 'componente_nombre',
      'formateo' => NULL,
      'no_ordenar' => NULL,
      'mostrar_xls' => NULL,
      'mostrar_pdf' => NULL,
      'pdf_propiedades' => NULL,
      'total' => NULL,
      'vinculo_indice' => NULL,
      'usar_vinculo' => NULL,
      'total_cc' => NULL,
      'permitir_html' => NULL,
      'grupo' => NULL,
      'evento_asociado' => NULL,
    ),
  ),
  '_info_cuadro_cortes' => 
  array (
  ),
  '_info_sum_cuadro_cortes' => 
  array (
  ),
);
	}

}

?>