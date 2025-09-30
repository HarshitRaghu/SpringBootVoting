package com.oep.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.oep.dao.CandidateDao;
import com.oep.pojo.Candidate;

@Component
public class CandidateDaoImpl implements CandidateDao {
	
	@Autowired
	private HibernateTemplate hTemplate;
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public Candidate updateCandidate(Candidate c) {
		try {
			hTemplate.update(c);
			return c;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean deleteCandidate(String candidate_id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "Delete From Candidate where candidate_id =: id";
			Query<?> q = session.createQuery(hql, Candidate.class);
			int i = q.executeUpdate();
			if(i >= 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public boolean nominate(Candidate c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeNomination(Candidate c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	@Transactional(readOnly = true)
	public Candidate searchCandidate(String candidate_id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "From Candidate where id =: id";
			Query<Candidate> c = session.createQuery(hql, Candidate.class).setParameter("id", candidate_id);
			Candidate candidate = c.list().get(0);
			if(candidate != null)
				return candidate;
			else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	@Transactional(readOnly = true)
	public List<Candidate> listOfCandidates() {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "From Candidate";
			Query<Candidate> c = session.createQuery(hql, Candidate.class);
			List<Candidate> candidate_list = c.list();
			if(candidate_list.isEmpty()) 
				return null;
			else 
				return candidate_list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
}
