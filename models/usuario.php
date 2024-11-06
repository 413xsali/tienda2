<?php

class Usuario{
    private $id;
    private $nombre;
    private $apellidos;
    private $email;
    private $password;
    private $rol;
    private $imagen;

    private $db;

    public function __construct()
    {
        $this->db = Database::connect();
    }
    public function getId()
    {
        return $this->id;
    }
    public function getNombre()
    {
        return $this->nombre;
    }
    public function getApellidos()
    {
        return $this->apellidos;
    }
    public function getEmail()
    {
        return $this->email;
    }
    public function getPassword()
    {
        return password_hash($this->db->real_escape_string($this->password),PASSWORD_BCRYPT,['cost'=>4]);
    }
    public function getRol()
    {
        return $this->rol;
    }
    public function getImagen()
    {
        return $this->imagen;
    }

    function setId($id)
    {
        $this->id=$id;
    }
    function setNombre($nombre)
    {
        $this->nombre=$this->db->real_escape_string($nombre);
    }

    function setApellidos($apellidos)
    {
        $this->apellidos=$this->db->real_escape_string($apellidos);
    }

    function setEmail($email)
    {
        $this->email=$this->db->real_escape_string($email);
    }
    function setPassword($password)
    {
        $this->password=$this->db->real_escape_string($password);
    }

    function setRol($rol)
    {
        $this->rol=$this->db->real_escape_string($rol);
    }

    function setImagen($imagen)
    {
        $this->imagen=$this->db->real_escape_string($imagen);
    }
    

}