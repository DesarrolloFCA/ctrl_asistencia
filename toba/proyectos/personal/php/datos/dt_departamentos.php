<?php
class dt_departamentos extends personal_datos_tabla
{
	function get_listado()
	{
		$sql = "SELECT
			t_d.depto,
			t_d.departamento
		FROM
			departamentos as t_d
		ORDER BY departamento";
		return toba::db('personal')->consultar($sql);
	}

}

?>