<?php
class ci_articulo extends comision_ci
{
	protected $s__datos;
	//-----------------------------------------------------------------------------------
	//---- formulario -------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	
	function evt__formulario__alta($datos)
	{
		

		

		$bandera_nodo = true;	
		$legajo =$datos['legajo'];
		$id_catedra = $datos['catedra'];
		$anio=$datos['anio'];
		$id_motivo = $datos['id_motivo'] ;
		//ei_arbol($datos);
		if ($id_motivo == 35) {
		$sql =  "SELECT count(*) cantidad from reloj.inasistencias
			WHERE legajo = $legajo
			AND id_catedra=$id_catedra
			AND anio =$anio
			AND id_motivo =35 ";
		$hay_vacaciones =  toba::db('comision')->consultar($sql); 
		$ya_tomo = $hay_vacaciones[0]['cantidad'];
			
			$sql = "SELECT nombre_catedra, id_departamento FROM reloj.catedras
				WHERE id_catedra = $id_catedra";
			$depto = toba::db('comision')->consultar($sql); 
			if ($depto[0]['id_departamento']<10){
			$sql = "SELECT t_l.legajo, t_l.apellido, t_l.nombre, t_l.fec_nacim, t_l.dni, t_l.fec_ingreso, t_l.estado_civil, 
                       t_l.caracter, t_l.categoria, t_l.agrupamiento, t_l.escalafon, 
                       t_l.fec_nacim as fecha_nacimiento, t_l.cuil,
                       t_d.pais, t_d.provincia, t_d.codigo_postal, t_d.localidad, t_d.codc_cara_manzana, 
                       t_d.zona_paraje_barrio, t_d.calle, t_d.numero, t_d.piso, t_d.dpto_oficina, t_d.telefono, t_l.tipo_sexo,
                       t_d.telefono_celular
                  	FROM uncu.legajo  as t_l LEFT JOIN uncu.domicilio as t_d
                  	ON t_l.legajo = t_d.legajo
                  	WHERE t_l.legajo = $legajo
                  	AND cod_depcia = '04'
                  	AND escalafon<> 'NODO'";	
			} else {
				$sql = "SELECT t_l.legajo, t_l.apellido, t_l.nombre, t_l.fec_nacim, t_l.dni, t_l.fec_ingreso, t_l.estado_civil, 
                       t_l.caracter, t_l.categoria, t_l.agrupamiento, t_l.escalafon, 
                       t_l.fec_nacim as fecha_nacimiento, t_l.cuil,
                       t_d.pais, t_d.provincia, t_d.codigo_postal, t_d.localidad, t_d.codc_cara_manzana, 
                       t_d.zona_paraje_barrio, t_d.calle, t_d.numero, t_d.piso, t_d.dpto_oficina, t_d.telefono, t_l.tipo_sexo,
                       t_d.telefono_celular
                 	 FROM uncu.legajo  as t_l LEFT JOIN uncu.domicilio as t_d
                  	ON t_l.legajo = t_d.legajo
                 	 WHERE t_l.legajo = $legajo
                 	 AND cod_depcia = '04'
                 	 AND escalafon = 'NODO' ";
			}

		
		}
		
       		$agente = toba::db('mapuche')->consultar($sql);          
		$cant = count($agente);
		//ei_arbol($agente);
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
         //   ei_arbol($antiguedad);

        $dias= $datos['dias'];
        $anio= $datos['anio'];
        $sql = "SELECT sum(dias) dias_restantes FROM reloj.vacaciones_restantes
        WHERE legajo = $legajo
        AND anio < $anio";
        $temp = toba::db('comision')->consultar($sql);
        if (isset($temp)){
        	$dias_restantes= $temp['dias_restantes'];
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
<<<<<<< HEAD

		
=======
	$agrupamiento = $agente [0]['escalafon'];
	$agrego = 0;	
	$sql = "SELECT sum(dias) dias_restantes FROM reloj.vacaciones_restantes
        WHERE legajo = $legajo
        AND anio = $anio";
        $vac_pen = toba::db('comision')->consultar($sql);
        $insertadas = count($vac_pen);
      //  ei_arbol($insertadas);
>>>>>>> desarrollo
		for ($i=0; $i < $cant; $i++) {
			
			if ($agente [$i]['escalafon'] == 'NODO'){
				
				
				
				if ($id_motivo == 30) {
							
							if($dias<=2){
							$agente [$i]['articulo'] = null;
							$agente [$i]['id_decreto'] = 4;
							$sql = "SELECT -SUM(dias) + 2 dias_restantes 
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
									
										if(!is_null($temp[0]['dias_restantes'])&&!($temp[0]['dias_restantes']> 0 &&$temp[0]['dias_restantes'] < 6) ){
										toba::notificacion()->agregar('Ud ha excedido la cantidad anual de razones particulares este año cuenta con '.$temp[0]['dias_restantes'] .' días', "info");
										}	
								} else if(!is_null($temp))
								{
								
							//	ei_arbol($agente);	
								toba::notificacion()->agregar('Ud ha excedido la cantidad mensual de razones particulares este mes cuenta con '.$temp[0]['dias_restantes'] .' días', "info");
<<<<<<< HEAD
=======
									$bandera_nodo = false;
>>>>>>> desarrollo
								} else{
									$agente [$i]['articulo'] = 40;
									$bandera= true;
								}

							} else
							{
								toba::notificacion()->agregar('Ud ha excedido la cantidad de dias recuerde que las razones particulares son entre 1 y 2 dias' , "info");
								$bandera_nodo = false;	
							}	
							 
				} elseif ($id_motivo == 35) {
							
<<<<<<< HEAD
									$agente[$i]['articulo'] = null;
=======
							$agente[$i]['articulo'] = null;
>>>>>>> desarrollo
							$agente [$i]['id_decreto'] = 4;
							//ei_arbol ($agente);
							if ($antiguedad > 20){
								$dias_totales = 40 + $dias_restantes;
							//	 ei_arbol ($dias);
								if ($dias < 30) { 
									toba::notificacion()->agregar('Los días de vacaciones no pueden ser menores de 30 dias', "info");
									break;
								} else {

									if ($agrego == 0 and $insertadas > 0){
									$dias_restantes = $dias_totales - $dias;
									//ei_arbol ($dias_restantes);

									$sql ="INSERT INTO reloj.vacaciones_restantes(
										legajo, cod_depcia, agrupamiento, anio, dias)
										VALUES ($legajo,4, '$agrupamiento', $anio, $dias_restantes);
										DELETE FROM reloj.vacaciones_restantes
										where legajo=$legajo
										AND anio < $anio;";
									toba::db('comision')->ejecutar($sql);
									$agrego=1;
									}

								}
								
							} elseif ($antiguedad > 15 && $antiguedad <=20)
								{
								$dias_totales = 35 + $dias_restantes;

								
								if ($dias < 30) { 
									toba::notificacion()->agregar('Los días de vacaciones no pueden ser menores de 30 dias', "info");
									$bandera_nodo = false;
									break;

								}else {
									if ($agrego == 0 and $insertadas > 0){
									$dias_restantes = $dias_totales - $dias;
									if ($dias_restantes > 0){
									$sql ="INSERT INTO reloj.vacaciones_restantes(
										legajo, cod_depcia, agrupamiento, anio, dias)
										VALUES ($legajo,4, '$agrupamiento', $anio, $dias_restantes);
										DELETE FROM reloj.vacaciones_restantes
										where legajo=$legajo
										AND anio < $anio;";
									toba::db('comision')->ejecutar($sql);
									$agrego=1;
									}
									}

								}

								} elseif($antiguedad > 10 && $antiguedad <=15)
									{
									$dias_totales = 30 + $dias_restantes;	
									if ($dias < 30) { 
									toba::notificacion()->agregar('Los días de vacaciones no pueden ser menores de 30 dias', "info");
									$bandera_nodo = false;
									break;
									} else {
										if ($agrego == 0 and $insertadas > 0){
										$dias_restantes = $dias_totales - $dias;
										if ($dias_restantes > 0){
											$sql ="INSERT INTO reloj.vacaciones_restantes(
											legajo, cod_depcia, agrupamiento, anio, dias)
											VALUES ($legajo,4, '$agrupamiento', $anio, $dias_restantes);
											DELETE FROM reloj.vacaciones_restantes
											where legajo=$legajo
											AND anio < $anio;";
										toba::db('comision')->ejecutar($sql);
										$agrego=1;
											}
										}
									   }
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
									toba::notificacion()->agregar('Los días de vacaciones tienen que ser menores o iguales a '.$dias_totales .' días.', "info");
<<<<<<< HEAD
=======
									$bandera_nodo=false;
>>>>>>> desarrollo
							
								} else {
							$agente[$i]['articulo'] = 55;
							$bandera= true;
								}
							
				} 

			} else {
				
				if ($id_motivo == 30) {
							if ($dias <= 2){
							$agente [$i]['articulo'] = null;
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
									//ei_arbol($temp);
									if(!is_null($temp[0]['dias_restantes'])&&!($temp[0]['dias_restantes']> 0 &&$temp[0]['dias_restantes'] < 6) ){
									toba::notificacion()->agregar('Ud ha excedido la cantidad anual de razones particulares este año cuenta con '.$temp[0]['dias_restantes'] .' días', "info");
									} 
								} else if(!is_null($temp)){
									
								toba::notificacion()->agregar('Ud ha excedido la cantidad mensual de razones particulares este mes cuenta con '.$temp[0]['dias_restantes'] .' días', "info");
								}
								else {
									$agente[$i]['articulo'] = 40;
									$bandera= true;
								}
								
							} else {
								toba::notificacion()->agregar('Ud ha excedido la cantidad de dias recuerde que las razones particulares son entre 1 y 2 dias' , "info");								
							}

				} elseif ($id_motivo == 35) {
							$agente[$i]['articulo'] = 56;
							$agente [$i]['id_decreto'] = 2;
							$bandera= true;
<<<<<<< HEAD
							/*if ($antiguedad > 20){
								$dias_totales = 40 + $dias_restantes;
=======
							if ($antiguedad > 15){
								$dias_totales = 45 + $dias_restantes;
								if ($dias < 30) { 
									toba::notificacion()->agregar('Los días de vacaciones no pueden ser menores de 30 dias', "info");
									break;
									}else {
									if ($agrego == 0 and $insertadas > 0){
									$dias_restantes = $dias_totales - $dias;
										if ($dias_restantes > 0){
										$sql ="INSERT INTO reloj.vacaciones_restantes(
										legajo, cod_depcia, agrupamiento, anio, dias)
										VALUES ($legajo,4, '$agrupamiento', $anio, $dias_restantes);
										DELETE FROM reloj.vacaciones_restantes
										where legajo=$legajo
										AND anio < $anio;";
										toba::db('comision')->ejecutar($sql);
										$agrego=1;
											}
									}
								}	
							}	
>>>>>>> desarrollo
								
							}else {
								$dias_totales = 30 +$dia_restantes;
							if ($dias < 30) { 
									toba::notificacion()->agregar('Los días de vacaciones no pueden ser menores de 30 dias', "info");
									break;
								}else {
									if ($agrego == 0 and $insertadas > 0){
									$agrego=1;
											}
									$dias_restantes = $dias_totales - $dias;
									if ($dias_restantes > 0){
									$sql ="INSERT INTO reloj.vacaciones_restantes( legajo, cod_depcia, agrupamiento, anio, dias)
										VALUES ($legajo,4, '$agrupamiento', $anio, $dias_restantes);
										DELETE FROM reloj.vacaciones_restantes
										where legajo=$legajo
										AND anio < $anio;";
									toba::db('comision')->ejecutar($sql);
									}
								}	

							

								if ($dias >$dias_totales ) {
									toba::notificacion()->agregar('Los días de vacaciones tienen que ser menores o iguales a '.$dias_totales .' días', "info");
								}*/
							 
							} 


			}
		}

		$edad = $this->dep('mapuche')->get_edad($legajo, null);
   		$datos['dias_restantes'] = $dias_restantes;
		//ei_arbol($agente);	
		if($bandera) {
		$fecha_inicio_licencia = $datos['fecha_inicio_licencia'];
        $fechaentera1 =strtotime($fecha_inicio_licencia);
		$fecha = date_create(date("Y-m-d",$fechaentera1)); 
	//$fecha=date('d/m/Y',strtotime($datos['fecha_inicio_licencia'] ) );
		
		$fecha_inicio =$fecha ->format("Y-m-d");
$dias_to= $dias. ' days';

	$hasta = date_add($fecha , date_interval_create_from_date_string($dias_to));
	
	$hasta =$hasta ->format("Y-m-d"); 
<<<<<<< HEAD
=======
	//ei_arbol($datos);
>>>>>>> desarrollo
		for ($i=0; $i < $cant; $i++){
			$fecha_alta =date("Y-m-d H:i:s");
			$datos ['fecha_alta']=$fecha_alta;
			$usuario_alta = $datos['legajo'];
			$estado = 'A';
			$datos['fecha_inicio'] = $fecha_inicio;
			$datos['hasta']=$hasta;
			$dias= $datos['dias'];
			$cod_depcia = '04';
			$observaciones = $datos['observaciones'];
			$id_motivo = $datos['id_motivo'] ;
			$id_decreto = $agente[$i]['id_decreto'];
			$datos['id_decreto'] = $id_decreto;
			$articulo=$agente[$i]['articulo'];
			$datos['articulo'] = $articulo;
			$catedra=$datos['catedra'];
			$anio=$datos['anio'];
			$superior= $datos['superior'];
			$autoridad=$datos['autoridad'];
		}
<<<<<<< HEAD

		
	

 $sql= "INSERT INTO reloj.inasistencias(
	 legajo, id_catedra, fecha_inicio, fecha_fin, anio, observaciones, leg_sup, auto_sup, leg_aut, auto_aut, fecha_alta, usuario_alta, estado, id_motivo, id_decreto, id_articulo)	VALUES (
	 $usuario_alta, $catedra, '$fecha_inicio', '$hasta',$anio, 'observaciones', $superior, false, $autoridad, false, '$fecha_alta',$usuario_alta ,'A', $id_motivo, $id_decreto, $articulo);";
