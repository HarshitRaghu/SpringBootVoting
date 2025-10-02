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
	
		 try {
	            hTemplate.save(v);
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
		
	}

	

	@Override
	public List<Vote> listOfVotes() {
		return hTemplate.loadAll(Vote.class);
		
	}

	@Override
	public Vote searchVote(int vote_id) {
		 return hTemplate.get(Vote.class, vote_id);
		
	}
	
}

