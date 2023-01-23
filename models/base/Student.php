<?php

class Student {
    //put your code here
    function __construct() {
    }
    //put your code here
    protected $id;
    protected $class_id;
    protected $parents_id;
    protected $user_id;


    function getStudentId() {
        return $this->id;
    }
    function getClass_id() {
        return $this->class_id;
    }
    function getParents_id() {
        return $this->parents_id;
    }
    function getUser_id() {
        return $this->user_id;
    }



    function setStudentId($StudentId) {
        $this->id = $StudentId;
    }
    function setClass_id($class_id) {
        $this->class_id = $class_id;
    }
    function setParents_id($parents_id) {
        $this->parents_id = $parents_id;
    }
    function setUser_id($user_id) {
        $this->user_id = $user_id;
    }

}