=======

		
	
	if($datos['fecha_inicio_licencia']< '2022-12-26'){
			toba::notificacion()->agregar('Ingrese una fecha mayor o igual al 26/12/2022', "info");
	}else
		{
			if ($ya_tomo == 0){
 			if($bandera_nodo ){
 			$sql= "INSERT INTO reloj.inasistencias(
	 		legajo, id_catedra, fecha_inicio, fecha_fin, anio, observaciones, leg_sup, auto_sup, leg_aut, auto_aut, fecha_alta, usuario_alta, estado, id_motivo, id_decreto, id_articulo)	VALUES (
	 		$usuario_alta, $catedra, '$fecha_inicio', '$hasta',$anio, '$observaciones', $superior, true, $autoridad, true, '$fecha_alta',$usuario_alta ,'A', $id_motivo, $id_decreto, $articulo);";
>>>>>>> desarrollo


/*
		
		$sql = "INSERT INTO reloj.parte(
	 legajo, edad, fecha_alta, usuario_alta, estado, fecha_inicio_licencia, dias, cod_depcia, domicilio, localidad, agrupamiento, fecha_nacimiento,
	  apellido, nombre, estado_civil, observaciones, id_decreto, id_motivo, id_articulo, tipo_sexo)
	VALUES ($legajo, $edad, '$fecha_alta', $usuario_alta, '$estado', '$fecha_inicio', $dias, '$cod_depcia', '$domicilio', '$localidad', '$agrupamiento', '$fecha_nacimiento', 
		'$apellido', '$nombre',	'$estado_civil', '$observaciones', $id_decreto, $id_motivo,$articulo,'$tipo_sexo');";*/
	
<<<<<<< HEAD
	toba::db('comision')->ejecutar($sql);

		//$this->dep('datos')->tabla('parte')->set($datos);
	
	if (isset ($catedra) and $catedra <> 0 ){
=======
		toba::db('comision')->ejecutar($sql);

		//$this->dep('datos')->tabla('parte')->set($datos);
	
		if (isset ($catedra) and $catedra <> 0 ){
>>>>>>> desarrollo
		$sql = "SELECT nombre_catedra from reloj.catedras
		WHERE id_catedra = $catedra;";
		$cat= toba::db('comision')->consultar($sql);
		$datos['catedra'] = $cat[0]['nombre_catedra'];
<<<<<<< HEAD
	}		
		
	if (isset($legajo)){
		$correo_agente = $this->dep('mapuche')->get_legajos_email($datos['legajo']);
				$datos['agente_ayn']=$correo_agente[0]['descripcion'];
		
	}

	if(isset($datos['superior'])and $datos['superior']<>0) {
		$correo_sup = $this->dep('mapuche')->get_legajos_email($datos['superior']);
				$datos['superior_ayn']=$correo_sup[0]['descripcion'];
			}

		if(isset($datos['autoridad'])) {
		$correo_aut = $this->dep('mapuche')->get_legajos_email($datos['autoridad']);
			$datos['autoridad_ayn']=$correo_aut[0]['descripcion'];
		
	}
	$this->s__datos = $datos;
	
	if (isset($legajo)){
		$sql= "SELECT email from reloj.agentes_mail
		where legajo=$legajo";
		$correo = toba::db('comision')->consultar($sql);
		
		$this->enviar_correos($correo[0]['email']);
	}

	if(isset($datos['superior'])and $datos['superior']<>0) {
		
		$superior =$datos['superior'];
		
=======
		}		
		
		if (isset($legajo)){
		$correo_agente = $this->dep('mapuche')->get_legajos_email($datos['legajo']);
				$datos['agente_ayn']=$correo_agente[0]['descripcion'];
		
		}

		if(isset($datos['superior'])and $datos['superior']<>0) {
		$correo_sup = $this->dep('mapuche')->get_legajos_email($datos['superior']);
				$datos['superior_ayn']=$correo_sup[0]['descripcion'];
			}

		if(isset($datos['autoridad'])) {
		$correo_aut = $this->dep('mapuche')->get_legajos_email($datos['autoridad']);
			$datos['autoridad_ayn']=$correo_aut[0]['descripcion'];
		
		}
		$this->s__datos = $datos;
	
		if (isset($legajo)){
		$sql= "SELECT email from reloj.agentes_mail
		where legajo=$legajo";
		$correo = toba::db('comision')->consultar($sql);
		$this->enviar_correos($correo[0]['email']);
		}

		if(isset($datos['superior'])and $datos['superior']<>0) {
		$superior =$datos['superior'];
>>>>>>> desarrollo
		$sql= "SELECT email from reloj.agentes_mail
		where legajo=$superior";
		$correo = toba::db('comision')->consultar($sql);
		$this->enviar_correos_sup($correo[0]['email'],$datos['superior_ayn']);

<<<<<<< HEAD
	}

		if(isset($datos['autoridad'])) {
		$superior= $datos['autoridad'];
		ei_arbol ($superior);
=======
		}

		/*if(isset($datos['autoridad'])) {
		$superior= $datos['autoridad'];
		//ei_arbol ($superior);
>>>>>>> desarrollo
		$sql= "SELECT email from reloj.agentes_mail
		where legajo=$superior";
		$correo = toba::db('comision')->consultar($sql);
		$this->enviar_correos_sup($correo[0]['email'],$datos['autoridad_ayn']);
<<<<<<< HEAD

	}

=======
		}*/
		}
		} else {
		toba::notificacion()->agregar('Ud. ya completo el fomulario para '. $depto[0]['nombre_catedra'] , "info");

		}
		}
