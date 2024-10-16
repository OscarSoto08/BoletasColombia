<?php
class ClienteDAO{
    private $idCliente;
    private $nombre;
    private $apellido;
    private $correo;
    private $clave;
    private $telefono;
    private $direccion;    

    public function __construct($idCliente = null, $nombre = null, $apellido = null, $correo = null, $clave = null, $telefono = null, $direccion = null){
        $this->idCliente = $idCliente;
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->correo = $correo;
        $this->clave = $clave;
        $this->telefono = $telefono;
        $this->direccion = $direccion;
    }
    public function autenticar(){
        return "SELECT idCliente
                FROM Cliente
                WHERE correo = '" . $this -> correo . "' and clave = '" . $this -> clave . "'";
    }


    public function consultar(){
        return 
        "SELECT nombre, apellido, correo, telefono, direccion
        FROM Proveedor
        WHERE idProveedor = '" . $this -> idCliente . "'";
    }

    public function insertar(){
        return 
        "INSERT INTO `Cliente`(`idCliente`, `nombre`, `apellido`, `correo`, `clave`, `telefono`, `direccion`) 
        VALUES ('".$this -> idCliente."','".$this -> nombre ."','".$this -> apellido."','".$this -> correo ."','".$this -> clave ."','".$this -> telefono ."','".$this -> direccion."')";
    }

    public function maxID(){
        return 
        "SELECT max(idCliente)
        FROM Cliente";
    }
}
?>