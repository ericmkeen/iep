##############################
##############################

map_stcats <- function(xmin = -81.22,
                       xmax = -81.12,
                       ymin = 31.55,
                       ymax = 31.705,
                       toplot=FALSE){
  # Plot limits
  if(FALSE){
    xmin <- -81.22
    xmax <- -81.12
    ymin <- 31.55
    ymax <- 31.705
  }

  suppressWarnings({
    library(rnaturalearth)
    library(magrittr)
    library(sf)
    library(rgdal)

    # lets get a bbox to make a smaller sized objects and facilitate the examples:


    # Data
    shore <- readOGR(
      dsn= paste0(getwd(),"/NSDE57399/") ,
      layer="CUSPLine",
      verbose=FALSE
    )

    x <- c(xmin,xmin,xmax,xmax)
    y <- c(ymin,ymax,ymax,ymin)
    xy <- cbind(x,y)
    S <- SpatialPoints(xy)
    bbshore <- bbox(S)

    gClip <- function(shp, bb){
      library(raster)
      library(rgeos)
      if(class(bb) == "matrix") b_poly <- as(extent(as.vector(t(bb))), "SpatialPolygons")
      else b_poly <- as(extent(bb), "SpatialPolygons")
      gIntersection(shp, b_poly, byid = T)
    }

    shorec <- gClip(shore, bbshore)


    if(toplot){pdf("map.pdf",height=10,width=6)}
    par(mfrow=c(1,1))
    par(mar=c(2.5,2.5,.5,.5));
    plot(shore,xlim=c(xmin,xmax),ylim=c(ymin,ymax),col="grey50")
    axis(1,at=c(xmin,xmax))
    axis(2,at=c(ymin,ymax))
    if(toplot){dev.off()}
  })
}

#map_stcats(toplot=TRUE)

##############################
##############################

random_coordinates <- function(n, # number of transects
                             lat_min, # lower bound
                             lat_max, # upper bound
                             buffer=200,
                             orientation="h",
                             tofile=FALSE,
                             title="map"){ # minimum buffer, in meters, between latitudes
  torun <- FALSE
  if(torun){
    n <- 20
    lat_min <- 31.6
    lat_max <- 31.65
    buffer <- 50 # meters
  }

  buffer <- (buffer/1000)/111 ; buffer

  lats <- runif(1,lat_min,lat_max)
  while(length(lats) < n){
    lati <- runif(1,lat_min,lat_max)
    diffi <- abs(lats - lati) ; diffi
    if(min(diffi) > buffer){lats <- c(lats,lati)}
  }

  lats
  lats <- rev(sort(lats)) ; lats

  if(tofile){pdf(paste0(title,".pdf"),height=10,width=6)}
  map_stcats()
  if(orientation=="h"){
    abline(h=lat_min,col="red",lty=3)
    abline(h=lat_max,col="red",lty=3)
    abline(h=lats,col="steelblue",lty=3)
  }
  if(orientation=="v"){
    abline(v=lat_min,col="red",lty=3)
    abline(v=lat_max,col="red",lty=3)
    abline(v=lats,col="steelblue",lty=3)
  }
  if(tofile){dev.off()}

  if(tofile){
    write.csv(data.frame(coordinate=lats),
              file=paste0(title,".csv"),
              quote=FALSE,row.names=FALSE)
  }

  return(lats)
}



