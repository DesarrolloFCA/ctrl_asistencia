<?php
class dt_dedicaciones extends personal_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT dedicacion, tipo_dedicacion FROM dedicaciones ORDER BY tipo_dedicacion";
		return toba::db('personal')->consultar($sql);
	}



















}
?>