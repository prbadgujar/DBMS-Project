package com.databasesproject.nationalparks.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "first"; // This returns the name of the Thymeleaf template (first.html)
    }

    @PostMapping("/selectContinent")
    public ModelAndView selectContinent(@RequestParam("continent") String continent) {
        ModelAndView modelAndView = new ModelAndView();
        if ("North America".equals(continent)) {
            modelAndView.setViewName("second"); // Redirect to second.html (second.html should be a Thymeleaf template)
        } else {
            modelAndView.setViewName("first"); // Stay on the same page or handle other continents as needed
        }
        return modelAndView;
    }
}