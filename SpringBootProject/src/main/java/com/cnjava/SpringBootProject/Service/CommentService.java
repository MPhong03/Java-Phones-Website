package com.cnjava.SpringBootProject.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.Comment;
import com.cnjava.SpringBootProject.Repository.CommentRepository;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;
	
	public void save(Comment b) {
		commentRepository.save(b);
	}
	
	public List<Comment> getAllComment(){
		return commentRepository.findAll();
	}
	
	public Comment getCommentById(int id) {
		return commentRepository.findById(id).get();
	}
	
	public void deleteById(int id) {
		commentRepository.deleteById(id);
	}
	
	public List<Comment> getAllCommentsByProductID(int id) {
		return commentRepository.findAllCommentsByProductID(id);
	}
}
