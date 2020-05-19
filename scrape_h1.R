#install.packages("rvest")                 # Installieren des Packages rvest
library(rvest)                            # Laden des Packages rvest

url <- "https://rstudio.com/"             # Zuweisen der url
webpage <- read_html(url)                 # Einlesen der HTML-Seite
h1_html <- html_nodes(webpage, "h1")      # h1-Element der Seite wird der Variable h1_html zugewiesen
h1 <- html_text(h1_html)                  # Text des h1-Tags wird der Variable h1 zugewiesen
h1                                        # h1 wird aufgerufen
