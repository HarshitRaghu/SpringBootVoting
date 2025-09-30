package com.oep.dao;

import java.util.List;

import com.oep.pojo.Voter;

public interface VoterDao {

	String addUser(Voter u, String party, String bio);
	Voter checkUser(String email, String password);
	boolean updateUser(Voter v);
	boolean deleteUser(Voter v);
	Voter searchVoter(String id);
	List<Voter> listOfVoters();
}
