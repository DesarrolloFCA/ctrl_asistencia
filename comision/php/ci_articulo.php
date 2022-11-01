<?php
class ci_articulo extends comision_ci
{
	//-----------------------------------------------------------------------------------
	//---- formulario -------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function conf__formulario(comision_ei_formulario $form)
	{

	}
	function evt__formulario__alta($datos)
	{
		//ei_arbol($datos);
		$legajo =$datos['legajo'];
		$sql = "SELECT t_l.legajo, t_l.apellido, t_l.nombre, t_l.fec_nacim, t_l.dni, t_l.fec_ingreso, t_l.estado_civil, 
                       t_l.caracter, t_l.categoria, t_l.agrupamiento, t_l.escalafon, 
                       t_l.fec_nacim as fecha_nacimiento, t_l.cuil,
                       t_d.pais, t_d.provincia, t_d.codigo_postal, t_d.localidad, t_d.codc_cara_manzana, 
                       t_d.zona_paraje_barrio, t_d.calle, t_d.numero, t_d.piso, t_d.dpto_oficina, t_d.telefono, t_l.tipo_sexo,
                       t_d.telefono_celular
                  FROM uncu.legajo  as t_l LEFT JOIN uncu.domicilio as t_d
                  ON t_l.legajo = t_d.legajo
                  WHERE t_l.legajo = $legajo
                  AND cod_depcia = '04'";
        $agente = toba::db('mapuche')->consultar($sql);          
		$cant = count($agente);
		$id_motivo = $datos['id_motivo'] ;

		$sql = "SELECT MIN(fec_ingreso) fecha from uncu.legajo
				where legajo = $legajo";
		$fec_ingreso = toba::db('mapuche')->consultar($sql);
		$res = 	$fec_ingreso[0]['fecha'];
		list($y,$m,$d)=explode("-",$res); //2011-03-31
                $fecha = $d."-".$m."-".$y;
                $dias = explode('-', $fecha, 3);
                $dias = mktime(0,0,0,$dias[1],$dias[0],$dias[2]);
                $antiguedad = (int)((time()-$dias)/31556926 );
                if ($antiguedad == 0){
                	$prop_vaca= (int)((time()-$dias)/1729147);
                }
        $sql ="SELECT fecha_ingreso from reloj.antiguedad
        WHERE legajo = $legajo";
        $fec_ingreso = toba::db('comision')->consultar($sql);
        if (isset($fec_ingreso[0]['fecha_ingreso'])) {
        	$fec=$fec_ingreso[0]['fecha_ingreso'];
        	list($y,$m,$d)=explode("-",$fec); //2011-03-31
                $fecha = $d."-".$m."-".$y;
                $dias = explode('-', $fecha, 3);
                $dias = mktime(0,0,0,$dias[1],$dias[0],$dias[2]);
                $antiguedad = (int)((time()-$dias)/31556926 );
            }

        $dias= $datos['dias'];
        $anio= $datos['anio'];
        $sql = "SELECT dias FROM reloj.vacaciones_restantes
        WHERE legajo = $legajo
        AND anio =$anio";
        $temp = toba::db('comision')->consultar($sql);
        if (isset($temp)){
        	$dias_restantes= $temp['dias'];
        }else
        {
        	$dias_restantes= 0;
        }
        $fecha_inicio_licencia = $datos['fecha_inicio_licencia'];
        $fechaentera1 =strtotime($fecha_inicio_licencia);
		$fecha_inicio = date_create(date("Y-m-d",$fechaentera1)); 
		$hoy=date_create(date("Y-m-d"));
		$diferencia = date_diff($fecha_inicio , $hoy);
		

		$y =date("Y",$fechaentera1);
		$m =date("m",$fechaentera1);


		for ($i=0; $i < $cant; $i++){
			
			if ($agente [0]['escalafon'] == 'NODO'){
				
				if ($id_motivo == 30) {
							if($dias<=2){
							$agente [$i]['articulo'] = 40;
							$agente [$i]['id_decreto'] = 4;
							$sql = "SELECT -SUM(dias) +2 dias_restantes 
									FROM reloj.parte
							WHERE legajo = $legajo	AND id_motivo = 30	AND  DATE_PART('month', fecha_inicio_licencia) = $m";
							$temp = toba::db('comision')->consultar($sql);
							
								
							
								if(!is_null($temp)&&($temp[0]['dias_restantes'] >= 0 && $temp[0]['dias_restantes']<=2 )){
									$sql="SELECT -SUM(dias) +6 dias_restantes 
									FROM reloj.parte
									WHERE legajo = $legajo
									AND id_motivo = 30
									AND  DATE_PART('year', fecha_inicio_licencia) = $y";
									$temp = toba::db('comision')->consultar($sql);	
									ei_arbol($temp);
										if(!is_null($temp[0]['dias_restantes'])&&!($temp[0]['dias_restantes']> 0 &&$temp[0]['dias_restantes'] < 6) ){
										toba::notificacion()->agregar('Ud ha excedido la cantidad anual de razones particulares este año cuenta con '.$temp[0]['dias_restantes'] .' días', "info");
										}	
								} else if(!is_null($temp))
								{
								
							//	ei_arbol($agente);	
								toba::notificacion()->agregar('Ud ha excedido la cantidad mensual de razones particulares este mes cuenta con '.$temp[0]['dias_restantes'] .' días', "info");
								}
							} else
							{
								toba::notificacion()->agregar('Ud ha excedido la cantidad de dias recuerde que las razones particulares son entre 1 y 2 dias' , "info");	
							}	
							 
				} elseif (id_motivo == 35) {
							$id_articulo[$i]['articulo'] = 55;
							$agente [$i]['id_decreto'] = 4;
							if ($antiguedad > 20){
								$dias_totales = 40 + $dias_restantes;
								
							} elseif ($antiguedad > 15 && $antiguedad <=20)
								{
								$dias_totales = 35 + $dias_restantes;
								} elseif($antiguedad > 10 && $antiguedad <=15)
									{
									$dias_totales = 30 + $dias_restantes;	
									}elseif ($antiguedad > 5 && $antiguedad <=10)
									{
										$dias_totales = 25 + $dias_restantes;
									}elseif ($antiguedad > 0 && $antiguedad <=5)
										{
										$dias_totales = 20 + $dias_restantes;
										}else{
											$dias_totales = $prop_vaca;
										}

					if ($dias >$dias_totales ) {
									toba::notificacion()->agregar('Los días de vacaciones tienen que ser menores o iguales a '.$dias_totales .' días', "info");
								}
							
				} 

			} else {
				
				if ($id_motivo == 30) {
							if ($dias <= 2){
							$agente[$i]['articulo'] = 40;
							$agente [$i]['id_decreto'] = 8;
							$sql = "SELECT -SUM(dias) +2 dias_restantes 
									FROM reloj.parte
							WHERE legajo = $legajo
							AND id_motivo = 30
							AND  DATE_PART('month', fecha_inicio_licencia) = $m";
							$temp = toba::db('comision')->consultar($sql);
								if(!is_null($temp)&&($temp[0]['dias_restantes'] >= 0 && $temp[0]['dias_restantes']<=2 )){
									$sql="SELECT -SUM(dias) +6 dias_restantes 
									FROM reloj.parte
									WHERE legajo = $legajo
									AND id_motivo = 30
									AND  DATE_PART('year', fecha_inicio_licencia) = $y";
									$temp = toba::db('comision')->consultar($sql);	
									ei_arbol($temp);
									if(!is_null($temp[0]['dias_restantes'])&&!($temp[0]['dias_restantes']> 0 &&$temp[0]['dias_restantes'] < 6) ){
									toba::notificacion()->agregar('Ud ha excedido la cantidad anual de razones particulares este año cuenta con '.$temp[0]['dias_restantes'] .' días', "info");
									} 
								} else if(!is_null($temp)){
									
								toba::notificacion()->agregar('Ud ha excedido la cantidad mensual de razones particulares este mes cuenta con '.$temp[0]['dias_restantes'] .' días', "info");
								}
								
							} else {
								toba::notificacion()->agregar('Ud ha excedido la cantidad de dias recuerde que las razones particulares son entre 1 y 2 dias' , "info");								
							}

				} elseif (id_motivo == 35) {
							$agente[$i]['articulo'] = 56;
							$agente [$i]['id_decreto'] = 2;
							if ($antiguedad > 20){
								$dias_totales = 40 + $dias_restantes;
								
							}elseif ($antiguedad > 15 && $antiguedad <=20) {
								$dias_totales = 35 + $dias_restantes;
							} elseif($antiguedad > 10 && $antiguedad <=15){
								$dias_totales = 30 + $dias_restantes;	
							}elseif ($antiguedad > 5 && $antiguedad <=10) {
									$dias_totales = 25 + $dias_restantes;
							}elseif ($antiguedad > 0 && $antiguedad <=5){
									$dias_totales = 20 + $dias_restantes;
							}else{
									$dias_totales = $prop_vaca;
							}

							if ($dias >$dias_totales ) {
									toba::notificacion()->agregar('Los días de vacaciones tienen que ser menores o iguales a '.$dias_totales .' días', "info");
								}
							 
				} 


			}
		}

		$edad = $this->dep('mapuche')->get_edad($legajo, null);
   
		//ei_arbol($agente);	
		
		for ($i=0; $i < $cant; $i++){
			$fecha_alta =date("Y-m-d H:i:s");
			$usuario_alta = $datos['legajo'];
			$estado = 'A';
			$fecha_inicio_licencia = $datos['fecha_inicio_licencia'];
			$dias= $datos['dias'];
			$cod_depcia = '04';
			$domicilio = $agente[$i]['domicilio'];
			$localidad = $agente[$i]['localidad'];
			$agrupamiento = $agente[$i]['agrupamiento'];
			$fecha_nacimiento=$agente[$i]['fecha_nacimiento'];
			$apellido= $agente[$i]['apellido'];
			$nombre=$agente[$i]['nombre'];
			$estado_civil = $agente[$i]['estado_civil'];
			$observaciones = $datos['observaciones'];
			$id_motivo = $datos['id_motivo'] ;
			$id_decreto = $agente[$i]['id_decreto'];
			$tipo_sexo = $agente[$i]['tipo_sexo'];
			$articulo=$agente[$i]['articulo'];
			



		}
	
/*
		$sql = "INSERT INTO reloj.parte(
	 legajo, edad, fecha_alta, usuario_alta, estado, fecha_inicio_licencia, dias, cod_depcia, domicilio, localidad, agrupamiento, fecha_nacimiento,
	  apellido, nombre, estado_civil, observaciones, id_decreto, id_motivo, id_articulo, tipo_sexo)
	VALUES ($legajo, $edad, '$fecha_alta', $usuario_alta, '$estado', '$fecha_inicio_licencia', $dias, '$cod_depcia', '$domicilio', '$localidad', '$agrupamiento', '$fecha_nacimiento', 
		'$apellido', '$nombre',	'$estado_civil', '$observaciones', $id_decreto, $id_motivo,$articulo,'$tipo_sexo');";
	
	toba::db('comision')->ejecutar($sql);*/
		//$this->dep('datos')->tabla('parte')->set($datos);
		
		
			
	}	

	function evt__guardar()
	{

		

			//verificamos que no exista otro parte abiertos(estado) con el mismo legajo, motivo y dependencia.
			$datos = $this->dep('datos')->tabla('parte')->get();
			ei_arbol ($datos);	
			/*$filtro['legajo']     = $datos['legajo'];
			$filtro['id_motivo']  = $datos['id_motivo'];
			$filtro['cod_depcia'] = 04;*/
			
			$this->dep('datos')->sincronizar();
			toba::notificacion()->agregar('Parte de inasistencia agregado correctamente.', 'info');
		
	
	
	}

}
?>