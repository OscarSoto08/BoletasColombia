<?php

class Conexion{
    private $mysqlConexion;
    private $resultado;
    
    public function abrirConexion(){
        $this -> mysqlConexion = new mysqli("localhost", "root", "", "BoletasColombia");
        if(!$this -> mysqlConexion->connect_error){
            // echo "conexion exitosa";
        }else{
            echo "hubo un problema";
        }
    }
    
    public function ejecutarConsulta($sentenciaSQL){
        $this -> resultado = $this -> mysqlConexion -> query($sentenciaSQL);
    }
    
    public function siguienteRegistro(){
        return $this -> resultado -> fetch_row();
    }
    
    public function obtenerLlaveAutonumerica(){
        return $this -> mysqlConexion -> insert_id;
    }
    
    public function cerrarConexion(){
        $this -> mysqlConexion -> close();
    }
}

?>
