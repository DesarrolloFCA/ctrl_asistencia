<?php
class con_salarios
{

	function listado()
	{
		$where = array();
		if (isset($filtro['sb'])) {
			$where[] = "sb = ".quote($filtro['sb']);
			}
		$sql = "SELECT
					t_c.nombre_cargo as cargo_nombre,
					t_d.tipo_dedicacion as dedicacion_nombre,
					t_sb.sueldo, c.costo sueldo_basico, c.fecha_paritaria fecha_paritaria,id_paritaria

				FROM
					sueldos_basicos as t_sb
					inner join cargos as t_c on t_sb.cargo = t_c.cargo
					inner join   dedicaciones as t_d on t_sb.dedicacion = t_d.dedicacion
					
					inner join (Select b.sb, costo, fecha_paritaria, id_paritaria
								from paritarias b
								inner join (Select sb,max (fecha_paritaria)fecha  from paritarias 
								group by sb) a
					 on a.sb=b.sb and fecha_paritaria = fecha) c on c.sb =t_sb.sueldo
				
				WHERE t_sb.cargo is not null";
		$sql = sql_concatenar_where($sql, $where);
		return toba::db('personal')->consultar($sql);
	}
	function buscar($cargo = integer, $dedicacion = integer)
	{
		$sql = "SELECT
				sueldo 
				from sueldos_basicos
				where cargo = " .$cargo	." and dedicacion = " .$dedicacion;
		return toba::db('personal')->consultar($sql);	

	}

}
?>