package servlets;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import entidades.Pieza;
import entidades.Posicion;

public class MapAstring {
	
	//singleton
	private MapAstring(){
	
	}
	
	private static MapAstring instancia;
	
	public static MapAstring getInstancia(){
		if (instancia==null){
			instancia = new MapAstring();
		}
		return instancia;
	}
	
	
	//este metodo recibe el map<Posicion, Pieza> y lo transforma en <String, String>, es usado una vez solo 
	//por el servlet q setea una partida en la pagina juego_ajedrez
	public Map<String, String> convertToStrings(Map<Posicion, Pieza> hashmap, char color){
		
		Map<String, String> posicionesString = new HashMap<String, String>();
		
		for (Map.Entry<Posicion, Pieza> entry : hashmap.entrySet()) {
			Posicion posic = entry.getKey();
    	    Pieza pieza = entry.getValue();
    	    
    	    if(pieza.getColor()== color){
        	    posicionesString.put(posic.toString(),pieza.toString());
    	    }
        }
		return posicionesString;
	}
	
	
	public String toJson(Map<Posicion, Pieza> hashmap){
		JsonArray array = new JsonArray();
		
		for (Map.Entry<Posicion, Pieza> entry : hashmap.entrySet()) {
			JsonObject object = new JsonObject();
			Posicion posic = entry.getKey();
    	    Pieza pieza = entry.getValue();
    	    
    	    object.addProperty("posicion", posic.toString());
    	    object.addProperty("pieza", pieza.toString());
    	    array.add(object);
    	    
        }
		 
		return array.toString();
		
	}

}
