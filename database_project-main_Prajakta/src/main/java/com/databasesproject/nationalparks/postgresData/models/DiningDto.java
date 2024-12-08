package com.databasesproject.nationalparks.postgresData.models;

public interface DiningDto {
double getParkId();
// String getClosureAndAlerts();
// String getEntranceFee();
// String getNationalParkName();
// String getOperatingHours();
// String getParkingTags();
// String getVisitors();
// String getWeather();
Long dnsId();
NationalPark getNationalPark();
String getDiningandSleepingName();
String getDiningandSleepingType();
String getDiningLocation();
String getDiningandSleepingDescription();

String getContactinfo();
}


//  @Query(value= "SELECT n.park_id AS parkId, d.dns_id AS dnsId, d.description AS DiningandSleepingDescription,d.location AS DiningLocation,d.name AS DiningandSleepingName, d.type AS DiningandSleepingType,d.park_id AS DiningparkId from national_park n,dining_and_sleeping d where n.park_id=d.park_id AND n.park_id=3",nativeQuery = true)
