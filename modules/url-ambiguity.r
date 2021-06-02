url_ambiguity_helper <- function(string, appropriate_regex) {
  # ---------------------------------------------------------
  # Counts number of "appropriate_regex" sequences in the "string"
  #
  # Arguments:
  #   string              A character or a character matrix. 
  #
  #   appropriate_regex   Regular expression which has to be applied
  #                       over the "string"
  #
  # Value:
  #   integer, number of occurrences of the "appropriate_regex" in the "string"
  # ------

  if (is.matrix(string)) {
    return(apply(
      string, 
      MARGIN = 2, 
      FUN = stringi::stri_count_regex,
      pattern = appropriate_regex))
  }
  else if (is.character(string)) {
    return(stringi::stri_count_regex(string, pattern = appropriate_regex))
  }
  else {
    stop(simpleError(paste(
      "'string' was expected to be a character or a character matrix, got '",
      typeof(string), "' instead.", sep = ""
    )))
  }
}


letter_digit_letter <- function(string, n_digits_inside = 2) {
  # ----------------------------------------------------------
  # Counts ambiguous sequences letter-digit-letter (e.g. examp1e)
  #
  # Arguments:
  #   string            A character or a character matrix. 
  #
  #   n_digits_inside   Number of digits between letters which are going to be 
  #                     accepted as letter-digit-letter sequence
  #
  # Value:
  #   integer, number of occurrences of the letter-digit-letter sequence
  # ------
  
  let_dig_let_regex <- paste("[a-z][\\d\\!]{1,",
                             n_digits_inside,
                             "}[a-z]", sep = "")
  url_ambiguity_helper(string, let_dig_let_regex)
}


digit_letter_digit <- function(string, n_letters_inside = 2) {
  # ----------------------------------------------------------
  # Counts ambiguous sequences digit-letter-digit (e.g. 9l1)
  #
  # Arguments:
  #   string              A character or a character matrix. 
  #
  #   n_letters_inside    Number of letters between digits which are going to be
  #                       accepted as digit-letter-digit sequence
  #
  # Value:
  #   integer, number of occurrences of the digit-letter-digit sequence
  # ------
  
  dig_let_dig_regex <- paste("\\d[a-z\\!]{1,",
                             n_letters_inside,
                             "}\\d", sep = "")
  url_ambiguity_helper(string, dig_let_dig_regex)
}


combined_url_ambiguity <- function(string, n_symbols_inside = 2) {
  # ----------------------------------------------------------
  # Counts ambiguous sequences like digit-letter-digit or
  # letter-digit-letter (e.g. Ca1l 9l1)
  #
  # Arguments:
  #   string              A character or a character matrix. 
  #
  #   n_symbols_inside    Number of symbols between digits or letters which 
  #                       are going to be accepted as digit-letter-digit
  #                       or letter-digit-letter sequences respectively
  #
  # Value:
  #   integer, number of occurrences of the digit-letter-digit 
  #   or letter-digit-letter sequences
  # ------
  
  ambiguity_regex <- paste("[a-z][\\d\\!]{1,",
                           n_symbols_inside,
                           "2}[a-z]|\\d[a-z\\!]{1,",
                           n_symbols_inside,
                           "2}\\d", sep = "")
  url_ambiguity_helper(string, ambiguity_regex)
}