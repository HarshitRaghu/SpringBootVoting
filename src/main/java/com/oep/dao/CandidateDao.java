package com.oep.dao;

import java.util.List;

import com.oep.pojo.Candidate;

public interface CandidateDao {
	
	
	Candidate updateCandidate(Candidate c);
	boolean deleteCandidate(String candidate_id);
	boolean nominate(Candidate c);
	boolean removeNomination(Candidate c);
	Candidate searchCandidate(String candidate_id);
	List<Candidate> listOfCandidates();
	
}
