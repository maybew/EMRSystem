package com.emrs.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Position POJO class
 * @author maybe
 *
 */
@Entity
@Table(name = "position")
public class Position implements java.io.Serializable {

	private Integer poid;
	private String name;

	public Position() {
	}

	public Position(String name) {
		this.name = name;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "poid", unique = true, nullable = false)
	public Integer getPoid() {
		return this.poid;
	}

	public void setPoid(Integer poid) {
		this.poid = poid;
	}

	@Column(name = "name", nullable = false, length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
