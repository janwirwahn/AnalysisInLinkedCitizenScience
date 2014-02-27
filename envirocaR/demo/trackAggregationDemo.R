library(envirocaR)
serverUrlAndID = "https://envirocar.org/api/dev/tracks/51d333eae4b01cbb274b7073"
serverUrl = "https://envirocar.org/api/stable"
trackID = "51d333eae4b01cbb274b7073"
trackData = importSingleTrack(serverUrl,trackID)

trackIds = getTrackIDs(serverUrl)
size = length(trackIds)
randomId = trackIds[sample(1:size,1)]

trackData = importSingleTrack(serverUrl,randomId)
class(trackData)

newTrack = aggregateTrack(track=trackData,phen="Speed",interval=10,fn=mean)
class(newTrack)

newTrack2 = aggregateTrack(track=trackData)
class(newTrack2)

plot(trackData@tracks$Track1@sp,col="blue",pch="*")
points(newTrack@sp,col="red",pch="o")
points(newTrack2@sp,col="green",pch="O")

plot(trackData@tracks$Track1@data$Speed,type="l",col="blue"); par(new=TRUE)
plot(newTrack@data$aggr.Speed,type="l",col="red",lwd=2); par(new=TRUE)
plot(newTrack2@data$Speed,type="l",col="green",lwd=2)