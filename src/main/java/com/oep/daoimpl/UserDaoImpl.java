package com.oep.daoimpl;

import java.time.LocalDate;
import java.time.Period;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.oep.dao.UserDao;
import com.oep.pojo.Candidate;
import com.oep.pojo.User;

@Component
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private HibernateTemplate hTemplate;

	@Override
	@Transactional
    public String addUser(User u, String party, String bio) {

        if (Period.between(u.getDob(), LocalDate.now()).getYears() < 18) {
            return null;
        }

        String prefix = u.getRole().toString();
        String suffix = u.getName().charAt(0) + "";
        String userId = prefix + User.getCount() + suffix;
        u.setId(userId);

        try {        	
            if ("CANDIDATE".equals(u.getRole().toString()) && party != null && bio != null) {
            	Candidate c = new Candidate(u.getName(), u.getEmail(), u.getPassword(), u.getRole(), u.getDob(), party, bio);
            	c.setId(userId);
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
	public String checkUser(String email, String password) {
		// TODO check user login code here
		// and return user role
		return null;
	}
		
}
