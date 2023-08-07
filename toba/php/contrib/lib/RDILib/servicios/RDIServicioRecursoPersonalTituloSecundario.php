<?php

class RDIServicioRecursoPersonalTituloSecundario extends RDIServicioRecursoPersonal
{
	function getTipo()
	{
		return RDITipos::TITULOSECUNDARIO;
	}
	
	function getParametrosOpcionales()
	{
		$parametros = parent::getParametrosOpcionales();
		$parametros['rdirpts:fechaPresentacion'] = 'fechaPresentacion';
		$parametros['rdirpts:cue'] = 'cue';
		
		return $parametros;
	}
	
	function getNombre($parametros)
	{
		$rta = 'Título Secundario ';
		if (isset($parametros['fechaPresentacion'])) {
			$rta .= substr($parametros['fechaPresentacion'], 0, 10);
		}
		return $rta;
	}
}