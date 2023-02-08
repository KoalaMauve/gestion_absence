const URLCom = "http://localhost/gestion_absence/controller/";
$(document).ready(displayLogin())
function displayLogin() {
    $('main').hide()
}
let activeUser;

$("#btn-post").click(AddStudent);
$("#btn-update").click(updateTable);
$("#btn-delete").click(deleteForm);
$("#btn-drop").click(dropTable);


function ajaxRequest(type, controller, data) {
    return new Promise(function (resolve, reject) {
        $.ajax({
            url: URLCom + controller,
            type: type,
            async: true,
            data: data,
            dataType: 'json',
            success: function (response) {
                resolve(response);
            },
            error : function(response,status){
                reject(status);
            }
        });
    });
}

async function login() {
    //TODO : directly try to get the user based on his mail & pass, avoid returning full user object from the back.
    mail = {"mail": $("#login-mail").val()};
    password = $("#login-password").val();
    const user = await getUserByEmail(mail) ?? null;
    if(user != [] && user != null) {
        const userPassword = user[0].password;
        if (userPassword === password){
            loginSuccessfull();
            activeUser = user;
        }
        else {
            console.error("Mot de passe incorrect")
        }
    }
    else { console.error("Utilisateur Introuvable")}
}


async function getUserByEmail(mail) {
    try {
        const data = await ajaxRequest('POST', 'GetUser.php', mail);
        return data
    } catch (e) {
        console.error(e);
    }
}

function loginSuccessfull(){
    $("#login").remove();
    fillStudentDatatable();
    $('main').show();
}

async function fillStudentDatatable() {
    try {
        const data = await ajaxRequest('GET','GetAllStudent.php')
        $('#myTable').DataTable({"data": data,});
    } catch (e){
        console.error(e)
    }
}


/*function AddStudent() {
    form = new RegistrationForm();
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
}*/

function updateTable() {
    console.log("update")
}

function deleteForm() {
    console.log("delete")
}

function dropTable() {
    console.log("drop")
}


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

function getFormValues(form) {
    form = "#" + form;
    let value = $(form).val();
    return value;
}
