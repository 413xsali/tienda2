<?php

    class productoController{
        public function index(){    
         
          echo "Controlador de PRODUCTOS" ;

          require_once "views/producto/destacados.php";
        
        }

    }