const URLCom = "http://localhost/gestion_absence/controller/";
$(document).ready(displayLogin())
function displayLogin() {
    $('main').hide()
}
let activeUser;

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
            activeUser = user[0];
            loginSuccessfull();
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

async function getAssociatedStudents() {
    id = {"id": activeUser.id};
    try {
        const data = await ajaxRequest('POST', 'GetStudentByParentId', id);
        console.log(data)
        return data
    } catch (e) {
        console.error(e);
    }
}

function loginSuccessfull(){
    $("#login").remove();
    $('main').show();
    generateStudentsList();
}

async function generateStudentsList() {
    students = await getAssociatedStudents();
    if (students != null && students != []) {
        var myItems = [];
        var component = $( "#student-container" );

        Object.keys(students).forEach(e => {
            let student = students[e]
            myItems.push( '<div class="student-avatar" onClick="getStudentAbsents(event)" user="' + student.user_id +
                '"student="' + student.id + '">' +
                '<div>' + student.Last_Name + '</div>' +
                '<div>' + student.Name + '</div>' +
                '</div>')
        })
        component.append(myItems.join( "" ));
    } else {
        console.error("No associated students")
    }
}

async function getStudentAbsents(event) {
    student_id = event.target.parentElement.getAttribute('student');
    user_id = event.target.parentElement.getAttribute('user');

    id = {"id": student_id};
    try {
        const data = await ajaxRequest('POST','GetAbsentByStudentId.php', id)
        var absents = new Array();
        Object.keys(data).forEach(e => {
            let obj = data[e];
            let absent = {};
            absent.id = obj.id;
            absent.student_id = obj.student_id;
            absent.prof_id = obj.prof_id;
            absent.start_date = obj.start_date;
            absent.end_date = obj.end_date;
            absent.is_justified = obj.is_justified;
            absent.comment = obj.comment;
            absents.push(absent)
        })
        deleteAbsentTable();
        createAbsentTable();
        $('#absentTable').DataTable({
            data: absents,
            columns : [
                {data: 'id'},
                {data: 'start_date'},
                {data: 'end_date'},
                {data: 'is_justified'},
                {data: 'comment'}
            ]
        });
    } catch (e){
        console.error(e)
    }
}

function deleteAbsentTable() {
    $('#absent-container').empty();
}

function createAbsentTable() {
    table = '<table id="absentTable" class="display col-11 table-striped"><thead><tr><th>ID</th><th>Début</th><th>Fin</th><th>Justifiée</th><th>Commentaire</th></tr></thead><tbody><tr></tr></tbody></table>';
    $('#absent-container').append(table);
    $('#absent-container').show();
}