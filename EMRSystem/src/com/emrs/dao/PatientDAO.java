package com.emrs.dao;

import java.util.List;

import com.emrs.jpa.JPAOperator;

import com.emrs.po.Patient;

/**
 * PatientDAO
 * @author maybe
 *
 */
public class PatientDAO {
	private static PatientDAO INSTANCE = new PatientDAO();

	private PatientDAO() {
	}

	public static PatientDAO getPatientDAO() {
		return INSTANCE;
	}
	
	public void insert(Patient patient) {
		JPAOperator.insert(patient);
	}
	
	public Patient find(String pid) {
		return JPAOperator.find(pid, Patient.class);
	}
	
	public void update(Patient patient) {
		JPAOperator.update(patient);
	}
	
	public void delete(Patient patient) {
		JPAOperator.delete(patient);
	}
	
	public List<Patient> searchPatientByName(String keyword, int pageNum, int pageSize) {
		String sql = "select p from Patient p where p.state = 0 AND p.fname like '%"+ keyword +"%' or p.lname like '%" + keyword + "%'";
		return JPAOperator.query(sql, null, Patient.class, pageNum, pageSize);
	}
	
	public List<Patient> getAllPatient(int pageNum, int pageSize) {
		String sql = "select p from Patient p where p.state = 0";
		return JPAOperator.query(sql, null, Patient.class, pageNum, pageSize);

	}
	
	public Patient findPatientBySsn(String ssn) {
		String sql = "select p from Patient p where p.ssn = '"+ssn+"'";
		return JPAOperator.querySingle(sql, Patient.class);
	}
	
}
