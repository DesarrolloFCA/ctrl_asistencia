<?php
/**
 *
 */
class ev_info_datos_nucleo
{
	protected $controlador;
	protected $titulo=null;
	protected $datos=array();
	protected $datos_originales=array();
	protected $etiquetas=array();
	protected $filas=array();
	protected $columnas=array();
	protected $columnas_no_imprimibles=array();
	protected $max_columnas=1;
	protected $max_datos_por_columna=3;
	protected $max_chars_por_columna=37;
	protected $mostrar_datos_sin_valor=false;
	
	protected $class='';
	protected $class_etiquetas='ei-form-etiq-oblig';
	protected $class_valores='';
	protected $style='';
	protected $style_fila='';
	protected $style_etiquetas='';
	protected $style_valores='';
	
	protected $td_etiqueta_width = '';
	protected $td_valores_width = '';
	protected $table_width = 'width = 100%';
	
	protected $datos_pre_html=array();

	function __construct($datos=array())
	{
		$this->datos = $datos;
	}

	function set_datos($datos=array(), $limpiar=true)
	{
		$this->datos_originales = $datos;
		foreach ($datos as $clave => $valores) {
			//Si es de selección múltiple
			$separador = '&bull;&nbsp;';
			$tope_items_tooltip = 25;
			if (is_array($valores)) {
				// Escapado de comillas para evitar errores JS en tooltip
				$valores_tooltip = array();
				foreach ($valores as $key => $valor) {
					$valores_tooltip[] = addslashes(str_replace('"', "'", $valor));
				}
				
				$usar_tooltip = false;
				$lista_valores_tooltip = $separador.implode('<br>'.$separador, $valores_tooltip);
				if (count($valores) > $this->max_datos_por_columna) {
					if (count($valores) > $tope_items_tooltip) {
						$valores_tooltip = array_slice($valores_tooltip, 0, $tope_items_tooltip);
						$lista_valores_tooltip = $separador.implode('<br>'.$separador, $valores_tooltip).'<br>&nbsp;&nbsp;...';
						
					}
					$valores = array_slice($valores, 0, $this->max_datos_por_columna);
					$usar_tooltip = true;
				}
				
				$datos[$clave] = implode(', ', $valores);
				if (strlen($datos[$clave]) > $this->max_chars_por_columna) {
					$datos[$clave] = substr($datos[$clave], 0, $this->max_chars_por_columna);
					$usar_tooltip = true;
				}
				if ($usar_tooltip == true) {
					$path_img = toba::instalacion()->get_url().'/img/descripcion.gif';
					$tooltip = '<img class=" ayuda" onmouseout="if (typeof window.tipclick != \'undefined\' &amp;&amp; window.tipclick !== null) return window.tipclick.hide();" onmouseover="tipclick.horizontal_offset = \'17px\';if (typeof window.tipclick != \'undefined\' &amp;&amp; window.tipclick !== null) return window.tipclick.show(\''.$lista_valores_tooltip.'\',this,event, 1000);" src="'.$path_img.'" alt="">';
					$datos[$clave] = $tooltip.'&nbsp;&nbsp;'.$datos[$clave].'&nbsp;...';
				}
			}
		}
		if ($limpiar) {
			$this->datos = $datos;
		} else {
			$this->datos = array_merge($this->datos, $datos);
		}
	}
	
	function set_controlador($controlador)
	{
		$this->controlador = $controlador;
	}

	function set_titulo($titulo)
	{
		$this->titulo = $titulo;
	}

	/*
	 * Si se setean, sólo se mostrarán éstas.
	 */
	function set_columnas_a_mostrar($columnas)
	{
		$this->columnas = $columnas;
	}

	/**
	 * Setea que una columna del ev_info sea no imprimible
	 *
	 * @param <type> $columnas
	 */
	function set_columnas_no_imprimible($columnas)
	{
		if (! is_array($columnas)) {
			$columnas = array($columnas);
		}
		$this->columnas_no_imprimibles = $columnas;
	}

	/**
	 * Se quitan columnas dentro del arreglo de columnas a mostrar seteado previamente.
	 *
	 * @param array $columnas arreglo con el id de columnas a ocultar.
	 */
	function ocultar_columnas($columnas)
	{
		foreach ($columnas as $col) {
			if ($this->es_columna_a_mostrar($col)) {
				$id = array_search($col, $this->columnas);
				unset($this->columnas[$id]);
			}
		}
	}
	
	function es_columna_a_mostrar($columna)
	{
		return $this->columnas == array() || in_array($columna, $this->columnas);
	}

