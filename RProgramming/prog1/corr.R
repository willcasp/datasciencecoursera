corrGetData <- function(directory, id) {
  ## if the id is single or double digit, we have to build it to 3 digits for the
  ## file name.
  createFileName <- paste(formatC(id, width = 3, flag = "0"), ".csv", sep = "")

  createFilePath <- paste(directory, "/", createFileName, sep = "")

  inputData <- read.csv(createFilePath)

  na.omit(inputData)
}


corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
    frames <- Map(function(threshold) corrGetData(directory, threshold), 1:332)
    framesAboveThreshold <- Filter(function(frame) dim(frame)[1] > threshold, frames)
    correlationList <- Map(function(frame) { cor(frame$sulfate, frame$nitrate)}, framesAboveThreshold)
    correlations <- unlist(correlationList)
    if (length(correlations) > 0) correlations
    else vector("numeric", 0)

}
