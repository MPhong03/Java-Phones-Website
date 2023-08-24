package com.cnjava.SpringBootProject.Service;

import java.util.List;

import com.cnjava.SpringBootProject.Model.Admin;
import com.cnjava.SpringBootProject.Model.AdminDTO;

public interface AdminService {
	
	void saveAdmin(AdminDTO adminDTO);
	
	Admin findAdminByEmail(String email);
	
	List<AdminDTO> findAllAdmins();
}
