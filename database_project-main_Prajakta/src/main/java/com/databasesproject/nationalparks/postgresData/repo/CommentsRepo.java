package com.databasesproject.nationalparks.postgresData.repo;

import com.databasesproject.nationalparks.postgresData.models.Comments;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentsRepo extends CrudRepository<Comments, Long> {
}