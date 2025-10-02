package com.oep.dao;

import java.util.List;

import com.oep.pojo.Result;

public interface ResultDao 
{
	boolean addResult(Result r);
	boolean deleteResult(Result r);
	List<Result> listAllResult();

}