
$(document).ready(function(){
    $("#butDevuelve").click(function(){
	
	console.log(" * Devolviendo ... ");


	$("td[name='valor']").each(function () {
			console.log($(this)[0].innerText);
	});

	$("input[type='radio']:checked").each(function () {

	        console.log('selected: ' + $(this).val());
		var expl_id=$(this).attr("name").replace('devolucion','');

		if ($(this).val() == "retirar"){
			console.log(" ** Retirando ...  : "+expl_id);
		}
		else if ($(this).val() == "devolver"){
			console.log(" ** Devolviendo! ... : "+expl_id);		
		}
		if ($(this).val() == "nodevolver"){
			console.log(" ** Dejando igual ... : "+expl_id);		
		}

    	});


	});
});

function saluda() {
	alert("hola");
}
