<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Jugador"%>
<%@page import="entidades.Partida"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Redirected page</title>



<style>
       .contenedor{
            
             width:100%;
             height:100%;
             background-position:center;
            
            
       }
       
       table{
        border: 1px solid black;
        border-collapse:collapse;
        text-align:center;
       }
       
       table td{
          width:100px;
          border: 1px solid black;
          
       }
       
       table .valores:hover{
           cursor:pointer;
           background:red;
       }
       
       table .valores:active{
           background:red;
           
       }
      
       a{
          padding:10 px 20px;
          display:block;
          text-decoration:none;
       }
    
    
    </style>




</head>
<body>
    <br>
    <%
		Jugador j1 = (Jugador)request.getAttribute("jugador1");
        Jugador j2 = (Jugador)request.getAttribute("jugador2");
        ArrayList<Partida> partidas = (ArrayList<Partida>)request.getAttribute("partidas");
		
	%>
	<br>
	Jugador1: <%=j1.getNombre()%><br>
	Jugador2: <%=j2.getNombre()%>
	<br><br>
	
	
	
	
	
	<br>
	
	
	
	<div class="contenedor">
       <form action="SetPartida" method="post" id="formulario" name="form"> 
         <table  id="fila">
             <tr>
                <td>Nro partida</td>
                <td>Blancas</td>
                <td>Negras</td>
                <td>Turno</td>    
             </tr>
          <% for(int i = 0; i < partidas.size();i++){ %>  
                 <% Partida p = partidas.get(i); %>
                 <% Jugador jug1 = p.getJugador1(); %>
	             <% Jugador jug2 = p.getJugador2(); %>
	             <tr class="valores">
					  <td><%= p.getNroPart() %></td>
					  <td><%= jug1.getDni() %></td>
					  <td><%= jug2.getDni() %></td>
					  <td><%= p.getEstado() %></td>   
	             </tr>
          <%;} %>
         </table>
         <input type="submit" value="Partida Nueva"/>
         <input type="hidden" id="hiddenField" name="nroPart"/>
        </form>    
    </div>
    
    <script type="text/javascript">
          function seleccionar(ev){
        	 var nroPart = parseInt(this.children[0].textContent);
        	 document.getElementById("hiddenField").value=nroPart;
        	 document.getElementById("formulario").submit();
          }
    
          var trs = document.getElementsByClassName("valores");
          for(var i = 0; i < trs.length; i++){
        	  trs[i].addEventListener("click", seleccionar);
          }
    
    
    </script>   
       
       
</body>
</html>