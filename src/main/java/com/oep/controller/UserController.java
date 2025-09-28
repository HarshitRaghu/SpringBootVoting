package com.oep.controller;

import java.net.http.HttpClient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oep.daoimpl.UserDaoImpl;
import com.oep.pojo.User;

@Controller
public class UserController {
	@Autowired
	private UserDaoImpl daoimpl;

	@RequestMapping("/")
	public String indexPage()
	{
		return "index";
	}
	
	@GetMapping("/reg") // Registration page mapping
	public String registerPage() {
		return "reg";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "login";
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
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setDob(java.time.LocalDate.parse(dob));
        user.setRole(User.Role.valueOf(role));

        String userId = daoimpl.addUser(user, party, bio);
        if (userId == null) {
            model.addAttribute("error", "Registration failed. Must be over 18 or an error occurred.");
            return "reg";
        }

        return "login";
    }
	
	@PostMapping("/checkUser")
	public boolean checkUser(@RequestParam("email")String email, @RequestParam("password")String password, Model m) {
		// next page after login for voter, candidate, and admin
		// if voter > Election list
		// if candidate > nomination view
		// if admin > admin dashborad 
		// since we have different databases in our machine so to test insert an admin record in manually in your database with Role admin
		return false;
	}
}
