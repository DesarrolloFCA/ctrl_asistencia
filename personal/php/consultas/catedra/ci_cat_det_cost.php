<?php
class ci_cat_det_cost extends personal_ci
{
	function ini()
	{
		parent::ini();
          toba::memoria()->desactivar_reciclado();
          $this->s__titulo = 'COSTO CATEDRA';
	}

	//-----------------------------------------------------------------------------------
	//---- cuadro -----------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__cuadro(personal_ei_cuadro $cuadro)
	{
		$catedra = toba::db()->quote( $this->controlador()->controlador()->get_catedra_seleccionada()); 
		 $datos =toba::consulta_php('con_vw_carg_cat')->get_datos_costos($catedra);
		// ei_arbol($datos);
		 $cuadro->set_datos($datos);
	}

}
?>