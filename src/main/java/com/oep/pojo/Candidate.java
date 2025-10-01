package com.oep.pojo;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Candidate extends Voter {
	
	@Column(nullable = false)
	private String constituency;
	
	private String profile_pic;
	
	public String getProfile_pic() {
		return profile_pic;
	}

	public void setProfile_pic(String profile_pic) {
		this.profile_pic = profile_pic;
	}

	private String party_logo;

	@Column(nullable = false)
	private String party;
	
	private String bio;
	
	@Column(nullable = false, unique = true)
	private String candidate_id;

	public Candidate() {
		super();
	}

	public Candidate(String name, String email, String password, Role role, LocalDate dob, String phone_no,
			String address, String constituency, String party_logo, String party, String bio, String profile_pic) {
		super(name, email, password, role, dob, phone_no, address);
		this.bio = bio;
		this.party = party;
		this.party_logo = party_logo;
		//this.profile_pic = profile_pic;
	}

	public String getConstituency() {
		return constituency;
	}

	public void setConstituency(String constituency) {
		this.constituency = constituency;
	}

//	public String getProfile_pic() {
//		return profile_pic;
//	}
//
//	public void setProfile_pic(String profile_pic) {
//		this.profile_pic = profile_pic;
//	}

	public String getParty_logo() {
		return party_logo;
	}

	public void setParty_logo(String party_logo) {
		this.party_logo = party_logo;
	}

	public String getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(String candidate_id) {
		this.candidate_id = candidate_id;
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
