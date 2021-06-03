# Required module:
source("url-ambiguity.r")


lett_dig_symb_count <- function(string) {
  # -------------------------------------
  # Counts letters, digits and symbols 
  # separately in the string
  #
  # Arguments:
  #   string            A character or a character matrix. 
  #
  # Value:
  #   matrix which has 3 times more columns then the
  #   input "string" variable
  # ------
  
  letters_regex <- "[a-zA-Z]"
  digits_regex <- "[\\d]"
  symbols_regex <- "[[:punct:]]"
  lett_count <- as.matrix(symbol_count_helper(string, letters_regex))
  dig_count <- as.matrix(symbol_count_helper(string, digits_regex))
  symb_count <- as.matrix(symbol_count_helper(string, symbols_regex))
  
  # Adding prefixes to the column names 
  colnames(lett_count) <- paste(
    "lett", colnames(lett_count), sep = "_"
    )
  colnames(dig_count) <- paste(
    "dig", colnames(dig_count), sep = "_"
  )
  colnames(symb_count) <- paste(
    "symb", colnames(symb_count), sep = "_"
  )
  
  cbind(lett_count, dig_count, symb_count)
}
