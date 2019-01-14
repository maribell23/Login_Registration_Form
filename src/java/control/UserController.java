/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.UserDAO;
import javax.servlet.http.HttpSession;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import utility.BCrypt;

/**
 *
 * @author Bella
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value = "emptyuser.htm", method = RequestMethod.GET)
    public String insertEmptyUser(ModelMap model) {
        User u = new User();
        model.addAttribute("user", u);
        return "home";
    }

    @RequestMapping(value = "register.htm", method = RequestMethod.POST)
    public String registerUser(ModelMap model, User u) {
        if (u.getPassword().equals(u.getConfirmpassword())) {
            String username = userDAO.getAllUsersByUsername(u.getUsername());
            if (username == null) {
                userDAO.insertUser(u);
                return "registrationform";

            } else {
                model.addAttribute("user", new User());
                model.addAttribute("msg", "Username already exists!");
                return "home";
            }
        } else {
            model.addAttribute("user", new User());
            model.addAttribute("msg", "Passwords should be matched!");
            return "home";
        }

    }

    @RequestMapping(value = "login.htm", method = RequestMethod.POST)
    public String login(ModelMap model, @RequestParam("username") String username, @RequestParam("password") String password, HttpSession session) {
        System.out.println(username);
        System.out.println(password);
        User u = userDAO.findByUserUsername(username);
        if (u != null) {
            if (BCrypt.checkpw(password, u.getPassword())) {
                session.setAttribute("user", u);
                return "logincomplete";
            } else {
                model.addAttribute("user", new User());
                model.addAttribute("msg", "Enter a valid password!");
                return "home";
            }
        }
        model.addAttribute("user", new User());
        model.addAttribute("msg", "No user found!");
        return "home";
    }

}
