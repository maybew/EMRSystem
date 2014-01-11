package com.emrs.po;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.json.JSONException;
import org.json.JSONObject;

import com.emrs.util.JSONUtils;

/**
 * Record POJO class
 * @author maybe
 *
 */
@Entity
@Table(name = "record")
public class Record implements java.io.Serializable {

	private Integer rid;
	private Patient patient;
	private Doctor doctor;
	private Date ctime;
	private Date mtime;
	private Set notes = new HashSet(0);
	private Set healths = new HashSet(0);
	private Set visits = new HashSet(0);
	private Set medicals = new HashSet(0);

	public Record() {
	}

	public Record(Patient patient, Doctor doctor) {
		this.patient = patient;
		this.doctor = doctor;
	}

	public Record(Patient patient, Doctor doctor, Date ctime, Date mtime,
			Set notes, Set healths, Set visits, Set medicals) {
		this.patient = patient;
		this.doctor = doctor;
		this.ctime = ctime;
		this.mtime = mtime;
		this.notes = notes;
		this.healths = healths;
		this.visits = visits;
		this.medicals = medicals;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "rid", unique = true, nullable = false)
	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
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

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ctime", length = 19)
	public Date getCtime() {
		return this.ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "mtime", length = 19)
	public Date getMtime() {
		return this.mtime;
	}

	public void setMtime(Date mtime) {
		this.mtime = mtime;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "record", targetEntity = Note.class)
	public Set getNotes() {
		return this.notes;
	}

	public void setNotes(Set notes) {
		this.notes = notes;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "record", targetEntity = Health.class)
	public Set getHealths() {
		return this.healths;
	}

	public void setHealths(Set healths) {
		this.healths = healths;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "record", targetEntity = Visit.class)
	public Set getVisits() {
		return this.visits;
	}

	public void setVisits(Set visits) {
		this.visits = visits;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "record", targetEntity = Medical.class)
	public Set getMedicals() {
		return this.medicals;
	}

	public void setMedicals(Set medicals) {
		this.medicals = medicals;
	}
	
	public JSONObject toJSON() {
		JSONObject json = new JSONObject();
		try {
			json.put("rid", this.getRid());
			json.put("rctime", this.getCtime());
			json.put("rmtime", this.getMtime());
			json.put("health", JSONUtils.toJSONArray(this.getHealths()));
			json.put("visit", JSONUtils.toJSONArray(this.getVisits()));
			json.put("medical", JSONUtils.toJSONArray(this.getMedicals()));
			json.put("note", JSONUtils.toJSONArray(this.getNotes()));
			json.put("patient", this.getPatient().toJSON());
			json.put("doctor", this.getDoctor().toJSON());
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return json;
	}

}