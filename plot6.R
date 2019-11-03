# Read in data
setwd("C:/Users/Matt/datasciencecoursera/EDA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset data motor-vehicle-related emissions in Baltimore City and Los Angeles 
# County over Time
mrg<-merge(NEI, SCC, by='SCC')
mrg_sub<-subset(mrg, type=="ON-ROAD" & (fips=='24510' | fips=='06037'))
index<-grep("vehicle", mrg_sub$Short.Name, ignore.case=TRUE)
mrg_sub<-mrg_sub[index,]
pm25sum<-aggregate(Emissions~year+fips, mrg_sub, sum)

# Make overlaying barplot shownig motor-vehicle-related emissions in Baltimore 
# City and Los Angeles County over Time
library(ggplot2)
png('plot6.png', width=640, height=480)
g<-ggplot(pm25sum, aes(year, Emissions, fill=fips))
g<- g + geom_col() +
        xlab('Year')+
        ylab(expression('Total PM'[2.5]*' Emissions (tons)')) +
        ggtitle(expression('Total Motor Vehicle PM'[2.5]*' Emissions in Baltimore City and Los Angeles')) +
        scale_fill_discrete(name="Location", 
                            labels = c('Los Angeles County',
                                       'Baltimore City')) +
        scale_x_continuous(name="Year", breaks = c(1999,2002, 2005, 2008),labels=c('1998','2002', '2005', '2008') )
print(g)
dev.off()