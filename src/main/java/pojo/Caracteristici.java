package pojo;

import java.util.HashSet;
import java.util.Set;

public class Caracteristici implements java.io.Serializable {


	private Long idcaracteristica;
	private String numeCaracteristica;
	private String detalii;
	private float frecventa_aparitie;
	private Set observatii = new HashSet(0);

	public Caracteristici() {
	}

	public Caracteristici(Long idcaracteristica, String nume, String detalii, Set observatii) {
		this.idcaracteristica = idcaracteristica;
		this.numeCaracteristica = nume;
		this.detalii = detalii;
		this.observatii = observatii;
	}

	public Long getIdcaracteristica() {
		return this.idcaracteristica;
	}
	
	public void setIdcaracteristica(Long idcaracteristica) {
		this.idcaracteristica = idcaracteristica;
	}
	
	public String getNumeCaracteristica() {
		return this.numeCaracteristica;
	}

	public void setNumeCaracteristica(String nume) {
		this.numeCaracteristica = nume;
	}
	public String getDetalii() {
		return this.detalii;
	}

	public void setDetalii(String detalii) {
		this.detalii = detalii;
	}
	public void setFrecventaAparitie(float frecventa_aparitie) {
		this.frecventa_aparitie = frecventa_aparitie;
	}
	public float getFrecventaAparitie() {
		return this.frecventa_aparitie;
	}
	
	public void setObservatii(Set observatii) {
		this.observatii = observatii;
	}
	public Set getObservatii() {
		return this.observatii;
	}
}
