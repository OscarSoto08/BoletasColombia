<?php
class Conexion{
    private $mysqlConexion;
    private $resultado;
    
    public function abrirConexion(){
        $this -> mysqlConexion = new mysqli("localhost", "root", "", "BoletasColombia");
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
    
    public function numeroFilas(){
        return $this -> resultado -> num_rows;
    }

    public function errorSQL(){
        return $this -> mysqlConexion -> error;
    }

    public function getResultado(){
        return $this -> resultado;
    }
}

?>
