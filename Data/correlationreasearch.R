library(ggplot2)
library(reshape2)
library(Hmisc)
library(stats)



hdfmc <- read_csv("data/ames_housing_data_modified_mc.csv")
names(hdfmc)
summary(hdfmc)


#buiding workingcolums and defining groups
data_colums<-c("SalePrice", "total_area_","living_area",
                "LotArea","OverallQual")


subdatnum <- subset(hdfmc, select= data_colums)


d <- subdatnum
cormatrix = rcorr(as.matrix(d), type='spearman')
cormatrix
