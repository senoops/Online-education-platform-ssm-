package com.senoops.service;

import java.util.List;

import com.senoops.model.User;

public interface UserService {
	List<User> selectAll();
	
	User selectById(Integer id);
	
	User selectByUsername(String username);
	
	void save(User user);
	
	boolean userIsExist(String username);
	
	void deleteById(Integer id);
}
