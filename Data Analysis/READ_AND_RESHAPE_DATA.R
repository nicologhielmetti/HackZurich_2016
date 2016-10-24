df1 <- read.csv('356156068026087_porscheinte_2016-08-31T13_07_10Z_2016-09-01T16_32_52Z.csv')
head(df1)
df2 <- read.csv('356156068026087_porscheinte_2016-09-01T16_32_56Z_2016-09-02T15_59_12Z.csv')
head(df2)
levels(df2$Field)
df3 <- read.csv('356156068026087_porscheinte_2016-09-02T15_59_17Z_2016-09-03T16_04_34Z.csv')
head(df3)
levels(df3$Field)
df4 <- read.csv('356156068026087_porscheinte_2016-09-03T16_04_39Z_2016-09-04T14_53_38Z.csv')
head(df4)
levels(df4$Field)
df5 <- read.csv('356156068026087_porscheinte_2016-09-04T14_53_43Z_2016-09-05T15_17_41Z.csv')
head(df5)
df6 <- read.csv('356156068026087_porscheinte_2016-09-05T15_17_46Z_2016-09-06T15_48_49Z.csv')
head(df6)
levels(df6$Field)
df7 <- read.csv('356156068026087_porscheinte_2016-09-06T15_48_54Z_2016-09-07T16_58_27Z.csv')
head(df7)
levels(df7$Field)
df8 <- read.csv('356156068026087_porscheinte_2016-09-07T16_58_32Z_2016-09-08T16_40_54Z.csv')
head(df8)
levels(df8$Field)
df9 <- read.csv('356156068026087_porscheinte_2016-09-08T16_40_59Z_2016-09-09T04_27_42Z.csv')
head(df9)
levels(df9$Field)
df10 <- read.csv('356156068026087_porscheinte_2016-09-09T04_27_45Z_2016-09-10T04_38_58Z.csv')
head(df10)
levels(df10$Field)
df11 <- read.csv('356156068026087_porscheinte_2016-09-10T04_39_03Z_2016-09-11T04_44_40Z.csv')
head(df11)
levels(df11$Field)
df12 <- read.csv('356156068026087_porscheinte_2016-09-11T04_44_45Z_2016-09-12T15_25_59Z.csv')
head(df12, n=50)
levels(df12$Field)
df13 <- read.csv('356156068026087_porscheinte_2016-09-12T15_26_04Z_2016-09-13T16_01_32Z.csv')
head(df13)
levels(df13$Field)
df14 <- read.csv('356156068026087_porscheinte_2016-09-13T16_01_37Z_2016-09-14T15_33_38Z.csv')
head(df14)
levels(df14$Field)
df15 <- read.csv('356156068026087_porscheinte_2016-09-14T15_33_43Z_2016-09-15T15_52_25Z.csv')
head(df15)
levels(df15$Field)
df16 <- read.csv('356156068026087_porscheinte_2016-09-15T15_52_30Z_2016-09-16T08_15_31Z.csv')
head(df16)
levels(df16$Field)
df17 <- read.csv('356156068030410_porscheinte_2016-08-30T07_53_07Z_2016-09-05T18_47_20Z.csv')
head(df17)
levels(df17$Field)
df18 <- read.csv('356156068030410_porscheinte_2016-09-05T18_47_25Z_2016-09-06T17_41_23Z.csv')
head(df18)
levels(df18$Field)
df19 <- read.csv('356156068030410_porscheinte_2016-09-06T17_41_28Z_2016-09-07T10_01_16Z.csv')
head(df19)
levels(df19$Field)
df20 <- read.csv('356156068030410_porscheinte_2016-09-07T10_01_21Z_2016-09-08T03_57_52Z.csv')
head(df20)
levels(df20$Field)
df21 <- read.csv('356156068030410_porscheinte_2016-09-08T03_57_57Z_2016-09-09T14_31_37Z.csv')
head(df21)
levels(df21$Field)
df22 <- read.csv('356156068030410_porscheinte_2016-09-09T14_31_42Z_2016-09-10T10_56_05Z.csv')
head(df22)
df23 <- read.csv('356156068030410_porscheinte_2016-09-10T10_56_10Z_2016-09-11T11_00_40Z.csv')
head(df23)
df24 <- read.csv('356156068030410_porscheinte_2016-09-11T11_00_45Z_2016-09-12T16_12_08Z.csv')
head(df24)
df25 <- read.csv('356156068030410_porscheinte_2016-09-12T16_12_13Z_2016-09-13T16_18_12Z.csv')
head(df25)
df26 <- read.csv('356156068030410_porscheinte_2016-09-13T16_18_17Z_2016-09-14T10_26_04Z.csv')
df27 <- read.csv('356156068030410_porscheinte_2016-09-14T10_26_09Z_2016-09-15T17_27_55Z.csv')
df28 <- read.csv('356156068030410_porscheinte_2016-09-15T17_28_00Z_2016-09-16T08_11_49Z.csv')

##

car1.160831 <- reshape(df1, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160831)[2])
  as.numeric(levels(car1.160831[,i]))[as.integer(car1.160831[,i])]
write.csv(car1.160831, file='car1.160831.csv')

car1.160901 <- reshape(df2, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160901)[2])
  as.numeric(levels(car1.160901[,i]))[as.integer(car1.160901[,i])]
write.csv(car1.160901, file='car1.160901.csv')

car1.160902 <- reshape(df3, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160902)[2])
  as.numeric(levels(car1.160902[,i]))[as.integer(car1.160902[,i])]
write.csv(car1.160902, file='car1.160902.csv')

car1.160903 <- reshape(df4, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160903)[2])
  as.numeric(levels(car1.160903[,i]))[as.integer(car1.160903[,i])]
write.csv(car1.160903, file='car1.160903.csv')

