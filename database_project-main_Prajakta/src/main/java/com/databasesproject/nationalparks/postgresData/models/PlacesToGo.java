package com.databasesproject.nationalparks.postgresData.models;

import jakarta.persistence.*;

@Entity
public class PlacesToGo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long place_id;

    @ManyToOne
    @JoinColumn(name = "park_id", nullable = false)
    private NationalPark nationalPark;

    private String name;
    private String type;
    private String location;
    private String description;

    // Getters and Setters

    public Long getPlace_id() {
        return place_id;
    }

    public void setPlace_id(Long place_id) {
        this.place_id = place_id;
    }

    public NationalPark getNationalPark() {
        return nationalPark;
    }

    public void setNationalPark(NationalPark nationalPark) {
        this.nationalPark = nationalPark;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}