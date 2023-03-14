<?php
class ci_permiso_horario extends comision_ci
{
	protected $s__datos;
	//-----------------------------------------------------------------------------------
	//---- formulario -------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function evt__formulario__alta($datos)
	{
		ei_arbol ($datos);
		//$this->dep('datos')->nueva_fila($datos);

		$anio= date('Y');
		$legajo = $datos['legajo'];
		$sql = "SELECT count(*) cantidad 
				FROM reloj.permisos_horarios
				WHERE legajo = $legajo
				and extract(year FROM fecha) = $anio ;";
		$a = toba::db('comision')->consultar($sql);
		$cantidad = $a [0]['cantidad'];
		if ($cantidad <= 5 ) {

		$this->dep('datos')->tabla('permiso_horarios')->nueva_fila($datos);
		$this->dep('datos')->sincronizar();
		$this->dep('datos')->resetear();
		$catedra=$datos['id_catedra'];
			$sql= "SELECT nombre_catedra FROM reloj.catedras 
				Where id_catedra =$catedra";
			$a = toba::db('comision')->consultar($sql);
			$datos['n_catedra']= $a[0]['nombre_catedra'];
		if (!empty ($datos['legajo'])){
				$correo_agente = $this->dep('mapuche')->get_legajos_email($datos['legajo']);
				$datos['agente']=$correo_agente[0]['descripcion'];
		//	ei_arbol ($correo_agente);
			}
			if (!empty ($datos['leg_sup'])){
				$correo_sup = $this->dep('mapuche')->get_legajos_email($datos['leg_sup']);
				$datos['superior']=$correo_sup[0]['descripcion'];
			}
			
			$this->s__datos = $datos;
			if (!empty ($datos['legajo'])){
			$this->enviar_correos($correo_agente[0]['email']);
		
			}
		toba::notificacion()->agregar('Su pedido de Permiso Horario sera tramitado a la brevedad', 'info');

		} else 
		{
			toba::notificacion()->agregar('Ud. ha excedido la cantidad de permisos excepcionales que se otorgan por a&ntilde;o', 'info');
		}	
			/*if (!empty ($datos['leg_sup'])){
				$this->enviar_correos_sup($correo_sup[0]['email']);
			}*/

	}

	function evt__formulario__cancelar()
	{
	}
	 function enviar_correos($correo) 
	 {
	 	require_once('3ros/phpmailer/class.phpmailer.php');

				$datos =$this-> s__datos;    
				
//ei_arbol ($this->s__datos);                
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

//$mail->AddReplyTo('caifca@fca.uncu.edu.ar','El de la réplica');
//Y, ahora sí, definimos el destinatario (dirección y, opcionalmente, nombre)
$mail -> AddAddress('ebermejillo@fca.uncu.edu.ar', 'Tester');
//$mail->AddAddress($correo, 'El Destinatario'); //Descomentar linea cuando pase a produccion
//Definimos el tema del email
$mail->Subject = 'Formulario Permiso Horario';
//Para enviar un correo formateado en HTML lo cargamos con la siguiente función. Si no, puedes meterle directamente una cadena de texto.
//$mail->MsgHTML(file_get_contents('correomaquetado.html'), dirname(ruta_al_archivo));
//Y por si nos bloquean el contenido HTML (algunos correos lo hacen por seguridad) una versión alternativa en texto plano (también será válida para lectores de pantalla)
$mail->IsHTML(true); //el mail contiene html
	$fecha=date('d/m/Y',strtotime($datos['fecha']) );
	$fecha_fin =date('d/m/Y',strtotime($datos['fecha_fin']));
	
	$body = '<table>
						El/la agente  <b>'. $datos['agente'].'</b> perteneciente a la catedra/oficina/ direccion <b>'.$datos['n_catedra'].'</b>.<br/>
						Solicita permiso horario con motivo de '.$datos['razon'].' a realizarse el dia '.$fecha.' a partir de la hora ' .$datos['horario'].' hasta la hora '.$datos['horario_fin'].'. Teniendo en cuenta las siguientes Observaciones: ' .$datos['observaciones']. '
											
			</table>'; //date("d/m/y",$fecha)
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