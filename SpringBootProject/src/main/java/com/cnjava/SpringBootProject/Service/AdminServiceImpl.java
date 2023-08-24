package com.cnjava.SpringBootProject.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.Admin;
import com.cnjava.SpringBootProject.Model.AdminDTO;
import com.cnjava.SpringBootProject.Model.Role;
import com.cnjava.SpringBootProject.Repository.AdminRepository;
import com.cnjava.SpringBootProject.Repository.RoleRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	private AdminRepository adminRepository;
	private RoleRepository roleRepository;
	private PasswordEncoder passwordEncoder;
	
	public AdminServiceImpl(AdminRepository adminRepository, RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
		this.adminRepository = adminRepository;
		this.roleRepository = roleRepository;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public void saveAdmin(AdminDTO adminDTO) {
		Admin admin = new Admin();
		admin.setName(adminDTO.getUsername());
		admin.setEmail(adminDTO.getEmail());
		admin.setPassword(passwordEncoder.encode(adminDTO.getPassword()));
		
		Role role = roleRepository.findByName("ROLE_ADMIN");
		if(role == null){
            role = checkRoleExist();
        }
		admin.setRoles(Arrays.asList(role));
		adminRepository.save(admin);
	}
	
	@Override
    public Admin findAdminByEmail(String email) {
        return adminRepository.findByEmail(email);
    }
	
	@Override
    public List<AdminDTO> findAllAdmins() {
        List<Admin> users = adminRepository.findAll();
        return users.stream()
                .map((user) -> mapToUserDto(user))
                .collect(Collectors.toList());
    }
	
	private AdminDTO mapToUserDto(Admin admin){
        AdminDTO adminDTO = new AdminDTO();
        adminDTO.setUsername(admin.getName());
        adminDTO.setEmail(admin.getEmail());
        return adminDTO;
    }
	
	private Role checkRoleExist(){
        Role role = new Role();
        role.setName("ROLE_ADMIN");
        return roleRepository.save(role);
    }

}
