completeGetData <- function(directory, id) {
  ## if the id is single or double digit, we have to build it to 3 digits for the
  ## file name.
  createFileName <- paste(formatC(id, width = 3, flag = "0"), ".csv", sep = "")

  createFilePath <- paste(directory, "/", createFileName, sep = "")

  inputData <- read.csv(createFilePath)

  obsClean <- na.omit(inputData)
  obsCleanCount <- nrow(obsClean)
  list(id = id, nobs = obsCleanCount)
}


complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  completeLists <- Map(function(id) completeGetData(directory, id), id)
  matrix <- do.call(rbind, completeLists)
  as.data.frame(matrix)
}
