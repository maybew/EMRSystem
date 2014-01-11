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

import com.emrs.util.JSONUtils;

/**
 * Patient POJO class
 * @author maybe
 *
 */
@Entity
@Table(name = "patient")
public class Patient extends Account implements java.io.Serializable {

	private String pid;
	private String password;
	private String fname;
	private String lname;
	private Date birthdate;
	private Integer gender;
	private String email;
	private String address;
	private String phone;
	private String ename;
	private String eemail;
	private String eaddress;
	private String ephone;
	private Integer state;
	private String icname;
	private String icaddress;
	private String icphone;
	private String icemail;
	private String ictax;
	private String icpolicynum;
	private String icpolicytype;
	private String icexpiredate;
	private String ssn;
	private Set records = new HashSet(0);
	private Set patientlists = new HashSet(0);

	public Patient() {
		super("patient");
	}

	public Patient(String pid, String password, Date birthdate, String ssn) {
		super("patient");
		this.pid = pid;
		this.password = password;
		this.birthdate = birthdate;
		this.ssn = ssn;
	}

	public Patient(String pid, String password, String fname, String lname,
			Date birthdate, Integer gender, String email, String address,
			String phone, String ename, String eemail, String eaddress,
			String ephone, Integer state, String icname, String icaddress,
			String icphone, String icemail, String ictax, String icpolicynum,
			String icpolicytype, String icexpiredate, String ssn, Set records,
			Set patientlists) {
		super("patient");
		this.pid = pid;
		this.password = password;
		this.fname = fname;
		this.lname = lname;
		this.birthdate = birthdate;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.ename = ename;
		this.eemail = eemail;
		this.eaddress = eaddress;
		this.ephone = ephone;
		this.state = state;
		this.icname = icname;
		this.icaddress = icaddress;
		this.icphone = icphone;
		this.icemail = icemail;
		this.ictax = ictax;
		this.icpolicynum = icpolicynum;
		this.icpolicytype = icpolicytype;
		this.icexpiredate = icexpiredate;
		this.ssn = ssn;
		this.records = records;
		this.patientlists = patientlists;
	}

	@Id
	@Column(name = "pid", unique = true, nullable = false, length = 45)
	public String getPid() {
		return this.pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
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
	@Column(name = "birthdate", nullable = false, length = 10)
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

	@Column(name = "address", length = 100)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone", length = 45)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "ename", length = 45)
	public String getEname() {
		return this.ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	@Column(name = "eemail", length = 45)
	public String getEemail() {
		return this.eemail;
	}

	public void setEemail(String eemail) {
		this.eemail = eemail;
	}

	@Column(name = "eaddress", length = 45)
	public String getEaddress() {
		return this.eaddress;
	}

	public void setEaddress(String eaddress) {
		this.eaddress = eaddress;
	}

	@Column(name = "ephone", length = 45)
	public String getEphone() {
		return this.ephone;
	}

	public void setEphone(String ephone) {
		this.ephone = ephone;
	}

	@Column(name = "state")
	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "icname", length = 45)
	public String getIcname() {
		return this.icname;
	}

	public void setIcname(String icname) {
		this.icname = icname;
	}

	@Column(name = "icaddress", length = 45)
	public String getIcaddress() {
		return this.icaddress;
	}

	public void setIcaddress(String icaddress) {
		this.icaddress = icaddress;
	}

	@Column(name = "icphone", length = 45)
	public String getIcphone() {
		return this.icphone;
	}

	public void setIcphone(String icphone) {
		this.icphone = icphone;
	}

	@Column(name = "icemail", length = 45)
	public String getIcemail() {
		return this.icemail;
	}

	public void setIcemail(String icemail) {
		this.icemail = icemail;
	}

	@Column(name = "ictax", length = 45)
	public String getIctax() {
		return this.ictax;
	}

	public void setIctax(String ictax) {
		this.ictax = ictax;
	}

	@Column(name = "icpolicynum", length = 45)
	public String getIcpolicynum() {
		return this.icpolicynum;
	}

	public void setIcpolicynum(String icpolicynum) {
		this.icpolicynum = icpolicynum;
	}

	@Column(name = "icpolicytype", length = 45)
	public String getIcpolicytype() {
		return this.icpolicytype;
	}

	public void setIcpolicytype(String icpolicytype) {
		this.icpolicytype = icpolicytype;
	}

	@Column(name = "icexpiredate", length = 45)
	public String getIcexpiredate() {
		return this.icexpiredate;
	}

	public void setIcexpiredate(String icexpiredate) {
		this.icexpiredate = icexpiredate;
	}

	@Column(name = "ssn", nullable = false, length = 45)
	public String getSsn() {
		return this.ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "patient", targetEntity=Record.class)
	public Set getRecords() {
		return this.records;
	}

	public void setRecords(Set records) {
		this.records = records;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "patient", targetEntity = Patientlist.class)
	public Set getPatientlists() {
		return this.patientlists;
	}

	public void setPatientlists(Set patientlists) {
		this.patientlists = patientlists;
	}
	
	public JSONObject toJSON() {
		JSONObject json = new JSONObject();
		try {
			json.put("pid", this.getPid());
			json.put("ssn", this.getSsn());
			json.put("pfname", this.getFname());
			json.put("plname", this.getLname());
			json.put("pemail", this.getEmail());
			json.put("pbirthday", this.getBirthdate());
			json.put("pgender", this.getGender());
			json.put("paddress", this.getAddress());
			json.put("pphone", this.getPhone());
			json.put("pename", this.getEname());
			json.put("peemail", this.getEemail());
			json.put("pephone", this.getEphone());
			json.put("peaddress", this.getEaddress());
			json.put("piaddress", this.getIcaddress());
			json.put("piphone", this.getIcphone());
			json.put("piname", this.getIcname());
			json.put("piemail", this.getIcemail());
			json.put("pitype", this.getIcpolicytype());
			json.put("piexpire", this.getIcexpiredate());
			
			//json.put("record", JSONUtils.toJSONArray(this.getRecords()));
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return json;
	}

}