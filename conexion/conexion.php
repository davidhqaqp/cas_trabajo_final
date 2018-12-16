<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
if (class_exists('Conexion') != true) {

    class Conexion {

        private $servername = "localhost";
        private $username = "root";
        private $password = "";
        private $dbname = "appraisal";
        private $conn = null;

        public function __construct() {
            
        }

        public function getConexion() {
            // Create connection
            if ($this->conn == null) {
                $this->conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);
                if ($this->conn->connect_error) {
                    die("Connection failed: " . $this->conn->connect_error);
                }
            }

            return $this->conn;
        }

    }

}
