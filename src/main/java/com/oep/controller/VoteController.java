package com.oep.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oep.daoimpl.CandidateDaoImpl;
import com.oep.daoimpl.VoteDaoImpl;
import com.oep.pojo.Candidate;
import com.oep.pojo.Election;
import com.oep.pojo.Vote;
import com.oep.pojo.Voter;


@Controller
@RequestMapping("/vote")
public class VoteController{
	
	
	@Autowired
	private VoteDaoImpl daoimpl;
	
	
	 @PostMapping("/add")
	 public ModelAndView saveVote(
			 @RequestParam ("voter") int voterId,
			 @RequestParam("candidate") int candidateId,
			 @RequestParam("election") int electionId) {
		 
		 ModelAndView mv= new ModelAndView();
		 
		 try {
			 Voter voter =new Voter();
			 voter.setVoter_Id(voterId);
			 
			 Candidate candidate = new Candidate();
			 candidate.setCandidate_id(candidateId);
			 
			 Election election = new Election();
			 election.setElection_id(electionId);
			 
			 Vote newVote = new Vote(voter, candidate, election);
			 
			 
			 boolean success= daoimpl.addVote(newVote);
			 
			 if(success) {
				 
				 mv.addObject("msg","Vote submitted successfully");
				 request.getSession().invalidate();
				 return 
				 
			 }else {
				 
			 mv.addObject("msg","failed to vote");
			 }
			 
		 
	 }catch (Exception e) {
	  e.printStackTrace();
	  mv.addObject("Error in vote submission ");
	 }
		 
		 return mv;
	 }
	
}

