<?php
class dt_tipo_estados_cargos extends personal_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT tipo_estadocargo, tipo_cargo FROM tipo_estados_cargos ORDER BY tipo_cargo";
		return toba::db('personal')->consultar($sql);
	}










}
?>