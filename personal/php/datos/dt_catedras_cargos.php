<?php
class dt_catedras_cargos extends personal_datos_tabla
{
	function get_listado($filtro=array())
	{
		
		$where = array();
		if (isset($filtro['catedra_nombre'])) {
			$where[] = "t_c.nombre_catedra LIKE '%".$filtro['catedra_nombre']."%'";
		}

		$sql = "SELECT
			t_c.nombre_catedra as catedra_nombre,
			t_c1.nombre_cargo as cargo_nombre,
			t_d.tipo_dedicacion as dedicacion_nombre,
			t_cc.id_cat_carg,
			t_tec.tipo_cargo as estado_nombre,
			t_cc.fecha_inicio,
			t_cc.fecha_fin,
			t_r.nro_reajuste as reajuste_nombre,
			t_ec.descripcion as estado_cargo_nombre,
			a.legajo ||'-'|| apellido ||', '|| nombres as persona
		FROM
			catedras_cargos as t_cc    LEFT OUTER JOIN reajustes as t_r ON (t_cc.reajuste = t_r.reajuste)
			LEFT OUTER JOIN estado_cargo as t_ec ON (t_cc.estado_cargo = t_ec.id_est_car)
			inner join personas as a on persona = id_persona,
			catedras as t_c,
			cargos as t_c1,
			dedicaciones as t_d,
			tipo_estados_cargos as t_tec
		WHERE
				t_cc.catedra = t_c.catedra
			AND  t_cc.cargo = t_c1.cargo
			AND  t_cc.dedicacion = t_d.dedicacion
			AND  t_cc.estado = t_tec.tipo_estadocargo";

		if (count($where)>0) {
			$sql = sql_concatenar_where($sql, $where);
		}
		
		return toba::db('personal')->consultar($sql);
	}



function get_listado_catedra($filtro=array())
	{
		$where = array();
		if (isset($filtro['catedra'])) {
			$where[] = "t_c.nombre_catedra Like '%". $filtro['catedra_nombre']."%'"; 
			//quote($filtro['nombre_catedra']);
				
		}
		$sql = "SELECT
			t_c.nombre_catedra as catedra_nombre,
			t_c1.nombre_cargo as cargo_nombre,
			t_d.tipo_dedicacion as dedicacion_nombre,
			t_cc.id_cat_carg,
			t_tec.tipo_cargo as estado_nombre,
			t_cc.fecha_inicio,
			t_cc.fecha_fin,
			t_r.nro_reajuste as reajuste_nombre,
			t_ec.descripcion as estado_cargo_nombre
		FROM
			catedras_cargos as t_cc    LEFT OUTER JOIN reajustes as t_r ON (t_cc.reajuste = t_r.reajuste)
			LEFT OUTER JOIN estado_cargo as t_ec ON (t_cc.estado_cargo = t_ec.id_est_car),
			catedras as t_c,
			cargos as t_c1,
			dedicaciones as t_d,
			tipo_estados_cargos as t_tec
		WHERE
				t_cc.catedra = t_c.catedra
			AND  t_cc.cargo = t_c1.cargo
			AND  t_cc.dedicacion = t_d.dedicacion
			AND  t_cc.estado = t_tec.tipo_estadocargo";
		if (count($where)>0) {
			$sql = sql_concatenar_where($sql, $where);
		}
		
		return toba::db('personal')->consultar($sql);
	}


	function get_descripciones()
	{
		$sql = "SELECT t_c.nombre_catedra as catedra_nombre FROM catedras_cargos, catedras as t_c ORDER BY catedra_nombre";
		return toba::db('personal')->consultar($sql);
	}

}
?>