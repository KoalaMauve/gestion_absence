<?php

class User
{
    //put your code here
    function __construct()
    {
    }

    //put your code here
    protected $id;
    protected $start_date;
    protected $end_date;
    protected $student_id;
    protected $prof_id;
    protected $is_justified;
    protected $comment;


    public function getAbsentId()
    {
        return $this->id;
    }

    public function setAbsentId($id)
    {
        $this->id = $id;
    }

    public function getStartDate() {
        return $this->start_date;
    }

    public function setStartDate($start_date) {
        $this->start_date = $start_date;
    }

    public function getEndDate() {
        return $this->end_date;
    }

    public function setEndDate($end_date) {
        $this->start_date = $end_date;
    }

    public function getStudentId()
    {
        return $this->student_id;
    }

    public function setStudentId($student_id)
    {
        $this->student_id = $student_id;
    }

    public function getProdId() {
        return $this->prof_id;
    }

    public function setProfId($prof_id) {
        $this->prof_id = $prof_id;
    }

    public function getIsJustified() {
        return $this->is_justified;
    }

    public function setIsJustified($is_justified) {
        $this->is_justified = $is_justified;
    }

    public function getComment() {
        return $this->comment;
    }

    public function setComment($comment) {
        $this->comment = $comment;
    }
}

