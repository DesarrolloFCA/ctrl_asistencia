 <?php

class personal_ei_pantalla extends toba_ei_pantalla
{
  protected $mostrar_extras_cabecera = true;
  
  
  
     function generar_layout()
     {
          if ($this->controlador()->ev_info()->tiene_datos()) {
              $this->controlador()->ev_info()->generar_html();
              echo '<hr />';
          }
          parent::generar_layout();
      }
  }
?>