library(ggplot2)
library(reshape2)
library(Hmisc)
library(stats)
library(lessR)


hdfmc <- read_csv("data/ames_housing_data_modified_mc4.csv")
names(hdfmc)
summary(hdfmc)
str(hdfmc)

ggplot(hdfmc, aes(x=SalePrice)) + 
  geom_histogram(color="black", binwidth= 10000) +
  labs(title="Distribution of Sale Price") +
  theme(plot.title=element_text(lineheight=0.8, face="bold", hjust=0.5))


summary(hdfmc$OverallQual)
hist(hdfmc$OverallQual)
plot(density(hdfmc$OverallQual))



selected_columns <-c("PID","SubClass","LotArea","LandContour","Utilities","Neighborhood","BldgType","HouseStyle","OverallCond","YearBuilt","YearRemodel", 
                     "TotalBsmtSF" , "Heating","CentralAir","Electrical","FirstFlrSF","SecondFlrSF","GrLivArea","YrSold","SalePrice")


boxplot(hdfmc$SalePrice/1000)
boxplot.stats(hdfmc$SalePrice)

#buiding workingcolums and defining groups
data_colums<-c("SalePrice", "total_area_","living_area",
                "LotArea","OverallQual")

propery_size_group <-c("LotArea","TotalBsmtSF","FirstFlrSF","SecondFlrSF","GrLivArea","SalePrice") 

sizegroup <- subset(hdfmc, select= propery_size_group)
sizedata<-data.frame(sizegroup)
SummaryStats(sizegroup)


propery_quality_group<-c("SubClass","LandContour","Utilities","Neighborhood","BldgType","HouseStyle","OverallCond","YearBuilt","YearRemodel","Heating","CentralAir","Electrical","YrSold","SalePrice")
qualitygroup <- subset(hdfmc, select= propery_quality_group)
qualitydata<-data.frame(qualitygroup)
SummaryStats(qualitydata)

Plot(OverallCond,SalePrice,data=qualitygroup, auto=TRUE)


d <- subdatnum
cormatrix = rcorr(as.matrix(d), type='spearman')
cormatrix



#size
ggplot(hdfmc, aes(x=living_area, y=SalePrice)) + 
  geom_point(color="blue", size=2) +
  ggtitle("Scatter Plot of Sale Price vs Total Floor SF") +
  theme(plot.title=element_text(lineheight=0.8, face="bold", hjust=0.5)) + 
  geom_smooth(method=lm,se=FALSE)  ## method=lm, se=FALSE ###

ggplot(hdfmc, aes(x=living_area, y=SalePrice)) + 
  geom_point(color="blue", size=2) +
  ggtitle("Scatter Plot of Sale Price vs Leaving Area") +
  theme(plot.title=element_text(lineheight=0.8, face="bold", hjust=0.5)) + 
  geom_smooth(method=lm,se=FALSE)  ## method=lm, se=FALSE ###

ggplot(hdfmc, aes(x=living_aria, y=SalePrice)) + 
  geom_point(color="blue", shape=1) +
  ggtitle("Scatter Plot of Total Floor SF vs Sale Price") +
  theme(plot.title=element_text(lineheight=0.8, face="bold", hjust=0.5))

ggplot(hdfmc, aes(x=OverallQual, y=SalePrice)) + 
  geom_point(color="blue", shape=1) +
  ggtitle("Scatter Plot of Overall Quality vs Sale Price") +
  theme(plot.title=element_text(lineheight=0.8, face="bold", hjust=0.5))
