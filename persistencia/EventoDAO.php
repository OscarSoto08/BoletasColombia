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
        "SELECT idEvento, nombre, descripcion, fecha, direccion, aforo, Ciudad_idCiudad
        FROM Evento";
        return $sql;
    }
    public function consultarIdProv($idprov){
        $sql = "select e.idEvento, e.nombre, e.descripcion, e.direccion, e.aforo, e.fecha, e.Ciudad_idCiudad
                from Evento e JOIN GestionEventos g ON(e.idEvento = g.Evento_idEvento)
                where g.Proveedor_idProveedor = ".$idprov.";";
    }
}
?>