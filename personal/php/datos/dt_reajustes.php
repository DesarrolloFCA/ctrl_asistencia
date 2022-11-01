<?php
class dt_reajustes extends personal_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT reajuste, nro_reajuste FROM reajustes ORDER BY nro_reajuste";
		return toba::db('personal')->consultar($sql);
	}







}
?>