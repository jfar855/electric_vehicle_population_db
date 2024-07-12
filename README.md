# Electric Vehicle Population Database

This repository contains the SQL backup and queries for the Electric Vehicle Population Database focused on Seattle, Washington for the year 2012.

## Contents

- `database_backup.sql`: SQL script to create the database and populate it with sample data.
- `queries.sql`: SQL script containing various queries to analyze the data.

## Project Overview

An accessible and intuitive relational database on the electric vehicle population, consisting of relevant information useful to a diverse audience, including consumers, researchers, insurance companies, and investors. The database focuses on electric vehicles (EVs) registered in Seattle, Washington, in 2012, a year when electric car sales nearly doubled.

## Database Structure

The database consists of the following key tables:
- `electric_vehicle_information`: Contains details about each electric vehicle.
- `ev_type`: Categorizes the types of electric vehicles.
- `location`: Stores location data (postal code, city, state).
- `government`: Contains legislative district information.
- `vehicle_make`: Lists the make and model of vehicles.
- `utility`: Stores information about the electric utility providers.
- `dol_vehicle_utility`: Links electric vehicles to utility providers.

## Queries

The repository includes SQL queries designed to extract meaningful insights from the data:
- `popular_model_by_district`: Identifies the most popular model and make within each legislative district.
- `popular_model`: Determines the most popular model for the brand with the highest count of models.
- `least_expensive_model`: Lists models from least to most expensive based on base MSRP.
- `base_msrp_over_fifty_thousand`: Filters vehicles with a base MSRP exceeding $50,000.
- `avg_electric_range_by_district`: Calculates the average electric range for each legislative district.

## How to Use

1. Clone the repository:
   ```sh
   git clone https://github.com/jfar855/electric_vehicle_population_db.git
   cd electric_vehicle_population_db

2. Import the database
   ```sh
   mysql -u yourusername -p < database_backup.sql

3. Run the queries
   ```sh
   mysql -u yourusername -p < queries.sql


