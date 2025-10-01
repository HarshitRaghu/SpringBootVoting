package com.oep.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.oep.dao.VoteDao;
import com.oep.pojo.Vote;

@Component
public class VoteDaoImpl implements VoteDao{
	
	@Autowired
	private HibernateTemplate hTemplate;

	@Override
	public boolean addVote(Vote v) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeVote(Vote v) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Vote> listOfVotes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Vote searchVote(int vote_id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
