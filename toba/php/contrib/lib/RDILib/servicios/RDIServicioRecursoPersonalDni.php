<?php

class RDIServicioRecursoPersonalDni extends RDIServicioRecursoPersonal
{
	function getTipo()
	{
		return RDITipos::DNI;
	}
	
	function getParametrosOpcionales()
	{
		$parametros = parent::getParametrosOpcionales();	
		$parametros['rdirpdi:numeroDocente'] = 'numeroDocente';
		$parametros['rdirpdi:fechaPresentacion'] = 'fechaPresentacion';
		return $parametros;
	}
	
	function getNombre($parametros)
	{
		return $parametros['tipoIdentificacion'] .' '. $parametros['numeroIdentificacion'];
	}
}