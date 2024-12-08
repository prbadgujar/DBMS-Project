package com.databasesproject.nationalparks.controllers;

import com.databasesproject.nationalparks.postgresData.models.ActivityDto;
import com.databasesproject.nationalparks.postgresData.models.DiningDto;
import com.databasesproject.nationalparks.postgresData.models.Location;
import com.databasesproject.nationalparks.postgresData.models.ParkDto;
import com.databasesproject.nationalparks.postgresData.models.ParkNameWithIdDto;
import com.databasesproject.nationalparks.postgresData.repo.LocationRepo;
import com.databasesproject.nationalparks.postgresData.repo.NationalParkRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin(origins = "*")
//@CrossOrigin(origin="*")
@RestController
@RequestMapping("/api/locations")
public class LocationController {

    @Autowired
    private LocationRepo locationRepository;

    @Autowired
    private NationalParkRepo nationalParkRepository;


    // Existing methods for CRUD operations

    @GetMapping
    public List<Location> getAllLocations() {
        return locationRepository.findAll();
    }

    @PostMapping
    public Location createLocation(@RequestBody Location location) {
        return locationRepository.save(location);
    }

    @GetMapping("/{id}")
    public Location getLocationById(@PathVariable Long id) {
        return locationRepository.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public Location updateLocation(@PathVariable Long id, @RequestBody Location location) {
        return locationRepository.findById(id).map(loc -> {
            loc.setContinent(location.getContinent());
            loc.setCountry(location.getCountry());
            loc.setState(location.getState());
            return locationRepository.save(loc);
        }).orElse(null);
    }

    @DeleteMapping("/{id}")
    public void deleteLocation(@PathVariable Long id) {
        locationRepository.deleteById(id);
    }

    // New endpoint to fetch distinct continents
    @GetMapping("/continent")
    public List<String> getDistinctContinents() {
        return locationRepository.findDistinctContinent();
    }
// New endpoint to fetch countries by continent //v1
    @GetMapping("/countries-by-continent/{continent}") //v1
//@GetMapping("/second")
    public List<String> getCountriesByContinent(@PathVariable("continent") String continent) //v3. //v1 @PathVariable //v2-@RequestParam String continent
       
    {String modifiedValue= continent.replace("-", " " );
        return locationRepository.findDistinctCountryByContinent(modifiedValue);  //v1
    } //v1

// v4 New endpoint to fetch state by country //v1
    @GetMapping("/state-by-country/{country}") //v1
//@GetMapping("/second")
    public List<String> getStateByContinent(@PathVariable("country") String country) //v3. //v1 @PathVariable //v2-@RequestParam String continent
       {return locationRepository.findDistinctState(country);  //v1
    } //v1
    @GetMapping("/state-by-npName/{state}") //v1
//@GetMapping("/second")
    public List<String> getStateByState(@PathVariable("state") String state) throws Exception //v3. //v1 @PathVariable //v2-@RequestParam String continent
       {
        return nationalParkRepository.getNationalParkName(state);  //v1
    }

    @GetMapping("/state-by-npNameId/{state}") //v1
//@GetMapping("/second")
    public List<ParkNameWithIdDto> getStateByStateWithId(@PathVariable("state") String state) throws Exception //v3. //v1 @PathVariable //v2-@RequestParam String continent
       {
        return nationalParkRepository.getNationalParkNameWithId(state);  //v1
    }

    @GetMapping("/parkId/{parkId}") //@PathVariable("parkId") int parkId
    //@GetMapping("/second")
        public List<ParkDto> getNationalParkAll(@PathVariable("parkId") int parkId) throws Exception //v3. //v1 @PathVariable //v2-@RequestParam String continent
           {
            return nationalParkRepository.getPlacesDetails(parkId);  //v1
        }
    
        @GetMapping("/activity/parkId/{parkId}") //
    //@GetMapping("/second")
        public List<ActivityDto> getActivityDetails(@PathVariable("parkId") int parkId) throws Exception //v3. //v1 @PathVariable //v2-@RequestParam String continent
           {
            return nationalParkRepository.getActivityDetails(parkId);  //v1
        }
        
        @GetMapping("/dining/parkId/{parkId}") //
    //@GetMapping("/second")
        public List<DiningDto> getDiningDetails(@PathVariable("parkId") int parkId) throws Exception //v3. //v1 @PathVariable //v2-@RequestParam String continent
           {
            return nationalParkRepository.getDiningDetails(parkId);  //v1
        }

}
