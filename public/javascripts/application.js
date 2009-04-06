

// Limpa os campos de busca
$.fn.clearClick = function() {
    return this.focus(function() {
        if( this.value == this.defaultValue ) {
            this.value = "";
        }
    }).blur(function() {
        if( !this.value.length ) {
            this.value = this.defaultValue;
        }
    });
};


$.fn.subMenu = function() {
    var menu = this
    var submenu = $(menu).find('ul')

    $(menu).hover(function(){
        $(submenu).css('visibility', 'visible')
    },function(){
        $(submenu).css('visibility','hidden')
    })
}

$.fn.subMenus = function() {
    for(i=0; i < $(this).length; i++){
        $($(this)[i]).subMenu()
    }
}

$(document).ready(function () {
    $("#search").clearClick();
    $('#main-navigation > ul > li').subMenus()

    if($("#tabs"))
        $("#tabs").tabs();
});


