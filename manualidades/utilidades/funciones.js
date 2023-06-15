
jQuery(document).ready(function ($) {
    
    $('.num').on('input', function () {
        this.value = this.value.replace(/[^0-9,.,c,m,k,g,m,l,x,r]/g, '');
    });
    $('.nom').on('input', function () {
        this.value = this.value.replace(/[^0-9]/g, '');
    });

  $('#checkbox').change(function(){
    setInterval(function () {
        moveRight();
    }, 3000);
  });
 
	var slideCount = $('#slider ul li').length;
	var slideWidth = $('#slider ul li').width();
	var slideHeight = $('#slider ul li').height();
	var sliderUlWidth = slideCount * slideWidth;
	
	$('#slider').css({ width: slideWidth, height: slideHeight });
	
	$('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
	
    $('#slider ul li:last-child').prependTo('#slider ul');

    function moveLeft() {
        $('#slider ul').animate({
            left: + slideWidth
        }, 200, function () {
            $('#slider ul li:last-child').prependTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    function moveRight() {
        $('#slider ul').animate({
            left: - slideWidth
        }, 200, function () {
            $('#slider ul li:first-child').appendTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    $('a.control_prev').click(function () {
        moveLeft();
    });

    $('a.control_next').click(function () {
        moveRight();
    })
    
    

});

function validar(){
    if (document.getElementById("titulo").value.length == 0){
        alert("Introduzca un título");
        return false;
    }else{
        if(!document.getElementById("plastico").checked &&
                !document.getElementById("papel").checked &&
                !document.getElementById("vidrio").checked &&
                !document.getElementById("carton").checked &&
                !document.getElementById("otro").checked){
            alert("Escoge alguna categoría");
            return false;
        }
        else{
            if(document.getElementById("uno").value.length == 0 &&
                    document.getElementById("dos").value.length == 0 &&
                    document.getElementById("tres").value.length == 0 &&
                    document.getElementById("cuatro").value.length == 0 &&
                    document.getElementById("cinco").value.length == 0 &&
                    document.getElementById("seis").value.length == 0 &&
                    document.getElementById("siete").value.length == 0 &&
                    document.getElementById("ocho").value.length == 0 &&
                    document.getElementById("nueve").value.length == 0 &&
                    document.getElementById("diez").value.length == 0 &&
                    document.getElementById("once").value.length == 0){
                alert("¿En verdad no ocupas materiales?");
                return false;
            }else{
                if(document.getElementById("unoc").value.length == 0 &&
                    document.getElementById("dosc").value.length == 0 &&
                    document.getElementById("tresc").value.length == 0 &&
                    document.getElementById("cuatroc").value.length == 0 &&
                    document.getElementById("cincoc").value.length == 0 &&
                    document.getElementById("seisc").value.length == 0 &&
                    document.getElementById("sietec").value.length == 0 &&
                    document.getElementById("ochoc").value.length == 0 &&
                    document.getElementById("nuevec").value.length == 0 &&
                    document.getElementById("diezc").value.length == 0 &&
                    document.getElementById("oncec").value.length == 0){
                    alert("Indica la cantidad de materiales que necesitas");
                    return false;
                }else{
                    if(document.getElementById("parr1").value.length == 0 &&
                        document.getElementById("parr2").value.length == 0 &&
                        document.getElementById("parr3").value.length == 0 &&
                        document.getElementById("parr4").value.length == 0 &&
                        document.getElementById("parr5").value.length == 0 &&
                        document.getElementById("parr6").value.length == 0 &&
                        document.getElementById("parr7").value.length == 0 &&
                        document.getElementById("parr8").value.length == 0 &&
                        document.getElementById("parr9").value.length == 0 &&
                        document.getElementById("parr10").value.length == 0){
                    alert("Escribe los pasos a seguir");
                    return false;
                    }else{//alta
                        document.getElementById("formi").submit();
                    }
                }
            }
        }
    }
}
function cosa(){
    
}