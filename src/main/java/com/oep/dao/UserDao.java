package com.oep.dao;

import com.oep.pojo.User;

public interface UserDao {
	
	String addUser(User u, String party, String bio);
	String checkUser(String email, String password);
}
