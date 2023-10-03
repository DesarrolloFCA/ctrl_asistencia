<?php
	$sql = "TRUNCATE TABLE reloj.agentes";
	toba::db('ctrl_asis')->ejecutar($sql);
	$sql = "SELECT legajo from reloj.adscripcion";
	$adscripto = toba::db('ctrl_asis')->consultar($sql);
	if (isset($adscripto)){
		$lim = count($adscripto);
		for ($i=0;$i<$lim;$i++){
			$legajo = $adscripto[$i]['legajo'];
			if ($i== 0 ){
				$lis = "or legajo  in ( $legajo";
			} else {
				$lis =$lis.",$legajo";
			}
		}
		$lis =$lis.")";	
	}
	$sql = "SELECT legajo, apellido, nombre, fec_nacim, fec_ingreso, dni, estado_civil, caracter, categoria,escalafon, agrupamiento, cod_depcia, cuil, mayor_dedicacion, funcion_critica, tipo_sexo, email, telefono, codc_dedic, cant_horas, subrogancia
	FROM uncu.legajo
	where cod_depcia = '04'";
	if (isset($lis)){
		$sql = $sql . $lis ;
	}
	$sql = $sql . "ORDER BY legajo, agrupamiento,cant_horas DESC";
	$agentes_mapuche = toba::db('mapuche')->consultar($sql);
	//ei_arbol($agentes_mapuche);	
	/*$sql = "SELECT * from reloj.agentes
	ORDER BY legajo, agrupamiento,cant_horas DESC";
	$agentes_local = toba::db('ctrl_asis')->consultar($sql);*/
	
	
	


	if (isset($agentes_local)){

	}else{
		$cant_mapuche = count($agentes_mapuche);
		$agentes_mapuche [0]['ncargo'] = 0;
		for ($i=0;$i<$cant_mapuche;$i++){
			$agentes_mapuche [$i]['ncargo'] = 0;
			if ($i>0){
				if($agentes_mapuche[$i]['legajo'] == $agentes_mapuche[$i-1]['legajo']){
					$agentes_mapuche [$i]['ncargo'] = $agentes_mapuche[$i-1]['ncargo'] +1;
				} 
			}
			$legajo = $agentes_mapuche[$i]['legajo'];
			$ncargo = $agentes_mapuche [$i]['ncargo'];
			$apellido = $agentes_mapuche [$i]['apellido'];
			$nombre = $agentes_mapuche [$i]['nombre'];
			$fec_nacim = $agentes_mapuche [$i]['fec_nacim'];
			$fecha_ingreso = $agentes_mapuche [$i]['fec_ingreso'];
			$dni = $agentes_mapuche [$i]['dni'];
			$estado_civil= $agentes_mapuche [$i]['estado_civil'];
			$caracter = $agentes_mapuche [$i]['caracter'];
			$categoria = $agentes_mapuche [$i]['categoria'];
			$agrupamiento = $agentes_mapuche [$i]['agrupamiento'];
			$escalafon = $agentes_mapuche[$i]['escalafon'];
			$cod_depcia = $agentes_mapuche [$i]['cod_depcia'];
			$cuil = intval($agentes_mapuche [$i]['cuil']);
			//ei_arbol($agentes_mapuche [$i]['mayor_dedicacion']== 'NO');

			$mayor_dedicacion = $agentes_mapuche [$i]['mayor_dedicacion'];
			$funcion_critica = $agentes_mapuche [$i]['funcion_critica'];
			$tipo_sexo = $agentes_mapuche [$i]['tipo_sexo'];
			$email = $agentes_mapuche [$i]['email'];
			$telefono = $agentes_mapuche [$i]['telefono'];
			$cod_dedic = $agentes_mapuche [$i]['codc_dedic'];
			$cant_horas = $agentes_mapuche [$i]['cant_horas'];
			$subrogancia = $agentes_mapuche [$i]['subrogancia'];
			$sql = "INSERT INTO reloj.agentes(
					legajo, ncargo, apellido, nombre, fec_nacim, dni, fecha_ingreso, estado_civil, caracter, categoria, agrupamiento, escalafon, cod_depcia, cuil, 
					mayor_dedicacion, funcion_critica, tipo_sexo, email, telefono, cod_dedic, cant_horas, subrogancia)
					VALUES
					($legajo,$ncargo,'$apellido','$nombre','$fec_nacim',$dni,'$fecha_ingreso','$estado_civil', '$caracter','$categoria','$agrupamiento','$escalafon','$cod_depcia',$cuil,
					'$mayor_dedicacion','$funcion_critica', '$tipo_sexo' , '$email' , '$telefono','$cod_dedic' , $cant_horas, '$subrogancia');";
			toba::db('ctrl_asis')->ejecutar($sql);

		}
		//ei_arbol($sql);
		 echo("Sincronización con éxito"); 
	}



?>	