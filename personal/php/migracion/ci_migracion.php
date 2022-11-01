<?php
class ci_migracion extends personal_ci
{
	//-----------------------------------------------------------------------------------
	//---- cuadro -----------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__cuadro(personal_ei_cuadro $cuadro)
	{
		$sql= "SELECT DISTINCT legajo,apellido,nombre as nombres,dni as nro_documento 
              FROM uncu.legajo as t_l 
              WHERE  cod_depcia = '04'
              ORDER BY t_l.legajo;";
               $legajos2 =  toba::db('mapuche')->consultar($sql); 
        $sql = "SELECT  legajo, apellido, nombres, nro_documento
			FROM public.personas
			order by legajo; " ;
			$legajo = toba::db('personal')->consultar($sql);
			$legajo_mapuche = count($legajos2);
			$legajo_personal = count($legajo) ;
			if ($legajo_personal <> $legajo_mapuche)
			{
				if ($legajo_mapuche > $legajo_personal)
				{
					$cuadro= array_diff($legajos2, $legajo);
					$cant_leg_insert = count($cuadro);
					for ($i=0; $i= $cant_leg_insert; $i ++)
					{
						$cuadro[$i]['valor']= 'Insertar';
					}

				} else
				{
				$cuadro= array_diff($legajo, $legajos2);
					$cant_leg_borrar = count($cuadro);	
					for ($i=0; $i= $cant_leg_borrar; $i ++)
					{
						$cuadro[$i]['valor']= 'Borrar';
					}
				}
             } 

	}

	//-----------------------------------------------------------------------------------
	//---- Eventos ----------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	/**
	 * Atrapa la interacción del usuario a través del botón asociado. El método no recibe parámetros
	 */
	function evt__migrar()
	{
		$sql= "SELECT DISTINCT legajo,apellido,nombre,dni,cuil,estado_civil,fec_nacim,email,sexo
              FROM uncu.legajo as t_l 
              WHERE  cod_depcia = '04'
              ORDER BY t_l.legajo;";
               $legajos2 =  toba::db('mapuche')->consultar($sql); 
              
        $sql = "SELECT  legajo, apellido, nombres, cuit, nro_documento, sexo, fecha_nacimiento, estado_civil, e_mail
			FROM public.personas
			order by legajo; ";
			$legajo = toba::db('personal')->consultar();
			$legajo_mapuche = count($legajos2);
			$legajo_personal = count($legajo) ;

			if ($legajo_personal <> $legajo_mapuche)
			{
				if ($legajo_mapuche > $legajo_personal)
				{
					$legajos_insert= array_diff($legajos2, $legajo);
					$cant_leg_insert = count($legajos_insert);
					for ($i = 0; $i = $cant_leg_insert;$i++)
					{
						$leg_mapuche =	$legajos_insert[$i]['legajo'];
						$apellido = $legajos_insert[$i]['apellido'];
						$nombre = $legajos_insert[$i]['nombre'];
						$fecha_nacimiento = $legajos_insert[$i]['fec_nacim'];
						$nro_documento = $legajos_insert[$i]['dni'];
						$estado_civil = $legajos_insert[$i]['estado_civil'];
						$cuil = $legajos_insert[$i]['cuil'];
						$sexo = $legajos_insert[$i]['tipo_sexo'];
						$email = $legajos_insert[$i]['email'];
						$sql = "Insert legajo, apellido, nombres, cuit, nro_documento, sexo, fecha_nacimiento, estado_civil, e_mail 
						into personas 
						values ($leg_mapuche, $apellido,$nombre,$cuil,$nro_documento,Select id_sexo from sexos where Like '$sexo%',$fecha_nacimiento, Select id_estados_civiles from descripcion where Like UPPER('$estado_civil%'),$email);";
						toba::db(personal)->ejecutar($sql);
					}


				} else
				{
					$legajos_borrar= array_diff($legajo, $legajos2);
					$cant_leg_borrar = count($legajos_borrar);
					for ($i = 0; $i = $cant_leg_borrar;$i++)
					{
						$leg_mapuche =	$legajos_insert[$i]['legajo'];
						$sql= "Delete from personas where legajo = $leg_mapuche;";
						toba::db(personas)->ejecutar($sql);
					}


				}
			}
	}

	/**
	 * Atrapa la interacción del usuario a través del botón asociado. El método no recibe parámetros
	 */
	/*function evt__evaluar()
	{
	}*/
}

?>