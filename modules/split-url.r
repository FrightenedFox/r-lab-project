split_url <- function(url_list) {
  # -----------------------------
  # Splits an URL (or a vector of URLs) into the following parts:
  # [1]  complete URL
  # [2]  protocol (https)
  # [3]  scheme (https:)
  # [4]  separator between scheme and authority (//)
  # [5]  authority (john.doe:geheim@www.example.com:8080)
  # [6]  user info (john.doe:geheim@)
  # [7]  login (john.doe)
  # [8]  password (geheim)
  # [9]  host (www.example.com)
  # [10] port (8080)
  # [11] path (/forum/questions/example.cgi)
  # [12] query with "?" (?tag=networking&order=newest)
  # [13] query (tag=networking&order=newest)
  # [14] fragment with "#" (#top)
  # [15] fragment (top)
  # 
  # Arguments:
  #   url_list  Input vector. Either a character vector, 
  #             or something coercible to one.
  #
  # Value:
  #   A character matrix with 15 columns
  # ------
    
  url_regex <- paste(
    "^(([^:/?#]+):(?=\\/\\/))?(\\/\\/)?((([^:]+)",
    "(?::([^@]+)?)?@)?([^@/?#:]*)(?::(\\d+)?)?)?",
    "([^?#]*)(\\?([^#]*))?(#(.*))?", sep = "")
  stringr::str_match(url_list, url_regex)
}


split_url_demo <- function() {
  # Demonstrates how does the "split_url()" function work. 
  
  url_demo <- paste("https://john.doe:geheim@www.example.com:8080",
                    "/forum/questions/example.cgi",
                    "?tag=networking&order=newest#top", sep = "")
  split_url(url_demo)
}


clean_split_url <- function(url_list) {
  # Returns a clean output of the "split_url()" function without 
  # unnecessary columns 
  
  split_url(url_list)[,c(1,2,9,11,13,15)]
}


