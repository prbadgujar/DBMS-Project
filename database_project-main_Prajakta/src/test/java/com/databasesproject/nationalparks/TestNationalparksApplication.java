package com.databasesproject.nationalparks;

import org.springframework.boot.SpringApplication;

public class TestNationalparksApplication {

	public static void main(String[] args) {
		SpringApplication.from(NationalparksApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
