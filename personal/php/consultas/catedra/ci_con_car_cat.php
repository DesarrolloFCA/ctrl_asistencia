<?php
class ci_con_car_cat extends personal_ci
{
	

	protected $s__datos_filtro;
	// Componente Visual de Información.
    protected $ev_info;
    // Catedra seleccionada
	protected $s__catedra;
	
	static function ev_info_datos($datos = array())
	{
		return new ev_info_datos($datos);
	}

	function set_catedra_seleccionada($catedra)
     {
          $this->s__catedra = $catedra;
     }
      function get_catedra_seleccionada()

    {
        
        return $this->s__catedra;
    }
	 //---- Filtro -----------------------------------------------------------------------

	//function conf__filtro(toba_ei_formulario $filtro)
	//{
	//	if (isset($this->s__datos_filtro)) {
	//		$filtro->set_datos($this->s__datos_filtro);
	//	}
	//}

	function evt__filtro__filtrar($datos)
	{
		$this->s__datos_filtro = $datos;
		
	}

	function evt__filtro__cancelar()
	{
		unset($this->s__datos_filtro);
	}

	
	//-----------------------------------------------------------------------------------
	//---- cuadro -----------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__cuadro(toba_ei_cuadro $cuadro)
	{
		if (isset($this->s__datos_filtro)) {
			$cuadro->set_datos($this->dep('datos')->tabla('catedras')->get_listado($this->s__datos_filtro));
		}
		// else {
		//	$cuadro->set_datos($this->dep('datos')->tabla('catedras')->get_listado());
		// }
	}

	function evt__cuadro__seleccion($seleccion)

	{
		
		$this->set_catedra_seleccionada($seleccion['catedra']);
		$this->set_pantalla('pant_seleccion');
	}
//-----------------------------------------------------------------------------------
    //---- ev_info ----------------------------------------------------------------------
    //-----------------------------------------------------------------------------------
    
    function conf__pant_seleccion()
    {
        $datos = toba::consulta_php('con_vw_carg_cat')->get_datos_catedra($this->get_catedra_seleccionada());
       $this->ev_info = $datos;
      // ei_arbol($datos);
       // $this->set_datos($datos);

    }
    
	/* function ev_info()
    {
        if (!isset($this->ev_info)) {
            $this->ev_info = ev_info_datos();
            $this->ev_info->set_columnas_a_mostrar(array('Cátedra'));
            
            $this->ev_info->set_columnas_fila(array('nombre_completo'), 1);            
            $this->ev_info->set_columnas_fila(array('documento'), 2);
            
            $this->ev_info->set_max_columnas_por_fila(1);
            
            $this->ev_info->set_etiqueta('nombre_completo', 'Apellido y Nombre:');
            $this->ev_info->set_etiqueta('documento', 'Tipo y Nro. de Identificación:');    
            
            $this->ev_info->set_table_width('');
        }
        return $this->ev_info;
    }*/
}

?>