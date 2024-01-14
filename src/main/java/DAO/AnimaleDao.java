package DAO;

import java.util.List;
import pojo.Animale;

public interface AnimaleDao {
    public void adaugaAnimal (Animale animal);
    public List<Animale> afiseazaAnimal();
    public void modificaAnimal (long idanimal, String tip, String familie, String specie, String sex, String nume);
    public void stergeAnimal (Animale animal);
}
