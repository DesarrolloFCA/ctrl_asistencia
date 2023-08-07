<?php

class RDIServicioRecursoPersonalDocumentoAcademico extends RDIServicioRecursoPersonal
{
	function getTipo()
	{
		return RDITipos::DOCUMENTOACADEMICO;
	}
	
	function getParametrosOpcionales()
	{
		$parametros = parent::getParametrosOpcionales();
		$parametros['rdirpda:fechaPresentacion'] = 'fechaPresentacion';
		return $parametros;
	}
	
	function getNombre($parametros)
	{
		$rta = 'Documento Académico ';
		if (isset($parametros['fechaPresentacion'])) {
			$rta .= substr($parametros['fechaPresentacion'], 0, 10);
		}
		return $rta;
	}
}