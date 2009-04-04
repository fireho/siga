// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function Telefone(campo)
{
    qtdcaracteres = (campo.value).length;

    if(qtdcaracteres == 0)
    campo.value = "(";

    if(qtdcaracteres == 3)
    campo.value = campo.value + ")";

    if(qtdcaracteres == 8)
    campo.value = campo.value + "-";

}
// Fim da fun��o telefone

// Formatar o cep
function Cep(campo)
{
    qtdcaracteres = (campo.value).length;

    if(qtdcaracteres == 2)
    campo.value = campo.value + ".";

	if(qtdcaracteres ==6)
    campo.value = campo.value + "-";
}
// Fim da fun��o cep

// Formatar cgc
function Cgc(campo)
{
    qtdcaracteres = (campo.value).length;

    if(qtdcaracteres == 2)
    campo.value = campo.value + ".";

    if(qtdcaracteres == 6)
    campo.value = campo.value + ".";

    if(qtdcaracteres == 10)
    campo.value = campo.value + "/";

    if(qtdcaracteres == 15)
    campo.value = campo.value + "-";

}
// Fim da fun��o cgc

// Fun��o caixa alta
function upper(campo)
{
   campo.value = campo.value.toUpperCase();
}

// Formatar data
function Data(campo)
{
    qtdcaracteres = (campo.value).length;

    if(qtdcaracteres == 2)
    campo.value = campo.value + "/";

	if(qtdcaracteres ==5)
    campo.value = campo.value + "/";
}
// Fim da fun��o cep

// Fun��o placa
function Placa(campo)
{
    qtdcaracteres = (campo.value).length;

    if(qtdcaracteres == 3)
    campo.value = campo.value + "-";
}
// Fim da fun��o placa
// Função sip
function Sip(campo)
{
    qtdcaracteres = (campo.value).length;

    if(qtdcaracteres == 1)
    campo.value = campo.value + ".";

    if(qtdcaracteres == 5)
    campo.value = campo.value + ".";

    if(qtdcaracteres == 9)
    campo.value = campo.value + "-";


}
// Fim da fun��o placa

// Fim da fun��o placa
// Função sip
function Cpf(campo)
{
    qtdcaracteres = (campo.value).length;

    if(qtdcaracteres == 3)
    campo.value = campo.value + ".";

    if(qtdcaracteres == 7)
    campo.value = campo.value + ".";

    if(qtdcaracteres == 11)
    campo.value = campo.value + "-";

}
// Fim da função cpf

Event.observe (window, 'load', function(){
// abas
// Ocultando as abas
$$('.contaba').invoke ('hide');
// Mostra somente a primeira aba
$$('.contaba').first ().show ();
// seta a primeira aba como selecionada (na lista de abas)
$$('#abas a').first ().addClassName ('active');
// Quando clicar no link de uma aba
$$('#abas a').each (function (e){
Event.observe (e, 'click', function (e){
// Oculta todas as abas
$$('div.contaba').invoke ('hide');
// tira a seleção da aba atual
$$('#abas a').invoke ('removeClassName', 'active');
// adiciona a classe selected na selecionada atualmente
Event.element (e).addClassName ('active');
// Mostra a aba clicada
var tab = $$(Event.element (e).getAttribute ('href'));

(tab[0]).show ();
// pra nao ir para o link
Event.stop (e);

}); // Fim do Event.observe
}); // Fim do each
});

