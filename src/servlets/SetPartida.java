package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidades.Partida;
import negocio.CtrlJuego;

/**
 * Servlet implementation class SetPartida
 */
@WebServlet("/SetPartida")
public class SetPartida extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetPartida() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String req = request.getParameter("nroPart");
		CtrlJuego ctrl = CtrlJuego.getInstancia();
		MapAstring mas = MapAstring.getInstancia();
		Partida p = null;
		
		
		if(req != ""){//se carga una partida existente
				Integer nro = Integer.parseInt(req);
				p = ctrl.getXnroPartida(nro);
				ctrl.getPosicionesGuardadas(nro);
				ctrl.setGameState(p.getEstado().charAt(0));
		
		}else{  //si el param nroPart esta vacio,quiere decir q se eligio jugar una partida nueva
			    ctrl.iniciarPartida();
			    p = new Partida();
			    p.setEstadoJuego(String.valueOf(ctrl.getGameState()));
			    System.out.println("el nro de partida nueva es: "+p.getNroPart());
		}
		
		
		request.setAttribute("partida", p);
		request.setAttribute("posBlancas", mas.convertToStrings(ctrl.getPiezas(), 'B'));
		request.setAttribute("posNegras", mas.convertToStrings(ctrl.getPiezas(), 'N'));
		
		request.setAttribute("turno", ctrl.getGameState());
		request.setAttribute("prueba", "funciona EL");
		
		request.getSession().setAttribute("sesionPartida", p);
		request.getRequestDispatcher("juego_Ajedrez.jsp").forward(request, response);
	}

}
