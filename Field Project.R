mydata = read.csv("/Users/daniellee/Downloads/movie_metadata.csv")

mydata.training <- mydata[sample(1:nrow(mydata),500),]

write.csv(mydata.training, file = "movie_training.csv")

