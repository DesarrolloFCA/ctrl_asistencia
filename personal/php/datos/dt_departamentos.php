<?php
class dt_departamentos extends personal_datos_tabla
{
	function get_listado()
	{
		$sql = "SELECT
			t_d.departamento,
			t_d.id_dpto
		FROM
			departamentos as t_d
		ORDER BY departamento";
		return toba::db('personal')->consultar($sql);
	}


	function get_descripciones()
	{
		$sql = "SELECT id_dpto, departamento FROM departamentos ORDER BY departamento";
		return toba::db('personal')->consultar($sql);
	}

}
?>