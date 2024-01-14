package DAO;

import java.util.List;
import pojo.Observatii;
import pojo.Animale;
import pojo.Caracteristici;


public interface ObservatiiDao {
    public void adaugaObservatii (Observatii observatie);
    public List<Observatii> afiseazaObservatie();
    public void modificaObservatie (Integer idobservatie, Animale animal, Caracteristici caracteristica, String observator);
    public void stergeObservatie (Observatii observatie);
}

    
