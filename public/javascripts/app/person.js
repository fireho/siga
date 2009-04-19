$(document).ready(function() {

     $("#person_mom_text").autocomplete("/people.json", { extraParams: { sex: false } })
    .result(function (evt, data, formatted) {
        $("#person_mom_id").val(data[1]);
    });

     $("#person_dad_text").autocomplete("/people.json", { extraParams: { sex: true } })
    .result(function (evt, data, formatted) {
        $("#person_mom_id").val(data[1]);
    });


 });


