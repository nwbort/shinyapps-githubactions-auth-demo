#--- Script details ------------------------------------------------------------
# Creation date: 10 November 2022
# Project:       shinyapps-githubactions-auth-demo
# Description:   Global stuff for shinyapps gs4 auth testing
# Author:        Nick Twort

library(shiny)
library(googlesheets4)

DEMO_SHEET_URL <- "1ovYeMack2HTzUKag1DRTbRrPgy5hTwneCPJ5_tNQgz0"

# Go to https://console.cloud.google.com/apis/dashboard
# Create project (shinyapps-githubactions-auth-demo)
# Enable APIs and services
# Enable Google Sheets API
# Credentials
# Create service account (nothing optional added)
# Create key json, download, and store somewhere sensible (eg, in `.secrets`)
# Share Google Sheet with new email address for the service account
# Create secret file with:

#          # Generate name and password
#          pw_name <- gargle:::secret_pw_name("name_of_your_project")
#          pw <- gargle:::secret_pw_gen()
#          # Save to .Renviron in project folder as format:
#          # {pw_name}:{pw}
#          
#          # Encrypt secret file
#          gargle:::secret_write(
#              package = "name_of_your_project",
#              name = "your_encrypted_key.json", # (whatever you want to call it)
#              input = ".secrets/your_unencrypted_key.json" # (the downloaded key)
#          )
#          # This saves the encrypted file as inst/secret/your_encrypted_key.json
# It is critical that you do not commit .Renviron or .secrets/ to your git repo

gs4_auth(path = ".secrets/your_unencrypted_key.json")

df <- read_sheet(DEMO_SHEET_URL, sheet = "Dummy")
