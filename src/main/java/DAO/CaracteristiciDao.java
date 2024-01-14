package DAO;

import java.util.List;
import pojo.Caracteristici;

public interface CaracteristiciDao {
    public void adaugaCaracteristica (Caracteristici caracteristica);
    public List<Caracteristici> afiseazaCaracteristica();
    public void modificaCaracteristica (long idcaracteristica, String nume, String detalii, float frecventa_aparitie);
    public void stergeCaracteristica (Caracteristici caracteristica);
}
