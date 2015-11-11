<%@page import="entidades.Partida"%>
<%@page import="entidades.Posicion"%>
<%@page import="entidades.Pieza"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Partida en juego</title>
<style>
html,body {
    background-color: #d0e4fe;
    height:100%;
    
    
}
.contenedor {
    background-color:yellow;
    width:100%;
    height:100%;
    text-align: center;
}

.header {
    background-color:red;
    height:10%;
    text-align: center;
}

.blancas, .negras{
    background-color:blue;
    width:35%;
    height:100%;
    text-align: center;
    float:left;
    
    display: flex;
    min-height: 100vh;
    margin: 0;
}

.movim{
    background-color:green;
    text-align: center;
    width:30%;
    height:100%;
    float:left;
}
ul{
    width:30%;
    border: 3px solid black;
    list-style:none;
    padding: 0;
    clear:both;
    margin: auto;
    
}
li{
    background-color:white;
    border-bottom: 1px solid black;
    padding: 2px;
}

.completar{
    border: 2px solid red;
    padding: 2px;
}
.tablero{
    margin:auto;
    text-align:center;
    margin-top:10%;
    border-collapse:collapse;
}
.tablero td{
    width: 30px;
    height:30px;
    
}
.tablero td:hover{
    cursor:pointer;
    background:yellow;
    color:black;
    border: 1px solid red;
}
.casillaB{
    background:white;
}
.casillaN{
    background:black;
    color:white;
}
input{
    margin-top:5%;
    display:inline;
    
}
.btn_reset{
    margin-top:2%;
}    
#btn{
    margin-top:10%;
    width:40%;
}
</style>
</head>
<body>
    
    <%
		Partida partSession = (Partida)session.getAttribute("sesionPartida");
        Map<String, String> posicBlancas = (HashMap<String,String>)request.getAttribute("posBlancas");
        Map<String, String> posicNegras = (HashMap<String,String>)request.getAttribute("posNegras");
	%>
    
    <div class="header">Turno ${turno}</div>
    <div class="blancas">
       <p>Blancas</p>
       <ul id="lista-blancas">
	    <%for (Map.Entry<String, String> entry : posicBlancas.entrySet()) {%>
	    	    
	    	    	<li><%= entry.getKey() %>   <%= entry.getValue() %></li>
	    	  
	    <%}%>
	    </ul>
	 </div>
	 
	 <div class="movim">
        <form id="form-send-movim" action="GuardarPartida" method="post">
            <input type="text" id="origen" name="origen" placeholder="origen" readonly><br>
            <input type="button" id="reset-orig" value="reset" class="btn_reset"><br>
            <input type="text" id="destino" name="destino" placeholder="destino" readonly><br>
            <input type="button" id="btn" value="MOVER"><br>
            <input type="submit" id="btn-guardar-partida" value="Guardar Partida"><br>
            <table class="tablero" id="tablero">
                 <tr>
                    <td class="casillaB">a8</td>
                    <td class="casillaN">b8</td>
                    <td class="casillaB">c8</td>
                    <td class="casillaN">d8</td>
                    <td class="casillaB">e8</td>
                    <td class="casillaN">f8</td>
                    <td class="casillaB">g8</td>
                    <td class="casillaN">h8</td>
                 </tr>
                 <tr>
                    <td class="casillaN">a7</td>
                    <td class="casillaB">b7</td>
                    <td class="casillaN">c7</td>
                    <td class="casillaB">d7</td>
                    <td class="casillaN">e7</td>
                    <td class="casillaB">f7</td>
                    <td class="casillaN">g7</td>
                    <td class="casillaB">h7</td>
                 </tr>
                 <tr>
                    <td class="casillaB">a6</td>
                    <td class="casillaN">b6</td>
                    <td class="casillaB">c6</td>
                    <td class="casillaN">d6</td>
                    <td class="casillaB">e6</td>
                    <td class="casillaN">f6</td>
                    <td class="casillaB">g6</td>
                    <td class="casillaN">h6</td>
                 </tr>
                 <tr>
                    <td class="casillaN">a5</td>
                    <td class="casillaB">b5</td>
                    <td class="casillaN">c5</td>
                    <td class="casillaB">d5</td>
                    <td class="casillaN">e5</td>
                    <td class="casillaB">f5</td>
                    <td class="casillaN">g5</td>
                    <td class="casillaB">h5</td>
                 </tr>
                 <tr>
                    <td class="casillaB">a4</td>
                    <td class="casillaN">b4</td>
                    <td class="casillaB">c4</td>
                    <td class="casillaN">d4</td>
                    <td class="casillaB">e4</td>
                    <td class="casillaN">f4</td>
                    <td class="casillaB">g4</td>
                    <td class="casillaN">h4</td>
                 </tr>
                 <tr>
                    <td class="casillaN">a3</td>
                    <td class="casillaB">b3</td>
                    <td class="casillaN">c3</td>
                    <td class="casillaB">d3</td>
                    <td class="casillaN">e3</td>
                    <td class="casillaB">f3</td>
                    <td class="casillaN">g3</td>
                    <td class="casillaB">h3</td>
                 </tr>
                 <tr>
                    <td class="casillaB">a2</td>
                    <td class="casillaN">b2</td>
                    <td class="casillaB">c2</td>
                    <td class="casillaN">d2</td>
                    <td class="casillaB">e2</td>
                    <td class="casillaN">f2</td>
                    <td class="casillaB">g2</td>
                    <td class="casillaN">h2</td>
                 </tr>
                 <tr>
                    <td class="casillaN">a1</td>
                    <td class="casillaB">b1</td>
                    <td class="casillaN">c1</td>
                    <td class="casillaB">d1</td>
                    <td class="casillaN">e1</td>
                    <td class="casillaB">f1</td>
                    <td class="casillaN">g1</td>
                    <td class="casillaB">h1</td>
                 </tr>
            </table>
        </form>
     </div>
	
	 <div class="negras">
	   <p>Negras</p>
       <ul id="lista-negras" >
	    <%for (Map.Entry<String, String> entry : posicNegras.entrySet()) {%>
	    	    
	    	    	<li><%= entry.getKey() %>   <%= entry.getValue() %></li>
	    	  
	    <%}%>
	   </ul>
	 </div>
   
  <script>
   
   //valida q los campos esten completos antes de hacer el movim
   var validaInputs = function(ev){
      var entrada = document.getElementById("origen");
      var destino = document.getElementById("destino");
      if(entrada.value==0){
          entrada.placeholder="completa este campo";
          entrada.setAttribute("class","completar");
          ev.preventDefault();
      }else if(destino.value==0){
          destino.placeholder="completa este campo";
          destino.setAttribute("class","completar");
          ev.preventDefault();
      }else manejaMovim(entrada.value, destino.value);
   }
   
   
   //setea las coord en los campos de texto al clickear sobre las casillas
   var setText = function(ev){
      var entrada = document.getElementById("origen");
      var destino = document.getElementById("destino");
      if(entrada.value==0){
             entrada.value=this.textContent;
             entrada.className=entrada.className.replace("completar"," ");
      }else {
            destino.value=this.textContent;
            destino.className=destino.className.replace("completar"," ");
      }
   }
   
   
   //si los inputs estan completos, se envian los datos para validar/hacer el movim usando AJAX
   function manejaMovim(ori, dest){
		var xmlhttp = new XMLHttpRequest();
		var query = "origen="+ori+"&destino="+dest;

		xmlhttp.onreadystatechange = function() {
  	 	  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	  	 	   
  	 		   //si la cadena de respuesta comienza con "Er" 
  	 		   //quiere decir q es un mensaje de error(excepcion) y lo muestra en un alert
  	 		   if(xmlhttp.responseText.substring(0,2)=="Er"){
	  	 		    alert(xmlhttp.responseText);
	  	 	   }else{
			  	 	   var json = JSON.parse(xmlhttp.responseText);
			           imprimirLista(json);
	  	 	   }
   	      }
        }
		xmlhttp.open("GET", "Ctrl_Juego_servlet?"+query, true);
		xmlhttp.send();

		
		//esta funcion interna imprime los item de las listas obtenidos de la peticion al server
		function imprimirLista(arr) {
		    var listaBlancas = document.getElementById("lista-blancas");
		    var listaNegras = document.getElementById("lista-negras");
		    
		    //eliminar todos lo item de las listas
		    while(listaBlancas.firstChild){
		    	  listaBlancas.removeChild(listaBlancas.firstChild);
		    }
		    
		    while(listaNegras.firstChild){
		    	  listaNegras.removeChild(listaNegras.firstChild);
		    }
		    
			
		    //agregar los items a sus respectivas listas
		    for(var i = 0; i < arr.length; i++) {
		        var li = document.createElement("li");
		        var contenido = document.createTextNode(arr[i].posicion+" "+arr[i].pieza);
		        li.appendChild(contenido);
		        if(arr[i].pieza.substring(1,2)=='B')
		        	 listaBlancas.appendChild(li);
		        else listaNegras.appendChild(li);
		        
	    	}
	    	
        }
   }
   
   
   //boton para enviar las entradas para el movimiento
   var btn_mover = document.getElementById("btn");
   btn_mover.addEventListener("click", validaInputs);
   
   
   //boton q resetea el campo de texto "origen"
   var btn_reset = document.getElementById("reset-orig");
   btn_reset.addEventListener("click", function(){
        document.getElementById("origen").value="";
   })
   
   
   //agrega eventlistener a las casillas del tablero al ser clickeados
   var casillas = document.getElementsByTagName("td");
   for(var i=0; i<casillas.length; i++){
      casillas[i].addEventListener("click",setText);
   }

  </script>
</body>
</html>