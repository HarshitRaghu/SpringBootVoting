package com.oep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oep.daoimpl.CandidateDaoImpl;
import com.oep.daoimpl.ElectionDaoImpl;
import com.oep.daoimpl.VoterDaoImpl;
import com.oep.pojo.Candidate;
import com.oep.pojo.Election;
import com.oep.pojo.Voter;

@Controller
public class MasterController {
	
	@Autowired
	private VoterDaoImpl voter_service;
	
	@Autowired
	private ElectionDaoImpl election_service;
	
	@Autowired
	private CandidateDaoImpl candidate_service;
	//mapping for views
	
	@RequestMapping("/")
	public String indexPage(){
		return "index";
	}
	
	@GetMapping("/reg") 
	public String registerPage() {
		return "reg";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@GetMapping("/login1")
	public String login1Page() {
		return "login1";
	}
	
	@GetMapping("/admin-dashboard")
	public String adminDashboardPage(Model m){
		List<Election> election_list = election_service.listOfElections();
		List<Candidate> candidate_list = candidate_service.listOfCandidates();
		List<Voter> voter_list = voter_service.listOfVoters();
		
		if(!voter_list.isEmpty()) m.addAttribute("voter_list", voter_list); 
		else m.addAttribute("msg","no voter found");
		
		if(!candidate_list.isEmpty()) m.addAttribute("candidate_list", candidate_list);
		else m.addAttribute("msg","no candidate found");
		
		if(!election_list.isEmpty()) m.addAttribute("election_list", election_list); 
		else m.addAttribute("msg","no voter found");
		
		return "admin-dashboard";
	}
}
