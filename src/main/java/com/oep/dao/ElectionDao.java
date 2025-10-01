package com.oep.dao;

import java.util.List;

import com.oep.pojo.Election;

public interface ElectionDao {
	
	boolean addElection(Election e);
	boolean updateElection(Election e);
	boolean deleteElection(Election e);
	Election searchElection(int id); 
	List<Election> listOfElections();
	
}
