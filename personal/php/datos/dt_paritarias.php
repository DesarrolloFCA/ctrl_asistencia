<?php
class dt_paritarias extends personal_datos_tabla
{
	function get_listado($filtro=array())
	{
		$where = array();
		if (isset($filtro['sb'])) {
			$where[] = "sb = ".quote($filtro['sb']);
		}
		$sql = "SELECT
			t_p.id_paritaria,
			t_p.fecha_paritaria,
			t_p.costo,
			t_sb.sueldo as sb_nombre
		FROM
			paritarias as t_p,
			sueldos_basicos as t_sb
		WHERE
				t_p.sb = t_sb.sueldo";
		if (count($where)>0) {
			$sql = sql_concatenar_where($sql, $where);
		}
		return toba::db('personal')->consultar($sql);
	}

function listado($filtro=array())
	
	{
		$where = array();
				if (isset($filtro['subclaustro'])) {
			$where[] = "id_subc = ".quote($filtro['subclaustro']);
			}
			if (isset($filtro['cargo_nombre'])) {
				$where [] = "t_sb.cargo = " .quote($filtro['cargo_nombre']);
			}
		$sql = "SELECT
					t_c.nombre_cargo as cargo_nombre,
					t_d.tipo_dedicacion as dedicacion_nombre,
					t_sb.sueldo, c.costo sueldo_basico, c.fecha_paritaria fecha_paritaria,id_paritaria,
					subclaustro,sb

				FROM
					sueldos_basicos as t_sb
					inner join cargos as t_c on t_sb.cargo = t_c.cargo
					inner join   dedicaciones as t_d on t_sb.dedicacion = t_d.dedicacion
					inner join tipo_subclaustro as t_ts on t_ts.id_subc = sub_claustro  
					
					inner join (Select b.sb, costo, fecha_paritaria, id_paritaria
								from paritarias b
								inner join (Select sb,max (fecha_paritaria)fecha  from paritarias 
								group by sb) a
						on a.sb=b.sb and fecha_paritaria = fecha) c on c.sb =t_sb.sueldo
				
				WHERE t_sb.cargo is not null";
			if (count($where)>0) {
			$sql = sql_concatenar_where($sql, $where);
		}
		return toba::db('personal')->consultar($sql);
	}

}
?>