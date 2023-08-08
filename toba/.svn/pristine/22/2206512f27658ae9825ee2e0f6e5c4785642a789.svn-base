<?php

class RDIServicioRecursoPersonalDesignacionCargo extends RDIServicioRecursoPersonal
{
	function getTipo()
	{
		return RDITipos::DESIGNACIONCARGO;
	}
	
	function getParametrosObligatorios()
	{
		$parametros = parent::getParametrosObligatorios();
		$parametros['rdirpdc:tipoDesignacion'] = 'tipoDesignacion'; //A-Alta / B-Baja
		$parametros['rdirpdc:dependencia'] = 'dependencia'; 
		$parametros['rdirpdc:fechaNorma'] = 'fechaNorma'; 
		$parametros['rdirpdc:numeroNorma'] = 'numeroNorma'; 
		return $parametros;
	}
	
	function getNombre($parametros)
	{
		return 'Designacion Cargo Tipo: ' . ($parametros['tipoDesignacion']=='A'?'Alta':'Baja') .' - ' . 'Norma Nro.: ' .$parametros['numeroNorma'];
	}
}