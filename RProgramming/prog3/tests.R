# tests
source("/volumes/data/code/datasciencecoursera/RProgramming/prog3/best.R", local = TRUE)
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
source("/volumes/data/code/datasciencecoursera/RProgramming/prog3/rankhospital.R", local = TRUE)
rankhospital("MN", "heart attack", 5000)
rankhospital("MD", "heart attack", "worst")
rankhospital("TX", "heart failure", 4)
source("/volumes/data/code/datasciencecoursera/RProgramming/prog3/rankall.R", local = TRUE)
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
