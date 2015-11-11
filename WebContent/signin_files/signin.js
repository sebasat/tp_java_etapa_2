(function () {
  
	function soloNros(evt){
		//asignamos el valor de la tecla a keynum
		if(window.event){// IE
		     keynum = evt.keyCode;
		}else{
		     keynum = evt.which;//Firefox, Chrome...
		
		}

		//comprobamos si se encuentra en el rango
		if(keynum>47 && keynum<58){
		     
		}else{
		     
		     evt.preventDefault();
		}
	}
	
	
	var dni1 = document.getElementById("inputDni1");
	var dni2 = document.getElementById("inputDni2");
	dni1.addEventListener("keypress", soloNros);
	dni2.addEventListener("keypress", soloNros);

})();