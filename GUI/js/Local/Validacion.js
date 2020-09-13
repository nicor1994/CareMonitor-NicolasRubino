function ValidarStringVacio(elementId) {

    var Valor = document.getElementById(elementId).value;
    if (!Valor || 0 === value.length || /^\s+$/.test(Valor)) {
        return false; //El String esta vacio
    } else {
        return true; //El String NO esta vacio
    }

}

function ValidarStringSinNumeros(elementId){

    var Valor = document.getElementById(elementId).value
    if (isNaN(Valor)) {
        return true; //NO es un numero
    } else {
        return false; //Es un Numero
    }
}

function ValidarEmail(valor) {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3,4})+$/.test(valor)) {
       return true; //La direccion de email es correcta
    } else {
        return false; //La direccion de email NO es correcta
    }
}