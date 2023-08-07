<?php
/**
 * Esta clase fue y será generada automáticamente. NO EDITAR A MANO.
 * @ignore
 */
class personal_autoload 
{
	static function existe_clase($nombre)
	{
		return isset(self::$clases[$nombre]);
	}

	static function cargar($nombre)
	{
		if (self::existe_clase($nombre)) { 
			 require_once(dirname(__FILE__) .'/'. self::$clases[$nombre]); 
		}
	}

	static protected $clases = array(
		'personal_ci' => 'extension_toba/componentes/personal_ci.php',
		'personal_cn' => 'extension_toba/componentes/personal_cn.php',
		'personal_datos_relacion' => 'extension_toba/componentes/personal_datos_relacion.php',
		'personal_datos_tabla' => 'extension_toba/componentes/personal_datos_tabla.php',
		'personal_ei_arbol' => 'extension_toba/componentes/personal_ei_arbol.php',
		'personal_ei_archivos' => 'extension_toba/componentes/personal_ei_archivos.php',
		'personal_ei_calendario' => 'extension_toba/componentes/personal_ei_calendario.php',
		'personal_ei_codigo' => 'extension_toba/componentes/personal_ei_codigo.php',
		'personal_ei_cuadro' => 'extension_toba/componentes/personal_ei_cuadro.php',
		'personal_ei_esquema' => 'extension_toba/componentes/personal_ei_esquema.php',
		'personal_ei_filtro' => 'extension_toba/componentes/personal_ei_filtro.php',
		'personal_ei_firma' => 'extension_toba/componentes/personal_ei_firma.php',
		'personal_ei_formulario' => 'extension_toba/componentes/personal_ei_formulario.php',
		'personal_ei_formulario_ml' => 'extension_toba/componentes/personal_ei_formulario_ml.php',
		'personal_ei_grafico' => 'extension_toba/componentes/personal_ei_grafico.php',
		'personal_ei_mapa' => 'extension_toba/componentes/personal_ei_mapa.php',
		'personal_servicio_web' => 'extension_toba/componentes/personal_servicio_web.php',
		'personal_comando' => 'extension_toba/personal_comando.php',
		'personal_modelo' => 'extension_toba/personal_modelo.php',
	);
}
?>