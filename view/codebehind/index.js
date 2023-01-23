import { UserService } from "../../service/UserService";
var MyDTdata;

$(document).ready(fillStudentDatatable())

$("#btn-post").click(AddStudent);
$("#btn-update").click(updateTable);
$("#btn-delete").click(deleteForm);
$("#btn-drop").click(dropTable);

class RegistrationForm{
    constructor(firstname, lastname, schoolclass, birthdate, city, specialization) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.schoolclass = schoolclass;
        this.birthdate = birthdate;
        this.city = city;
        this.specialization = specialization;
    }

    setValuesFromDocument() {
        this.firstname = getFormValue("input-firstname") != null || undefined ? getFormValues("input-firstname") : this.firstname
        this.lastname = getFormValue("input-lastname") != null || undefined ? getFormValues("input-lastname") : this.lastname
        this.schoolclass = getFormValue("input-schoolclass") != null || undefined ? getFormValues("input-schoolclass") : this.schoolclass
        this.birthdate = getFormValue("input-birthdate") != null || undefined ? getFormValues("input-birthdate") : this.birthdate
        this.city = getFormValue("input-city") != null || undefined ? getFormValues("input-city") : this.city
        this.specialization = getFormValue("input-specialization") != null || undefined ? getFormValues("input-specialization") : this.specialization
    }
}


function AddStudent() {
    let form = new RegistrationForm();
    form.setValuesFromDocument();

    $.ajax({
            // chargement du fichier externe
            url: URLCom + 'AddStudent.php',
            // Passage des données au fichier externe (ici le nom cliqué)
            type: "POST",
            data     : {
                "Firstname": form.firstname,
                "Lastname": form.lastname,
                "Birthdate": form.birthdate,
                "City": form.city,
                "Schoolclass": form.schoolclass,
                "Specialization": form.specialization,
            },
            dataType : 'html',
            success  : function(retour,status) {
                alert(retour);
            },
            error : function(data,status){
                alert(status);
            }
        });
}

function updateTable() {
    console.log("update")
}

function deleteForm() {
    console.log("delete")
}

function dropTable() {
    console.log("drop")
}


function getFormValues(form) {
    form = "#" + form;
    let value = $(form).val();
    return value;
}


function fillStudentDatatable() {
    let userService = new UserService()
    MyDTdata = $('#myTable').Datatable({"data": userService.getAll()});
}
