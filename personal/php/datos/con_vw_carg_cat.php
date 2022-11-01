<?php
class con_vw_carg_cat
{
	function get_datos_catedra ($catedra)
	{
		$sql= "SELECT distinct nombre_catedra
				FROM vw_catedras_costos
				WHERE catedra =".$catedra ;
		return toba::db('personal')->consultar($sql);
	}
	function get_datos_costos($catedra)
	{
		$sql= "SELECT distinct nombre_catedra, nombre_cargo cargo_nombre, tipo_dedicacion, sueldo_basico
				FROM vw_catedras_costos
				WHERE catedra =".$catedra ;
		return toba::db('personal')->consultar($sql);

	}
	function get_datos_total ($catedra)
	{
		$sql= "SELECT nombre_catedra , sum(sueldo_basico) as total
				FROM vw_catedras_costos
				where catedra =".$catedra
				."group by nombre_catedra";
		return toba::db('personal')->consultar($sql);
	}

}