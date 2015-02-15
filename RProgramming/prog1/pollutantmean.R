pollutantGetData <- function(directory, pollutant, id) {
  ## if the id is single or double digit, we have to build it to 3 digits for the
  ## file name.
  createFileName <- paste(formatC(id, width = 3, flag = "0"), ".csv", sep = "")

  createFilePath <- paste(directory, "/", createFileName, sep = "")

  inputData <- read.csv(createFilePath)
  
  ## just get the data for the pollutant that we want
  pollutantValueList <- inputData[[pollutant]]
  
  ## get the NA's out of the dataset
  pollutantValueList[!is.na(pollutantValueList)]
  
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  pollutantValueList <- sapply(id, function(id) pollutantGetData(directory, pollutant, id))

  ## convert back to a vector so we can take the mean
  pollutantValues <- unlist(pollutantValueList)
  mean(pollutantValues)
}




