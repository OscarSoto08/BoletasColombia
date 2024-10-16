<?php
    class CiudadDAO{    
        private $idCiudad;
        private $nombre;


        public function consultarTodos(){
            $sql = "select idCiudad, nombre from ciudad";
            return $sql;
        }
    }
?>