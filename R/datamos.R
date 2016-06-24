#' datamos
#'
#' @name datamos
#' @docType package
#' @author Boris Demeshev
NULL

#' Download the data.frame of all datasets available at data.mos.ru
#'
#' Download the data.frame of all datasets available at data.mos.ru
#'
#' Download the data.frame of all datasets available at data.mos.ru
#'
#' @return the data.frame of all datasets available at data.mos.ru
#' @export
#' @examples
#' dsets <- datamos_list()
datamos_list <- function() {
  url <- "http://api.data.mos.ru/v1/datasets"
  data <- RCurl::getURL(url, .encoding = "UTF-8")
  df <- jsonlite::fromJSON(data)
  return(df)
}


#' Download specific dataset from data.mos.ru
#'
#' Download specific dataset from data.mos.ru
#'
#' Download specific dataset from data.mos.ru
#'
#' @param id the integer id of dataset to download
#' @return the desired dataset from data.mos.ru
#' @export
#' @examples
#' df <- datamos(673)
#' attr(df, "info_df")
#' attr(df, "info_vars")
datamos <- function(id) {
  url <- paste0("http://api.data.mos.ru/v1/datasets/", id, "/rows")
  data_json <- RCurl::getURL(url, .encoding = "UTF-8")
  df <- jsonlite::fromJSON(data_json)
  cells <- df$Cells
  df$Cells <- NULL
  df <- cbind(df, cells)

  url_info <- paste0("http://api.data.mos.ru/v1/datasets/", id)
  info_json <- RCurl::getURL(url_info, .encoding = "UTF-8")
  info <- jsonlite::fromJSON(info_json)

  info_df <- as.data.frame(t(unlist(head(info, -1)))) # info about data frame
  info_vars <- tail(info, 1)[[1]] # info about particular variables

  attr(df, "info_df") <- info_df
  attr(df, "info_vars") <- info_vars

  return(df)
}


