randomly_sample_paths <- function(path, samples){
    
    directory_list <- list.files(path, full.names = TRUE, recursive = TRUE, include.dirs = TRUE) 
    # set recusrive to true and include dirs to true so get all files within directory 
    
    all_paths <- directory_list[grepl("*.txt", directory_list)] # grep through vector, filter accordingly 
    
    
    samples <- replicate(samples ,sample(all_paths ,size = 1, replace = FALSE)) %>%
        as.vector()
    
    # randomly sample, without replacement, multiple times
    

    
    samples
    
}

 # we test 
randomly_sample_paths('../input/indoor-location-navigation/train/',5 )
