package com.oep.daoimpl;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
    public String addUser(User u, String party, String bio) {

        if (Period.between(u.getDob(), LocalDate.now()).getYears() < 18) {
            return null;
        }

        String prefix = u.getRole().toString();
        String suffix = u.getName().charAt(0) + "";
        String userId = prefix + (int)(Math.random()*1000) + suffix;
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
	@Transactional
	public User checkUser(String email, String password) {
		
		try {
	        String hql = "FROM User u WHERE u.email = :email AND u.password = :password";
	        Session session = sessionFactory.getCurrentSession();

	        List<User> users = session.createQuery(hql, User.class)
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
		
}