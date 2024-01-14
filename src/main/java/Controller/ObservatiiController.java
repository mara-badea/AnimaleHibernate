package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Caracteristici;
import pojo.Animale;
import pojo.Observatii;
import DAOImpl.ObservatiiDaoImpl;
import DAOImpl.HibernateUtil;
import org.hibernate.Session;


public class ObservatiiController extends HttpServlet {

	Observatii observatie = new Observatii();
	ObservatiiDaoImpl observatiiDaoImpl = new ObservatiiDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("intra in controlleru de observatii");
		if (request.getParameter("adaugaObservatie") != null) {
			// preluarea parametrilor de interes
			Long idanimal = java.lang.Long.parseLong(request.getParameter("idanimal"));
			Long idcaracteristica = java.lang.Long.parseLong(request.getParameter("idcaracteristica"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Caracteristici caracteristica = (Caracteristici) session.get(Caracteristici.class, idcaracteristica);
			Animale animal = (Animale) session.get(Animale.class, idanimal);
			String observator = request.getParameter("observator");
			
			observatie.setAnimale(animal);
			observatie.setCaracteristici(caracteristica);
			observatie.setObservator(observator);

			observatiiDaoImpl.adaugaObservatie(observatie);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("afiseazaObservatie") != null) {
			List<Observatii> listaObservatii = new ArrayList();
			listaObservatii = observatiiDaoImpl.afiseazaObservatie();
			request.setAttribute("listaObservatii", listaObservatii);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Observatii.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaObservatie") != null) {
			Long idobservatie = Long.parseLong(request.getParameter("idobservatie"));
			// preluarea parametrilor de interes
			Long idanimal = java.lang.Long.parseLong(request.getParameter("idanimal"));
			Long idcaracteristica = java.lang.Long.parseLong(request.getParameter("idcaracteristica"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Caracteristici caracteristica = (Caracteristici) session.get(Caracteristici.class, idcaracteristica);
			Animale animal = (Animale) session.get(Animale.class, idanimal);
			String observator = request.getParameter("observator");
		
			observatiiDaoImpl.modificaObservatie(idobservatie, animal, caracteristica, observator);
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeObservatie") != null) {
			Long idobservatie = Long.parseLong(request.getParameter("idobservatie"));
			observatie.setIdobservatie(idobservatie);
			observatiiDaoImpl.stergeObservatie(observatie);
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


