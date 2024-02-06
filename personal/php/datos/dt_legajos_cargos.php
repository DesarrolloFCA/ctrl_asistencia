<?php
class dt_legajos_cargos extends personal_datos_tabla
{
	function get_listado($filtro=array())
	{
		$where = array();
		if (isset($filtro['legajo'])) {
			$where[] = "legajo = ".quote($filtro['legajo']);
		}
		if (isset($filtro['cargo'])) {
			$where[] = "cargo = ".quote($filtro['cargo']);
		}
		$sql = "SELECT
			t_lc.id_cargo,
			t_p.apellido ||', '|| nombres as legajo_nombre,
			t_c.nombre_cargo as cargo_nombre
		FROM
			legajos_cargos as t_lc,
			personas as t_p,
			cargos as t_c
		WHERE
				t_lc.legajo = t_p.legajo
			AND  t_lc.cargo = t_c.cargo";
		if (count($where)>0) {
			$sql = sql_concatenar_where($sql, $where);
		}
		return toba::db('personal')->consultar($sql);
	}

}
?>