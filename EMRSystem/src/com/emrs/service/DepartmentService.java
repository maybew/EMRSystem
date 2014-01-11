package com.emrs.service;

import java.util.List;

import com.emrs.config.Configure;
import com.emrs.dao.DepartmentDAO;
import com.emrs.po.Department;

/**
 * DepartmentServe
 * Keep us system be the newest of its department
 * @author maybe
 *
 */
public class DepartmentService {
	DepartmentDAO dao = DepartmentDAO.getDepartmentDAO();

	public List<Department> searchDepartmentByName(boolean asc, int pageNum, String keyword) {
		return dao.searchDepartmentByName(pageNum, Configure.PAGESIZE, asc, keyword);
	}
	
	public List<Department> getAllDepartments(boolean asc, int pageNum) {
			return dao.searchDepartmentByName(pageNum, Configure.PAGESIZE, asc, null);
	}
	
	public void addDepartment(String name) {
		Department dp = new Department();
		
		dp.setName(name);
		dao.insert(dp);
	}
	
	public void deleteDepartment(int dpid) {
		dao.delete(dao.find(dpid));
	}
	
}
