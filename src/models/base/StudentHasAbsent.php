<?php

class StudentHasAbsent {
    function __construct() {
    }
    protected $student_id;
    protected $absent_id;

    function getStudentId() {
        return $this->student_id;
    }
    function getAbsentId() {
        return $this->absent_id;
    }

    function setStudentId($StudentId) {
        $this->student_id = $StudentId;
    }
    function setAbsentId($AbsentId) {
        $this->absent_id = $AbsentId;
    }
}
