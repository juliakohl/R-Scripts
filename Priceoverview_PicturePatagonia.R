#install.packages("rvest")
#install.packages("stringr")

library(rvest)
library(stringr)

#Picture Organic Clothing
url <- "https://www.bergzeit.de/picture-wanderjacken/?manufacturer%5B%5D=37fafe7a74d50c228738f0431a1d746a"
webpage <- read_html(url)
titles_html <- html_nodes(webpage, "strong.title")
titles <- html_text(titles_html)

prices_html <- html_nodes(webpage, "strong.price.is_product_price")
prices <- html_text(prices_html)

prices <- str_replace_all(prices, "[,??? ]" , "") 

i <- 1
prices_num <- c()
for (price in prices) {
  prices_num[i] <- (as.numeric(price))/100
  i <- i + 1
}

summary(prices_num)
boxplot(prices_num)

picture_data <- data.frame(Title = titles, Price = prices_num)

View(picture_data)


#Patagonia

url_2 <- "https://www.bergzeit.de/patagonia-wanderjacken/?manufacturer%5B%5D=e92d8dd42d09f11237d83b1a64e064f8&Gender%5B%5D=Herren&Gender%5B%5D=Damen"
webpage_2 <- read_html(url_2)
titles_html_2 <- html_nodes(webpage_2, "strong.title")
titles_2 <- html_text(titles_html_2)

prices_html_2 <- html_nodes(webpage_2, "strong.price.is_product_price")
prices_2 <- html_text(prices_html_2)

prices_2 <- str_replace_all(prices_2, "[,??? ]" , "") 

i <- 1
prices_num_2 <- c()

for (price in prices_2) {
  prices_num_2[i] <- (as.numeric(price))/100
  i <- i + 1
}

patagonia_data <- data.frame(Title = titles_2, Price = prices_num_2)
View(patagonia_data)

#Comparison
boxplot(prices_num_2, prices_num, 
        xlab = "Preis", ylab = "Marke", 
        names = c("Patagonia", "Picture"), 
        horizontal = TRUE)
