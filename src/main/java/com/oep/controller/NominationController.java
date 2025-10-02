package com.oep.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oep.daoimpl.NominationDaoImpl;
import com.oep.pojo.Candidate;
import com.oep.pojo.Election;
import com.oep.pojo.Nomination;

@Controller
@RequestMapping("/nomination")
public class NominationController
{
	private NominationDaoImpl daoimpl;
	
	@GetMapping("/add-Nomination")
	public String addNominationPage(Model m)
	{
		return "add-Nomination";
	}
	
	@GetMapping("/remove-Nomination")
	public String removeNominationPage(Model m)
	{
		return "remove-Nomination";
	}
	
	@GetMapping("/update-Nomination")
	public String updateNominationPage(Model m)
	{
		return "update-Nomination";
	}
	
	@GetMapping("/list")
	public String listNomination(Model m)
	{
		List<Nomination> nomination_list=daoimpl.listOfNomination();
		if(nomination_list.isEmpty())
		{
			m.addAttribute("msg", "No nomination available");
			return "nomination";
		}
		else {
			m.addAttribute("nomination_list", nomination_list);
			return "nomination_list";
		}
	}

	@PostMapping("/add")
	public String addNomination(@RequestParam("nomination_id")int nomination_id,
			@RequestParam("candidate")String candidate_id,
			@RequestParam("election_id")int election_id,Model m)
	{
		Nomination n=new Nomination();
		n.setNomination_id(nomination_id);
		Candidate c=new Candidate();
		c.setCandidate_id(candidate_id);
		Election e=new Election();
		e.setElection_id(election_id);
		if(daoimpl.addNomination(n))
		{
			m.addAttribute("msg","Nomination added successfully");
			return "add-nomination";
		}
		else
		{
			m.addAttribute("msg","Nomination can not be added");
			return "add-nomination";
		}
		
	}
		@PostMapping("/update")
		public String updateNomination(@RequestParam("nomination_id")int nomination_id,
				@RequestParam("candidate")String candidate_id,
				@RequestParam("election_id")int election_id,Model m)
		{
			try
			{
			Nomination n=daoimpl.searchNomination(nomination_id);
			if(n!=null)
			{
				n.setNomination_id(nomination_id);
				Candidate c=new Candidate();
				c.setCandidate_id(candidate_id);
				Election e=new Election();
				e.setElection_id(election_id);
				m.addAttribute("msg","Updated");
				return "nomination";
			}
			else
			{
				m.addAttribute("msg","can not be Updated");
				return "update-Nomination";
			}
			
			}
			catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("msg", "can not be Updated");
				return "update-Nomination";
			}
		}
		
		@PostMapping("/remove-nomination")
		public String removeNomination(@RequestParam("nomination_id")int nomination_id,Model m)
		{
			 Nomination nomination = daoimpl.searchNomination(nomination_id);
			    if (nomination != null)
			    {
			      if(daoimpl.removeNomination(nomination))
			      {
			    	  m.addAttribute("msg","Deleted successfully");
						return "remove";
			      }
			      else
					{
						m.addAttribute("msg","can not be deleted");
						return "remove-nomination";
					}
			    }
			      else
			      {
			    	   m.addAttribute("record not found");
			    	   return "remove-nomination";
			      }
		}
		}
