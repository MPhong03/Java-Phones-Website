package com.cnjava.SpringBootProject;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.cnjava.SpringBootProject.Model.User;
import com.cnjava.SpringBootProject.Repository.UserRepository;
 
@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class UserRepositoryTests {
 
    @Autowired
    private TestEntityManager entityManager;
     
    @Autowired
    private UserRepository repo;
     
    @Test
    public void testCreateUser() {
        User user = new User();
        user.setUserName("mphong");
        user.setPassword("mphong");
        user.setAddress("TP HCM");
        user.setPhoneNumber("0123456789");
        user.setEmail("mphong@gmail.com");
        user.setIsAdmin(false);
         
        User savedUser = repo.save(user);
         
        User existUser = entityManager.find(User.class, savedUser.getUserID());
         
        assertThat(user.getEmail()).isEqualTo(existUser.getEmail());
         
    }
}