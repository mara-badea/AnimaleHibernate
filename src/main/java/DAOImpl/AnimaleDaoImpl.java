package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Animale;
import DAO.AnimaleDao;


public class AnimaleDaoImpl implements AnimaleDao{

    public void adaugaAnimal(Animale animal) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(animal);
        transaction.commit();
        session.close();
    }


	public List<Animale> afiseazaAnimal() {
        List<Animale> listaAnimale = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From Animale");
        listaAnimale = query.list();
        return listaAnimale;
    }

    public void modificaAnimal(long idanimal, String tip, String familie, String specie, String sex, String nume) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        System.out.println("a pornit sesiunea");
        Transaction transaction = session.beginTransaction();
        Animale detaliianimale = (Animale) session.load(Animale.class, idanimal);
        detaliianimale.setTip(tip);
        detaliianimale.setFamilie(familie);
        detaliianimale.setSpecie(specie);
        detaliianimale.setSex(sex);
        detaliianimale.setNume(nume);
        session.update(detaliianimale);
        transaction.commit();
        session.close();
    }

    public void stergeAnimal(Animale animal) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(animal);
        transaction.commit();
        session.close();
    }
}