car1.160904 <- reshape(df5, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160904)[2])
  as.numeric(levels(car1.160904[,i]))[as.integer(car1.160904[,i])]
write.csv(car1.160904, file='car1.160904.csv')

car1.160905 <- reshape(df6, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160905)[2])
  as.numeric(levels(car1.160905[,i]))[as.integer(car1.160905[,i])]
write.csv(car1.160905, file='car1.160905.csv')

car1.160906 <- reshape(df7, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160906)[2])
  as.numeric(levels(car1.160906[,i]))[as.integer(car1.160906[,i])]
write.csv(car1.160906, file='car1.160906.csv')

car1.160907 <- reshape(df8, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160907)[2])
  as.numeric(levels(car1.160907[,i]))[as.integer(car1.160907[,i])]
write.csv(car1.160907, file='car1.160907.csv')

car1.160908 <- reshape(df9, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160908)[2])
  as.numeric(levels(car1.160908[,i]))[as.integer(car1.160908[,i])]
write.csv(car1.160908, file='car1.160908.csv')

car1.160909 <- reshape(df10, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160909)[2])
  as.numeric(levels(car1.160909[,i]))[as.integer(car1.160909[,i])]
write.csv(car1.160909, file='car1.160909.csv')

car1.160910 <- reshape(df11, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160910)[2])
  as.numeric(levels(car1.160910[,i]))[as.integer(car1.160910[,i])]
write.csv(car1.160910, file='car1.160910.csv')

car1.160911 <- reshape(df12, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160911)[2])
  as.numeric(levels(car1.160911[,i]))[as.integer(car1.160911[,i])]
write.csv(car1.160911, file='car1.160911.csv')

car1.160912 <- reshape(df13, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160912)[2])
  as.numeric(levels(car1.160912[,i]))[as.integer(car1.160912[,i])]
write.csv(car1.160912, file='car1.160912.csv')

car1.160913 <- reshape(df14, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160913)[2])
  as.numeric(levels(car1.160913[,i]))[as.integer(car1.160913[,i])]
write.csv(car1.160913, file='car1.160913.csv')

car1.160914 <- reshape(df15, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160914)[2])
  as.numeric(levels(car1.160914[,i]))[as.integer(car1.160914[,i])]
write.csv(car1.160914, file='car1.160914.csv')

car1.160915 <- reshape(df16, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car1.160915)[2])
  as.numeric(levels(car1.160915[,i]))[as.integer(car1.160915[,i])]
write.csv(car1.160915, file='car1.160915.csv')

save(car1.160915,car1.160914,car1.160913,car1.160912,car1.160911,car1.160910,car1.160909,car1.160908,car1.160907,
     car1.160906,car1.160905,car1.160904,car1.160903,car1.160902,car1.160901,car1.160831, file='car1.RData')

car2.160830 <- reshape(df17, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160830)[2])
  as.numeric(levels(car2.160830[,i]))[as.integer(car2.160830[,i])]
write.csv(car2.160830, file='car2.160830.csv')

car2.160905 <- reshape(df18, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160905)[2])
  as.numeric(levels(car2.160905[,i]))[as.integer(car2.160905[,i])]
write.csv(car2.160905, file='car2.160905.csv')


car2.160906 <- reshape(df19, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160906)[2])
  as.numeric(levels(car2.160906[,i]))[as.integer(car2.160906[,i])]
write.csv(car2.160906, file='car2.160906.csv')

head(df20)
car2.160907 <- reshape(df20, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160907)[2])
  as.numeric(levels(car2.160907[,i]))[as.integer(car2.160907[,i])]
write.csv(car2.160907, file='car2.160907.csv')

car2.160908 <- reshape(df21, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160908)[2])
  as.numeric(levels(car2.160908[,i]))[as.integer(car2.160908[,i])]
write.csv(car2.160908, file='car2.160908.csv')

car2.160909 <- reshape(df22, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160909)[2])
  as.numeric(levels(car2.160909[,i]))[as.integer(car2.160909[,i])]
write.csv(car2.160909, file='car2.160909.csv')

car2.160910 <- reshape(df23, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160910)[2])
  as.numeric(levels(car2.160910[,i]))[as.integer(car2.160910[,i])]
write.csv(car2.160910, file='car2.160910.csv')

head(df24)
car2.160911 <- reshape(df24, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160911)[2])
  as.numeric(levels(car2.160911[,i]))[as.integer(car2.160911[,i])]
write.csv(car2.160911, file='car2.160911.csv')

head(df25)
car2.160912 <- reshape(df25, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160912)[2])
  as.numeric(levels(car2.160912[,i]))[as.integer(car2.160912[,i])]
write.csv(car2.160912, file='car2.160912.csv')

head(df26)
car2.160913 <- reshape(df26, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160913)[2])
  as.numeric(levels(car2.160913[,i]))[as.integer(car2.160913[,i])]
write.csv(car2.160913, file='car2.160913.csv')

head(df27)
car2.160914 <- reshape(df27, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160914)[2])
  as.numeric(levels(car2.160914[,i]))[as.integer(car2.160914[,i])]
write.csv(car2.160914, file='car2.160914.csv')

head(df28)
car2.160915 <- reshape(df28, timevar='Field', idvar=c('Latitude','Longitude','Received_at','Recorded_at'), direction='wide')
for(i in 5:dim(car2.160915)[2])
  as.numeric(levels(car2.160915[,i]))[as.integer(car2.160915[,i])]
write.csv(car2.160915, file='car2.160915.csv')

save(car2.160915,car2.160914,car2.160913,car2.160912,car2.160911,car2.160910,car2.160909,car2.160908,car2.160907,
     car2.160906,car2.160905,car2.160830, file = 'car2.RData')

