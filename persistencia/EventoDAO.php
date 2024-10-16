<?php
class EventoDAO{
    private $idEvento;
    private $nombre;
    private $descripcion;
    private $fecha;
    private $direccion;
    private $aforo;

    //Consultar todos
    public function consultarTodos(){
        $sql = 
        "SELECT idEvento, nombre, descripcion, fecha, direccion, aforo
        FROM Evento";
        return $sql;
    }
    public function consultarIdProv( ){
        $sql = "select idEvento, nombre descripcion, direccion, aforo, fecha, Ciudad_idCiudad";
    }
}
?>