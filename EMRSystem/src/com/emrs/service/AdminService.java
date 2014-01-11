package com.emrs.service;

import com.emrs.dao.AdminDAO;
import com.emrs.po.Admin;

/**
 * AdminService
 * Admin business logic
 * @author maybe
 *
 */
public class AdminService {
	AdminDAO dao = AdminDAO.getAdminDAO();

	public Admin getAdminById(String id) {
		if (id.equals("") || id == null)
			return null;
		return dao.find(id);
	}
	
	public boolean changePassword(String username, String oldPwd, String newPwd) {
		Admin admin = dao.find(username);
		if(admin == null || !oldPwd.equals(admin.getPassword()))
			return false;
		admin.setPassword(newPwd);
		dao.update(admin);
		return true;
	}
}
