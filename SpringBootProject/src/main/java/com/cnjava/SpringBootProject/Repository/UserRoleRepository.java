package com.cnjava.SpringBootProject.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.AppUser;
import com.cnjava.SpringBootProject.Model.UserRole;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {

	@Query("SELECT ur.appRole.name FROM UserRole ur where ur.user.UserID=:id")
	List<String> getRoleNames(@Param("id") int id);
	
	@Query(nativeQuery = true,value="Select * from userrole where roleid = 2 limit :page,:number")
	List<UserRole> getLimitUser(@Param("page") int page, @Param("number") int n);
	
	@Query(nativeQuery = true,value="Select * from userrole where roleid = 1 limit :page,:number")
	List<UserRole> getLimitAdmin(@Param("page") int page, @Param("number") int n);
}
