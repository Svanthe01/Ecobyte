
jQuery(document).ready(function ($) {
    
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
    if (document.getElementById("nombre").value.length == 0){
        alert("Introduzca un nombre");
        return false;
    }else{
        if (document.getElementById("costo").value.length == 0){
            alert("Introduzca el costo del artículo");
            return false;
        }
        else{
            if (document.getElementById("stock").value.length == 0){
                alert("Introduzca el número de artículos");
                return false;
            }else{
                if (document.getElementById("desc").value.length == 0){
                    alert("Indica la cantidad de materiales que necesitas");
                    return false;
                }else{//alta
                    document.getElementById("formi").submit();
                }
            }
        }
    }
}
function cosa(){
    
}
