package com.oep.dao;

import java.util.List;

import com.oep.pojo.Nomination;

public interface NominationDao {
	
	boolean addNomination(Nomination n);
	boolean removeNomination(Nomination n);
	List<Nomination> listOfNomination();
	Nomination searchNomination(int nomination_id);
}
