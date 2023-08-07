<?php

class  RDIServicios
{
	//  ID SERVICIO			TIPO	
	protected $mapeoServicioClase;

    function __construct()
    {	
														// CLASE IMPLEMENTACION
		$this->mapeoServicioClase[RDITipos::FOTO] =					'RDIServicioRecursoPersonalFoto';
		$this->mapeoServicioClase[RDITipos::RECIBOSUELDO]=			'RDIServicioRecursoPersonalReciboSueldo';
		$this->mapeoServicioClase[RDITipos::CV]=					'RDIServicioRecursoPersonalCV';		
		$this->mapeoServicioClase[RDITipos::CONSTANCIAACADEMICA]=	'RDIServicioRecursoPersonalConstanciaAcademica';				
		$this->mapeoServicioClase[RDITipos::CONSTANCIAINSCFISCAL]=	'RDIServicioRecursoPersonalConstanciaInscFiscal';						
		$this->mapeoServicioClase[RDITipos::DESIGNACIONCARGO]=		'RDIServicioRecursoPersonalDesignacionCargo';
		$this->mapeoServicioClase[RDITipos::DNI]=					'RDIServicioRecursoPersonalDni';		
		$this->mapeoServicioClase[RDITipos::TITULOSECUNDARIO]=		'RDIServicioRecursoPersonalTituloSecundario';				
		$this->mapeoServicioClase[RDITipos::DOCUMENTOACADEMICO]=	'RDIServicioRecursoPersonalDocumentoAcademico';				
    }	
    
    function agregar($servicio, $clase) 
	{
		if (!isset($this->mapeoServicioClase[$servicio])) {
			$this->mapeoServicioClase[$servicio] = $clase;
		} else {
			throw new RDIExcepcion('Ya existe el servicio '. $servicio);
		}
	}

	function redefinir($servicio, $clase) 
	{
		if (isset($this->mapeoServicioClase[$servicio])) {
			$this->mapeoServicioClase[$servicio] = $clase;
		} else {
			throw new RDIExcepcion('No existe el servicio '. $servicio);
		}
	}
	
	function getClase($servicio)
	{
		if (isset($this->mapeoServicioClase[$servicio])) {
			return $this->mapeoServicioClase[$servicio];
		} elseif (trim($servicio) == '') {										//nombre a definir, por el momento cadena vacia.
			return 'RDIServicioBasico';			
		} else {
			throw new RDIExcepcion('No existe el servicio '. $servicio);			
		}
	}
	
	function getLista()
	{
		return $this->mapeoServicioClase;
	}
}