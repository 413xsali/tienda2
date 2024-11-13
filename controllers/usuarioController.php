<?php

    class usuarioController{
        public function index(){    
         
          echo "Controlador de USUARIOS" ;
        
        }

        public function registro(){

          require_once "views/usuario/registro.php";
        }

    }