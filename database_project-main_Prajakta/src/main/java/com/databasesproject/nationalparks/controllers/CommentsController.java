package com.databasesproject.nationalparks.controllers;

import com.databasesproject.nationalparks.postgresData.models.Comments;
import com.databasesproject.nationalparks.postgresData.models.CommentsDto;
import com.databasesproject.nationalparks.postgresData.models.NationalPark;
import com.databasesproject.nationalparks.postgresData.models.User;
import com.databasesproject.nationalparks.postgresData.repo.CommentsRepo;
import com.databasesproject.nationalparks.postgresData.repo.NationalParkRepo;
import com.databasesproject.nationalparks.postgresData.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
@CrossOrigin(origins = "*")

@RestController
@RequestMapping("/api/comments")
public class CommentsController {

    @Autowired
    private CommentsRepo commentsRepo;

    @Autowired
    private NationalParkRepo nationalParkRepo;

    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public List<Comments> getAllComments() {
        List<Comments> comments = new ArrayList<>();
        commentsRepo.findAll().forEach(comments::add);
        return comments;
    }

    @PostMapping
    public Comments createComment(@RequestBody CommentsDto comment) {
        // Ensure park_id is of the correct type (e.g., UUID or Long)
        NationalPark nationalPark = nationalParkRepo.findById(comment.getPark_id()).orElse(null);

        // Assuming `getUser()` returns a UUID or the correct ID type for User
        User user = userRepo.findById(comment.getUser_id()).orElse(null);

        
        if (nationalPark != null ) {

Comments comments= new Comments();
            comments.setNationalPark(nationalPark);
           comments.setUser(user);
            comments.setComment(comment.getComment());
            return commentsRepo.save(comments);

        }
        // Handle the case where either the National Park or User is not found
        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "National Park or User not found");
    }
}