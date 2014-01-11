package com.emrs.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Patientlist POJO class
 * @author maybe
 *
 */
@Entity
@Table(name = "patientlist")
public class Patientlist implements java.io.Serializable {

	private Integer plid;
	private Patient patient;
	private Doctor doctor;

	public Patientlist() {
	}

	public Patientlist(Patient patient, Doctor doctor) {
		this.patient = patient;
		this.doctor = doctor;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "plid", unique = true, nullable = false)
	public Integer getPlid() {
		return this.plid;
	}

	public void setPlid(Integer plid) {
		this.plid = plid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "patient", nullable = false)
	public Patient getPatient() {
		return this.patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "doctor", nullable = false)
	public Doctor getDoctor() {
		return this.doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

}
