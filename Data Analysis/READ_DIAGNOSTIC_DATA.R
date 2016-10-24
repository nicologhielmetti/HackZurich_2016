df1 <- read.csv('356156068026087_porscheinte_2016-08-31T13_07_10Z_2016-09-01T16_32_52Z_DIAG.csv')
df2 <- read.csv('356156068026087_porscheinte_2016-09-01T16_32_56Z_2016-09-02T15_59_12Z_DIAG.csv')
df3 <- read.csv('356156068026087_porscheinte_2016-09-02T15_59_17Z_2016-09-03T16_04_34Z_DIAG.csv')
df4 <- read.csv('356156068026087_porscheinte_2016-09-03T16_04_39Z_2016-09-04T14_53_38Z_DIAG.csv')
df5 <- read.csv('356156068026087_porscheinte_2016-09-04T14_53_43Z_2016-09-05T15_17_41Z_DIAG.csv')
df6 <- read.csv('356156068026087_porscheinte_2016-09-05T15_17_46Z_2016-09-06T15_48_49Z_DIAG.csv')
df7 <- read.csv('356156068026087_porscheinte_2016-09-06T15_48_54Z_2016-09-07T16_58_27Z_DIAG.csv')
df8 <- read.csv('356156068026087_porscheinte_2016-09-07T16_58_32Z_2016-09-08T16_40_54Z_DIAG.csv')
df9 <- read.csv('356156068026087_porscheinte_2016-09-08T16_40_59Z_2016-09-09T04_27_42Z_DIAG.csv')
df10 <- read.csv('356156068026087_porscheinte_2016-09-09T04_27_45Z_2016-09-10T04_38_58Z_DIAG.csv')
df11 <- read.csv('356156068026087_porscheinte_2016-09-10T04_39_03Z_2016-09-11T04_44_40Z_DIAG.csv')
df12 <- read.csv('356156068026087_porscheinte_2016-09-11T04_44_45Z_2016-09-12T15_25_59Z_DIAG.csv')
df13 <- read.csv('356156068026087_porscheinte_2016-09-12T15_26_04Z_2016-09-13T16_01_32Z_DIAG.csv')
df14 <- read.csv('356156068026087_porscheinte_2016-09-13T16_01_37Z_2016-09-14T15_33_38Z_DIAG.csv')
df15 <- read.csv('356156068026087_porscheinte_2016-09-14T15_33_43Z_2016-09-15T15_52_25Z_DIAG.csv')
df16 <- read.csv('356156068026087_porscheinte_2016-09-15T15_52_30Z_2016-09-16T08_15_31Z_DIAG.csv')
df17 <- read.csv('356156068030410_porscheinte_2016-08-30T07_53_07Z_2016-09-05T18_47_20Z_DIAG.csv')
df18 <- read.csv('356156068030410_porscheinte_2016-09-05T18_47_25Z_2016-09-06T17_41_23Z_DIAG.csv')
df19 <- read.csv('356156068030410_porscheinte_2016-09-06T17_41_28Z_2016-09-07T10_01_16Z_DIAG.csv')
df20 <- read.csv('356156068030410_porscheinte_2016-09-07T10_01_21Z_2016-09-08T03_57_52Z_DIAG.csv')
df21 <- read.csv('356156068030410_porscheinte_2016-09-08T03_57_57Z_2016-09-09T14_31_37Z_DIAG.csv')
df22 <- read.csv('356156068030410_porscheinte_2016-09-09T14_31_42Z_2016-09-10T10_56_05Z_DIAG.csv')
df23 <- read.csv('356156068030410_porscheinte_2016-09-10T10_56_10Z_2016-09-11T11_00_40Z_DIAG.csv')
df24 <- read.csv('356156068030410_porscheinte_2016-09-11T11_00_45Z_2016-09-12T16_12_08Z_DIAG.csv')
df25 <- read.csv('356156068030410_porscheinte_2016-09-12T16_12_13Z_2016-09-13T16_18_12Z_DIAG.csv')
df26 <- read.csv('356156068030410_porscheinte_2016-09-13T16_18_17Z_2016-09-14T10_26_04Z_DIAG.csv')
df27 <- read.csv('356156068030410_porscheinte_2016-09-14T10_26_09Z_2016-09-15T17_27_55Z_DIAG.csv')
df28 <- read.csv('356156068030410_porscheinte_2016-09-15T17_28_00Z_2016-09-16T08_11_49Z_DIAG.csv')

##

car11_diag <- reshape(df1, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car12_diag <- reshape(df2, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car13_diag <- reshape(df3, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car14_diag <- reshape(df4, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car15_diag <- reshape(df5, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car16_diag <- reshape(df6, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car17_diag<- reshape(df7, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car18_diag <- reshape(df8, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car19_diag <- reshape(df9, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car110_diag <- reshape(df10, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car111_diag <- reshape(df11, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car112_diag <- reshape(df12, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car113_diag <- reshape(df13, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car114_diag<- reshape(df14, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car115_diag <- reshape(df15, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

car116_diag <- reshape(df16, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')

fuel <- 0
fuel <- car11_diag[,c(4,7,8)]
fuel <- rbind(fuel, car12_diag[,c(4,8,9)])
fuel <- rbind(fuel, car15_diag[,c(4,9,10)])
fuel <- rbind(fuel, car16_diag[,c(4,5,6)])
fuel <- rbind(fuel, car17_diag[,c(4,5,6)])
fuel <- rbind(fuel, car18_diag[,c(4,9,10)])
fuel <- rbind(fuel, car112_diag[,c(4,6,7)])
fuel <- rbind(fuel, car113_diag[,c(4,9,10)])
fuel <- rbind(fuel, car114_diag[,c(4,6,7)])
fuel <- rbind(fuel, car115_diag[,c(4,8,9)])
fuel <- rbind(fuel, car116_diag[,c(4,9,10)])

fuel$Recorded_at <- as.POSIXct(fuel$Recorded_at, format="%Y-%m-%dT%H:%M:%S")

newfuel <- fuel[order(fuel$Recorded_at),]

x11()
plot(newfuel$Recorded_at, newfuel$Value.ENH_DASHBOARD_FUEL, col='red' ,type='l', xlab = 'time', ylab = 'fuel level', main= 'Fuel history')

