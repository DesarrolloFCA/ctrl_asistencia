<?php

class RDIServicioRecursoPersonalConstanciaAcademica extends RDIServicioRecursoPersonal
{
	function getTipo()
	{
		return RDITipos::CONSTANCIAACADEMICA;
	}
	
	function getParametrosObligatorios()
	{
		$parametros = parent::getParametrosObligatorios();
		$parametros['rdirpca:codigoConstancia'] = 'codigoConstancia';
		$parametros['rdirpca:descripcionConstancia'] = 'descripcionConstancia';
		$parametros['rdirpca:solicitud'] = 'solicitud';
		return $parametros;
	}
	
//	function getParametrosOpcionales()
//	{
//		$parametros = parent::getParametrosOpcionales();
//        $parametros['rdirpca:fechaSolicitud'] = 'fechaSolicitud';
//		return $parametros;
//	}
	
	function getNombre($parametros)
	{
		return $parametros['descripcionConstancia'] .' - '. $parametros['solicitud'];
	}
}