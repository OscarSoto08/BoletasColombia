<?php
require ("./persistencia/ProveedorDAO.php");
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
    
    /**
     * @inheritDoc
     */
    public function registrar() {
        $conexion = new Conexion();
        $conexion -> abrirConexion();

        //Aqui se busca cual id puede tener el proveedor
        $this -> colocarID($this);

        $ProveedorDAO = new ProveedorDAO($this -> idPersona, $this -> nombre, $this -> apellido, $this -> correo, $this -> clave, $this -> telefono, $this -> direccion);

        $conexion -> ejecutarConsulta($ProveedorDAO -> insertar());

        $conexion -> cerrarConexion();
        if($conexion -> getResultado() == true){
            return true;
        }
        return false;
    }

    private function colocarID(Proveedor $proveedor) {
        $conexion = new Conexion();
        $conexion -> abrirConexion();
        $ProveedorDAO = new ClienteDAO();
        $conexion -> ejecutarConsulta($ProveedorDAO -> maxID());
        $registro = $conexion -> siguienteRegistro();

        
        $proveedor -> setIdPersona($registro[0] + 1);//siguiente registro al ultimo
        $conexion -> cerrarConexion();
    }

}
?>