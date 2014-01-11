package com.emrs.dao;

import java.util.List;

import com.emrs.jpa.JPAOperator;
import com.emrs.po.Doctor;

/**
 * DoctorDAO
 * @author maybe
 *
 */
public class DoctorDAO {
	private static DoctorDAO INSTANCE = new DoctorDAO();
	
	private DoctorDAO() {		
	}
	
	public static DoctorDAO getDoctorDAO() {
		return INSTANCE;
	}
	
	public void insert(Doctor doctor) {
		JPAOperator.insert(doctor);
	}
	
	public Doctor find(String did) {
		return JPAOperator.find(did, Doctor.class);
	}
	
	public void update(Doctor doctor) {
		JPAOperator.update(doctor);
	}
	
	public void delete(Doctor doctor) {
		JPAOperator.delete(doctor);
	}
	
	public List<Doctor> searchDoctorByName(String keyword) {
		String sql = "select d from Doctor d where d.fname like '%"+ keyword +"%' or d.lname like '%" + keyword + "%'";
		return JPAOperator.query(sql, Doctor.class, 1, Integer.MAX_VALUE / 2);
	}
	
	public List<Doctor> getAllDoctor() {
		String sql = "select d from Doctor d";
		return JPAOperator.query(sql, Doctor.class, 1, Integer.MAX_VALUE / 2);
	}
	
}
