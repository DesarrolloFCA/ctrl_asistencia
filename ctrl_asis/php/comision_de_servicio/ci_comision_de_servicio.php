<?php
class ci_comision_de_servicio extends ctrl_asis_ci
{
	protected $s__datos_filtro;

	function ini__operacion()
	{
		$this->dep('datos')->cargar();
	}

	function evt__guardar()
	{
		$this->dep('datos')->sincronizar();
		$this->dep('datos')->resetear();
		$this->dep('datos')->cargar();
	}

	function evt__formulario__modificacion($datos)
	{
		$this->dep('datos')->procesar_filas($datos);
	}

	function conf__formulario(toba_ei_formulario_ml $componente)
		{
		$filtro = $this->s__datos_filtro;
		//ei_arbol($filtro);
		$where = array();
		if (isset($this->s__datos_filtro)) {
			$sql = "SELECT * from reloj.comision 
			WHERE autoriza_aut = false 
			ORDER BY fecha";
			if (isset($filtro['fecha'])) {
				$fecha = $filtro['fecha']['valor'];
				switch ($filtro['fecha']['condicion']) {
					case "es_igual_a" :
						$compara = "=";
						break;
					case "desde":
					$compara = ">=";
					break;

					default :
					toba::notificacion()->agregar('Esta condicion no esta habilitada', "info");
					break;
				}
				$where[] = "fecha " .$compara .quote("{$fecha}");	
				
				

				

			}
			if (isset($filtro['legajo_aut']))	{
				$legajo_aut = $filtro['legajo_aut']['valor'];
				$where [] = "legajo =" . $legajo_aut;
			}
			if (isset($filtro['catedra'])) {
				$catedra = $filtro['catedra']['valor'];
				$where [] = "catedra =" . $catedra;
			}
			if (count($where)>0){
				$sql = sql_concatenar_where($sql, $where);

				}
		} else {
			$sql = "SELECT * from reloj.comision 
					where fecha >= current_date
					and autoriza_aut =false
					order by fecha";
			
		}
		$datos = toba::db('ctrl_asis')->consultar($sql);
		$componente->set_datos($datos);
		//$componente->set_datos($this->dep('datos')->get_filas());
		
	}

	//-----------------------------------------------------------------------------------
	//---- filtro -----------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__filtro(ctrl_asis_ei_filtro $filtro)
	{
	}

	function evt__filtro__filtrar($datos)
	{
		$this->s__datos_filtro = $datos;
	}

	function evt__filtro__cancelar()
	{
		unset($this->s__datos_filtro);
	}

}
?>