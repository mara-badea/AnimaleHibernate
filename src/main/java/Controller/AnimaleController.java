package Controller;

import DAO.AnimaleDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Animale;
import DAOImpl.AnimaleDaoImpl;


public class AnimaleController extends HttpServlet {

	Animale animal = new Animale();
	AnimaleDaoImpl animaleDaoImpl = new AnimaleDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaAnimal") != null) {
			String tip = request.getParameter("tip");
			String familie = request.getParameter("familie");
			String specie = request.getParameter("specie");
			String sex = request.getParameter("sex");
			String nume = request.getParameter("nume");
			animal.setTip(tip);
			animal.setFamilie(familie);
			animal.setSpecie(specie);
			animal.setSex(sex);
			animal.setNume(nume);
			animaleDaoImpl.adaugaAnimal(animal);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("intra in controller");
		if (request.getParameter("afiseazaAnimal") != null) {
			List<Animale> listaAnimale = new ArrayList();
			listaAnimale = animaleDaoImpl.afiseazaAnimal();;
			request.setAttribute("listaAnimale", listaAnimale);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Animale.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaAnimal") != null) {
			long id1 = Long.parseLong(request.getParameter("idanimal"));
			String tip = request.getParameter("tip");
			String familie = request.getParameter("familie");
			String specie = request.getParameter("specie");
			String sex = request.getParameter("sex");
			String nume = request.getParameter("nume");
			animaleDaoImpl.modificaAnimal(id1, tip, familie, specie, sex, nume);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeAnimal") != null) {
			long id2 = Long.parseLong(request.getParameter("idanimal"));
			animal.setIdanimal(id2);
			animaleDaoImpl.stergeAnimal(animal);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}
	
	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */

	@Override
	public String getServletInfo() {
		return "Short description";
	}

}


