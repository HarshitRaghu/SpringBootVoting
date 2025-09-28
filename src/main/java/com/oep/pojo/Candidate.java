package com.oep.pojo;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Candidate extends User {
	
	@Column(nullable = false)
	private String party;
	
	private String bio;

	public Candidate() {
	}

	public Candidate(String name, String email, String password, Role role, LocalDate dob, String party, String bio) {
		super(name, email, password, role, dob);
		this.bio = bio;
		this.party = party;
	}

	public String getParty() {
		return party;
	}

	public void setParty(String party) {
		this.party = party;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	@Override
	public String toString() {
		return "Candidate [party=" + party + ", bio=" + bio + ", getId()=" + getId() + ", getName()=" + getName()
				+ ", getEmail()=" + getEmail() + ", getPassword()=" + getPassword() + ", getRole()=" + getRole()
				+ ", getDob()=" + getDob() + "]";
	}
	
	
}
