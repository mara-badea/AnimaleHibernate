package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Caracteristici;
import DAO.CaracteristiciDao;


public class CaracteristiciDaoImpl implements CaracteristiciDao{

    public void adaugaCaracteristica(Caracteristici caracteristica) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(caracteristica);
        transaction.commit();
        session.close();
    }

    public List<Caracteristici> afiseazaCaracteristica() {
        List<Caracteristici> listaCaracteristici = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Caracteristici");
        listaCaracteristici = query.list();
        return listaCaracteristici;
    }

    public void modificaCaracteristica(long idcaracteristica, String nume, String detalii, float frecventa_aparitie) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Caracteristici detaliicaracteristici = (Caracteristici) session.load(Caracteristici.class, idcaracteristica);
        detaliicaracteristici.setNumeCaracteristica(nume);
        detaliicaracteristici.setDetalii(detalii);
        detaliicaracteristici.setFrecventaAparitie(frecventa_aparitie);
        session.update(detaliicaracteristici);
        transaction.commit();
        session.close();
    }

    public void stergeCaracteristica(Caracteristici caracteristica) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(caracteristica);
        transaction.commit();
        session.close();
    }
}
