package com.databasesproject.nationalparks.controllers;

import com.databasesproject.nationalparks.postgresData.repo.UserRepo;
import com.databasesproject.nationalparks.controllers.service.UserLoginService;
import com.databasesproject.nationalparks.postgresData.models.User;

import java.net.http.HttpResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.BodyBuilder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController // This means that this class is a Controller
@RequestMapping(path="/demo") // This means URL's start with /demo (after Application path)
@CrossOrigin("*")
public class TestUserController {
    @Autowired // This means to get the bean called userRepo
    private UserRepo userRepository;

    @Autowired
    private UserLoginService userLoginService;

    @PostMapping(path="/add") // Map ONLY POST Requests
    public String addNewUser (@RequestBody User user ) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        userRepository.save(user);
        return "Saved";
    }

    @GetMapping(path="/all")
    public @ResponseBody Iterable<User> getAllUsers() {
        // This returns a JSON or XML with the users
        return userRepository.findAll();
    }

    @PostMapping(path="/verify")
    public User verifyUserDetails(@RequestBody User user){

        // if(userLoginService.verifyUserDetails(user.getUsername(),user.getPassword()) == "valid"){
        //     return "valid";
        // }
        // else{
        //    // return "invalid";
        //    throw new RuntimeException("Invalid Credentials");
        // }


        try {
User user2 = userLoginService.verifyUserDetails(user.getUsername(),user.getPassword()) ;
System.out.println(user2);            
return user2;
            
        } catch (Exception e) {
            throw new RuntimeException("Invalid Credentials");        }

    }

    @PostMapping(path="/signup")
    public User signupDetails(@RequestBody User user){

        try {
            return userLoginService.signup(user);
           
            // return "";
        } catch (Exception e) {
            throw new RuntimeException("Invalid Credentials");
        }
        

    }



}
