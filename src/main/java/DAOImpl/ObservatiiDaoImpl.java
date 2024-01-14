package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Caracteristici;
import pojo.Animale;
import pojo.Observatii;
import DAO.ObservatiiDao;

public class ObservatiiDaoImpl {
	
	public void adaugaObservatie(Observatii observatie) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(observatie);
        transaction.commit();
        session.close();
    }

    public List<Observatii> afiseazaObservatie() {
        List<Observatii> listaObservatii = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Observatii");
        listaObservatii = query.list();
        return listaObservatii;
    }

    public void modificaObservatie(Long idobservatie, Animale animal, Caracteristici caracteristica, String observator) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Observatii detaliiobservatii = (Observatii) session.load(Observatii.class, idobservatie);
        detaliiobservatii.setAnimale(animal);
        detaliiobservatii.setCaracteristici(caracteristica);
        detaliiobservatii.setObservator(observator);
        session.update(detaliiobservatii);
        transaction.commit();
        session.close();
    }

    public void stergeObservatie(Observatii observatie) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(observatie);
        transaction.commit();
        session.close();
    }

}
