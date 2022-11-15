<?php
class dt_catedras extends ctrl_asis_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT id_catedra, nombre_catedra FROM catedras ORDER BY nombre_catedra";
		return toba::db('ctrl_asis')->consultar($sql);
	}


	function get_catedra ($catedra)
	{
		$sql = "SELECT  nombre_catedra,id_departamento FROM catedras where id_catedra = $catedra";
		return toba::db('ctrl_asis')->consultar($sql);
	}

}
?>