	function set_columnas_fila($columnas, $fila=null)
	{
		if (sizeof($columnas) > $this->max_columnas) {
			$this->set_max_columnas_por_fila(sizeof($columnas));
		}
		if ($fila) {
			$this->filas[$fila] = $columnas;
		} else {
			$this->filas[] = $columnas;
		}
	}

	function set_max_columnas_por_fila($max_columnas)
	{
		if ($max_columnas < 1) {
			$max_columnas = 1;
		}
		$this->max_columnas = $max_columnas;
	}

	function set_max_datos_por_columna($max_datos)
	{
		$this->max_datos_por_columna = $max_datos;
	}

	function set_max_chars_por_columna($max_chars)
	{
		$this->max_chars_por_columna = $max_chars;
	}

	function set_etiqueta($columna, $etiqueta)
	{
		$this->etiquetas[$columna] = $etiqueta;
	}

	/*
	 * $etiquetas = array( 'clave1' => 'etiqueta1', ... )
	 */
	function set_etiquetas($etiquetas=array())
	{
		foreach ($etiquetas as $columna => $etiqueta) {
			$this->set_etiqueta($columna ,$etiqueta);
		}
	}

	function set_class($class)
	{
		$this->class = "class='$class'";
	}

	function set_class_etiquetas($class)
	{
		$this->class_etiquetas = "class='$class'";
	}

	function set_class_valores($class)
	{
		$this->class_valores = "class='$class'";
	}

	function set_style($style)
	{
		$this->style = "style='$style'";
	}

	function set_style_fila($style)
	{
		$this->style_fila = "style='$style'";
	}

	function set_style_etiquetas($style)
	{
		$this->style_etiquetas = "style='$style'";
	}

	function set_style_valores($style)
	{
		$this->style_valores = "$style";
	}
	
	function set_td_etiqueta_width($width)
	{
		if ($width) {
			$this->td_etiqueta_width = "width='$width'";	
		} else {
			$this->td_etiqueta_width = '';
		}		
	}
	
	function set_td_valores_width($width)
	{
		if ($width) {
			$this->td_valores_width = "width='$width'";	
		} else {
			$this->td_valores_width = '';
		}		
	}
	
	function set_table_width($width)
	{
		if ($width) {
			$this->table_width = "width='$width'";	
		} else {
			$this->table_width = '';
		}		
	}

	function get_datos($pre_html=true, $originales=false)
	{
		if ($originales) {
			return $this->datos_originales;
		}
		if ($pre_html) {
			$this->prearmar_layout();
			return $this->datos_pre_html;
		}
		return $this->datos;
	}
	
	function tiene_datos()
	{
		$datos = $this->get_datos();
		return !empty($datos);
	}

	function get_etiqueta($columna)
	{
		if (key_exists($columna, $this->etiquetas)) {
			return $this->etiquetas[$columna];
		}
		return ucwords(str_replace('_', ' ', $columna));
	}

	function prearmar_layout($for_xml=false)
	{
		$this->datos_pre_html = array();
		$key_name = 'etiqueta';
		if ($for_xml) {
			$key_name = 'clave';
		}
		$columnas_usadas = array();
		foreach ($this->filas as $pos => $cols_fila) {
			$fila_sin_datos = true;
			foreach ($cols_fila as $columna) {
				if (in_array($columna, $columnas_usadas)) {
					continue;
				}
				$columnas_usadas[] = $columna;
				if (! $this->es_columna_a_mostrar($columna)) {
					continue;
				}
				$tiene_valor = key_exists($columna, $this->datos) && isset($this->datos[$columna]);
				if ($tiene_valor || $this->mostrar_datos_sin_valor) {
					$etiqueta = $this->get_etiqueta($columna);
					$this->datos_pre_html[$pos][$columna][$key_name] = $etiqueta;
					$this->datos_pre_html[$pos][$columna]['valor'] = '&nbsp;';
				}
				if ($tiene_valor) {
					$this->datos_pre_html[$pos][$columna]['valor'] = $this->datos[$columna];
				}
			}
		}

		if (!empty ($this->columnas)) {
			$datos_ordenados = array();
			foreach ($this->columnas as $key => $columna) {
				if (isset($this->datos[$columna])) {
					$datos_ordenados[$columna] = $this->datos[$columna];
				}
			}
			$this->datos = $datos_ordenados;
		}

		for($fila=1;sizeof($columnas_usadas)<sizeof($this->datos);$fila++){
			if (key_exists($fila, $this->datos_pre_html)) {
				continue;
			}
			//Armo fila
			$col=1;
			foreach($this->datos as $columna => $valor) {
				if (in_array($columna, $columnas_usadas)) {
					continue;
				}
				$columnas_usadas[] = $columna;
				if (! $this->es_columna_a_mostrar($columna)) {
					continue;
				}
				$tiene_valor = isset($this->datos[$columna]);
				if ($tiene_valor || $this->mostrar_datos_sin_valor) {
					$etiqueta = $this->get_etiqueta($columna);
					$this->datos_pre_html[$fila][$columna][$key_name] = $etiqueta;
					$this->datos_pre_html[$fila][$columna]['valor'] = '&nbsp;';
				}
				if ($tiene_valor) {
					$this->datos_pre_html[$fila][$columna]['valor'] = $this->datos[$columna];
				}
				if ($col == $this->max_columnas) {
					break;
				}
				$col++;
			}
		}
	}

