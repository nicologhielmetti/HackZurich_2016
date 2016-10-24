## In order to get car1.RData run the script READ_AND_RESHAPE_DATA.R
load('car1.RData')  ## for now we work just on car 1. 

car1 <- car1.160831
car2 <- car1.160901
car3 <- car1.160902
car4 <- car1.160903
car5 <- car1.160904
car6 <- car1.160905
car7 <- car1.160906
car8 <- car1.160907
car9 <- car1.160908
car10 <- car1.160909
car11 <- car1.160910
car12 <- car1.160911
car13 <- car1.160912
car14 <- car1.160913
car15 <- car1.160914
car16 <- car1.160915

l1 <- names(car1[-c(1:4)])
l2 <- names(car2[-c(1:4)])
l3 <- names(car3[-c(1:4)])
l4 <- names(car4[-c(1:4)])
l5 <- names(car5[-c(1:4)])
l6 <- names(car6[-c(1:4)])
l7 <- names(car7[-c(1:4)])
l8 <- names(car8[-c(1:4)])
l9 <- names(car9[-c(1:4)])
l10 <- names(car10[-c(1:4)])
l11 <- names(car11[-c(1:4)])
l12 <- names(car12[-c(1:4)])
l13 <- names(car13[-c(1:4)])
l14 <- names(car14[-c(1:4)])
l15 <- names(car15[-c(1:4)])
l16 <- names(car16[-c(1:4)])

intersection <- Reduce(intersect, list(l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16)) # !!
union <- Reduce(union, list(l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16)) # !!

dim(car1)
head(car1)

speed <- car1[,c(3,11,20)]

names(car2)
speed <- rbind(speed, car2[,c(4,19,28)])

names(car3)
car3$Value.MDI_OBD_SPEED <- NA
speed <- rbind(speed, car3[,c(4,12,13)])

names(car4)
car4$Value.MDI_OBD_SPEED <- NA
speed <- rbind(speed, car4[,c(4,12,31)])

names(car5)
speed <- rbind(speed, car5[,c(4,12,27)])

names(car6)
speed <- rbind(speed, car6[,c(4,29,28)])

names(car7)
speed <- rbind(speed, car7[,c(4,24,27)])

names(car8)
speed <- rbind(speed, car8[,c(4,13,22)])

names(car9)
car9$Value.MDI_OBD_SPEED <- NA
speed <- rbind(speed, car9[,c(4,13,15)])

names(car10)
car10$Value.MDI_OBD_SPEED <- NA
speed <- rbind(speed, car10[,c(4,5,12)])

names(car11)
car11$Value.MDI_OBD_SPEED <- NA
speed <- rbind(speed, car11[,c(4,9,13)])

names(car12)
speed <- rbind(speed, car12[,c(4,12,24)])

names(car13)
speed <- rbind(speed, car13[,c(4,26,25)])

names(car14)
speed <- rbind(speed, car14[,c(4,5,6)])

names(car15)
speed <- rbind(speed, car15[,c(4,12,22)])

names(car16)
speed <- rbind(speed, car16[,c(4,12,25)])


head(speed[1:20,-3])

speed$day.time <- as.POSIXct(speed$Recorded_at, format="%Y-%m-%dT%H:%M:%S")

library(zoo)
speed$Value.GPS_SPEED.nafilled <- na.locf(speed$Value.GPS_SPEED, na.rm = FALSE)
head(speed)

x11()
plot(speed$day.time[-c(1:3)], speed$Value.GPS_SPEED.nafilled[-c(1:3)])

speed$date <- as.Date(speed$day.time)
speed$date <- as.factor(speed$date)
head(speed$date)

days <- levels(speed$date)
n.days <- length(days)
n.days

library(zoo)
library(lubridate)
speed$time <- hour(ymd_hms(speed$day.time)) + minute(ymd_hms(speed$day.time))/60
head(speed$time)
each.day <- speed[-c(1:3),c(5,6,7)]

for (i in 2:n.days){
  each.day.i <- each.day[each.day$date == days[i], c(1,3)]
  x11()
  plot(each.day.i$time, each.day.i$Value.GPS_SPEED.nafilled, type='l')
}

for (i in 2:n.days){
  each.day.i <- each.day[each.day$date == days[i], c(1,3)]
  if(dim(each.day.i)[1] > 10){
    x11()
    plot(approx(each.day.i$time, each.day.i$Value.GPS_SPEED.nafilled, method='linear', n=200),type='l')
  }
}

