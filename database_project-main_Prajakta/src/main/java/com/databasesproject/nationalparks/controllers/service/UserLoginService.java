package com.databasesproject.nationalparks.controllers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.databasesproject.nationalparks.postgresData.models.User;
import com.databasesproject.nationalparks.postgresData.repo.UserRepo;
@Service
public class UserLoginService {
    
    @Autowired
    
    private UserRepo userRepo;

    public User verifyUserDetails(String userName, String password){
        // if(userRepo.verifyUserName(userName,password) > 0){
        //     return "valid";
        // }else{
        //     return "invalid";
        // }

        return userRepo.verifyUserName(userName,password);

    }



    public User signup(User user){
        try {
           return userRepo.save(user);
            //return " "; 
        } catch (Exception e) {
        throw new RuntimeException("Invalid Credentials");
    }
    
    
    }

    

}