>>>>>>> desarrollo
	}	
			
	}	

	function evt__guardar()
	{

		

			//verificamos que no exista otro parte abiertos(estado) con el mismo legajo, motivo y dependencia.
			$datos = $this->dep('datos')->tabla('parte')->get();
			//ei_arbol ($datos);	
			/*$filtro['legajo']     = $datos['legajo'];
			$filtro['id_motivo']  = $datos['id_motivo'];
			$filtro['cod_depcia'] = 04;*/
			
			$this->dep('datos')->sincronizar();
			toba::notificacion()->agregar('Parte de inasistencia agregado correctamente.', 'info');
		
	
	}
function enviar_correos($correo)
	{
		require_once('3ros/phpmailer/class.phpmailer.php');

<<<<<<< HEAD
				$datos =$this->s__datos;    
=======
				$datos =$this->s__datos;  

>>>>>>> desarrollo
	$fecha=date('d/m/Y',strtotime($datos['fecha_inicio_licencia'] ) );

	$hasta=date('d/m/Y',strtotime($datos['fecha_inicio_licencia'] . "+ " .$datos['dias']. " days") );

<<<<<<< HEAD

//$catedra = $this->			

 //ei_arbol ($datos);              
=======
//ei_arbol($correo);  
//$catedra = $this->			

// ei_arbol ($datos);              
>>>>>>> desarrollo
$mail = new phpmailer();
$mail->IsSMTP();

//Esto es para activar el modo depuración. En entorno de pruebas lo mejor es 2, en producción siempre 0
// 0 = off (producción)
// 1 = client messages
// 2 = client and server messages
$mail->SMTPDebug  = 0;
//Ahora definimos gmail como servidor que aloja nuestro SMTP
$mail->Host       = 'smtp.gmail.com';
//El puerto será el 587 ya que usamos encriptación TLS
$mail->Port       = 587;
//Definmos la seguridad como TLS
$mail->SMTPSecure = 'tls';
//Tenemos que usar gmail autenticados, así que esto a TRUE
$mail->SMTPAuth   = true;
//Definimos la cuenta que vamos a usar. Dirección completa de la misma
$mail->Username   = "formularios_personal@fca.uncu.edu.ar";
//Introducimos nuestra contraseña de gmail
$mail->Password   = "djxgidwlytoydsow";
//Definimos el remitente (dirección y, opcionalmente, nombre)
$mail->SetFrom('formularios_personal@fca.uncu.edu.ar', 'Formulario Personal');
//Esta línea es por si queréis enviar copia a alguien (dirección y, opcionalmente, nombre)
<<<<<<< HEAD
$mail->AddReplyTo('caifca@fca.uncu.edu.ar','El de la réplica');
//Y, ahora sí, definimos el destinatario (dirección y, opcionalmente, nombre)
$mail->AddAddress('molina.martin@gmail.com', 'El Destinatario');
//Definimos el tema del email
$mail->Subject = 'Esto es un correo de prueba';
=======
//$mail->AddReplyTo('caifca@fca.uncu.edu.ar','El de la réplica');
//Y, ahora sí, definimos el destinatario (dirección y, opcionalmente, nombre)
$mail->AddAddress($correo, 'El Destinatario');
//Definimos el tema del email
$mail->Subject = 'Formulario de Vacaciones';
>>>>>>> desarrollo
//Para enviar un correo formateado en HTML lo cargamos con la siguiente función. Si no, puedes meterle directamente una cadena de texto.
//$mail->MsgHTML(file_get_contents('correomaquetado.html'), dirname(ruta_al_archivo));
//Y por si nos bloquean el contenido HTML (algunos correos lo hacen por seguridad) una versión alternativa en texto plano (también será válida para lectores de pantalla)
$mail->IsHTML(true); //el mail contiene html*/

<<<<<<< HEAD
	
//	 ei_arbol($fecha,$hasta);
=======
	
//	 ei_arbol($fecha,$hasta);
	if ($datos['id_motivo'] == 30) {
		//$motivo = 'Razones Particulares con gose de haberes';
		$body = '<table>
						El/la agente  <b>'.$datos['agente_ayn'].'</b> perteneciente a la catedra/oficina/ direccion <b>'.$datos['catedra'].'</b>.<br/>
						Solicita Justificacion de Inasistencia por Razones Particulares a partir del dia '.$fecha.' hasta '.$hasta. '.
						 Teniendo en cuenta las siguientes Observaciones: ' .$datos['observaciones']. '
											
			</table>';

	} else
	{
		 
		//$motivo = 'Vacaciones'.$datos['anio'];
		$body = '<table>
						El/la agente  <b>'.$datos['agente_ayn'].'</b> perteneciente a  <b>'.$datos['catedra'].'</b>.<br/>
						Solicita Vacaciones correspondiente al  '.$datos['anio'].' a partir del dia '.$fecha.' hasta '.$hasta. '. <br/>
						Teniendo en cuenta las siguientes Observaciones: ' .$datos['observaciones']. 'Ud. cuenta con '.$datos['dias_restantes'].' dias de vacaciones 
						pendientes.
											
			</table>';
	}
	

	; //date("d/m/y",$fecha)

$mail->Body = $body;
//Enviamos el correo
if(!$mail->Send()) {
	echo "Error: " . $mail->ErrorInfo;
} else {
	toba::notificacion()->agregar('Su formulario ha sido completado y enviado a su correo. Ya puede cerrar la ventana.' , "info");
	echo "Enviado!";
}
	

		
	}
	function enviar_correos_sup($correo,$destino)
	{
		require_once('3ros/phpmailer/class.phpmailer.php');

				$datos =$this-> s__datos;   
				$fecha=date('d/m/Y',strtotime($datos['fecha_inicio_licencia'] ) );

	$hasta=date('d/m/Y',strtotime($datos['fecha_inicio_licencia'] . "+ " .$datos['dias']. " days") );
 
			
        //    ei_arbol($correo,$destino);   
		$mail = new phpmailer();
		$mail->IsSMTP();
//Esto es para activar el modo depuración. En entorno de pruebas lo mejor es 2, en producción siempre 0
// 0 = off (producción)
// 1 = client messages
// 2 = client and server messages
$mail->SMTPDebug  = 0;
//Ahora definimos gmail como servidor que aloja nuestro SMTP
$mail->Host       = 'smtp.gmail.com';
//El puerto será el 587 ya que usamos encriptación TLS
$mail->Port       = 587;
//Definmos la seguridad como TLS
$mail->SMTPSecure = 'tls';
//Tenemos que usar gmail autenticados, así que esto a TRUE
$mail->SMTPAuth   = true;
//Definimos la cuenta que vamos a usar. Dirección completa de la misma
$mail->Username   = "formularios_personal@fca.uncu.edu.ar";
//Introducimos nuestra contraseña de gmail
$mail->Password   = "djxgidwlytoydsow";
//Definimos el remitente (dirección y, opcionalmente, nombre)
$mail->SetFrom('formularios_personal@fca.uncu.edu.ar', 'Formularios Personal');
//Esta línea es por si queréis enviar copia a alguien (dirección y, opcionalmente, nombre)
//$mail->AddReplyTo('caifca@fca.uncu.edu.ar','El de la réplica');
//Y, ahora sí, definimos el destinatario (dirección y, opcionalmente, nombre)
$mail->AddAddress($correo, $destino);
//Definimos el tema del email
$mail->Subject = 'Formulario de Vacaciones del Agente ' .$datos['agente_ayn'];
//Para enviar un correo formateado en HTML lo cargamos con la siguiente función. Si no, puedes meterle directamente una cadena de texto.
//$mail->MsgHTML(file_get_contents('correomaquetado.html'), dirname(ruta_al_archivo));
//Y por si nos bloquean el contenido HTML (algunos correos lo hacen por seguridad) una versión alternativa en texto plano (también será válida para lectores de pantalla)
$mail->IsHTML(true); //el mail contiene html
	
	
>>>>>>> desarrollo
	if ($datos['id_motivo'] == 30) {
		//$motivo = 'Razones Particulares con gose de haberes';
		$body = '<table>
						El/la agente  <b>'.$datos['agente_ayn'].'</b> perteneciente a la catedra/oficina/ direccion <b>'.$datos['catedra'].'</b>.<br/>
<<<<<<< HEAD
						Solicita Justificacion de Inasistencia por Razones Particulares a partir del dia '.$fecha.' hasta '.$hasta. '.
						 Teniendo en cuenta las siguientes Observaciones: ' .$datos['observaciones']. '
=======
						Ha solicitado la Justificacion de Inasistencia por Razones Particulares a partir del dia '.$fecha.' hasta '.$hasta. '.<br/>
						 Teniendo en cuenta las siguientes Observaciones: ' .$datos['observaciones']. ' <br/>
						 Por favor haga <a href="http://172.22.8.49/ctrl_asis/1.0">click aqui </a> para su autorizacion
>>>>>>> desarrollo
											
			</table>';

	} else
	{
		 
		//$motivo = 'Vacaciones'.$datos['anio'];
		$body = '<table>
<<<<<<< HEAD
						El/la agente  <b>'.$datos['agente_ayn'].'</b> perteneciente a la catedra/oficina/ direccion <b>'.$datos['catedra'].'</b>.<br/>
						Solicita Vacaciones correspondiente al año '.$datos['anio'].' a partir del dia '.$fecha.' hasta '.$hasta. '. <br/>
						 Teniendo en cuenta las siguientes Observaciones: ' .$datos['observaciones']. '
=======
						El/la agente  <b>'.$datos['agente_ayn'].'</b> perteneciente a  <b>'.$datos['catedra'].'</b>.<br/>
						Solicita Vacaciones correspondiente al  '.$datos['anio'].' a partir del dia '.$fecha.' hasta '.$hasta. '.<br/>
						Teniendo en cuenta las siguientes Observaciones: ' .$datos['observaciones']. ' <br/>
						En caso de no estar de acuerdo con la autorizacion comuniquese por correo con la autoridad correspondiente.
>>>>>>> desarrollo
											
			</table>';
	}
	
<<<<<<< HEAD

	; //date("d/m/y",$fecha)
$mail->Body = $body;
//Enviamos el correo
if(!$mail->Send()) {
	echo "Error: " . $mail->ErrorInfo;
} else {
	toba::notificacion()->agregar('Su formulario ha sido completado y enviado a su correo. Ya puede cerrar la ventana.' , "info");
	echo "Enviado!";
}
	

		
	}
	function enviar_correos_sup($correo,$destino)
	{
		require_once('3ros/phpmailer/class.phpmailer.php');

				$datos =$this-> s__datos;   
				$fecha=date('d/m/Y',strtotime($datos['fecha_inicio_licencia'] ) );

	$hasta=date('d/m/Y',strtotime($datos['fecha_inicio_licencia'] . "+ " .$datos['dias']. " days") );
 
			
               
		$mail = new phpmailer();
		$mail->IsSMTP();
//Esto es para activar el modo depuración. En entorno de pruebas lo mejor es 2, en producción siempre 0
// 0 = off (producción)
// 1 = client messages
// 2 = client and server messages
$mail->SMTPDebug  = 0;
//Ahora definimos gmail como servidor que aloja nuestro SMTP
$mail->Host       = 'smtp.gmail.com';
//El puerto será el 587 ya que usamos encriptación TLS
$mail->Port       = 587;
//Definmos la seguridad como TLS
$mail->SMTPSecure = 'tls';
//Tenemos que usar gmail autenticados, así que esto a TRUE
$mail->SMTPAuth   = true;
//Definimos la cuenta que vamos a usar. Dirección completa de la misma
$mail->Username   = "formularios_personal@fca.uncu.edu.ar";
//Introducimos nuestra contraseña de gmail
$mail->Password   = "djxgidwlytoydsow";
//Definimos el remitente (dirección y, opcionalmente, nombre)
$mail->SetFrom('formularios_personal@fca.uncu.edu.ar', 'Formularios Personal');
//Esta línea es por si queréis enviar copia a alguien (dirección y, opcionalmente, nombre)
//$mail->AddReplyTo('caifca@fca.uncu.edu.ar','El de la réplica');
//Y, ahora sí, definimos el destinatario (dirección y, opcionalmente, nombre)
$mail->AddAddress('ebermejillo@fca.uncu.edu.ar', $destino);
//Definimos el tema del email
$mail->Subject = 'Esto es un correo de prueba';
//Para enviar un correo formateado en HTML lo cargamos con la siguiente función. Si no, puedes meterle directamente una cadena de texto.
//$mail->MsgHTML(file_get_contents('correomaquetado.html'), dirname(ruta_al_archivo));
//Y por si nos bloquean el contenido HTML (algunos correos lo hacen por seguridad) una versión alternativa en texto plano (también será válida para lectores de pantalla)
$mail->IsHTML(true); //el mail contiene html
	
	
	if ($datos['id_motivo'] == 30) {
		//$motivo = 'Razones Particulares con gose de haberes';
		$body = '<table>
						El/la agente  <b>'.$datos['agente_ayn'].'</b> perteneciente a la catedra/oficina/ direccion <b>'.$datos['catedra'].'</b>.<br/>
						Ha solicitado la Justificacion de Inasistencia por Razones Particulares a partir del dia '.$fecha.' hasta '.$hasta. '.<br/>
						 Teniendo en cuenta las siguientes Observaciones: ' .$datos['observaciones']. ' <br/>
						 Por favor haga <a href="http://172.22.8.49/ctrl_asis/1.0">click aqui </a> para su autorizacion
											
			</table>';

	} else
	{
		 
		//$motivo = 'Vacaciones'.$datos['anio'];
		$body = '<table>
						El/la agente  <b>'.$datos['agente_ayn'].'</b> perteneciente a la catedra/oficina/ direccion <b>'.$datos['catedra'].'</b>.<br/>
						Solicita Vacaciones correspondiente al anio '.$datos['anio'].' a partir del dia '.$fecha.' hasta '.$hasta. '.<br/>
						Teniendo en cuenta las siguientes Observaciones: ' .$datos['observaciones']. ' <br/>
						Por favor haga <a href="http://172.22.8.49/ctrl_asis/1.0">click aqui </a> para su autorizacion
											
			</table>';
	}
	
=======
>>>>>>> desarrollo
	

$mail->Body = $body;
//Enviamos el correo
if(!$mail->Send()) {
	echo "Error: " . $mail->ErrorInfo;
} else {
	echo "Enviado!";
}
}
}
?>