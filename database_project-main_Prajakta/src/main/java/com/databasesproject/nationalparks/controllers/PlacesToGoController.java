package com.databasesproject.nationalparks.controllers;

import com.databasesproject.nationalparks.postgresData.models.NationalPark;
import com.databasesproject.nationalparks.postgresData.models.PlacesToGo;
import com.databasesproject.nationalparks.postgresData.repo.NationalParkRepo;
import com.databasesproject.nationalparks.postgresData.repo.PlacesToGoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/placestogo")
public class PlacesToGoController {

    @Autowired
    private PlacesToGoRepo placesToGoRepo;

    @Autowired
    private NationalParkRepo nationalParkRepo;

    @GetMapping
    public List<PlacesToGo> getAllPlacesToGo() {
        List<PlacesToGo> places = new ArrayList<>();
        placesToGoRepo.findAll().forEach(places::add);
        return places;
    }

    @PostMapping
    public PlacesToGo createPlaceToGo(@RequestBody PlacesToGo placeToGo) {
        // Fetch the National Park by ID
        NationalPark nationalPark = nationalParkRepo.findById(placeToGo.getNationalPark().getPark_id()).orElse(null);
        if (nationalPark != null) {
            placeToGo.setNationalPark(nationalPark);
        }
        return placesToGoRepo.save(placeToGo);
    }

    @GetMapping("/{id}")
    public PlacesToGo getPlaceToGoById(@PathVariable Long id) {
        return placesToGoRepo.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public PlacesToGo updatePlaceToGo(@PathVariable Long id, @RequestBody PlacesToGo placeToGo) {
        PlacesToGo existingPlaceToGo = placesToGoRepo.findById(id).orElse(null);
        if (existingPlaceToGo != null) {
            NationalPark nationalPark = nationalParkRepo.findById(placeToGo.getNationalPark().getPark_id()).orElse(null);
            if (nationalPark != null) {
                placeToGo.setNationalPark(nationalPark);
            }
            existingPlaceToGo.setName(placeToGo.getName());
            existingPlaceToGo.setType(placeToGo.getType());
            existingPlaceToGo.setLocation(placeToGo.getLocation());
            existingPlaceToGo.setDescription(placeToGo.getDescription());
            return placesToGoRepo.save(existingPlaceToGo);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deletePlaceToGo(@PathVariable Long id) {
        placesToGoRepo.deleteById(id);
    }
}