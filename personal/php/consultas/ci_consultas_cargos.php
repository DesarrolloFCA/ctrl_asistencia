<?php
class ci_consultas_cargos extends personal_ci
{
	//-----------------------------------------------------------------------------------
	//---- Configuraciones --------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__pant_inicial(toba_ei_pantalla $pantalla)
	{
	}

	function conf__pant_seleccion(toba_ei_pantalla $pantalla)
	{
	}

	function evt__pant_seleccion__salida()
	{
	}

	//-----------------------------------------------------------------------------------
	//---- filtro -----------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__filtro(personal_ei_filtro $filtro)
	{
	}

	function evt__filtro__filtrar($datos)
	{
	}

	function evt__filtro__cancelar()
	{
	}

	//-----------------------------------------------------------------------------------
	//---- cuadro -----------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__cuadro(personal_ei_cuadro $cuadro)
	{
	}

	function evt__cuadro__seleccion($seleccion)
	{
	}

	function conf_evt__cuadro__seleccion(toba_evento_usuario $evento, $fila)
	{
	}

}

?>