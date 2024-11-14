<?php

    class usuarioController{
        public function index(){    
         
          echo "Controlador de USUARIOS" ;
        
        }

        public function registro(){

          require_once "views/usuario/registro.php";
        }

        public function save(){
          if(isseT($POST)){
            var_dump($POST);
            die();
          }
          
        }

    }