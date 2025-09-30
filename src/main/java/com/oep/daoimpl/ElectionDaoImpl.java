package com.oep.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.oep.dao.ElectionDao;
import com.oep.pojo.Election;

@Component
public class ElectionDaoImpl implements ElectionDao {
	
	@Autowired
	private HibernateTemplate hTemplate;
	
	@Override
	@Transactional
	public boolean addElection(Election e)
	{
		try{
			hTemplate.save(e);
			return true;
		}
		catch(Exception e1){
			e1.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public boolean updateElection(Election e) {
		try{
			hTemplate.update(e);
			return true;
		}
		catch(Exception e1){
			e1.printStackTrace();
			return false;
		}
	}


	@Override
	@Transactional
	public boolean deleteElection(Election e) {
		try
		{
			hTemplate.delete(e);
			return true;
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
			return false;
		}
	}

	@Override
	public Election searchElection(int id) {

		try {
			Election e = 
			hTemplate.execute(new HibernateCallback<Election>() 
			{
				@Override
				public Election doInHibernate(Session session) throws HibernateException {
					
					Query q = session.createQuery("from Election "
							+ "where election_id=:id");
					q.setParameter("id", id);
					List<Election>lst = q.getResultList();
					return lst.get(0);
				}
			});
			return e;
		} 
		catch (Exception e1) 
		{
			e1.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<Election> listOfElections() {

		List<Election>lst = new ArrayList<>();
		try 
		{
			lst = hTemplate.execute(
			new HibernateCallback<List<Election>>()
			{
				@Override
				public List<Election> doInHibernate(Session session) throws HibernateException {
				
					Query<Election> q = session.createQuery("from Election", Election.class);
					List<Election>lst = q.getResultList();
					return lst;
				
				}	
			});
			return lst;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	}


}
