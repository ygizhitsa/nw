library(readr)
library(ggplot2)
library(dplyr)
library(Amelia)
library(mlbench)
library(corrplot)
library(VIM)


?table()
?quantile()
?mean()
?sd()


hdf <- read_csv("data/ames_housing_data.csv")
names(hd)
summary(hdf)


hdfmc <- read_csv("data/ames_housing_data_modified_mc.csv")
names(hdfmc)
summary(hdfmc)
missmap(hdfmc, col=c("black", "grey"), legend=TRUE)

aggr_plot <- aggr(hdfmc, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE, labels=names(data), cex.axis=.7, gap=3, ylab=c("Histogram of missing data","Pattern"))


#corrplot(hdfmc, method="circle")

#sales price
sd(hdfmc$SalePrice)
3*sd(hdfmc$SalePrice)

summary(hdfmc$SalePrice)
hist(hdfmc$SalePrice)
plot(density(hdfmc$SalePrice))
boxplot(hdfmc$SalePrice/100)
boxplot.stats.min(hdfmc$SalePrice)
?boxplot
ggplot(subdat, aes(x=LotShape, y=SalePrice)) + 
  geom_boxplot(fill="blue") +
  labs(title="Distribution of HouseAge") +
  theme(plot.title=element_text(lineheight=0.8, face="bold", hjust=0.5))


  

zoning_residential <-c("RM","RP","RL","RH")
house_sf<-hdf$FirstFlrSF + hdf$SecondFlrSF
price_per_sf<-hdf$SalePrice/house_sf


prohdfp<-filter(.data=hdfmc, Zoning %in% zoning_residential) %>% 
  select( SalePrice, PID , YrSold ,  SaleCondition ,FirstFlrSF, SecondFlrSF )

head( hdfp )






