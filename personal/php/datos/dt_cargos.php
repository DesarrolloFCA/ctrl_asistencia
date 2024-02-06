<?php
class dt_cargos extends personal_datos_tabla
{
		function get_descripciones()
		{
			$sql = "SELECT cargo, nombre_cargo FROM cargos ORDER BY nombre_cargo";
			return toba::db('personal')->consultar($sql);
		}























}
?>