package com.databasesproject.nationalparks.postgresData.models;

import java.util.UUID;

public class CommentsDto {

    UUID user_id;
Long park_id;
String comment;
public String getComment() {
    return comment;
}
public void setComment(String comment) {
    this.comment = comment;
}
public UUID getUser_id() {
    return user_id;
}
public void setUser_id(UUID user_id) {
    this.user_id = user_id;
}
public Long getPark_id() {
    return park_id;
}
public void setPark_id(Long park_id) {
    this.park_id = park_id;
}

    
}
