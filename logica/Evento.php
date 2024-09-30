<?php
class Evento{
    private $idEvento;
    private $nombre;
    private $descripcion;
    private $fecha;
    private $direccion;
    private $aforo;

    

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
    //Constructor, coloca los parametros nulos o vacios por defecto
    public function __construct($idEvento = "", $nombre = "", $descripcion = "", $fecha = null, $direccion = "", $aforo = 0){
        $this->idEvento = $idEvento;
        $this->nombre = $nombre;
        $this->descripcion = $descripcion;
        $this->fecha = $fecha;
        $this->direccion = $direccion;
        $this->aforo = $aforo;
    }

    public function consultarTodos(){
        
    }
}
?>