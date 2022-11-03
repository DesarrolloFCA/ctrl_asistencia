<?php
class dt_catedra extends comision_datos_tabla
{
	
	function get_catedra_agentes ($legajo)
	{
		//ei_arbol ($legajo);
	/*	$sql="DELETE from reloj.temp_agentes_catedra";
		toba::db('comision')->ejecutar($sql);
		$sql = "INSERT INTO reloj.temp_agentes_catedra SELECT a.id_catedra, nombre_catedra   from reloj.catedras a
				left join reloj.catedras_agentes b on a.id_catedra =b.id_catedra
				where legajo = '$legajo'";
		
		toba::db('comision')->ejecutar($sql);
		$sql= "SELECT id_catedra, nombre_catedra from reloj.temp_agentes_catedra";
		return  toba::db('comision')->consutar($sql);
		

		
		/*if(!empty($res['nombre_catedra'])){
					return $res['nombre_catedra'];
				}*/

	}
	
	function autoridades ($legajo) {
		//ei_arbol ($legajo);
		$sql = "SELECT legajo_autoridad legajo_aut from reloj.autoridades
		WHERE legajo_subalterno = $legajo";
		$autoridad = toba::db('comision')->consultar($sql);
		if ($autoridad<> null) {
			/*$leg= $autoridad [0]['legajo_aut']
			$sql = "SELECT   legajo ||'-'|| apellido||', '||nombre as legajo_aut
                    FROM uncu.legajo 
                    WHERE legajo = $leg";
       $d = toba::db('mapuche')->consultar ($sql);
       ei_arbol($d);
       		return  $d;*/
			return $autoridad;
		} else
		$sql = "SELECT DISTINCT legajo_dir legajo_jefe FROM reloj.departamento_director a
						INNER JOIN reloj.departamentos b on a.id_departamento =b.id_departamento
						INNER JOIN reloj.catedras c on c.id_departamento = b.id_departamento
						INNER JOIN reloj.catedras_agentes d on d.id_catedra =c.id_catedra
						WHERE jefe = true
						AND d.legajo = $legajo;"; 
				$jefe= toba::db('comision')->consultar($sql);
				$legajo = $jefe[0]['legajo_jefe'];
				$sql = "SELECT legajo_autoridad legajo_aut from reloj.autoridades
		WHERE legajo_subalterno = $legajo";
		$autoridad = toba::db('comision')->consultar($sql);

		//ei_arbol($autoridad);
		return $autoridad ;

		//return $leg;

	}
	function jefes ($legajo) {
		$sql = "SELECT jefe from reloj.catedras_agentes b 
		 		WHERE legajo = $legajo;";
		 $es_jefe = toba::db('comision')->consultar($sql);	
		 //ei_arbol 
		 if ($es_jefe [0]['jefe']) {
		 	$sql = "SELECT * from reloj.departamento_director b 
		 		WHERE legajo_dir = $legajo;";
		 	$auto = toba::db('comision')->consultar($sql);	
		 	$hay = count($auto);
		 	if ($hay > 0) {
		 		$jefe[0]['legajo_jefe']= null;

		 		}else{
		 		$sql = "SELECT DISTINCT legajo_dir legajo_jefe FROM reloj.departamento_director a
						INNER JOIN reloj.departamentos b on a.id_departamento =b.id_departamento
						INNER JOIN reloj.catedras c on c.id_departamento = b.id_departamento
						INNER JOIN reloj.catedras_agentes d on d.id_catedra =c.id_catedra
						WHERE jefe = true
						AND d.legajo = $legajo;"; 
				$jefe= toba::db('comision')->consultar($sql);
		 		} 
		 	}else {		
			$sql ="SELECT legajo legajo_jefe from reloj.catedras_agentes b 
			where id_catedra in (( Select id_catedra from reloj.catedras_agentes
			where legajo = $legajo)) and jefe = true;";
			$jefe= toba::db('comision')->consultar($sql);
		}	
		return $jefe;
		//$legajo_jefe =   toba::db('comision')->consultar($sql);
		//ei_arbol($legajo_jefe);
	}

	function get_catedra_jefe ($legajo)
	{
		return self::jefes($legajo);
		
		
	}
	function get_descripciones()
	{
		$sql = "SELECT id_catedra, nombre_catedra FROM catedras ORDER BY nombre_catedra";
		return toba::db('comision')->consultar($sql);
	}
	function get_autoridades ($legajo,$superior){
		
		if ($superior <> null){
			$legajo_aut = self::autoridades ($superior);

		}else {
			$legajo_aut = self::autoridades ($legajo);
		}
		//ei_arbol($legajo_aut);
		return $legajo_aut;
	}
	function get_ayn_aut($legajo_aut){
		$sql = "SELECT   apellido||', '||nombre as ayn
                    FROM uncu.legajo 
                    WHERE legajo = $legajo_aut";
       $d = toba::db('mapuche')->consultar ($sql);
       ei_arbol($d);
       return $d;
	}

}
?>