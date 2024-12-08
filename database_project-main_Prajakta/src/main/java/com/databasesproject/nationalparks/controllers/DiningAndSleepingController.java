package com.databasesproject.nationalparks.controllers;

import com.databasesproject.nationalparks.postgresData.models.DiningAndSleeping;
import com.databasesproject.nationalparks.postgresData.models.NationalPark;
import com.databasesproject.nationalparks.postgresData.repo.DiningAndSleepingRepo;
import com.databasesproject.nationalparks.postgresData.repo.NationalParkRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/diningandsleeping")
public class DiningAndSleepingController {

    @Autowired
    private DiningAndSleepingRepo diningAndSleepingRepo;

    @Autowired
    private NationalParkRepo nationalParkRepo;

    @GetMapping
    public List<DiningAndSleeping> getAllDiningAndSleeping() {
        List<DiningAndSleeping> dnsList = new ArrayList<>();
        diningAndSleepingRepo.findAll().forEach(dnsList::add);
        return dnsList;
    }

    @PostMapping
    public DiningAndSleeping createDiningAndSleeping(@RequestBody DiningAndSleeping diningAndSleeping) {
        // Fetch the National Park by ID
        NationalPark nationalPark = nationalParkRepo.findById(diningAndSleeping.getNationalPark().getPark_id()).orElse(null);
        if (nationalPark != null) {
            diningAndSleeping.setNationalPark(nationalPark);
        }
        return diningAndSleepingRepo.save(diningAndSleeping);
    }

    @GetMapping("/{id}")
    public DiningAndSleeping getDiningAndSleepingById(@PathVariable Long id) {
        return diningAndSleepingRepo.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public DiningAndSleeping updateDiningAndSleeping(@PathVariable Long id, @RequestBody DiningAndSleeping diningAndSleeping) {
        DiningAndSleeping existingDiningAndSleeping = diningAndSleepingRepo.findById(id).orElse(null);
        if (existingDiningAndSleeping != null) {
            NationalPark nationalPark = nationalParkRepo.findById(diningAndSleeping.getNationalPark().getPark_id()).orElse(null);
            if (nationalPark != null) {
                diningAndSleeping.setNationalPark(nationalPark);
            }
            existingDiningAndSleeping.setName(diningAndSleeping.getName());
            existingDiningAndSleeping.setType(diningAndSleeping.getType());
            existingDiningAndSleeping.setLocation(diningAndSleeping.getLocation());
            existingDiningAndSleeping.setDescription(diningAndSleeping.getDescription());
            existingDiningAndSleeping.setContact_info(diningAndSleeping.getContact_info());
            return diningAndSleepingRepo.save(existingDiningAndSleeping);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteDiningAndSleeping(@PathVariable Long id) {
        diningAndSleepingRepo.deleteById(id);
    }
}