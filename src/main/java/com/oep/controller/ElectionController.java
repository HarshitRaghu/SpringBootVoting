package com.oep.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oep.daoimpl.ElectionDaoImpl;
import com.oep.pojo.Candidate;
import com.oep.pojo.Election;

@Controller
@RequestMapping("/election")
public class ElectionController {
	
	@Autowired
	private ElectionDaoImpl daoimpl;
	
	@GetMapping("/add-election")
	public String addElectionPage(Model m) {
		return "add-election";
	}
	
	@GetMapping("/update-election")
	public String updateElectionPage(Model m) {
		return "update-election";
	}
	
	@GetMapping("/list")
	public String listOfElection(Model m) {
		List<Election> election_list = daoimpl.listOfElections();
		if(election_list.isEmpty()) {
			m.addAttribute("msg", "No candidate available");
			return "admin-dashboard";
		}
		else {
			m.addAttribute("election_list", election_list);
			return "election-list";
		}
	}
	
	@PostMapping("/add")
	public String addElection(
			@RequestParam("name")String name,
			@RequestParam("date")String date,
			@RequestParam("position")String position, Model m) {
		Election e = new Election();
		e.setDate(java.time.LocalDate.parse(date));
		e.setElection_name(name);
		e.setPosition(position);
		if(daoimpl.addElection(e)) {
			m.addAttribute("msg", "Election added");
			return "add-election";
		}
		else {
			m.addAttribute("msg", "NO election added");
			return "add-election";
		}
	}
	
	@PostMapping("/update")
	public String updateElection(
			@RequestParam("election_id")int election_id,
			@RequestParam("name")String name,
			@RequestParam("date")String date,
			@RequestParam("position")String position, Model m) {
		Election e = daoimpl.searchElection(election_id);
		if(e != null) {
			e.setElection_name(name);
			e.setDate(java.time.LocalDate.parse(date));
			e.setPosition(position);
			m.addAttribute("election", e);
			m.addAttribute("msg", "Updated.");
			return "update-election";
		}
		else {
			m.addAttribute("msg", "Not updated");
			return "update-election";
		}
	}
}
