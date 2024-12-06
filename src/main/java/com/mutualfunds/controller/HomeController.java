package com.mutualfunds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    // Mapping for the home page (index.jsp)
    @RequestMapping("/")
    public String home() {
        return "index";  // This returns index.jsp
    }

    // Mapping for the login page (login.jsp)
    @RequestMapping("/login")
    public String login() {
        return "login";  // This returns login.jsp
    }

    // Mapping for the register page (register.jsp)
    @RequestMapping("/register")
    public String register() {
        return "register";  // This returns register.jsp
    }
}
