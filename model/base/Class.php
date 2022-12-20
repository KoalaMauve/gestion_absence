<?php

class SchoolClass { //Binded to "class" table
    function __construct() {
    }
    protected $id;
    protected $name;

    function getClassId() {
        return $this->id;
    }
    function getName() {
        return $this->name;
    }

    function setClassId($ClassId) {
        $this->id = $ClassId;
    }
    function setName($Name) {
        $this->name = $Name;
    }
}
