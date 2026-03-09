# COVID-19 Data Analysis Dashboard (R Shiny)

## Overview

This project presents an **interactive COVID-19 data dashboard built using R and Shiny**.
The dashboard visualizes global COVID-19 trends using data from **Our World in Data (OWID)**.

The application performs **data preprocessing, missing value handling, and outlier handling**, followed by interactive visualization of key COVID-19 metrics such as total cases, deaths, and country comparisons.

The goal of the project is to demonstrate a **complete data science workflow**, including:

* Data collection
* Data cleaning and preprocessing
* Handling missing values
* Handling outliers
* Data visualization
* Interactive dashboard development

---

## Dataset

The dataset used in this project is obtained from:

**Our World in Data – COVID-19 Dataset**

Source:
https://catalog.ourworldindata.org/garden/covid/latest/compact/compact.csv

Key characteristics:

* Global COVID-19 statistics
* Daily updates per country
* Includes metrics such as:

  * Total cases
  * New cases
  * Total deaths
  * New deaths
  * Population statistics
  * Vaccination data

This dataset was chosen because it is **reliable, frequently updated, and widely used in research**.

---

## Project Structure

```
covid19-r-dashboard
│
├── app.R
├── README.md
│
├── data
│   └── covid_cleaned.csv
│
├── scripts
│   ├── 01_load_data.R
│   ├── 02_add_missing_values.R
│   ├── 03_preprocess_data.R
│
└── images
```

### Description

**app.R**
Main Shiny dashboard application.

**scripts/**
Contains the data processing pipeline.

* `01_load_data.R` – Loads the dataset from OWID.
* `02_add_missing_values.R` – Introduces artificial missing values for analysis.
* `03_preprocess_data.R` – Cleans the dataset by removing missing values and handling outliers.

**data/**
Stores the final cleaned dataset used by the dashboard.

---

## Data Processing Workflow

The data pipeline follows these steps:

### 1. Data Loading

The dataset is downloaded directly from the **Our World in Data repository**.

### 2. Missing Value Simulation

Artificial missing values are introduced to demonstrate **data cleaning techniques**.

### 3. Data Preprocessing

The preprocessing stage includes:

* Removing missing values
* Handling outliers
* Filtering only valid country records
* Preparing a clean dataset for visualization

After preprocessing, the cleaned dataset is stored as:

```
data/covid_cleaned.csv
```

---

## Dashboard Features

The Shiny dashboard provides multiple interactive visualizations.

### 1. Country Selection

Users can select any country to explore its COVID-19 statistics.

### 2. Key Metrics

The dashboard displays:

* Total COVID-19 cases
* Total COVID-19 deaths

These metrics update dynamically based on the selected country.

### 3. Cases Over Time

A time-series line chart showing how total COVID-19 cases evolved over time.

### 4. Cases vs Deaths Analysis

A scatter plot visualizing the relationship between daily COVID-19 cases and deaths.

### 5. Top 10 Countries by Cases

A bar chart ranking countries with the highest cumulative COVID-19 cases.

### 6. Global Distribution Map

An interactive world map displaying COVID-19 case distribution across countries.

---

## Technologies Used

* **R**
* **Shiny**
* **shinydashboard**
* **dplyr**
* **ggplot2**
* **plotly**
* **readr**

These libraries are used for **data manipulation, visualization, and interactive dashboard development**.

---

## How to Run the Project

### Step 1 – Clone the repository

```
git clone https://github.com/suraj954/covid19-r-dashboard.git
```

### Step 2 – Open the project in RStudio

Open the project folder in **RStudio**.

### Step 3 – Run the preprocessing scripts

Execute the following scripts once to generate the cleaned dataset:

```r
source("scripts/01_load_data.R")
source("scripts/02_add_missing_values.R")
source("scripts/03_preprocess_data.R")
```

### Step 4 – Run the dashboard

```r
shiny::runApp()
```

The dashboard will open in your browser.

---

## Key Insights from the Dashboard

The dashboard helps analyze:

* The progression of COVID-19 cases over time
* The relationship between cases and deaths
* Countries with the highest infection counts
* Global distribution of COVID-19 cases

---

## Future Improvements

Potential improvements for the dashboard include:

* Adding vaccination analysis
* Incorporating date-range filters
* Adding additional epidemiological metrics
* Deploying the dashboard online (ShinyApps / Posit Connect)

---

## Author

**Suraj Dwivedi**

GitHub:
https://github.com/suraj954

---

## License

This project is for **educational and research purposes**.
