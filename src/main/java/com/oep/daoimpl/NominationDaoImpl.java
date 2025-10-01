package com.oep.daoimpl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.oep.dao.NominationDao;
import com.oep.pojo.Nomination;

@Component
public class NominationDaoImpl implements NominationDao {

	@Override
	public boolean addNomination(Nomination n) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeNomination(Nomination n) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Nomination> listOfNomination() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Nomination searchNomination(int nomination_id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