	function generar_html()
	{
		$this->prearmar_layout();
		if ($this->datos_pre_html == array()) {
			return;
		}
		if ($this->titulo) {
			echo '<div class="ei-barra-sup ci-barra-sup ei-barra-sup-sin-botonera">';
			echo '<span class="ei-barra-sup-tit">'.$this->titulo.'</span>';
			echo '</div>';
		}
		echo "<div style='padding-left: 5px;padding-right:5px;'>";
		echo "<table {$this->table_width} {$this->class} {$this->style}>";
		foreach ($this->datos_pre_html as $fila => $columnas) {
			echo "<tr class='ei-form-fila' {$this->style_fila}>";
			$colspan = null;
			$cols = sizeof($columnas);
			if ($cols < $this->max_columnas) {
				$colspan = ($this->max_columnas - $cols) * 2 + 1;
			}
			$col = 1;
			foreach ($columnas as $columna) {
				echo "<td align='left' {$this->td_etiqueta_width}>";
				echo "<strong><span {$this->class_etiquetas} {$this->style_etiquetas}>{$columna['etiqueta']}</span></strong>";
				echo '</td>';
				$colspan_text = '';
				if ($colspan && $col == $cols) {
					$colspan_text = "colspan='$colspan'";
				}
				echo "<td $colspan_text align='left' {$this->td_valores_width}>";
				echo "<span {$this->class_valores} style='white-space:normal;{$this->style_valores}'>{$columna['valor']}</span>";
				echo '</td>';
				$col++;
			}
			echo '</tr>';
		}
		echo '</table></div>';
		$this->datos_pre_html = array();
	}

	function vista_xml($inicial = false, $xmlns = NULL)
	{
		$this->prearmar_layout(true);
		$xml = '';
		foreach ($this->datos_pre_html as $fila) {
			$_fila = array();
			foreach ($fila as $key => $datos) {
				if (!in_array($key, $this->columnas_no_imprimibles)) {
					$_fila[] = array('valor' => $datos['clave'], 'font-weight' => 'bold', 'border' => 'none');
					$_fila[] = array('valor' => strip_tags($datos['valor']), 'border' => 'none');
				}
			}
			if (! empty($_fila)) {
				$xml .= $this->controlador->xml_tabla(array($_fila), false);
			}
		}
		return $xml;
	}
	
	function vista_xml_jasper()
	{
		$this->prearmar_layout(true);
		$xml = '';
		$_fila = array();
		foreach ($this->datos_pre_html as $fila) {
			foreach ($fila as $key => $datos) {
				if (!in_array($key, $this->columnas_no_imprimibles)) {
					$_fila[] = array('clave' => $key,
									 'val' => strip_tags($datos['valor'])
									 );
				}
			}
		}
		if (! empty($_fila)) {
			$xml .= $this->controlador->xml_tabla(array($_fila), false);
		}
		return $xml;
	}
	
	//------------------------------------------------------------------------
	//---- SALIDA EXCEL ------------------------------------------------------
	//------------------------------------------------------------------------
	
	function vista_excel(toba_vista_excel $salida)
	{
		$opciones = array();
		$opciones['etiqueta']['estilo']['font']['bold'] = true;
		$opciones['etiqueta']['ancho'] = 'auto';
		$opciones['valor']['ancho'] = 'auto';
		foreach ($this->etiquetas as $clave => $etiqueta) {
			if (key_exists($clave, $this->datos) && isset($this->datos[$clave])) {
				$valor = $this->datos[$clave];
				$datos = array(array('etiqueta' => $etiqueta, 'valor' => $valor));
				$salida->tabla($datos, array(), $opciones);
			}
		}
		$salida->separacion(1);
	}
}
?>
