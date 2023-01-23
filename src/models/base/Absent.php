<?php

class Absent {
    function __construct() {
    }
    protected $id;
    protected $start_date;
    protected $end_date;
    protected $student_id;
    protected $prof_id;
    protected $isjustified;
    protected $comment;


    function getAbsentId() {
        return $this->id;
    }
    function getStart_date() {
        return $this->start_date;
    }
    function getEnd_date() {
        return $this->end_date;
    }
    function getStudent_id() {
        return $this->student_id;
    }
    function getProf_id() {
        return $this->prof_id;
    }
    function getIsJustified() {
        return $this->isjustified;
    }
    function getComment() {
        return $this->comment;
    }

    function setAbsentId($AbsentId) {
        $this->id = $AbsentId;
    }
    function setStart_date($Start_date) {
        $this->start_date = $Start_date;
    }
    function setEnd_date($End_date) {
        $this->end_date = $End_date;
    }
    function setStudent_id($Student_id) {
        $this->student_id = $Student_id;
    }
    function setProf_id($Prof_id) {
        $this->prof_id = $Prof_id;
    }
    function setIsJustified($IsJustified) {
        $this->isjustified = $IsJustified;
    }
    function setComment($Comment) {
        $this->comment= $Comment;
    }
}
