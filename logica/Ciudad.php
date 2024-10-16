<?php
    require_once './persistencia/Conexion.php';
    require './persistencia/CiudadDAO.php';
    class Ciudad{
        private $idCiudad;
        private $nombre;

        public function setIdCiudad($idCiudad){
            $this->idCiudad = $idCiudad;
        }
        public function setNombre($nombre){
            $this->nombre = $nombre; 
        }
        public function getIdCiudad(){ 
            return $this->idCiudad;
        }
        public function getNombre(){
            return $this->nombre;
        }
        public function __construct($idCiudad = null, $nombre = null){
            $this->idCiudad = $idCiudad;
            $this->nombre = $nombre;
        }
        

        public function consultarTodos(){
            $ciudades = array();
            $conn = new Conexion;
            $conn -> abrirConexion();
            $ciudadDAO = new CiudadDAO();
            $conn -> ejecutarConsulta($ciudadDAO->consultarTodos());
            while($registro = $conn -> siguienteRegistro()){
                $ciudad = new Ciudad($registro[0],
            $registro[1]);
            array_push($ciudades, $ciudad);
            }
            return $ciudades;
        }
    }
?>