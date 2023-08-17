package com.cnjava.SpringBootProject.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.Code;
import com.cnjava.SpringBootProject.Repository.CodeRepository;

@Service
public class CodeService {

	
	@Autowired 
	private CodeRepository codeRepository;
	
	
	public Code getCodeByText(String text) {
		Code code = codeRepository.getCodeByCodeText(text);
		return code;
	}
	
	public void saveCode(Code c) {
		codeRepository.save(c);
	}
}
