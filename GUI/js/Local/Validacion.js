function ValidarStringVacio(elementId) {

    var Valor = document.getElementById(elementId).value;
    if (!Valor || 0 === value.length || /^\s+$/.test(Valor)) {
        return false; //El String esta vacio
    } else {
        return true; //El String NO esta vacio
    }

}

function ValidarStringSinNumeros{

    var Valor = document.getElementById(elementId).value
    if (isNaN(Valor)) {
        return 
    }
}