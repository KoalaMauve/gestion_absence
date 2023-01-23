<?php

class User {
    function __construct() {
    }
    protected $id;
    protected $last_name;
    protected $name;
    protected $birthdate;
    protected $login;
    protected $password;
    protected $mail;
    protected $phone;
    protected $isvalid;
    protected $profile;
    protected $photo;


    function getUserId() {
        return $this->id;
    }
    function getLast_name() {
        return $this->last_name;
    }
    function getName() {
        return $this->name;
    }
    function getBirthdate() {
        return $this->birthdate;
    }
    function getLogin() {
        return $this->login;
    }
    function getPassword() {
        return $this->password;
    }
    function getMail() {
        return $this->mail;
    }
    function getIsValid() {
        return $this->isvalid;
    }
    function getProfile() {
        return $this->profile;
    }
    function getPhoto() {
        return $this->photo;
    }


    function setUserId($UserId) {
        $this->id = $UserId;
    }
    function setLast_name($Last_name) {
        $this->last_name = $Last_name;
    }
    function setName($Name) {
        $this->name = $Name;
    }
    function setBirthdate($Birthdate) {
        $this->birthdate = $Birthdate;
    }
    function setLogin($Login) {
        $this->login = $Login;
    }
    function setPassword($Password) {
        $this->password = $Password;
    }
    function setMail($Mail) {
        $this->mail = $Mail;
    }
    function setIsValid($IsValid) {
        $this->isvalid = $IsValid;
    }
    function setProfile($Profile) {
        $this->profile = $Profile;
    }
    function setPhoto($Photo) {
        $this->photo = $Photo;
    }
}
