package com.emrs.po;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Note POJO class
 * @author maybe
 *
 */
@Entity
@Table(name = "note")
public class Note implements java.io.Serializable {

	private Integer nid;
	private Record record;
	private Date ctime;
	private String text;

	public Note() {
	}

	public Note(Record record, Date ctime) {
		this.record = record;
		this.ctime = ctime;
	}

	public Note(Record record, Date ctime, String text) {
		this.record = record;
		this.ctime = ctime;
		this.text = text;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "nid", unique = true, nullable = false)
	public Integer getNid() {
		return this.nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "record", nullable = false)
	public Record getRecord() {
		return this.record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ctime", nullable = false, length = 19)
	public Date getCtime() {
		return this.ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	@Column(name = "text", length = 65535)
	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	public JSONObject toJSON() {
		JSONObject json = new JSONObject();
		try {
			json.put("ntext", this.getText());
			json.put("nctime", this.getCtime());
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return json;
	}

}
