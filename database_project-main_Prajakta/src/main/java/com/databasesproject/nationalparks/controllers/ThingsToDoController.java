package com.databasesproject.nationalparks.controllers;

import com.databasesproject.nationalparks.postgresData.models.NationalPark;
import com.databasesproject.nationalparks.postgresData.models.ThingsToDo;
import com.databasesproject.nationalparks.postgresData.repo.NationalParkRepo;
import com.databasesproject.nationalparks.postgresData.repo.ThingsToDoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/thingstodo")
public class ThingsToDoController {

    @Autowired
    private ThingsToDoRepo thingsToDoRepo;

    @Autowired
    private NationalParkRepo nationalParkRepo;

    @GetMapping
    public List<ThingsToDo> getAllThingsToDo() {
        List<ThingsToDo> activities = new ArrayList<>();
        thingsToDoRepo.findAll().forEach(activities::add);
        return activities;
    }

    @PostMapping
    public ThingsToDo createThingToDo(@RequestBody ThingsToDo thingToDo) {
        // Fetch the National Park by ID
        NationalPark nationalPark = nationalParkRepo.findById(thingToDo.getNationalPark().getPark_id()).orElse(null);
        if (nationalPark != null) {
            thingToDo.setNationalPark(nationalPark);
        }
        return thingsToDoRepo.save(thingToDo);
    }

    @GetMapping("/{id}")
    public ThingsToDo getThingToDoById(@PathVariable Long id) {
        return thingsToDoRepo.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public ThingsToDo updateThingToDo(@PathVariable Long id, @RequestBody ThingsToDo thingToDo) {
        ThingsToDo existingThingToDo = thingsToDoRepo.findById(id).orElse(null);
        if (existingThingToDo != null) {
            NationalPark nationalPark = nationalParkRepo.findById(thingToDo.getNationalPark().getPark_id()).orElse(null);
            if (nationalPark != null) {
                thingToDo.setNationalPark(nationalPark);
            }
            existingThingToDo.setName(thingToDo.getName());
            existingThingToDo.setType(thingToDo.getType());
            existingThingToDo.setLocation(thingToDo.getLocation());
            existingThingToDo.setDescription(thingToDo.getDescription());
            return thingsToDoRepo.save(existingThingToDo);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteThingToDo(@PathVariable Long id) {
        thingsToDoRepo.deleteById(id);
    }
}