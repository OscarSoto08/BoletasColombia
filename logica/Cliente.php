<?php 
require './persistencia/ClienteDAO.php';
class Cliente extends Persona{
    public function __construct($idPersona = null, $nombre = null, $apellido = null, $correo = null, $clave = null, $telefono = null, $direccion = null){
        parent::__construct($idPersona, $nombre, $apellido, $correo, $clave, $telefono, $direccion);
    }
    /**
     * @inheritDoc
     */
    public function registrar() {
        $conexion = new Conexion();
        $conexion -> abrirConexion();

        //Aqui se busca cual id puede tener el proveedor
        $this -> colocarID($this);

        $clienteDAO = new ClienteDAO($this -> idPersona, $this -> nombre, $this -> apellido, $this -> correo, $this -> clave, $this -> telefono, $this -> direccion);

        $conexion -> ejecutarConsulta($clienteDAO -> insertar());

        $conexion -> cerrarConexion();
        if($conexion -> getResultado() == true){
            return true;
        }
        return false;
    }


    /**
     * @inheritDoc
     */
    public function autenticar() {
        $conexion = new Conexion();
        $conexion -> abrirConexion();
        $clienteDAO = new clienteDAO(null, null, null, $this -> correo, $this -> clave, null, null);
        $conexion -> ejecutarConsulta($clienteDAO -> autenticar());
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


    private function colocarID(Cliente $cliente) {
        $conexion = new Conexion();
        $conexion -> abrirConexion();
        $clienteDAO = new ClienteDAO();
        $conexion -> ejecutarConsulta($clienteDAO -> maxID());
        $registro = $conexion -> siguienteRegistro();

        
        $cliente -> setIdPersona($registro[0] + 1);//siguiente registro al ultimo
        $conexion -> cerrarConexion();
    }


    public function consultar(){
        $conexion = new Conexion();
        $conexion -> abrirConexion();
        $clienteDAO = new clienteDAO($this -> idPersona);
        $conexion -> ejecutarConsulta($clienteDAO -> consultar());
        $registro = $conexion -> siguienteRegistro();
        $this -> nombre = $registro[0];
        $this -> apellido = $registro[1];
        $this -> correo = $registro[2];
        $this -> telefono = $registro[3];
        $this -> direccion = $registro[4];
    }
}
?>