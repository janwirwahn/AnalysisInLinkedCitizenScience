library(envirocaR)
#Link to enpoint of the rest api:
serverUrl = "https://envirocar.org/api/stable"

#Getting all the IDs over getTrackIDs:
trackIDs = getTrackIDs(serverUrl)
#We could also limit the results by passing a bbox or timeInterval as optional parameter.

trackIDs[1:5]
#Choose one of the IDs from the received list...
trackID = "51d333eae4b01cbb274b7073"

#...or select a random ID
size = length(trackIds)
randomID = trackIDs[sample(1:size,1)]

#Import a single Track over the specified track ID:
trackData = importSingleTrack(serverUrl,trackID)
class(trackData)

#We aggregate the speed of the track by taking the mean of each 10 samples:
newTrack = aggregateTrack(track=trackData,phen="Speed",interval=10,fn=mean)
class(newTrack)

#We aggregate over all attributes of the track by taking mean (default) of each 20 samples (default):
newTrack2 = aggregateTrack(track=trackData)
class(newTrack2)

plot(trackData@tracks$Track1@sp@coords,col="blue",pch="*", main="Aggregation of coordinates", xlab="Longitude", ylab="Latitude")
points(newTrack@sp,col="red",pch="o")
points(newTrack2@sp,col="green",pch="O")

plot(trackData@tracks$Track1@data$Speed,type="l",col="blue", ylab="Speed in km/h", main="Aggregation of phenomenon speed"); par(new=TRUE)
plot(newTrack@data$aggr.Speed,type="l",col="red",lwd=2, xlab="", ylab="", xaxt="n", yaxt="n"); par(new=TRUE)
plot(newTrack2@data$Speed,type="l",col="green",lwd=2, xlab="", ylab="", xaxt="n", yaxt="n")