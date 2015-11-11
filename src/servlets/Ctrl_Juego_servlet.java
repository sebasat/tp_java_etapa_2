package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import excepciones.AppExceptions;

import negocio.CtrlJuego;

/**
 * Servlet implementation class Ctrl_Juego_servlet
 */
@WebServlet("/Ctrl_Juego_servlet")
public class Ctrl_Juego_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ctrl_Juego_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ori = request.getParameter("origen");
		String dest = request.getParameter("destino");
		CtrlJuego ctrl = CtrlJuego.getInstancia();
		MapAstring mas = MapAstring.getInstancia();
		String piezas = "";
		
		try {
			ctrl.manejarMovim(ori, dest);
			piezas = mas.toJson(ctrl.getPiezas());
		} catch (AppExceptions e) {
			// TODO Auto-generated catch block
			piezas = "Error: "+e.getMessage();
		}
		
		
		//se escribe un string json en la respuesta, el cual sera parseado en el script q recibe la respuesta
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(piezas);
		
	}

}
