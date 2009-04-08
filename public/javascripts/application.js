

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

$.fn.changeTheme = function() {
  $(this).change(function(){
    var links = $('link')
    for(i=0; i<links.length; i++){
      link = $(links[i])
      theme = $(this).val()
      link.attr('href', link.attr('href').replace(/themes\/\w+\//, 'themes/' + theme + '/') )
    }
  })
}

$(document).ready(function () {
    $("#search").clearClick();
    $('#main-navigation > ul > li').subMenus();
    $('#themes').changeTheme();
});


