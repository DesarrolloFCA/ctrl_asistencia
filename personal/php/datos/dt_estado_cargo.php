<?php
class dt_estado_cargo extends personal_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT id_est_car, descripcion FROM estado_cargo ORDER BY descripcion";
		return toba::db('personal')->consultar($sql);
	}



}
?>