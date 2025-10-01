package com.oep.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"candidate_id", "election_id"}))
public class Nomination {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int nomination_id;
	
	@JoinColumn(name = "candidate_id")
	private Candidate candidate;
	
	@JoinColumn(name = "election_Id")
	private Election election;
	
	private String approved_by;

	public Nomination() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Nomination(Candidate candidate, Election election, String approved_by) {
		
		this.candidate = candidate;
		this.election = election;
		this.approved_by = approved_by;
	}

	@Override
	public String toString() {
		return "Nomination [nomination_id=" + nomination_id + ", candidate=" + candidate + ", election=" + election
				+ ", approved_by=" + approved_by + "]";
	}

	public int getNomination_id() {
		return nomination_id;
	}

	public void setNomination_id(int nomination_id) {
		this.nomination_id = nomination_id;
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

	public String getApproved_by() {
		return approved_by;
	}

	public void setApproved_by(String approved_by) {
		this.approved_by = approved_by;
	}
	
}
