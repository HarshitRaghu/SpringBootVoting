package com.oep.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.oep.dao.NominationDao;
import com.oep.pojo.Nomination;

@Component
public class NominationDaoImpl implements NominationDao {
	@Autowired
	private HibernateTemplate hTemplate;
	
	@Override
	public boolean addNomination(Nomination n) {
		// TODO Auto-generated method stub
//return null if not entered in database so check for validation in ~controller~
		  try {
	            hTemplate.save(n);  // directly saves Nomination
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	}

	@Override
	public boolean removeNomination(Nomination n) {
//return null if deleted in database so check for validation in ~controller~
		try {
            hTemplate.delete(n); // deletes Nomination
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
		}
	

	@Override
	public List<Nomination> listOfNomination() {
		  // HQL query with HibernateTemplate
//to show on the view for admin to select from 
        return (List<Nomination>) hTemplate.find("from Nomination");
	}

	@Override
	public Nomination searchNomination(int nomination_id) {
		// fetch by primary key
//admin search the nomination if needed
        return hTemplate.get(Nomination.class, nomination_id);
	}
	
}