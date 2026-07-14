<?php

namespace Admision\Config;

use PDO;
use PDOException;
use Exception;

class PgsqlConnection {

    private static $instance = null;
    private $pdo;

    private function __construct() {
        $host = self::env('DB_HOST');
        $dbname = self::env('DB_NAME');
        $user = self::env('DB_USER');
        $password = self::env('DB_PASSWORD');

        $dsn = "pgsql:host=$host;dbname=$dbname";
        
        try {
            $this->pdo = new PDO($dsn, $user, $password, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
            ]);
        } catch (PDOException $e) {
            error_log("Error de conexión a la BD: " . $e->getMessage());
            throw new Exception("No se pudo conectar a la base de datos.");
        }
    }
    public static function getInstance() {
        if (self::$instance == null) {
            self::$instance = new PgsqlConnection();
        }
        return self::$instance;
    }

    public function getConnection() {
        return $this->pdo;
    }

    private static function env($key) {
        return $_ENV[$key] ?? getenv($key) ?: null;
    }
}

