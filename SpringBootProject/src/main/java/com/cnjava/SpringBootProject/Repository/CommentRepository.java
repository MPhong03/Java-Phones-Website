package com.cnjava.SpringBootProject.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cnjava.SpringBootProject.Model.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {

	@Query("SELECT c FROM Comment c WHERE c.product.ProductID = ?1")
	List<Comment> findAllCommentsByProductID(int ProductID);
	
	@Query("SELECT c FROM Comment c WHERE c.commentid = ?1 and c.user.Email = ?2")
	Comment checkComment(int cmtid, String email);
}
