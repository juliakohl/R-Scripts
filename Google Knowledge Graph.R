library(GoogleKnowledgeGraphR)
APIkey <- "xyz"

query <- "Albert Einstein"
#gkg_raw(query, token = APIkey,
        #language = "de", limit = 1, types = "", prefix = FALSE)

gkg_result <- gkg(query, token = APIkey,
                  language = "de", limit = 1, types = "", prefix = FALSE,
                  type_output = TRUE)
gkg_result$name
gkg_result$description
gkg_result$resultURL
gkg_result$detailedDescription
gkg_result$detailedDescriptionURL

