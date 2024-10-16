<?php
class Proveedor extends Persona{
    public function __construct($idPersona = null, $nombre = null, $apellido = null, $correo = null, $clave = null, $telefono = null, $direccion = null){
        parent::__construct($idPersona, $nombre, $apellido, $correo, $clave, $telefono, $direccion);
    }
    
    public function autenticar(){
        $conexion = new Conexion();
        $conexion -> abrirConexion();
        $proveedorDAO = new ProveedorDAO(null, null, null, $this -> correo, $this -> clave, null, null);
        $conexion -> ejecutarConsulta($proveedorDAO -> autenticar());
        if($conexion -> numeroFilas() == 0){
            $conexion -> cerrarConexion();
            return false;
        }else{
            $registro = $conexion -> siguienteRegistro();
            $this -> idPersona = $registro[0];
            $conexion -> cerrarConexion();
            return true;
        }
    }

    public function consultar(){
        $conexion = new Conexion();
        $conexion -> abrirConexion();
        $proveedorDAO = new ProveedorDAO($this -> idPersona);
        $conexion -> ejecutarConsulta($proveedorDAO -> consultar());
        $registro = $conexion -> siguienteRegistro();
        $this -> nombre = $registro[0];
        $this -> apellido = $registro[1];
        $this -> correo = $registro[2];
        $this -> telefono = $registro[3];
        $this -> direccion = $registro[4];
    }
}
?>