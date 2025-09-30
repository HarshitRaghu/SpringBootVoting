package com.oep.controller;





import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	
	@GetMapping("/login1")
	public String login1Page() {
		return "login1";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "logout";
		
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
	public String checkUserCredentails(@RequestParam("email")String email, @RequestParam("password")String password, Model m,HttpSession session) {
		User user = daoimpl.checkUser(email, password);
		if(user != null) {
			 
			session.setAttribute("loggedUser", user);
			session.setAttribute("username", user.getName());
			session.setAttribute("userId", user.getId());
			
			 System.out.println("Session username: " + session.getAttribute("username"));
		        System.out.println("Session userId: " + session.getAttribute("userId"));
			if(user.getRole()==User.Role.VOTER)
				return "voterDash";
			else if(user.getRole()==User.Role.CANDIDATE)
				return "candidate_dashboard";
			else if(user.getRole()==User.Role.ADMIN)
				return "admin_dashboard";
		}
		else {
			m.addAttribute("msg","enter valid user info.");
			return "login";
		}
		return "login";
	}
}