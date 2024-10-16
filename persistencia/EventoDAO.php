<?php
class EventoDAO{
    private $idEvento;
    private $nombre;
    private $descripcion;
    private $fecha;
    private $direccion;
    private $aforo;
    private $ciudad;

    public function setIdEvento($idEvento){
        $this->idEvento = $idEvento;
    }
    public function __construct($idEvento = null, $nombre = null, $descripcion= null, $fecha= null, $direccion = null, $aforo = null, $ciudad = null){
        $this->idEvento = $idEvento;
        $this->nombre = $nombre;
        $this->descripcion = $descripcion;
        $this->fecha = $fecha;
        $this->direccion = $direccion;
        $this->aforo = $aforo;
        $this->ciudad = $ciudad;
    }
    //Consultar todos
    public function consultarTodos(){
        $sql = 
        "SELECT idEvento, nombre, descripcion, fecha, direccion, aforo, Ciudad_idCiudad
        FROM Evento";
        return $sql;
    }
    public function consultarEveId(){
        $sql = "select nombre, descripcion, direccion, aforo, fecha, Ciudad_idCiudad
                from evento where idEvento=".$this->idEvento."";
        return $sql;
    }
    public function regisEven(){
        $sql = "insert into evento (nombre, descripcion, direccion, aforo, fecha, Ciudad_idCiudad)
                values ('".$this->nombre."','".$this->descripcion."','".$this->direccion."',".$this->aforo.",'".$this->fecha."',".$this->ciudad.")";
                return $sql;
    }
    public function actEven(){
        $sql = "update evento
                set nombre = '".$this->nombre."', descripcion = '".$this->descripcion."', direccion = '".$this->direccion."', aforo= ".$this->aforo.", fecha='".$this->fecha."', Ciudad_idCiudad = ".$this->ciudad."
                where idEvento = ".$this->idEvento."";
        return $sql;
    }
    public function consultarIdProv($idprov){
        $sql = "select e.idEvento, e.nombre, e.descripcion, e.direccion, e.aforo, e.fecha, e.Ciudad_idCiudad
                from Evento e JOIN GestionEventos g ON(e.idEvento = g.Evento_idEvento)
                where g.Proveedor_idProveedor = ".$idprov.";";
        return $sql;
    }
    public function regisGesEve($idProv){
        $sql="insert into gestioneventos (Evento_idEvento, Proveedor_idProveedor, rolProveedor)
              values (".$this->idEvento.",".$idProv.",'Creador')";
        return $sql;
    }
    public function eliminarGesEve(){
        $sql = "delete from gestioneventos where Evento_idEvento = ".$this->idEvento.";";
        return $sql;
    }
    public function eliminarEve(){
        $sql = "delete from evento where idEvento = ".$this->idEvento.";";
        return $sql;
    }
}   
?>