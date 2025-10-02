package com.oep.pojo;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Result extends Candidate
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int result_no;
	private long total_votes;
	
	public Result()
	{
		
	}
	
	public Result(String name, String email, String password, Role role, LocalDate dob, String phone_no, String address,
			String constituency, String profile_pic, String party_logo, String party, String bio)
	{
		super(name, email, password, role, dob, phone_no, address, constituency, profile_pic, party_logo, party, bio);
		// TODO Auto-generated constructor stub
	}
	
	public Result(int result_no, long total_votes)
	{
		super();
		this.result_no = result_no;
		this.total_votes = total_votes;
	}
	
	public long getTotal_votes()
	{
		return total_votes;
	}
	
	public void setTotal_votes(long total_votes)
	{
		this.total_votes = total_votes;
	}

	@Override
	public String toString() {
		return "Result [result_no=" + result_no + ", total_votes=" + total_votes + ", getConstituency()="
				+ getConstituency() + ", getProfile_pic()=" + getProfile_pic() + ", getParty_logo()=" + getParty_logo()
				+ ", getCandidate_id()=" + getCandidate_id() + ", getParty()=" + getParty() + ", getBio()=" + getBio()
				+ ", toString()=" + super.toString() + ", getPhone_no()=" + getPhone_no() + ", getAddress()="
				+ getAddress() + ", getId()=" + getId() + ", getName()=" + getName() + ", getEmail()=" + getEmail()
				+ ", getPassword()=" + getPassword() + ", getRole()=" + getRole() + ", getDob()=" + getDob()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	

}