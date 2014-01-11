package com.emrs.dao;

import java.util.List;


import com.emrs.jpa.JPAOperator;
import com.emrs.po.Department;

/**
 * DepartmentDAO
 * @author maybe
 *
 */
public class DepartmentDAO {
	private static DepartmentDAO INSTANCE = new DepartmentDAO();
	
	private DepartmentDAO() {
	}
	
	public static DepartmentDAO getDepartmentDAO() {
		return INSTANCE;
	}
	
	public void insert(Department department) {
		JPAOperator.insert(department);
	}
	
	public Department find(int dpid) {
		return JPAOperator.find(dpid, Department.class);
	}
	
	public void update(Department department) {
		JPAOperator.update(department);
	}
	
	public void delete(Department department) {
		JPAOperator.delete(department);
	}
	
	public List<Department> searchDepartmentByName(int pageNum, int pageSize, boolean order, String keyword) {
		String sql = "select d from Department d";
		String searchSql = " where d.name like '%"+keyword+"%'";
		String orderSql = " order by d.name DESC";
		
		if(keyword != null)
			sql += searchSql;
		if(!order)
			sql += orderSql;
		
		List<Department> ld =JPAOperator.query(sql, null, Department.class, pageNum, pageSize);
		
		return ld;
	}
}
