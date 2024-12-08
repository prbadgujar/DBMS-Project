package com.databasesproject.nationalparks.controllers;

import com.databasesproject.nationalparks.postgresData.models.Location;
import com.databasesproject.nationalparks.postgresData.models.NationalPark;
import com.databasesproject.nationalparks.postgresData.repo.LocationRepo;
import com.databasesproject.nationalparks.postgresData.repo.NationalParkRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/nationalparks")
public class NationalParkController {

    @Autowired
    private NationalParkRepo nationalParkRepository;

    @Autowired
    private LocationRepo locationRepo; // Corrected to use LocationRepo

    @GetMapping
    public List<NationalPark> getAllNationalParks() {
        List<NationalPark> nationalParks = new ArrayList<>();
        nationalParkRepository.findAll().forEach(nationalParks::add);
        return nationalParks;
    }

    @PostMapping
    public NationalPark createNationalPark(@RequestBody NationalPark nationalPark) {
        // Fetch the Location by ID
        Location location = locationRepo.findById(nationalPark.getLocation().getLoc_id()).orElse(null);
        if (location != null) {
            nationalPark.setLocation(location);
        }
        return nationalParkRepository.save(nationalPark);
    }

    @GetMapping("/{id}")
    public NationalPark getNationalParkById(@PathVariable Long id) {
        return nationalParkRepository.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public NationalPark updateNationalPark(@PathVariable Long id, @RequestBody NationalPark nationalPark) {
        NationalPark existingNationalPark = nationalParkRepository.findById(id).orElse(null);
        if (existingNationalPark != null) {
            Location location = locationRepo.findById(nationalPark.getLocation().getLoc_id()).orElse(null);
            if (location != null) {
                nationalPark.setLocation(location);
            }
            existingNationalPark.setName(nationalPark.getName());
            existingNationalPark.setEntrance_fee(nationalPark.getEntrance_fee());
            existingNationalPark.setParking_tags(nationalPark.getParking_tags());
            existingNationalPark.setWeather(nationalPark.getWeather());
            existingNationalPark.setOperating_hours(nationalPark.getOperating_hours());
            existingNationalPark.setVisitors(nationalPark.getVisitors());
            existingNationalPark.setClosure_and_alerts(nationalPark.getClosure_and_alerts());
            return nationalParkRepository.save(existingNationalPark);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteNationalPark(@PathVariable Long id) {
        nationalParkRepository.deleteById(id);
    }
}