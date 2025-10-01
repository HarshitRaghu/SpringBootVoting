package com.oep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oep.daoimpl.CandidateDaoImpl;
import com.oep.pojo.Candidate;

@Controller
@RequestMapping("/candidate")
public class CandidateController {
		
		@Autowired
		private CandidateDaoImpl daoimpl;
		
		@GetMapping("/update-candidate")
		public String updateCandidatePage() {
			return "update-candidate";
		}
		
		@GetMapping("/search-candidate")
		public String searchCandidatePage() {
			return "search-candidate";
		}
		
		@GetMapping("/list")
		public String listOfCandidate(Model m) {
			List<Candidate> candidate_list = daoimpl.listOfCandidates();
			if(candidate_list.isEmpty()) {
				m.addAttribute("msg", "No candidate available");
				return "admin-dashboard";
			}
			else {
				m.addAttribute("candidate_list", candidate_list);
				return "candidate-list";
			}
		}
		
		@PostMapping("/update")
		public String updateCandidate(
				@RequestParam("user_id")String candidate_id,
				@RequestParam("party")String party,
				@RequestParam("bio")String bio,
				Model m) {
			
			Candidate c = daoimpl.searchCandidate(candidate_id);
			if(c != null) {
				c.setBio(bio);
				c.setParty(party);
				c = daoimpl.updateCandidate(c);
				m.addAttribute("candidate", c);
				m.addAttribute("msg", "Updated.");
				return "candidate-profile";
			}
			else {
				m.addAttribute("msg", "Not updated");
				return "update-candidate";
			}
			
		}
		
		@PostMapping("/search")
		public String searchCandidate(@RequestParam("candidate_id")String candidate_id, Model m) {
			Candidate candidate = daoimpl.searchCandidate(candidate_id);
			if(candidate != null) {
				m.addAttribute("candidate",candidate);
				return "candidate-dashboard";
			}
			else {
				m.addAttribute("msg", "no candidate found");
				return "admin-dashboard";
			}
		}
	}
