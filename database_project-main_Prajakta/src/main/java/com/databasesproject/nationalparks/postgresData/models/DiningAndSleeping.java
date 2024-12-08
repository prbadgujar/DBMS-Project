package com.databasesproject.nationalparks.postgresData.models;

import jakarta.persistence.*;

@Entity
public class DiningAndSleeping {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long dns_id;

    @ManyToOne
    @JoinColumn(name = "park_id", nullable = false)
    private NationalPark nationalPark;

    private String name;
    private String type;
    private String location;
    private String description;
    private String contact_info;

    // Getters and Setters

    public Long getDns_id() {
        return dns_id;
    }

    public void setDns_id(Long dns_id) {
        this.dns_id = dns_id;
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

    public String getContact_info() {
        return contact_info;
    }

    public void setContact_info(String contact_info) {
        this.contact_info = contact_info;
    }
}