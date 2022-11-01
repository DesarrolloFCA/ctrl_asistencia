<?php
class dt_personas extends personal_datos_tabla
{
	function get_listado($filtro=array())
	{
		$where = array();
		if (isset($filtro['legajo'])) {
			$where[] = "legajo = ".quote($filtro['legajo']);
		}
		if (isset($filtro['apellido'])) {
			$where[] = "apellido ILIKE ".quote("%{$filtro['apellido']}%");
		}
		if (isset($filtro['nombres'])) {
			$where[] = "nombres ILIKE ".quote("%{$filtro['nombres']}%");
		}
		$sql = "SELECT
			t_p.id_persona,
			t_p.legajo,
			t_p.apellido,
			t_p.nombres,
			t_p.cuit,
			t_p.nro_documento,
			t_p.sexo,
			t_p.fecha_nacimiento,
			t_p.estado,
			t_p.calle,
			t_p.nro_calle,
			t_p.piso,
			t_p.dpto,
			t_p.localidad,
			t_p.telefono,
			t_p.telefono_celular,
			t_p.e_mail
		FROM
			personas as t_p
		ORDER BY apellido";
		if (count($where)>0) {
			$sql = sql_concatenar_where($sql, $where);
		}
		return toba::db('personal')->consultar($sql);
	}

}

?>