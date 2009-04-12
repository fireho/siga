$(document).ready(function() {

     $("#person_mom_text").autocomplete("/people.json")
    .result(function (evt, data, formatted) {
        $("#person_mom_id").val(data[1]);
    });


//     $("#person_mom_text").autocomplete({
//         correction: 0,
//         ajax_get : function(key, cont) {
//             var script_name = '/people.json'
//             var params = { nome : key }

//             $.get(script_name, params, function(obj){
//                 // obj is just array of strings
//                 var res = [];
//                 obj = obj.results;
//                 for(var i=0;i<obj.length;i++){
//                     res.push({ id:obj[i].id , value:obj[i].value });
//                 }
//           cont(res);
//         }, 'json'
//       );
//     },

//     callback: function (obj) {
//       // if(inputs.hasClass('poi')) {
//       //   map.setCenter(new GLatLng(obj.y, obj.x), 13);
//       // }
//     }
//   });
 });



// autocomplete("/people.json", {
//                 width: 260,
//                 selectFirst: false,
//                 matchContains: true,

//                 formatItem: formatItem,
//                 formatResult: formatResult

//         });

