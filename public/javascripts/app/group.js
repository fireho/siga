$(document).ready(function() {

     $(".person_text").autocomplete("/people.json")
    .result(function (evt, data, formatted) {
        $("#holder_person_id").val(data[1]);
    });

});