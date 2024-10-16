<?php
require_once './persistencia/Conexion.php';
require './persistencia/EventoDAO.php';
class Evento{
    private $idEvento;
    private $nombre;
    private $descripcion;
    private $fecha;
    private $direccion;
    private $aforo;
    private $ciudad;

    

    //Aqui van los getters
    public function getIdEvento(){
        return $this->idEvento;
    }
    public function getNombre(){
        return $this->nombre;
    }
    public function getDescripcion(){
        return $this->descripcion;
    }
    public function getFecha(){
        return $this->fecha;
    }
    public function getdireccion(){
        return $this->direccion;
    }
    public function getAforo(){
        return $this->aforo;
    }
    public function getCiudad(){
        return $this->ciudad;
    }

    //Aqui van los setters
    public function setIdEvento($idEvento){
        $this -> idEvento = $idEvento;
    }
    public function setNombre($nombre){
        $this -> nombre = $nombre;
    }
    public function setDescripcion($descripcion){
        $this ->descripcion = $descripcion;
    }
    public function setFecha($fecha){
        $this ->fecha = $fecha;
    }
    public function setdireccion($direccion){
        $this ->direccion = $direccion;
    }
    public function setAforo($aforo){
        $this -> aforo = $aforo;
    }
    public function setCiudad($ciudad){
        $this ->ciudad = $ciudad;
    }
    //Constructor, coloca los parametros nulos o vacios por defecto
    public function __construct($idEvento = "", $nombre = "", $descripcion = "", $fecha = null, $direccion = "", $aforo = "", $ciudad = null){
        $this->idEvento = $idEvento;
        $this->nombre = $nombre;
        $this->descripcion = $descripcion;
        $this->fecha = $fecha;
        $this->direccion = $direccion;
        $this->aforo = $aforo;
        $this->ciudad = $ciudad;
    }

    public function consultarTodos(){
        $Eventos = array();
        $conn = new Conexion(); 
        $conn->abrirConexion();
        $EventoDAO = new EventoDAO();
        $conn -> ejecutarConsulta($EventoDAO -> consultarTodos());
        while($registro = $conn -> siguienteRegistro()){
            $Evento = new Evento($registro[0],
                $registro[1],
                $registro[2],
                $registro[3],
                $registro[4],
                $registro[5],
                $registro[6]
            );
            array_push($Eventos, $Evento);
        }
        return $Eventos;
    }
    public function consPorIdProv($id){
        $Eventos = array();
        $conn = new Conexion(); 
        $conn->abrirConexion();
        $EventoDAO = new EventoDAO();
        $conn -> ejecutarConsulta($EventoDAO -> consultarIdProv($id));
        while($registro = $conn -> siguienteRegistro()){
            $Evento = new Evento($registro[0],
                $registro[1],
                $registro[2],
                $registro[3],
                $registro[4],
                $registro[5],
                $registro[6]
            );
            array_push($Eventos, $Evento);
        }
        return $Eventos;
    }
}
?>