# battery voltage se la batteria è on
# journey state when a trip starts

####################
names(car1)
car <- car1[,c(4,27,22)]

names(car2)
car <- rbind(car, car2[,c(4,13,27)])

names(car4)
car <- rbind(car, car4[,c(4,17,30)])

names(car5)
car <- rbind(car, car5[,c(4,13,25)])

names(car6)
car <- rbind(car, car6[,c(4,22,26)])

names(car7)
car <- rbind(car, car7[,c(4,14,28)])

names(car8)
car <- rbind(car, car8[,c(4,25,23)])

names(car12)
car <- rbind(car, car12[,c(4,27,31)])

names(car13)
car <- rbind(car, car13[,c(4,30,28)])

names(car14)
car <- rbind(car, car14[,c(4,13,9)])

names(car15)
car <- rbind(car, car15[,c(4,28,23)])

names(car16)
car <- rbind(car, car16[,c(4,27,24)])

# value.behave_acc_peack
# behave gps speed peak
# mdi_obd_rpm

car$day.time <- as.POSIXct(car$Recorded_at, format="%Y-%m-%dT%H:%M:%S")

carnew <- car[-c(1:213),]
head(carnew)

library(zoo)
carnew$Value.BEHAVE_GPS_SPEED_PEAK <- na.locf(carnew$Value.BEHAVE_GPS_SPEED_PEAK)
carnew$Value.MDI_OBD_RPM <- na.locf(carnew$Value.MDI_OBD_RPM, na.rm = FALSE)

head(carnew)

carnew <- na.omit(carnew)

head(carnew)

carnew$Recorded_at <- NULL

carnew$date <- as.Date(carnew$day.time)
###speed$date <- as.factor(speed$date)

library(zoo)
library(lubridate)
carnew$time <- hour(ymd_hms(carnew$day.time)) + minute(ymd_hms(carnew$day.time))/100 + second(ymd_hms(carnew$day.time))/10000
head(carnew)

carnew$Value.BEHAVE_GPS_SPEED_PEAK <- as.numeric(levels(carnew$Value.BEHAVE_GPS_SPEED_PEAK))[as.integer(carnew$Value.BEHAVE_GPS_SPEED_PEAK)]
carnew$Value.MDI_OBD_RPM <- as.numeric(levels(carnew$Value.MDI_OBD_RPM))[as.integer(carnew$Value.MDI_OBD_RPM)]

pts <- data.frame(date=double(),
                  time.start=double(),
                  time.end=double(),
                  speed.peak=double(),
                  average_RPM=double()
                  )

pts <- pts[0,]
it.begin <- 1
it.end <- 1

N <- dim(carnew)[1]
count.row <- 1

flag <- 0 # per gestire ultima riga del file

while(it.end < N){
  it.begin <- it.end
  sum.rpm <- 0
  max.speed <- 0
  while(it.end < N & carnew$date[it.end] == carnew$date[it.end + 1] & carnew$time[it.end + 1] - carnew$time[it.end] < .006){
    sum.rpm <- sum.rpm + carnew$Value.MDI_OBD_RPM[it.end]
    max.speed <- max(max.speed, carnew$Value.BEHAVE_GPS_SPEED_PEAK[it.end])
    it.end = it.end + 1
  }
  if(it.end == N & carnew$date[N] == carnew$date[N-1] & carnew$time[N]-carnew$time[N-1]<.0006){
    sum.rpm <- sum.rpm + carnew$Value.MDI_OBD_RPM[N]
    max.speed <- max(max.speed, carnew$Value.BEHAVE_GPS_SPEED_PEAK[N])
    flag <- 1
  }
  pts[count.row,] <- c(carnew$date[it.end], carnew$time[it.begin], carnew$time[it.end], max.speed, sum.rpm/(it.end-it.begin+1))
  count.row = count.row + 1
  if(it.end == N & flag  == 0){
    pts[count.row,] <- c(carnew$date[N],carnew$time[N], carnew$time[N], carnew$Value.BEHAVE_GPS_SPEED_PEAK[N], carnew$Value.MDI_OBD_RPM[N])
  }
  
  it.end = it.end + 1
}

x11()
plot(pts$speed.peak, pts$average_RPM, xlab='Speed_Peak', ylab='Average_RPM')
title('Car1 DATA')


########

