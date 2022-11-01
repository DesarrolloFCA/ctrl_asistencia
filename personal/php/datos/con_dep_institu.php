<?php
class con_dep_institu extends personal_datos_tabla
{
	function get_listado()
	{
		$sql = "Select nombre_catedra, departamento from departamentos a
			inner join catedras b on id_departamento = id_dpto ";
		return toba::db('personal')->consultar($sql);
	}


}
?>