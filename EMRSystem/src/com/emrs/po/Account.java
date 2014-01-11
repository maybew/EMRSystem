package com.emrs.po;
/**
 * Account POJO class
 * The super class of Admin, Patient, and Docor
 * @author maybe
 *
 */
public class Account {
	private String type;
	
	public Account(String type) {
		this.type = type;
	}
	
	public Account() {
		
	}
	
	public String getType() {
		return type;
	}
}
