package com.cnjava.SpringBootProject.Repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cnjava.SpringBootProject.Model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	@Query("SELECT u FROM User u WHERE u.Email = ?1")
    User findByEmail(String email);
	
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("Update User u set u.otp = :otp, u.otp_requested_time = :date WHERE u.Email = :email")
	int updateOtp(@Param("otp") String otp,@Param("date") String date, @Param("email") String email);
	
	
	@Query("SELECT u.otp FROM User u WHERE u.Email = ?1")
    String getOTP(String email);
	
	@Query("SELECT u.otp_requested_time FROM User u WHERE u.Email = ?1")
    String getTime(String email);
	
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("Update User u set u.Password = :password  WHERE u.Email = :email")
	int updatePassword(@Param("password") String password,  @Param("email") String email);
	
}
