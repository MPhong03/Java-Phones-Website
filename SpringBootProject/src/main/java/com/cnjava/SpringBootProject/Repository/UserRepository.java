package com.cnjava.SpringBootProject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}
