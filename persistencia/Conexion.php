<?php

/*
Razón de usar PDO, además de definir una interfaz ligera para tener acceso a bases de datos (PHP Data Object, independientemente de la base de datos emplea las mismas funciones para realizar consultas y obtener datos)

PDO maneja controladores y mediante ellos es funcional, cada uno corresponde al tipo de base de datos
*/
class Conexion {
    private $host = 'localhost';        // El servidor de la base de datos
    private $dbname = 'BoletasColombia';  // El nombre de la base de datos
    private $username = 'root';      //  nombre de usuario
    private $password = '';   //  contraseña
    private $pdo; // Instancia de PDO

    // Constructor de la clase
    public function __construct() {
        $this->connect();
    }

    // Método para establecer la conexión a la base de datos
    private function connect() {
        $dsn = "mysql:host={$this->host};dbname={$this->dbname};charset=utf8";  // Data Source Name
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Configura el manejo de errores
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC // Configura el modo de recuperación por defecto
        ];

        try {
            // Crear una nueva instancia de PDO
            $this->pdo = new PDO($dsn, $this->username, $this->password, $options);
            echo "Conexión exitosa.";
            return true;
        } catch (PDOException $e) {
            // Manejo de errores
            echo "Error de conexión: " . $e->getMessage();
            return false;
        }
    }

    // Método para obtener la instancia de PDO
    public function getConnection() {
        return $this->pdo;
    }
}
/*
// Uso de la clase
$db = new Database();
$pdo = $db->getConnection();

// Puedes usar $pdo para ejecutar consultas, por ejemplo:
try {
    $stmt = $pdo->query('SELECT * FROM usuario');
    $rows = $stmt->fetchAll();
    foreach ($rows as $row) {
        print_r($row['name'] . '<br>');
    }
} catch (PDOException $e) {
    echo "Error en la consulta: " . $e->getMessage();
}*/
?>