package com.emrs.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Admin POJO class
 * @author maybe
 *
 */
@Entity
@Table(name = "admin")
public class Admin extends Account implements java.io.Serializable {

	private String aid;
	private String password;

	public Admin() {
		super("admin");
	}

	public Admin(String aid, String password) {
		super("admin");
		this.aid = aid;
		this.password = password;
	}

	@Id
	@Column(name = "aid", unique = true, nullable = false, length = 45)
	public String getAid() {
		return this.aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	@Column(name = "password", nullable = false, length = 45)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
