package com.emrs.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Department POJO class
 * @author maybe
 *
 */
@Entity
@Table(name = "department")
public class Department implements java.io.Serializable {

	private Integer dpid;
	private String name;

	public Department() {
	}

	public Department(String name) {
		this.name = name;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "dpid", unique = true, nullable = false)
	public Integer getDpid() {
		return this.dpid;
	}

	public void setDpid(Integer dpid) {
		this.dpid = dpid;
	}

	@Column(name = "name", nullable = false, length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public JSONObject toJSON() {
		JSONObject json = new JSONObject();
		try {
			json.put("dpid", this.dpid);
			json.put("name", this.name);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return json;
	}

}
