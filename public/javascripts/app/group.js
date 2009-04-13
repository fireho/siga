$(document).ready(function() {

    function completePerson(){
        $(".person_text").autocomplete("/people.json")
        .result(function (evt, data, formatted) {
            $(this).parents().next(':input').val(data[1]);
        });
    };

    // Reattach the autocomplete after dom load
    $('#holder_new').click(function () {
        completePerson();
    });

    completePerson();


});