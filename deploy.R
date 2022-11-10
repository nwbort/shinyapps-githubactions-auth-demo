#--- Script details ------------------------------------------------------------
# Creation date: 10 November 2022
# Project:       shinyapps-githubactions-auth-demo
# Description:   Deploy shinyapps gs4 auth testing
# Author:        Nick Twort

# Restore Environment to synchronise with lockfile `renv.lock`
renv::restore(prompt = F)

# Decrypt secret file
path <- "inst/secret/your_encrypted_key.json"
raw <- readBin(path, "raw", file.size(path))
auth <- sodium::data_decrypt(
    bin = raw,
    key = gargle:::secret_pw_get("name_of_your_project"),
    nonce = gargle:::secret_nonce()
)

# Write decrypted file to .secrets
fs::dir_create(".secrets")
jsonlite::write_json(
    x = jsonlite::fromJSON(rawToChar(auth)),
    path = ".secrets/your_unencrypted_key.json",
    auto_unbox = TRUE
)

# Authenticate with shinyapps.io
rsconnect::setAccountInfo(
    name = Sys.getenv("SHINY_ACC_NAME"),
    token = Sys.getenv("SHINY_TOKEN"),
    secret = Sys.getenv("SHINY_SECRET")
)
# Deploy the application.
rsconnect::deployApp(
    account = Sys.getenv("SHINY_ACC_NAME"),
    appName = Sys.getenv("SHINY_APP_NAME"),
    appTitle = "your_shinyapps_title"
)
