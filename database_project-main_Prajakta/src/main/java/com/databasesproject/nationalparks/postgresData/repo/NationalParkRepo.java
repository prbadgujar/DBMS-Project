package com.databasesproject.nationalparks.postgresData.repo;

import com.databasesproject.nationalparks.postgresData.models.ActivityDto;
import com.databasesproject.nationalparks.postgresData.models.DiningDto;
import com.databasesproject.nationalparks.postgresData.models.NationalPark;
import com.databasesproject.nationalparks.postgresData.models.ParkDto;
import com.databasesproject.nationalparks.postgresData.models.ParkNameWithIdDto;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NationalParkRepo extends CrudRepository<NationalPark, Long> {
    
@Query(value = "SELECT n.name FROM location l, national_park n WHERE l.loc_id= n.loc_id AND l.state=:state", nativeQuery = true) //v4 :country
   // @Query("SELECT DISTINCT l.country FROM Location l WHERE l.continent = 'North America' AND l.country IS NOT NULL") //v1
     List<String> getNationalParkName(String state) throws Exception; //v

     @Query(value = "SELECT n.name AS name, n.park_id AS parkId FROM location l, national_park n WHERE l.loc_id= n.loc_id AND l.state=:state", nativeQuery = true) //v4 :country
   // @Query("SELECT DISTINCT l.country FROM Location l WHERE l.continent = 'North America' AND l.country IS NOT NULL") //v1
     List<ParkNameWithIdDto> getNationalParkNameWithId(String state) throws Exception; //v

    //  @Query(value = "SELECT n.park_id AS parkId, n.closure_and_alerts AS closureAndAlerts, n.entrance_fee AS entranceFee, n.name AS NationalParkName, n.operating_hours AS operatingHours, n.parking_tags AS parkingTags, n.visitors AS visitors, n.weather AS weather, n.loc_id AS locId, p.description AS placesDescription, p.location AS placesLocation, p.name AS placesName, p.type AS placesType, t.activity_id AS activityId, t.description AS thingsDescription, t.location AS thingsLocation,t.name AS thingsName, t.type AS thingsType from national_park n, places_to_go p, things_to_do t where n.park_id=p.park_id AND t.park_id= :park_id",nativeQuery = true)
    //  List<NationalAllData> getNationalParkAll(int park_id);

     @Query(value = "SELECT n.park_id AS parkId, n.closure_and_alerts AS closureAndAlerts, n.entrance_fee AS entranceFee, n.name AS nationalParkName, n.operating_hours AS operatingHours, n.parking_tags AS parkingTags, n.visitors AS visitors, n.weather AS weather, n.loc_id AS locId, p.description AS placesDescription, p.location AS placesLocation, p.name AS placesName, p.type AS placesType, p.place_id AS placeId from national_park n, places_to_go p where n.park_id=p.park_id AND n.park_id=:parkId", nativeQuery = true)
     List<ParkDto> getPlacesDetails(int parkId);

     @Query(value = "SELECT n.park_id AS parkId, n.closure_and_alerts AS closureAndAlerts, n.entrance_fee AS entranceFee, n.name AS NationalParkName, n.operating_hours AS operatingHours, n.parking_tags AS parkingTags, n.visitors AS visitors, n.weather AS weather, n.loc_id AS locId, t.activity_id AS activityId, t.description AS thingsDescription, t.location AS thingsLocation,t.name AS thingsName, t.type AS thingsType from national_park n, things_to_do t where n.park_id=t.park_id AND t.park_id=:parkId",nativeQuery = true)
     List<ActivityDto> getActivityDetails(int parkId);

  //   @Query(value = "SELECT n.park_id AS parkId, n.closure_and_alerts AS closureAndAlerts, n.entrance_fee AS entranceFee,n.name AS NationalParkName,n.operating_hours AS operatingHours,n.parking_tags AS parkingTags,n.visitors AS visitors,n.weather AS weather,n.loc_id AS locId,d.dns_id AS dnsId, d.description AS DiningandSleepingDescription,d.location AS DiningLocation,d.name AS DiningandSleepingName, d.type AS DiningandSleepingType,d.park_id AS DiningparkId from national_park n,dining_and_sleeping d where n.park_id=d.park_id AND n.park_id=:parkId",nativeQuery = true)
  @Query(value= "SELECT n.park_id AS parkId, d.dns_id AS dnsId, d.description AS DiningandSleepingDescription,d.location AS DiningLocation,d.contact_info AS Contactinfo,d.name AS DiningandSleepingName, d.type AS DiningandSleepingType,d.park_id AS DiningparkId from national_park n,dining_and_sleeping d where n.park_id=d.park_id AND n.park_id=3",nativeQuery = true)
   
  List<DiningDto> getDiningDetails(int parkId);

     
}