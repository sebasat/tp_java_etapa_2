package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Jugador;
import entidades.Partida;
import excepciones.AppExceptions;

import negocio.CtrlJuego;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int dni1 = Integer.parseInt(request.getParameter("dni1"));
		int dni2 = Integer.parseInt(request.getParameter("dni2"));
		
		CtrlJuego ctrl = CtrlJuego.getInstancia();
		Jugador jug1 = ctrl.buscarJugadorXDni(dni1);
		Jugador jug2 = ctrl.buscarJugadorXDni(dni2);
		ArrayList<Partida> partidasJugadores = null;
		
		try {
			partidasJugadores = ctrl.buscarPartidasJugadores(jug1, jug2);
		} catch (AppExceptions e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(jug1 != null && jug2 != null){
			request.setAttribute("jugador1", jug1);
			request.setAttribute("jugador2", jug2);
			
			//aca habria q setear jugadores en la sesion
			request.getSession().setAttribute("sesionjugador1", jug1);
			request.getSession().setAttribute("sesionjugador2", jug2);
			
			
			//partidas guardadas entre esos 2 jugadores
			request.setAttribute("partidas", partidasJugadores);
		    request.getRequestDispatcher("redirect.jsp").forward(request, response);
		
		}
	}

}
