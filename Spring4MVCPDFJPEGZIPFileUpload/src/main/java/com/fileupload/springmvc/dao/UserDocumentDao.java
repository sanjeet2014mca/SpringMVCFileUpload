package com.fileupload.springmvc.dao;

import java.util.List;

import com.fileupload.springmvc.model.UserDocument;

public interface UserDocumentDao {

	List<UserDocument> findAll();
	
	UserDocument findById(int id);
	
	void save(UserDocument document);
	
	List<UserDocument> findAllByUserId(int userId);
	
	void deleteById(int id);
}
