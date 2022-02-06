library(tidyverse)
library(knitr)
library(dplyr)
library(knitr)
library(bookdown)
library(kableExtra)
library(ggplot2) 
data_firearms<-read.csv("Miscellaneous_Firearms_ASR_F_TBL_003.csv")
x<-head(data_firearms,n=10L)
x
sum_firearms<-aggregate(data_firearms$Count_,by=list(year=data_firearms$Year),sum)
ggplot(sum_firearms,aes(x=year,y=x))+geom_bar(stat = "identity",position = "dodge")
sum_category<-aggregate(data_firearms$Count_,by=list(data_firearms$Year,data_firearms$Category),sum)
ggplot(sum_category,aes(x=Group.1,y=x,color=Group.2))+geom_bar(stat = "identity",position = "dodge")+theme_light() +labs(x = "Year", y = "Number of firearms", title = "Gun Seizures Are the Most Frequently Reported Category firearms") +guides(color = guide_legend(override.aes = list(size=3)))+
  theme(plot.title = element_text(face = "bold"))
sum_type<-aggregate(data_firearms$Count_,by=list(data_firearms$Year,data_firearms$Type),sum)
type_table<-data.frame(Year=2014:2020,AirGun =sum_type[1:7,3], Antique=sum_type[8:14,3], CombinationGun=c(sum_type[15:18,3],"0",sum_type[19:20,3]),Commercial=sum_type[21:27,3],CommercialStorageFacility=c("0","0","0","0","0","2","0"),CommercialVersion=c("0","0","0",sum_type[29:32,3]),Crime=sum_type[33:39,3],DeemedNonFirearm=sum_type[40:46,0],Derringer=c("0","0","0",sum_type[47:50,3]),Handgun=sum_type[51:57,3],Intransit=c("1","0","0","0","0","0","0"),MachineGun=c("1","0","1","1","0","1","0"),NonCrime=sum_type[64:70,3],NonRestricted=sum_type[71:77,3],Other=sum_type[78:84,3],OutsideToronto=sum_type[85:91,3],Pistol=sum_type[92:98,3],Prohibited=sum_type[99:105,3],Replica=sum_type[106:112,3],Residential=sum_type[113:119,3],ResidentialStorageUnit=c("0","0","0","0","0","2","0"),Restricted=sum_type[121:127,3],Revolver=sum_type[128:134,3],Rifle=sum_type[135:141,3],SawedoffRifle=sum_type[142:148,3],SawedoffShotgun=c(sum_type[149:153,3],"36","27"),School=c("0","0","0","0","0","0","1"),Shotgun=sum_type[159:165,3],StartersPistol=sum_type[166:172,3],Street=c("0","0","1","0","0","0","0"),SubmachineGun=sum_type[174:180,3],Taser=c("1","0","0","0","0","0","0"),Toronto=sum_type[182:188,3],ToyGun=sum_type[189:195,3],Vehicle=c("0",sum_type[197:202,3]) )
knitr::kable(type_table,format = "pandoc")

