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
    
}
?>