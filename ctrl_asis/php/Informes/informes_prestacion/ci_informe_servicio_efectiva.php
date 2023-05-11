<?php
class ci_informe_servicio_efectiva extends ctrl_asis_ci
{
	protected $s__datos_filtro;
	protected $s__datos;

	protected $s__seleccion;
	//-----------------------------------------------------------------------------------
	//---- cuadro -----------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__cuadro(ctrl_asis_ei_cuadro $cuadro)
	{
		if (isset($this->s__datos_filtro)) {
			if (isset($this->s__datos_filtro['fecha_inicio']['valor'])) {
					$fecha1 = $this->s__datos_filtro['fecha_inicio']['valor'];
			//	ei_arbol($fecha1);
					$fechaentera1 =strtotime($fecha1);
					$y =date("Y",$fechaentera1);
					$m =date("m",$fechaentera1);
					$d =date("d",$fechaentera1);
					$this->s__datos_filtro['fecha_desde'] = $y."-".$m."-".$d;
					$fecha2 = $this->s__datos_filtro['fecha_fin']['valor'];
					$fechaentera2 =strtotime($fecha2);
					$y2 =date("Y",$fechaentera2);
					$m2 =date("m",$fechaentera2);
					$d2 =date("d",$fechaentera2);
					$this->s__datos_filtro['fecha_hasta'] = $y2."-".$m2."-".$d2;
					
						
			}

			$this->s__datos_filtro['basedatos'] = "access";
			$_SESSION['fecha_desde'] = $this->s__datos_filtro['fecha_desde'];
			$_SESSION['fecha_hasta'] = $this->s__datos_filtro['fecha_hasta'];
			$_SESSION['basedatos']   = $this->s__datos_filtro['basedatos']; 
			$_SESSION['dependencia']  == '04';
			
			$filtro['fecha_desde'] = $this->s__datos_filtro['fecha_desde'];
			$filtro['fecha_hasta'] = $this->s__datos_filtro['fecha_hasta'];
			$this->s__datos_filtro['marcas']= 3;
			$this->s__datos_filtro['adscripcion']=1;
			$this->s__datos_filtro['cargos_todos'] = 0;
			$this->s__datos_filtro[0]['legajo']=28168;

			

			$agentes =  $this->dep('mapuche')->get_agentes_control_asistencia($this->s__datos_filtro);
			//ei_arbol($agentes);
			$this->s__datos = $this->dep('access')->get_lista_resumen($agentes,$filtro);
			//$f = $this->s__datos;
			//ei_arbol($f);
		}
	}

	//-----------------------------------------------------------------------------------
	//---- filtro -----------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__filtro(ctrl_asis_ei_filtro $filtro)
	{
		if (isset($this->s__datos_filtro)) {
			
			$filtro->set_datos($this->s__datos_filtro);
		}else{
			$f['anio'] = date("Y");
			$f['mes']  = date("m");
			if(!empty($_SESSION['dependencia'])){ 
				$f['cod_depcia']  =   $_SESSION['dependencia'];
			}
			
			$filtro->set_datos($f);
			
		}
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