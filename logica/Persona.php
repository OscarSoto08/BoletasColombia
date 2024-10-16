<?php
require_once ("./persistencia/Conexion.php");



abstract class Persona{
    protected $idPersona;
    protected $nombre;
    protected $apellido;
    protected $correo;
    protected $clave;
    protected $telefono;
    protected $direccion;

    public function getIdPersona(){
        return $this->idPersona;
    }

    public function getNombre(){
        return $this->nombre;
    }

    public function getApellido(){
        return $this->apellido;
    }

    public function getCorreo(){
        return $this->correo;
    }

    public function getClave(){
        return $this->clave;
    }

    public function getTelefono(){
        return $this->telefono;
    }

    public function getdireccion(){
        return $this->direccion;
    }
    public function setIdPersona($idPersona){
        $this->idPersona = $idPersona;
    }

    public function setNombre($nombre){
        $this->nombre = $nombre;
    }

    public function setApellido($apellido){
        $this->apellido = $apellido;
    }

    public function setCorreo($correo){
        $this->correo = $correo;
    }

    public function setClave($clave){
        $this->clave = $clave;
    }
    
    public function __construct($idPersona, $nombre, $apellido, $correo, $clave, $telefono, $direccion){
        $this -> idPersona = $idPersona;
        $this -> nombre = $nombre;
        $this -> apellido = $apellido;
        $this -> correo = $correo;
        $this -> clave = $clave;
        $this -> telefono = $telefono;
        $this -> direccion = $direccion;
    }

    abstract function autenticar();
    
    abstract function registrar();
}

?>