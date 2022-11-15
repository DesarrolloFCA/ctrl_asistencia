<?php
class dt_catedras_agentes extends comision_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT legajo,  FROM catedras_agentes ORDER BY ";
		return toba::db('comision')->consultar($sql);
	}

}

?>