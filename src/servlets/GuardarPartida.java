package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlJuego;

import entidades.Jugador;
import entidades.Partida;
import excepciones.AppExceptions;

/**
 * Servlet implementation class GuardarPartida
 */
@WebServlet("/GuardarPartida")
public class GuardarPartida extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardarPartida() {
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
		Partida p = (Partida)request.getSession().getAttribute("sesionPartida");
		Jugador j1 = (Jugador)request.getSession().getAttribute("sesionjugador1");
		Jugador j2 = (Jugador)request.getSession().getAttribute("sesionjugador2");
		CtrlJuego ctrl = CtrlJuego.getInstancia();
		p.setJugador1(j1);
		p.setJugador2(j2);
		
		
		//si se cargo una partida finalizada para verla, la misma no se vuelve a guardar 
		if(p.getEstado().charAt(0)!='F'){
			p.setEstadoJuego(String.valueOf(ctrl.getGameState()));
			try {
				ctrl.guardarPartida(p);
			}catch (AppExceptions e) {
			 }
	    }
		
		
	}

}
