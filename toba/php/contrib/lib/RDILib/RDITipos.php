<?php

class RDITipos 
{
	const RECURSO = 'Recurso';
	const RECURSOPERSONAL = 'RecursoPersonal';
	const FOTO	= 'RecursoPersonalFoto';
	const RECIBOSUELDO = 'RecursoPersonalReciboSueldo';
	const CONSTANCIAACADEMICA = 'RecursoPersonalConstanciaAcademica';
	const CV = 'RecursoPersonalCV';
	const CONSTANCIAINSCFISCAL = 'RecursoPersonalConstanciaInscFiscal';	
	const DESIGNACIONCARGO = 'RecursoPersonalDesignacionCargo';
	const DNI = 'RecursoPersonalDni';
	const TITULOSECUNDARIO = 'RecursoPersonalTituloSecundario';
	const DOCUMENTOACADEMICO = 'RecursoPersonalDocumentoAcademico';
	
	static function getAncestroTipos()
	{
		return self::RECURSO;
	}
	
	static function getTiposBasicos()
	{		
		return array(	self::RECURSOPERSONAL,
						self::FOTO,
						self::RECIBOSUELDO,
						self::CONSTANCIAACADEMICA,
						self::CONSTANCIAINSCFISCAL,
						self::CV,			
						self::DESIGNACIONCARGO,
						self::DNI,
						self::TITULOSECUNDARIO,			
						self::DOCUMENTOACADEMICO						
                );
	}	
}
?>