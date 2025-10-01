package com.oep.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"voter_id", "election_id"}))
public class Vote {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int vote_id;
	
	@JoinColumn(name = "id")
	private Voter voter;
	
	@JoinColumn(name = "candidate_id")
	private Candidate candidate;
	
	@JoinColumn(name = "election_id")
	private Election election;

	public Vote() {
	}

	public Vote(Voter voter, Candidate candidate, Election election) {
		this.voter = voter;
		this.candidate = candidate;
		this.election = election;
	}

	public int getVote_id() {
		return vote_id;
	}

	public void setVote_id(int vote_id) {
		this.vote_id = vote_id;
	}

	public Voter getVoter() {
		return voter;
	}

	public void setVoter(Voter voter) {
		this.voter = voter;
	}

	public Candidate getCandidate() {
		return candidate;
	}

	public void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}

	public Election getElection() {
		return election;
	}

	public void setElection(Election election) {
		this.election = election;
	}

	@Override
	public String toString() {
		return "Vote [vote_id=" + vote_id + ", voter=" + voter + ", candidate=" + candidate + ", election=" + election
				+ "]";
	}
	
}
