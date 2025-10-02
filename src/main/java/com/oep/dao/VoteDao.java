package com.oep.dao;

import java.util.List;

import com.oep.pojo.Vote;

public interface VoteDao {
	
	boolean addVote(Vote v);
	
	List<Vote> listOfVotes();
	Vote searchVote(int vote_id);
}
