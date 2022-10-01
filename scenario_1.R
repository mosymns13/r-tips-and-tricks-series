# Install packages (remove the "#" on the next two lines if you need to install)
# install.packages("tidyverse") # will take some times since multiple packages in one
# install.packages("readxl")

# Calling your libraries
library(tidyverse)
library(readxl)

# The before times

# Creating a df reading the same excel file multiple times
# Reading each individual sheet separately
# Creating a new column in each called "sheet_name"
july2022 <- read_excel("Data/sample_animal_shelter_data.xlsx", sheet =  "July 2022") |>
  mutate(sheet_name = "July 2022")
august2022 <- read_excel("Data/sample_animal_shelter_data.xlsx", sheet =  "August 2022") |>
  mutate(sheet_name = "August 2022")
september2022 <- read_excel("Data/sample_animal_shelter_data.xlsx", sheet =  "September 2022") |>
  mutate(sheet_name = "September 2022")

# Bindng all the sheets together into one new dataframe
before_times_complete_data <- bind_rows(july2022, august2022, september2022)



# The after

# Getting all the sheet names from the excel workbook
sheets <- excel_sheets("Data/sample_animal_shelter_data.xlsx")

# Iterating the process above through map_df by getting the path with the sheet name and creating the new column all at once
after_times_complete_data <- purrr::map_df(sheets, ~dplyr::mutate(readxl::read_excel("Data/sample_animal_shelter_data.xlsx", sheet = .x),
                                                   sheet_name = .x))
