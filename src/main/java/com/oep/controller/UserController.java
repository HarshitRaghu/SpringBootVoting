package com.oep.controller;

import java.io.File;
import java.time.LocalDate; // ✅ Added import for LocalDate
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

        if (voter_list == null || voter_list.isEmpty()) { // ✅ null + empty check
            m.addAttribute("msg", "No voters available");
            return "admin-dashboard";
        } else {
            m.addAttribute("voter_list", voter_list);
            return "candidate-list";
        }
    }
	
    @PostMapping("/register") // controller mapping
    public String registerUser(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam(value = "dob", required = false) String dob, // ✅ dob can be optional
            @RequestParam("role") String role,
            @RequestParam("phone") String phone_no,
            @RequestParam("address") String address,
            @RequestParam(value = "party", required = false) String party,
            @RequestParam(value = "bio", required = false) String bio,
            @RequestParam(value = "profile_photo", required = false) MultipartFile profile,
            @RequestParam(value = "party_logo", required = false) MultipartFile logo,
            @RequestParam(value = "constituency", required = false) String constituency,
            Model m) {

        Voter user = new Voter();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        // ✅ dob empty/null check
        if (dob != null && !dob.trim().isEmpty()) {
            try {
                user.setDob(LocalDate.parse(dob));
            } catch (Exception e) {
                m.addAttribute("error", "Invalid date format. Please enter a valid date.");
                return "reg"; // return back to registration form
            }
        } else {
            m.addAttribute("error", "Date of Birth is required.");
            return "reg";
        }

        user.setRole(Voter.Role.valueOf(role));
        user.setAddress(address);
        user.setPhone_no(phone_no);

        // Initialize file names to null
        String profile_name = null;
        String logo_name = null;

        try {
            // --------------------------
            // Profile Photo Upload
            // --------------------------
            if (profile != null && !profile.isEmpty()) { // ✅ proper null + empty check
                profile_name = System.currentTimeMillis() + "_" + profile.getOriginalFilename(); 
                String serverpath_profile = "C:\\Users\\user\\MYCollageProject\\voting\\SpringBootVoting\\src\\main\\webapp\\resources\\images\\";
                File serverfile_profile = new File(serverpath_profile, profile_name);

                if (serverfile_profile.exists()) {
                    serverfile_profile.delete(); 
                }

                profile.transferTo(serverfile_profile); 
            }

            // --------------------------
            // Party Logo Upload
            // --------------------------
            if (logo != null && !logo.isEmpty()) { // ✅ proper null + empty check
                logo_name = System.currentTimeMillis() + "_" + logo.getOriginalFilename(); 
                String serverpath_logo = "C:\\Users\\user\\MYCollageProject\\voting\\SpringBootVoting\\src\\main\\webapp\\resources\\images\\";
                File serverfile_logo = new File(serverpath_logo, logo_name);

                if (serverfile_logo.exists()) {
                    serverfile_logo.delete(); 
                }

                logo.transferTo(serverfile_logo); 
            }

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "File upload error.");
            return "reg";
        }

        // Save user into DB with uploaded file names
        String userId = daoimpl.addUser(user, party, bio, logo_name, constituency, profile_name);
        if (userId == null) {
            m.addAttribute("error", "Registration failed. Must be over 18 or an error occurred.");
            return "reg";
        }

        // ✅ Redirect according to role
        if(user.getRole()==Voter.Role.VOTER) {
            return "voter-dashboard";
        } else if(user.getRole()==Voter.Role.CANDIDATE) {
            return "candidate-dashboard";
        } else {
            return "admin-dashboard";
        }
    }

	
    @PostMapping("/checkUser")
    public String checkUserCredentails(@RequestParam("email")String email, @RequestParam("password")String password, Model m,HttpSession session) {
		
        Voter user = daoimpl.checkUser(email, password);
	
        if(user != null) {
            session.setAttribute("logged", user);
            session.setAttribute("username", user.getName());
            session.setAttribute("userId", user.getId());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("phone", user.getPhone_no());
            session.setAttribute("dob", user.getDob());

            if(user.getRole()==Voter.Role.VOTER) {
                return "voter-dashboard";
            }
            else if(user.getRole()==Voter.Role.CANDIDATE) {
                Candidate c = (Candidate) user; 
                session.setAttribute("address", c.getAddress());
                session.setAttribute("partyName", c.getParty());
                session.setAttribute("constituency", c.getConstituency());
                session.setAttribute("bio", c.getBio());
                
                session.setAttribute("partyLogo", "resources/images/" + c.getParty_logo());  
                session.setAttribute("profilePhoto", "resources/images/" + c.getProfile_pic());
                
                System.out.print(c.getAddress()+c.getParty()+user.getName()+user.getPhone_no()+user.getEmail());
				
                return "candidate-dashboard";
            }
            else if(user.getRole()==Voter.Role.ADMIN) {
                return "redirect:/adminDashboard";
            }
        }
        else {
            m.addAttribute("msg","Enter valid user info.");
            return "login";
        }
        return "login";
    }
}
