<?php

class RDIServicioRecursoPersonalConstanciaInscFiscal extends RDIServicioRecursoPersonal
{
	function getTipo()
	{
		return RDITipos::CONSTANCIAINSCFISCAL;
	}
	
	function getParametrosObligatorios()
	{
		$parametros = parent::getParametrosObligatorios();
		$parametros['rdirpcf:fechaPresentacion'] = 'fechaPresentacion';
		return $parametros;
	}
	
	function getNombre($parametros)
	{
//		return 'Constancia CUIT - presentado en: ' . date_format(strtotime($parametros['fechaPresentacion']),'Y-m-d H:i:s');
		return 'Constancia CUIT - presentado en: ' . date('d-m-Y',strtotime($parametros['fechaPresentacion']));
	}
}