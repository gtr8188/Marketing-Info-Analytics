movie = read.csv("/Users/daniellee/Codings/Marketing Info Analytics/Field Project/IMDB 100_2.csv")
movie_training = within(movie,rm(language,country,title_year,num_voted_users,director_facebook_likes))

movie_training$num_critic_for_reviews = round(scale(movie_training$num_critic_for_reviews,center=TRUE,scale=TRUE),2)
movie_training$duration = round(scale(movie_training$duration,center=TRUE,scale=TRUE),2)
#movie_training$director_facebook_likes = round(scale(movie_training$director_facebook_likes,center=TRUE,scale=TRUE),2)
movie_training$actor_1_facebook_likes = round(scale(movie_training$actor_1_facebook_likes,center=TRUE,scale=TRUE),2)
movie_training$gross = round(scale(movie_training$gross,center=TRUE,scale=TRUE),2)
movie_training$cast_total_facebook_likes = round(scale(movie_training$cast_total_facebook_likes,center=TRUE,scale=TRUE),2)
movie_training$facenumber_in_poster = round(scale(movie_training$facenumber_in_poster,center=TRUE,scale=TRUE),2)
movie_training$num_user_for_reviews = round(scale(movie_training$num_user_for_reviews,center=TRUE,scale=TRUE),2)
movie_training$budget = round(scale(movie_training$budget,center=TRUE,scale=TRUE),2)
movie_training$imdb_score = round(scale(movie_training$imdb_score,center=TRUE,scale=TRUE),2)
movie_training$aspect_ratio = round(scale(movie_training$aspect_ratio,center=TRUE,scale=TRUE),2)
movie_training$movie_facebook_likes = round(scale(movie_training$movie_facebook_likes,center=TRUE,scale=TRUE),2)
ncol(movie_training)



cor_movie = cor(movie_training[5:15]) 


movieDistances = (dist(movie_training[5:15], method="euclidean", diag=TRUE))^2
movieDistances

#Hierarchical Clustering
movieClusters = hclust(movieDistances, method="centroid")
movieClusters$merge

Agglomeration = data.frame(ClustersRemaining = seq(from=99,to=1,by=-1),CentroidDistance=movieClusters$height, Item1=movieClusters$merge[,1], Item2=movieClusters$merge[,2])
Agglomeration

plot(movieClusters)
movieGroup = cutree(movieClusters, k = 5)
rect.hclust(movieClusters, k=5, border="red")

plot(movie_training$gross, movie_training$movie_title, pch=10)


