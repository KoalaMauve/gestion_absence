export class GenericService {
    constructor() {
        this.URLCom = "http://localhost/gestion_absence/controller/";
    }
    ajaxRequest(controller, type) {
        $.ajax({
            url: this.URLCom + controller,
            type: type,
            async: true,
            dataType: 'json',
            success: function (data) {
                return data
            },
            error: function(data,status){
                alert(status);
            }
        });
    }

    getAll(controller){
        return this.ajaxRequest(controller, 'GET');
    }
}