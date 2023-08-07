<?php

class RDIServicioRecursoPersonalCV extends RDIServicioRecursoPersonal
{
	function getTipo()
	{
		return RDITipos::CV;
	}
	
	function getParametrosObligatorios()
	{
		$parametros = parent::getParametrosObligatorios();
		$parametros['rdirpcv:fechaPresentacion'] = 'fechaPresentacion';
		return $parametros;
	}
	
	function getNombre($parametros)
	{
		return 'Curriculum Vitae, presentado en: ' . $parametros['fechaPresentacion'];
	}
}