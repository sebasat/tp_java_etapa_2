var tabla = document.getElementById("fila");
           for(var i1=0; i1<partidas.size();i1++){ 
               var fila = document.createElement("tr");
                   fila.setAttribute("class","valores");
              
              for(var i = 0; i<=3; i++){ 
            	  Partida p = partidas.get(i1);
                  var textoCelda = document.createTextNode(p.getNroPart());
                  var link = document.createElement("a");
                  link.href="https://www.google.com.ar";
                  link.appendChild(textoCelda);
                  var celda = document.createElement("td");
                  celda.appendChild(link);
                  fila.appendChild(celda);
              }                           
               tabla.appendChild(fila);
          } 