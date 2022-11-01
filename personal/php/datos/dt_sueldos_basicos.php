<?php
class dt_sueldos_basicos extends personal_datos_tabla
{
	function get_listado($filtro=array())
	{
		$where = array();
		if (isset($filtro['cargo'])) {
			$where[] = "cargo = ".quote($filtro['cargo']);
		}
		if (isset($filtro['dedicacion'])) {
			$where[] = "dedicacion = ".quote($filtro['dedicacion']);
		}
		$sql = "SELECT
			t_c.nombre_cargo as cargo_nombre,
			t_d.tipo_dedicacion as dedicacion_nombre,
			t_sb.sueldo, costo sueldo_basico, fecha_paritaria
		FROM
			sueldos_basicos as t_sb,
			cargos as t_c,
			dedicaciones as t_d,
		        paritarias
		WHERE
				t_sb.cargo = t_c.cargo
			AND  t_sb.dedicacion = t_d.dedicacion
		 and  sueldo  = (( select sb from paritarias
		where sb=sueldo
		group by sb
		having fecha_paritaria = max(fecha_paritaria))) ";
		if (count($where)>0) {
			$sql = sql_concatenar_where($sql, $where);
		}
		return toba::db('personal')->consultar($sql);
	}


		function get_descripciones()
		{
			$sql = "SELECT sueldo, sueldo FROM sueldos_basicos ORDER BY sueldo";
			return toba::db('personal')->consultar($sql);
		}








	

}
?>