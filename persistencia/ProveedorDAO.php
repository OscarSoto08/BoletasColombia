<?php
class ProveedorDAO{
    private $idPersona;
    private $nombre;
    private $apellido;
    private $correo;
    private $clave;
    private $telefono;
    private $direccion;

    public function __construct($idPersona=null, $nombre=null, $apellido=null, $correo=null, $clave=null, $telefono=null, $direccion=null){
        $this -> idPersona = $idPersona;
        $this -> nombre = $nombre;
        $this -> apellido = $apellido;
        $this -> correo = $correo;
        $this -> clave = $clave;
        $this -> telefono = $telefono;
        $this -> direccion = $direccion;
    }
    
    public function autenticar(){
        return "select idProveedor
                from Proveedor 
                where correo = '" . $this -> correo . "' and clave = '" . $this -> clave . "'";
    }
    
    public function consultar(){
        return "select nombre, apellido, correo, telefono, direccion
                from Proveedor
                where idProveedor = '" . $this -> idPersona . "'";
    }

    public function insertar(){
        return 
        "INSERT INTO `Proveedor`(`idProveedor`, `nombre`, `apellido`, `correo`, `clave`, `telefono`, `direccion`) 
        VALUES ('".$this -> idPersona."','".$this -> nombre ."','".$this -> apellido."','".$this -> correo ."','".$this -> clave ."','".$this -> telefono ."','".$this -> direccion."')";
    }
    public function maxID(){
        return 
        "SELECT max(idProveedor)
        FROM Proveedor";
    }
}
?>