load('car2.RData')  ## for now we work just on car 1

car1 <- car2.160830
car2 <- car2.160905
car3 <- car2.160906
car4 <- car2.160907
car5 <- car2.160908
car6 <- car2.160909
car7 <- car2.160910
car8 <- car2.160911
car9 <- car2.160912
car10 <- car2.160913
car11 <- car2.160914
car12 <- car2.160915


names(car1)
car <- car1[,c(4,9,33)]

names(car2)
car <- rbind(car, car2[,c(4,24,25)])

names(car3)
car <- rbind(car, car3[,c(4,16,29)])

names(car4)
car <- rbind(car, car4[,c(4,17,21)])

names(car5)
car <- rbind(car, car5[,c(4,29,31)])

names(car6)
car <- rbind(car, car6[,c(4,25,23)])

names(car8)
car <- rbind(car, car8[,c(4,26,21)])

names(car11)
car <- rbind(car, car11[,c(4,25,28)])

names(car12)
car <- rbind(car, car12[,c(4,19,24)])


# value.behave_acc_peack
# behave gps speed peak
# mdi_obd_rpm

car$day.time <- as.POSIXct(car$Recorded_at, format="%Y-%m-%dT%H:%M:%S")

carnew <- car[-c(1:7),]
head(carnew)

library(zoo)
carnew$Value.BEHAVE_GPS_SPEED_PEAK <- na.locf(carnew$Value.BEHAVE_GPS_SPEED_PEAK)
carnew$Value.MDI_OBD_RPM <- na.locf(carnew$Value.MDI_OBD_RPM, na.rm = FALSE)

head(carnew)

carnew <- na.omit(carnew)

head(carnew)

carnew$Recorded_at <- NULL

carnew$date <- as.Date(carnew$day.time)
###speed$date <- as.factor(speed$date)

library(zoo)
library(lubridate)
carnew$time <- hour(ymd_hms(carnew$day.time)) + minute(ymd_hms(carnew$day.time))/100 + second(ymd_hms(carnew$day.time))/10000
head(carnew)

carnew$Value.BEHAVE_GPS_SPEED_PEAK <- as.numeric(levels(carnew$Value.BEHAVE_GPS_SPEED_PEAK))[as.integer(carnew$Value.BEHAVE_GPS_SPEED_PEAK)]
carnew$Value.MDI_OBD_RPM <- as.numeric(levels(carnew$Value.MDI_OBD_RPM))[as.integer(carnew$Value.MDI_OBD_RPM)]

pts <- data.frame(date=double(),
                  time.start=double(),
                  time.end=double(),
                  speed.peak=double(),
                  average_RPM=double()
)

pts <- pts[0,]
it.begin <- 1
it.end <- 1

N <- dim(carnew)[1]
count.row <- 1

flag <- 0 # per gestire ultima riga del file

while(it.end < N){
  it.begin <- it.end
  sum.rpm <- 0
  max.speed <- 0
  while(it.end < N & carnew$date[it.end] == carnew$date[it.end + 1] & carnew$time[it.end + 1] - carnew$time[it.end] < .006){
    sum.rpm <- sum.rpm + carnew$Value.MDI_OBD_RPM[it.end]
    max.speed <- max(max.speed, carnew$Value.BEHAVE_GPS_SPEED_PEAK[it.end])
    it.end = it.end + 1
  }
  if(it.end == N & carnew$date[N] == carnew$date[N-1] & carnew$time[N]-carnew$time[N-1]<.0006){
    sum.rpm <- sum.rpm + carnew$Value.MDI_OBD_RPM[N]
    max.speed <- max(max.speed, carnew$Value.BEHAVE_GPS_SPEED_PEAK[N])
    flag <- 1
  }
  pts[count.row,] <- c(carnew$date[it.end], carnew$time[it.begin], carnew$time[it.end], max.speed, sum.rpm/(it.end-it.begin+1))
  count.row = count.row + 1
  if(it.end == N & flag  == 0){
    pts[count.row,] <- c(carnew$date[N],carnew$time[N], carnew$time[N], carnew$Value.BEHAVE_GPS_SPEED_PEAK[N], carnew$Value.MDI_OBD_RPM[N])
  }
  
  it.end = it.end + 1
}

x11()
plot(pts$speed.peak, pts$average_RPM, xlab='Speed_Peak', ylab='Average_RPM')
title('Car2 DATA')
