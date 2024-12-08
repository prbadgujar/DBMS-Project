package com.databasesproject.nationalparks.postgresData.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.databasesproject.nationalparks.postgresData.models.User;

import java.util.UUID;

// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

public interface UserRepo extends CrudRepository<User, UUID> {
    @Query(value="select * from users where username =:username AND password=:password",nativeQuery=true)

    //@Query(value="select count(*) AS count from users where username =:username AND password=:password",nativeQuery=true)
   // int verifyUserName(String username, String password);
   User verifyUserName(String username, String password);


    
}
