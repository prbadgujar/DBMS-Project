package com.databasesproject.nationalparks.postgresData.repo;

import com.databasesproject.nationalparks.postgresData.models.Location;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LocationRepo extends JpaRepository<Location, Long> {

    // Custom query to get distinct continents
    @Query("SELECT DISTINCT l.continent FROM Location l WHERE l.continent IS NOT NULL")
    List<String> findDistinctContinent();

    //Custom query to get distinct countries by continent //v1
  @Query("SELECT DISTINCT l.country FROM Location l WHERE l.continent = :continent AND l.country IS NOT NULL") //v3

  //@Query("SELECT DISTINCT l.country FROM Location l WHERE l.continent = 'North   America' AND l.country IS NOT NULL") //v1
     List<String> findDistinctCountryByContinent(String continent); //v1


    //Custom query to get distinct state by country //v4
  @Query("SELECT DISTINCT l.state FROM Location l WHERE l.country = :country AND l.state IS NOT NULL") //v4 :country

   // @Query("SELECT DISTINCT l.country FROM Location l WHERE l.continent = 'North America' AND l.country IS NOT NULL") //v1
     List<String> findDistinctState(String country); //v4

// @Query("SELECT n.name FROM location l, national_park n WHERE l.loc_id= n.loc_id AND l.state=:state") //v4 :country
//    // @Query("SELECT DISTINCT l.country FROM Location l WHERE l.continent = 'North America' AND l.country IS NOT NULL") //v1
//      List<String> getNationalParkName(String state) throws Exception; //v

}
