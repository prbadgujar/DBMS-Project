package com.databasesproject.nationalparks.postgresData.repo;

import com.databasesproject.nationalparks.postgresData.models.PlacesToGo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlacesToGoRepo extends CrudRepository<PlacesToGo, Long> {

}