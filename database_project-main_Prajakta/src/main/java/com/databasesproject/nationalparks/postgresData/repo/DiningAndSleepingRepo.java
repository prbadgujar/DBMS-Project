package com.databasesproject.nationalparks.postgresData.repo;

import com.databasesproject.nationalparks.postgresData.models.DiningAndSleeping;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DiningAndSleepingRepo extends CrudRepository<DiningAndSleeping, Long> {

}