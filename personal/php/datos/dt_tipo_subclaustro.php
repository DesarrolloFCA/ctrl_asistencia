<?php
class dt_tipo_subclaustro extends personal_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT id_subc, subclaustro FROM tipo_subclaustro ORDER BY subclaustro";
		return toba::db('personal')->consultar($sql);
	}

}

?>