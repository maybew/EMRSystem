package com.emrs.service;

import com.emrs.dao.DoctorDAO;
import com.emrs.po.Doctor;

/**
 * DoctorService
 * Used to deal with the Doctor business logic
 * @author maybe
 *
 */
public class DoctorService {
	DoctorDAO dao = DoctorDAO.getDoctorDAO();
	
	public Doctor getDoctorById(String id) {
			if(id.equals("") || id == null) return null;
			return dao.find(id);
	}
	
	public boolean changePassword(String username, String oldPwd, String newPwd) {
		Doctor doctor = dao.find(username);
		if(doctor == null || !oldPwd.equals(doctor.getPassword()))
			return false;
		doctor.setPassword(newPwd);
		dao.update(doctor);
		return true;
	}
}
