package com.databasesproject.nationalparks.postgresData.models;

import jakarta.persistence.*;

@Entity
public class NationalPark {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long park_id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "loc_id", nullable = false)
    private Location location;
    private String entrance_fee;
    private String parking_tags;
    private String weather;
    private String operating_hours;
    private String visitors;
    private String closure_and_alerts;

    // Getters and Setters
    public String getParking_tags() {
        return parking_tags;
    }

    public void setParking_tags(String parking_tags) {
        this.parking_tags = parking_tags;
    }

    public String getEntrance_fee() {
        return entrance_fee;
    }

    public void setEntrance_fee(String entrance_fee) {
        this.entrance_fee = entrance_fee;
    }

    public String getVisitors() {
        return visitors;
    }

    public void setVisitors(String visitors) {
        this.visitors = visitors;
    }
    public Long getPark_id() {
        return park_id;
    }

    public void setPark_id(Long park_id) {
        this.park_id = park_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getWeather() {
        return weather;
    }

    public void setWeather(String weather) {
        this.weather = weather;
    }

    public String getOperating_hours() {
        return operating_hours;
    }

    public void setOperating_hours(String operating_hours) {
        this.operating_hours = operating_hours;
    }

    

    public String getClosure_and_alerts() {
        return closure_and_alerts;
    }

    public void setClosure_and_alerts(String closure_and_alerts) {
        this.closure_and_alerts = closure_and_alerts;
    }
}