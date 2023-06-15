var map = L.map('map').
setView([ 19.421127, -99.130677],12.5);

L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom: 18
}).addTo(map);

L.control.scale().addTo(map);
var mako = L.marker([ 19.421127, -99.130677], {draggable: true});
mako.addTo(map).bindPopup("<b>¿Cuál es tu ubicación?</b>").openPopup();

//validar numeros
onload = function(){ 
    var ele = document.querySelectorAll('.validanumericos')[0];
    ele.onkeypress = function(e) {
       if(isNaN(this.value+String.fromCharCode(e.charCode)))
          return false;
    }
    ele.onpaste = function(e){
       e.preventDefault();
    }
}

function validarSiNumero(numero){
    if (!/^([0-9])*$/.test(numero)){
        alert("El valor " + numero + " no es un número");
        
    }
    
}

//validar datos enviados
function enviar(){
    // para insertar una localizacion mako.setLatLng([19.421127, -99.130677]);
    document.getElementById("oculto").value = mako.getLatLng();
    
    var isChecked = document.getElementById('compra').checked;
    if(isChecked){//compra
        //Checamos que algúb checkbox haya sido seleccionado
        if(!document.getElementById("plast").checked && !document.getElementById("pap").checked
                && !document.getElementById("vid").checked && !document.getElementById("alu").checked
                && !document.getElementById("cart").checked && !document.getElementById("texles").checked
                && !document.getElementById("pet").checked && !document.getElementById("cob").checked
                && !document.getElementById("acet").checked && !document.getElementById("ferr").checked
                && !document.getElementById("noFerr").checked)
            alert("Selecione algún material");

        else{//Si alguno se seleccionó, verifiamos que haya escrito el precio correspondiente
            var val = true;
            
            if(document.getElementById("plast").checked && (document.getElementById("prePlast").value.length == 0))
                val = false;
            if(document.getElementById("pap").checked && (document.getElementById("prePap").value.length == 0))
                val = false;
            if(document.getElementById("vid").checked && (document.getElementById("preVid").value.length == 0))
                val = false;
            if(document.getElementById("alu").checked && (document.getElementById("preAlu").value.length == 0))
                val = false;
            if(document.getElementById("cart").checked && (document.getElementById("preCart").value.length == 0))
                val = false;
            if(document.getElementById("texles").checked && (document.getElementById("preTexles").value.length == 0))
                val = false;
            if(document.getElementById("pet").checked && (document.getElementById("prePet").value.length == 0))
                val = false;
            if(document.getElementById("cob").checked && (document.getElementById("preCob").value.length == 0))
                val = false;
            if(document.getElementById("acet").checked && (document.getElementById("preAcet").value.length == 0))
                val = false;
            if(document.getElementById("ferr").checked && (document.getElementById("preFerr").value.length == 0))
                val = false;
            if(document.getElementById("noFerr").checked && (document.getElementById("preNoFerr").value.length == 0))
                val = false;
            
            //finalmente, si todo está bien, hacemos submit
            if(val){
                
                document.getElementById("frm").submit();
            }else{
                alert("Introduzca el precio de cada material");
            }
        }
    }else if(document.getElementById('recibe').checked){//recibe
        //checamos que se haya seleccionado algún checkbox
        if(!document.getElementById("acetAut").checked && !document.getElementById("acetCoc").checked
                && !document.getElementById("toner").checked && !document.getElementById("residConst").checked
                && !document.getElementById("elec").checked && !document.getElementById("tetra").checked
                && !document.getElementById("focos").checked && !document.getElementById("medic").checked
                && !document.getElementById("baterias").checked && !document.getElementById("pintura").checked
                && !document.getElementById("orgas").checked && !document.getElementById("sanit").checked
                && !document.getElementById("vidrio").checked && !document.getElementById("varios").checked
                && !document.getElementById("unicel").checked)
            alert("Selecione algún material");
        else{
            
            document.getElementById("frm").submit();
        }
    }
    
}

//activa las casillas de precio
function activarCasilla(num){
    switch(num){
        case 1:
            if(document.getElementById("prePlast").disabled)
                document.getElementById("prePlast").disabled = false;
            else
                document.getElementById("prePlast").disabled = true;
            break;
        case 2:
            if(document.getElementById("prePet").disabled)
                document.getElementById("prePet").disabled = false;
            else
                document.getElementById("prePet").disabled = true;
            break;
        case 3:
            if(document.getElementById("prePap").disabled)
                document.getElementById("prePap").disabled = false;
            else
                document.getElementById("prePap").disabled = true;
            break;
        case 4:
            if(document.getElementById("preVid").disabled)
                document.getElementById("preVid").disabled = false;
            else
                document.getElementById("preVid").disabled = true;
            break;
        case 5:
            if(document.getElementById("preAlu").disabled)
                document.getElementById("preAlu").disabled = false;
            else
                document.getElementById("preAlu").disabled = true;
            break;
        case 6:
            if(document.getElementById("preCob").disabled)
                document.getElementById("preCob").disabled = false;
            else
                document.getElementById("preCob").disabled = true;
            break;
        case 7:
            if(document.getElementById("preCart").disabled)
                document.getElementById("preCart").disabled = false;
            else
                document.getElementById("preCart").disabled = true;
            break;
        case 8:
            if(document.getElementById("preAcet").disabled)
                document.getElementById("preAcet").disabled = false;
            else
                document.getElementById("preAcet").disabled = true;
            break;
        case 9:
            if(document.getElementById("preFerr").disabled)
                document.getElementById("preFerr").disabled = false;
            else
                document.getElementById("preFerr").disabled = true;
            break;
        case 10:
            if(document.getElementById("preNoFerr").disabled)
                document.getElementById("preNoFerr").disabled = false;
            else
                document.getElementById("preNoFerr").disabled = true;
            break;
        case 11:
            if(document.getElementById("preTexles").disabled)
                document.getElementById("preTexles").disabled = false;
            else
                document.getElementById("preTexles").disabled = true;
    }
}

//mostrat u ocultar div
function mostrar(num){
    var x = document.getElementById("miDIV");
    var y = document.getElementById("otroDIV");
    if (document.getElementById("compra").checked) {
        x.style.display = "block";
        y.style.display = "none"
    } else if(document.getElementById("recibe").checked){
        x.style.display = "none";
        y.style.display = "block"
    }
}
function cosa(){
    alert("Su ubicacion es: " + mako.getLatLng());
    var coors = mako.getLatLng();
    document.getElementById("oculto").value = coors;
}

