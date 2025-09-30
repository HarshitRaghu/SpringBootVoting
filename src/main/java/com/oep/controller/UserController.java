package com.oep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oep.daoimpl.VoterDaoImpl;
import com.oep.pojo.Candidate;
import com.oep.pojo.Voter;

@Controller
public class UserController {
	@Autowired
	private VoterDaoImpl daoimpl;
	
	@GetMapping("/voter-list")
	public String listOfVoters(Model m) {
		List<Voter> voter_list = daoimpl.listOfVoters();
		if(voter_list.isEmpty()) {
			m.addAttribute("msg", "No candidate available");
			return "admin-dashboard";
		}
		else {
			m.addAttribute("voter_list", voter_list);
			return "candidate-list";
		}
	}
	
	@PostMapping("/register") // controller mapping
    public String registerUser(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("dob") String dob,
            @RequestParam("role") String role,
            @RequestParam(value = "party", required = false) String party,
            @RequestParam(value = "bio", required = false) String bio,
            Model model) {
        Voter user = new Voter();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setDob(java.time.LocalDate.parse(dob));
        user.setRole(Voter.Role.valueOf(role));

        String userId = daoimpl.addUser(user, party, bio);
        if (userId == null) {
            model.addAttribute("error", "Registration failed. Must be over 18 or an error occurred.");
            return "reg";
        }

        return "admin-dashboard";
    }
	
	@PostMapping("/checkUser")
	public String checkUserCredentails(@RequestParam("email")String email, @RequestParam("password")String password, Model m) {
		Voter user = daoimpl.checkUser(email, password);
		if(user != null) {
			if(user.getRole().toString().equalsIgnoreCase(Voter.Role.VOTER.toString())) {
				m.addAttribute("voter", user);
				return "voter-dashboard";
			}
			else if(user.getRole().toString().equalsIgnoreCase(Voter.Role.CANDIDATE.toString())) {
				m.addAttribute("candidate", user);
				return "candidate-dashboard";
			}
			else if(user.getRole().toString().equalsIgnoreCase(Voter.Role.ADMIN.toString()))
				return "redirect:/adminDashboard";
		}
		else {
			m.addAttribute("msg","enter valid user info.");
			return "login";
		}
		return "login";
	}
}
