################################################################################
################################################################################

### marmap package - for producing bathymetric maps
### Jono Handley, jonorow@gmail.com, 9 June 2016
### See: https://cran.r-project.org/web/packages/marmap/vignettes/marmap.pdf

################################################################################
################################################################################

## load useful spatial packages
library(marmap)
library(raster)
library(sp)
library(maptools) #to handle ArcGIS shapefiles
library(rgdal)

## Download the bathymetry of your specified area
SGbathy <- getNOAA.bathy(lon1 = -44.6, lon2 = -18.9,
                         lat1 = -61, lat2 = -49, 
                         ## resolution in minutes
                         ## 1 looks to be best full resolution available
                         resolution = 1,
                         ## Save the data to WD
                         keep=F)


## Check the data
summary(SGbathy)
class(SGbathy)

plot(SGbathy,  
     ## image indicates whether or not the heat map of bathymetry is plotted
     image=T, land=T,
     ## your shallowest and deepest isobaths you want to plot
     shallowest.isobath = 0, deepest.isobath = -8239,lty=0, lwd=c(0.1),col='grey',
     ## Step indicates the isobaths you want to plot
     step=50,
     ## drawlabel inidactes whether isobaths are labelled or not
     drawlabel=F)

