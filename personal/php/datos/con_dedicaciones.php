<?php
class con_dedicaciones
{
	function get_listado_docente()
	{
		$sql = "SELECT dedicacion,
				t_d.tipo_dedicacion as dedicacion_nombre
				FROM
		dedicaciones t_d
		WHERE
			(t_d.dedicacion between  1 and 3 or t_d.dedicacion = 8)";
		return toba::db('personal')->consultar($sql);
	}
	function get_listado_ppa()
	{
		$sql = "SELECT dedicacion,
				t_d.tipo_dedicacion as dedicacion_nombre
				FROM
				dedicaciones t_d
				WHERE
				(t_d.dedicacion > 3 and t_d.dedicacion <> 8)";
		return toba::db('personal')->consultar($sql);
	}
}

?>