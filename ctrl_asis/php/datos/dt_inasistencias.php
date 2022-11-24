<?php
class dt_inasistencias extends ctrl_asis_datos_tabla
{

	function get_descripciones()
	{
		$sql = "SELECT id_inasistencia, observaciones FROM inasistencias ORDER BY observaciones";
		return toba::db('ctrl_asis')->consultar($sql);
	}
}

?>