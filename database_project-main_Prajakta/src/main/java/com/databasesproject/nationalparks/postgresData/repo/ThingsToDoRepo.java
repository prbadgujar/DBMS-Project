package com.databasesproject.nationalparks.postgresData.repo;

import com.databasesproject.nationalparks.postgresData.models.ThingsToDo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ThingsToDoRepo extends CrudRepository<ThingsToDo, Long> {

}