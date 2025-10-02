package com.oep.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.oep.dao.ResultDao;
import com.oep.pojo.Result;

public class ResultDaoImpl implements ResultDao
{

	@Autowired
	private HibernateTemplate hTemplate;
	
	
	@Override
	@Transactional
	public boolean addResult(Result r)
	{
		try{
			hTemplate.save(r);
			return true;
		}
		catch(Exception e1){
			e1.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public boolean deleteResult(Result r)
	{
		try
		{
			hTemplate.delete(r);
			return true;
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
			return false;
		}
	}

	
	@Override
	public List<Result> listAllResult()
	{
		List<Result>lst = new ArrayList<>();
		try {
		lst = 
		hTemplate.execute(new HibernateCallback<List<Result>>() 
		{
			@Override
			public List<Result> doInHibernate(Session session) throws HibernateException {
				
				Query q = session.createQuery(" from Result ",Result.class);
				List<Result>lst = q.getResultList();
				return lst;
			}
		});
		return lst;
	} 
	catch (Exception e1) 
	{
		e1.printStackTrace();
		return null;
	}

	}
	

}