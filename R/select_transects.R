# Select random coordinates for transects in each beach

source('functions.R')

# Far south Beach
random_coordinates(n=20,
                   lat_min=31.56,
                   lat_max=31.60,
                   buffer=50,
                   title="south_beach")

# Cracker Tom Beach
random_coordinates(n=20,
                   lat_min=31.60,
                   lat_max=31.63,
                   buffer=50,
                   title="cracker_tom_beach")

# Middle Beach
random_coordinates(n=20,
                   lat_min=31.639,
                   lat_max=31.657,
                   buffer=50,
                   title="middle_beach")

# North Beach (erosion)
random_coordinates(n=15,
                   lat_min=31.6614,
                   lat_max=31.67838,
                   buffer=50,
                   title="north_beach_erosion")

# Shadow zone (accretion)
random_coordinates(n=10,
                   lat_min=31.67982,
                   lat_max=31.694139,
                   buffer=50,
                   title="shadow_zone_latitudes")

random_coordinates(n=5,
                   lat_min=-81.132406,
                   lat_max=-81.129184,
                   buffer=50,
                   title="shadow_zone_longitudes",
                   orientation="v")

# Top Beach
random_coordinates(n=15,
                   lat_min=-81.1500,
                   lat_max=-81.13566,
                   buffer=50,
                   title="top_beach",
                   orientation="v")


# Supplemental

# How to reformat coordinates, if you need to
x <- 31.6390   ; mins <- (x - floor(x))*60 ; secs <- (mins - floor(mins))*60 ;  paste0(floor(x)," deg ",floor(mins)," minutes ",round(secs,3))

