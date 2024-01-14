package pojo;


public class Observatii implements java.io.Serializable {


	private Long idobservatie;
	private Animale animale;
	private Caracteristici caracteristici;
	private String observator;

	public Observatii() {
	}

	public Observatii(Animale animale, Caracteristici caracteristici, String observator) {
		this.animale = animale;
		this.caracteristici = caracteristici;
		this.observator = observator;
	}
	
	public Long getIdobservatie() {
		return this.idobservatie;
	}
	
	public void setIdobservatie(Long idobservatie) {
		this.idobservatie = idobservatie;
	}
	
	public Animale getAnimale() {
		return this.animale;
	}
	
	public void setAnimale(Animale animale) {
		this.animale = animale;
	}

	public Caracteristici getCaracteristici() {
		return this.caracteristici;
	}
	
	public void setCaracteristici(Caracteristici caracteristici) {
		this.caracteristici = caracteristici;
	}
	
	public String getObservator() {
		return this.observator;
	}

	public void setObservator(String observator) {
		this.observator = observator;
	}
	
}
