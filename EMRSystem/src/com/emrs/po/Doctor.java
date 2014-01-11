package com.emrs.po;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Doctor POJO class
 * @author maybe
 *
 */
@Entity
@Table(name = "doctor")
public class Doctor extends Account implements java.io.Serializable {

	private String did;
	private String password;
	private String fname;
	private String lname;
	private Date birthdate;
	private Integer gender;
	private String email;
	private String phone;
	private String position;
	private String olocation;
	private String ohour;
	private Integer state;
	private String department;
	private Set records = new HashSet(0);
	private Set patientlists = new HashSet(0);

	public Doctor() {
		super("doctor");
	}

	public Doctor(String did, String password) {
		super("doctor");
		this.did = did;
		this.password = password;
	}

	public Doctor(String did, String password, String fname, String lname,
			Date birthdate, Integer gender, String email, String phone,
			String position, String olocation, String ohour, Integer state,
			String department, Set records, Set patientlists) {
		super("doctor");
		this.did = did;
		this.password = password;
		this.fname = fname;
		this.lname = lname;
		this.birthdate = birthdate;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.position = position;
		this.olocation = olocation;
		this.ohour = ohour;
		this.state = state;
		this.department = department;
		this.records = records;
		this.patientlists = patientlists;
	}

	@Id
	@Column(name = "did", unique = true, nullable = false, length = 45)
	public String getDid() {
		return this.did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	@Column(name = "password", nullable = false, length = 45)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "fname", length = 45)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "lname", length = 45)
	public String getLname() {
		return this.lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "birthdate", length = 10)
	public Date getBirthdate() {
		return this.birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	@Column(name = "gender")
	public Integer getGender() {
		return this.gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	@Column(name = "email", length = 45)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "phone", length = 45)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "position", length = 45)
	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Column(name = "olocation", length = 45)
	public String getOlocation() {
		return this.olocation;
	}

	public void setOlocation(String olocation) {
		this.olocation = olocation;
	}

	@Column(name = "ohour", length = 45)
	public String getOhour() {
		return this.ohour;
	}

	public void setOhour(String ohour) {
		this.ohour = ohour;
	}

	@Column(name = "state")
	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "department", length = 45)
	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "doctor", targetEntity = Record.class)
	public Set getRecords() {
		return this.records;
	}

	public void setRecords(Set records) {
		this.records = records;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "doctor", targetEntity = Patientlist.class)
	public Set getPatientlists() {
		return this.patientlists;
	}

	public void setPatientlists(Set patientlists) {
		this.patientlists = patientlists;
	}
	
	public JSONObject toJSON() {
		JSONObject json = new JSONObject();
		try {
			json.put("did", this.getDid());
			json.put("dfname", this.getFname());
			json.put("dlname", this.getLname());
			json.put("demail", this.getEmail());
			json.put("dbirthday", this.getBirthdate());
			json.put("dgender", this.getGender());
			json.put("dolocation", this.getOlocation());
			json.put("dphone", this.getPhone());
			json.put("dohour", this.getOhour());
			json.put("dposition", this.getPosition());
			json.put("ddepartment", this.getDepartment());
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return json;
	}

}
