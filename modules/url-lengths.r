url_lengths <- function(devided_url) {
  # ----------------------------------
  # Calculates the following 12 descriptive features of each url:
  # "XXX_l" - length of the corresponding part of the URL, where XXX:
  #   + url
  #   + protocol 
  #   + host
  #   + path
  #   + query
  #   + fragment
  #
  # "host_by_url" - host_l devided by url_l
  # "path_by_url" - path_l devided by url_l
  # "query_by_url" - query_l devided by url_l
  # "path_by_host" - path_l devided by host_l
  # "query_by_host" - query_l devided by host_l
  # "query_by_path" - query_l devided by path_l
  # 
  # Arguments:
  #   devided_url   Input matrix with 6 columns: 
  #                   ["url", "protocol", "host", "path", "query", "fragment"]
  #                 May or may not be named that way.
  #
  # Value:
  #   Matrix with 12 columns listed above
  # ------

  
  # Lengths
  partial_lengths <- apply(
    devided_url, 
    MARGIN = 2, 
    FUN = stringi::stri_length)
  colnames(partial_lengths) <- c("url_l", "protocol_l", "host_l", 
                                 "path_l", "query_l", "fragment_l")
  
  # Lengths ratios 
  host_by_url <- partial_lengths[, "host_l"] / partial_lengths[, "url_l"]
  path_by_url <- partial_lengths[, "path_l"] / partial_lengths[, "url_l"]
  query_by_url <- partial_lengths[, "query_l"] / partial_lengths[, "url_l"]
  path_by_host <- partial_lengths[, "path_l"] / partial_lengths[, "host_l"]
  query_by_host <- partial_lengths[, "query_l"] / partial_lengths[, "host_l"]
  query_by_path <- partial_lengths[, "query_l"] / partial_lengths[, "path_l"]
  
  ratios_matrix <- matrix(
    c(host_by_url, path_by_url, query_by_url, 
      path_by_host, query_by_host, query_by_path), 
    ncol = 6,
    dimnames = list(NULL, c("host_by_url", "path_by_url", "query_by_url", 
                            "path_by_host", 'query_by_host', "query_by_path"))
    )
  
  # Joined matrices
  return(cbind(partial_lengths, ratios_matrix))
}
