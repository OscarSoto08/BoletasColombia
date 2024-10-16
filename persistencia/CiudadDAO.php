<?php
    class CiudadDAO{    
        private $idCiudad;
        private $nombre;


        public function __construct($idCiudad = null, $nombre = null){
            $this->idCiudad = $idCiudad;
            $this->nombre = $nombre;
        }
        public function consultarTodos(){
            $sql = "select idCiudad, nombre from Ciudad";
            return $sql;
        }

        public function consultar(){
            return "select nombre from Ciudad where idCiudad =" . $this->idCiudad;
        }
    }
?>