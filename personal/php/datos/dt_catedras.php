<?php
class dt_catedras extends personal_datos_tabla
{
	function get_listado($filtro=array())
	{
		$where = array();
		
		if (isset($filtro['catedra_nombre'])) {
			$where[] = "nombre_catedra LIKE '%".$filtro['catedra_nombre']['valor']."%'";
		}
		$sql = "SELECT
			t_c.nombre_catedra,
			t_d.departamento as id_departamento_nombre,
			t_c.catedra
		FROM
			catedras as t_c,
			departamentos as t_d
		WHERE
				t_c.id_departamento = t_d.id_dpto
		ORDER BY nombre_catedra";
		if (count($where)>0) {
			$sql = sql_concatenar_where($sql, $where);
		}
		return toba::db('personal')->consultar($sql);
	}

		function get_descripciones()
		{
			$sql = "SELECT catedra, nombre_catedra FROM catedras ORDER BY nombre_catedra";
			return toba::db('personal')->consultar($sql);
		}

























}
?>