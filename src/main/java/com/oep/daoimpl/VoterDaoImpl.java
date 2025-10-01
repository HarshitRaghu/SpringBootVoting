package com.oep.daoimpl;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.oep.dao.VoterDao;
import com.oep.pojo.Candidate;
import com.oep.pojo.Voter;

@Component
public class VoterDaoImpl implements VoterDao {
	
	@Autowired
	private HibernateTemplate hTemplate;
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
    public String addUser(Voter u, String party, String bio, String constituency, String profile_pic, String party_logo) {

        if (Period.between(u.getDob(), LocalDate.now()).getYears() < 18) {
            return null;
        }

        String prefix = "VOTER";
        String suffix = u.getName().substring(0,2);
        String userId = prefix + (int)(Math.random()*1000) + suffix;
        u.setId(userId);

        try {        	
            if ("CANDIDATE".equals(u.getRole().toString()) && party != null && bio != null) {
            	Candidate c = new Candidate();
            	c.setId(u.getId());
            	c.setName(u.getName());
            	c.setEmail(u.getEmail());
            	c.setPassword(u.getPassword());
            	c.setParty(party);
            	c.setDob(u.getDob());
            	c.setBio(bio);
            	c.setRole(u.getRole());
            	c.setAddress(u.getAddress());
            	c.setConstituency(constituency);
            	c.setParty_logo(party_logo);
            	c.setPhone_no(u.getPhone_no());
            	c.setProfile_pic(profile_pic);
            	String prefix1 = "CANDIDATE";
                String suffix1 = u.getName().substring(0,2);
                String candidateId1 = prefix1 + (int)(Math.random()*1000) + suffix1;
            	c.setCandidate_id(candidateId1);
                hTemplate.save(c);
            }
            else {
            	hTemplate.save(u);
            }
            
            return userId;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }	
	
	@Override
	@Transactional
	public Voter checkUser(String email, String password) {
		
		try {
	        String hql = "FROM Voter u WHERE u.email = :email AND u.password = :password";
	        Session session = sessionFactory.getCurrentSession();

	        List<Voter> users = session.createQuery(hql, Voter.class)
	                                  .setParameter("email", email)
	                                  .setParameter("password", password)
	                                  .list();

	        if (!users.isEmpty()) {
	            return users.get(0);  // safe access
	        }
	        return null;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	@Override
	public boolean updateUser(Voter v) {
		try {
			hTemplate.update(v);
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteUser(Voter v) {
		try {
			hTemplate.delete(v);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public Voter searchVoter(String id) {
		return this.hTemplate.get(Voter.class,id);
	}

	@Override
	public List<Voter> listOfVoters() {
		List<Voter> voters = hTemplate.loadAll(Voter.class);
		return voters;
	}	
}
