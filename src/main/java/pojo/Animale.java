package pojo;

import java.util.HashSet;
import java.util.Set;

public class Animale implements java.io.Serializable {


	private Long idanimal;
	private String tip;
	private String familie;
	private String specie;
	private String sex;
	private String nume;
	private Set observatii = new HashSet(0);

	public Animale() {
	}

	public Animale(Long idanimal, String tip, String familie, String specie, String sex, String nume, Set observatii) {
		this.idanimal = idanimal;
		this.tip = tip;
		this.familie = familie;
		this.specie = specie;
		this.sex = sex;
		this.nume = nume;
		this.observatii = observatii;

	}

	public Long getIdanimal() {
		return this.idanimal;
	}
	
	public void setIdanimal(Long idanimal) {
		this.idanimal = idanimal;
	}
	
	public String getTip() {
		return this.tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
	
	public String getFamilie() {
		return this.familie;
	}

	public void setFamilie(String familie) {
		this.familie = familie;
	}
	
	public String getSpecie() {
		return this.specie;
	}

	public void setSpecie(String specie) {
		this.specie = specie;
	}
	
	public String getSex() {
		return this.sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getNume() {
		return this.nume;
	}
	
	public void setNume(String nume) {
		this.nume = nume;
	}
	
	public void setObservatii(Set observatii) {
		this.observatii = observatii;
	}
	
	public Set getObservatii() {
		return this.observatii;
	}
}