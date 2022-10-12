rm(list = ls())


best <- function(state, outcome){
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  if(!state %in% outcome_data$State){
    stop("invalid state")
  } 
  
  else{
    if (outcome == "heart attack"){
      colnum <- 11
    }
    else if (outcome == "heart failure"){
      colnum <- 17
    }
    else if (outcome == "pneumonia"){
      colnum <- 23
    }
    else{
      stop("invalid outcome")
    }
    outcome_data1 <- subset(outcome_data, State == state
                            & outcome_data[,colnum]!= "Not Available")
    ##omit the NA value for the next length function,
    ##notice that here it used "Not Available" rather than NA
    min_mort <- min(as.numeric(outcome_data1[,colnum]))
    lowest_mort <- subset(outcome_data1, 
                          as.numeric(outcome_data1[,colnum]) == min_mort)
    return(lowest_mort[,2])
  }
}

best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")

rankhospital <- function(state, outcome, num = "best"){
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  if(!state %in% outcome_data$State){
    stop("invalid state")
  } 
  else{
    if (outcome == "heart attack"){
      colnum <- 11
    }
    else if (outcome == "heart failure"){
      colnum <- 17
    }
    else if (outcome == "pneumonia"){
      colnum <- 23
    }
    else{
      stop("invalid outcome")
    }
    ##determing the coloum
    
    outcome_data1 <- subset(outcome_data, State == state
                            & outcome_data[,colnum]!= "Not Available")
    ##omit the NA value for the next length function,
    ##notice that here it used "Not Available" rather than NA
    
    if (num == "best"){
      rank <- 1
    }
    else if (num == "worst"){
      rank <- length(outcome_data1[,colnum])
    }
    else if (num > nrow(outcome_data1)){
      return(NA)
    }
    else{
      rank <- num
    }
    hos_num <- sort(as.numeric(outcome_data1[,colnum]))
    hos_name <- subset(outcome_data1, 
                       as.numeric(outcome_data1[,colnum]) == hos_num[rank])
    ##death rate has to be numeric
    return(hos_name[1,2]) ##If 2 value exist, just return the first
  }
}

rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)

helper <- function(data, outcome, num){
  hospital <- data[, 2][order(outcome, data[, 2])[num]]
  hospital
}
rankall <- function(outcome, num = "best") {
  data <- read.csv(file="outcome-of-care-measures.csv", colClasses = "character")
  reason <- c("heart attack", "heart failure", "pneumonia")
  state_arr <- sort(unique(data$State))
  arr_len <- length(state_arr)
  hospital <- rep("", arr_len)
  if(!outcome %in% reason){
    stop("invalid outcome")
  } else {
    for(i in 1:arr_len){
      goal <- data[data$State == state_arr[i], ]
      if(outcome == "heart attack"){
        attack <- as.numeric(goal[, 11])   
        len <- dim(goal[!is.na(attack),])[1]
        if(num == "best"){
          hospital[i] <- helper(goal, attack, 1)
        } else if(num == "worst"){
          hospital[i] <- helper(goal, attack, len)
        } else if(num > len){
          hospital[i] <- NA
        } else{
          hospital[i] <- helper(goal, attack, num)
        }          
      }
      else if(outcome == "heart failure" ){ # Attention here!
        failure <- as.numeric(goal[, 17])   
        len <- dim(goal[!is.na(failure),])[1]
        if(num == "best"){
          hospital[i] <- helper(goal, failure, 1)
        } else if(num == "worst"){
          hospital[i] <- helper(goal, failure, len)
        } else if(num > len){
          hospital[i] <- NA
        } else{
          hospital[i] <- helper(goal, failure, num)
        } 
      }
      else{
        pneumonia <- as.numeric(goal[, 23])
        len <- dim(goal[!is.na(pneumonia),])[1]
        if(num == "best"){
          hospital[i] <- helper(goal, pneumonia, 1)
        } else if(num == "worst"){
          hospital[i] <- helper(goal, pneumonia, len)
        } else if(num > len){
          hospital[i] <- NA
        } else{
          hospital[i] <- helper(goal, pneumonia, num)   
        } 
      }  
    }
    df <- data.frame(hospital = hospital, state = state_arr)
    df
  }
}

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)