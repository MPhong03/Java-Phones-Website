package com.cnjava.SpringBootProject.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.UserRole;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {

	@Query("SELECT ur.appRole.name FROM UserRole ur where ur.user.UserID=:id")
	List<String> getRoleNames(@Param("id") int id);
}
