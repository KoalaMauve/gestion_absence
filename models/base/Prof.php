<?php

class Prof {
    function __construct() {
    }
    protected $id;
    protected $name;
    protected $user_id;

    function getProfId() {
        return $this->id;
    }
    function getName() {
        return $this->name;
    }
    function getUser_id() {
        return $this->user_id;
    }

    function setProfId($ProfId) {
        $this->id = $ProfId;
    }
    function setName($Name) {
        $this->name = $Name;
    }
    function setUser_id($User_id) {
        $this->user_id = $User_id;
    }
}
