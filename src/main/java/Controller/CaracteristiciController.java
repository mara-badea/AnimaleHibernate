package Controller;

import DAO.CaracteristiciDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Caracteristici;
import DAOImpl.CaracteristiciDaoImpl;


public class CaracteristiciController extends HttpServlet {

	Caracteristici caracteristica = new Caracteristici();
	CaracteristiciDaoImpl caracteristiciDaoImpl = new CaracteristiciDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaCaracteristica") != null) {
			String nume_caracteristica = request.getParameter("numeCaracteristica");
			String detalii = request.getParameter("detalii");
			String frecventa_aparitie = request.getParameter("frecventaAparitie");
			caracteristica.setNumeCaracteristica(nume_caracteristica);
			caracteristica.setDetalii(detalii);
			caracteristica.setFrecventaAparitie(Float.parseFloat(frecventa_aparitie));
			caracteristiciDaoImpl.adaugaCaracteristica(caracteristica);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaCaracteristica") != null) {
			List<Caracteristici> listaCaracteristici = new ArrayList();
			listaCaracteristici = caracteristiciDaoImpl.afiseazaCaracteristica();
			request.setAttribute("listaCaracteristici", listaCaracteristici);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Caracteristici.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaCaracteristica") != null) {
			System.out.println("se modifica caracteristica");
			long id1 = Long.parseLong(request.getParameter("idcaracteristica"));

			String nume_caracteristica = request.getParameter("numeCaracteristica");
			String frecventa_aparitie = request.getParameter("frecventaAparitie");
			String detalii = request.getParameter("detalii");
			caracteristiciDaoImpl.modificaCaracteristica(id1, nume_caracteristica, detalii, Float.parseFloat(frecventa_aparitie));
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeCaracteristica") != null) {
			long id2 = Long.parseLong(request.getParameter("idcaracteristica"));
			caracteristica.setIdcaracteristica(id2);
			caracteristiciDaoImpl.stergeCaracteristica(caracteristica);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}

}


